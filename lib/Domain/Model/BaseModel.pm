package Domain::Model::BaseModel;

use strict;
use warnings;
use Carp qw(croak);
use Memoize qw(memoize);
use Module::Load;
use YAML qw(LoadFile);

my $_config = {
	default => {
		dsn => 'dbi:mysql:database=m2m;host=127.0.0.1',
		schema_class => 'Infrastructure::DB::M2M::Schema',
		user => 'admin',
		password => 'circle',
		options => {
			RaiseError => 1,
			PrintError => 1
		}
	}
};
my $_schemas = {};

sub config {
	my ($data) = @_;
	if ($data) {
		croak 'config data must be a hashref' unless 'HASH' eq ref $data;
		$_config = $data;
	}
	return $_config if $_config;
	my $config_path;
	if (-f 'config.yaml') {
		$config_path = 'config.yaml'
	} elsif (-f 'config.yml') {
		$config_path = 'config.yml';
	} else {
		croak "could not find a config.yml or config.yaml file";
	}
	return LoadFile($config_path)->{dbicx_sugar};
}

sub schema {
	my ($name) = @_;
	my $cfg = config();

	if (not defined $name) {
		if (keys %$cfg == 1) {
			($name) = keys %$cfg;
		} elsif (keys %$cfg) {
			$name = "default";
		} else {
			die "No schemas are configured";
		}
	}

	return $_schemas->{$name} if $_schemas->{$name};

	my $options = $cfg->{$name} or die "The schema $name is not configured";
	if ( my $alias = $options->{alias} ) {
		$options = $cfg->{$alias}
			or die "The schema alias $alias does not exist in the config";
		return $_schemas->{$alias} if $_schemas->{$alias};
	}

	my @conn_info = $options->{connect_info}
		? @{$options->{connect_info}}
		: @$options{qw(dsn user password options)};
	if ( exists $options->{pass} ) {
		warn "The pass option is deprecated. Use password instead.";
		$conn_info[2] = $options->{pass};
	}

	my $schema;

	if ( my $schema_class = $options->{schema_class} ) {
		$schema_class =~ s/-/::/g;
		eval { load $schema_class };
		die "Could not load schema_class $schema_class: $@" if $@;
		if ( my $replicated = $options->{replicated} ) {
			$schema = $schema_class->clone;
			my %storage_options;
			my @params = qw( balancer_type balancer_args pool_type pool_args );
			for my $p ( @params ) {
				my $value = $replicated->{$p};
				$storage_options{$p} = $value if defined $value;
			}
			$schema->storage_type([ '::DBI::Replicated', \%storage_options ]);
			$schema->connection( @conn_info );
			$schema->storage->connect_replicants( @{$replicated->{replicants}});
		} else {
			$schema = $schema_class->connect( @conn_info );
		}
	} else {
		my $dbic_loader = 'DBIx::Class::Schema::Loader';
		eval { load $dbic_loader };
		die "You must provide a schema_class option or install $dbic_loader."
			if $@;
		$dbic_loader->naming( $options->{schema_loader_naming} || 'v7' );
		$schema = DBIx::Class::Schema::Loader->connect(@conn_info);
	}

	return $_schemas->{$name} = $schema;
};

sub resultset {
	my ($rset_name) = @_;
	return schema()->resultset($rset_name);
}

sub rset { goto &resultset };

1;

__END__
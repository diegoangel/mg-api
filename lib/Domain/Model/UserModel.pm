=pod

=head1 PACKAGE NAME

	Domain::Model::UserModel

=head2 DESCRIPTION

=head2 LICENSE AND COPYRIGHT

Copyright E<0169> 2015 Movilgate
Cannot modify source-code for any purpose (cannot create derivative works)

=cut

package Domain::Model::UserModel;

use Dancer2;
use Dancer2::Plugin::DBIC;
use Moo;
use Types::Standard qw(Str Int);
use FindBin;
use lib "$FindBin::Bin/../..";
use Infrastructure::DB::M2M::Schema::Result::Usuario;
use Data::Dumper;

  local $Data::Dumper::Freezer = '_dumper_hook';

my $schema = 'default';
my $resultset = 'Usuario';

sub findById() {
	my ($self, $id) = @_;

	my $rs = schema($schema)->resultset($resultset)->find($id);
	my %user = $rs->get_columns;
	return %user;
}

sub save() {
	my ($self, $id, $data) = @_;

	if(defined($id)){
		my $user = schema($schema)->resultset($resultset)->find($id);
		$user->id_usuario($id);
		if(defined($data->{'user'})){$user->user($data->{'user'});}
		if(defined($data->{'pass'})){$user->pass($data->{'pass'});}
		if(defined($data->{'id_tipo_usuario'})){$user->id_tipo_usuario($data->{'id_tipo_usuario'});}
		if(defined($data->{'id_cliente'})){$user->id_cliente($data->{'id_cliente'});}
		if(defined($data->{'descripcion'})){$user->descripcion($data->{'descripcion'});}
		if(defined($data->{'estado'})){$user->estado($data->{'estado'});}
		if(defined($data->{'timezone'})){$user->timezone($data->{'timezone'});}

		$user->update;    ## UPDATE
		return $user->is_changed();
	}else{
		my $user = schema($schema)->resultset($resultset)->new({});
		if(defined($data->{'user'})){$user->user($data->{'user'});}
		if(defined($data->{'pass'})){$user->pass($data->{'pass'});}
		if(defined($data->{'id_tipo_usuario'})){$user->id_tipo_usuario($data->{'id_tipo_usuario'});}
		if(defined($data->{'id_cliente'})){$user->id_cliente($data->{'id_cliente'});}
		if(defined($data->{'descripcion'})){$user->descripcion($data->{'descripcion'});}
		if(defined($data->{'estado'})){$user->estado($data->{'estado'});}
		if(defined($data->{'timezone'})){$user->timezone($data->{'timezone'});}

		$user->insert;    ## INSERT

		if($user->in_storage()){
			return {'id_usuario' => $user->id_usuario};
		}else{
			return {'id_usuario' => 0};
		}
	}
}

sub delete() {
	my ($self, $id) = @_;

	my $user = schema($schema)->resultset($resultset)->find($id)->delete();
# 	$user->id_usuario($id);

	return $user->in_storage();    ## DELETE
	}

sub findAll() {
	my ($self) = @_;
# 	return schema($schema)->resultset($resultset)->all;
	my $users = schema($schema)->resultset($resultset)->search(
		{'id_tipo_usuario' => {'!=' => 4}}
	);

	return $users;
}

sub login() {
	my ($self, $user, $pass) = @_;
	$user = schema($schema)->resultset($resultset)->search_rs({'user' => $user, 'pass' => $pass});
	return $user;
}

true;

__END__

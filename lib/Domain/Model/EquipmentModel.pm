=pod

=head1 PACKAGE NAME

	Domain::Model::EquipmentModel

=head2 DESCRIPTION

=head2 LICENSE AND COPYRIGHT

Copyright E<0169> 2015 Movilgate
Cannot modify source-code for any purpose (cannot create derivative works)

=cut

package Domain::Model::EquipmentModel;

use Dancer2;
use Dancer2::Plugin::DBIC;
use Moo;
use Types::Standard qw(Str Int);
use FindBin;
use lib "$FindBin::Bin/../..";
use Infrastructure::DB::M2M::Schema::Result::Equipo;
use Data::Dumper;

local $Data::Dumper::Freezer = '_dumper_hook';

my $schema = 'default';
my $resultset = 'Equipo';

sub findById() {
	my ($self, $id) = @_;
	return schema($schema)->resultset($resultset)->find($id);
}

sub save() {
	my ($self, $id) = @_;	

}

sub _insert() {
	my ($self) = @_;

}

sub _update() {
	my ($self, $id) = @_;

}

sub delete() {
	my ($self, $id) = @_;
	my $equipmentResultset = schema($schema)->resultset($resultset)->find($id);
	return $equipmentResultset->delete();
}

sub findAll() {
	my ($self) = @_;
	return schema($schema)->resultset($resultset)->search({});
}

1;

__END__

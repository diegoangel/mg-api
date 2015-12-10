=pod

=head1 PACKAGE NAME

	Service::EquipmentService

=head2 DESCRIPTION

=head2 LICENSE AND COPYRIGHT

Copyright E<0169> 2015 Movilgate
Cannot modify source-code for any purpose (cannot create derivative works)

=cut

package Service::EquipmentService;

use Moo;
use Types::Standard qw(Str Int InstanceOf);

has model => (
	is => 'rw',
	isa => InstanceOf['Domain::Model::EquipmentModel'],
	required => 1,
);

sub listEquipment() {
	my ($self, $id) = @_;
	my $equipmentResultSet = $self->model->findAll();
	my $listOfEquipment = [];

	while(my $row = $equipmentResultSet->next) {
		push(@$listOfEquipment, {
			id_equipo => $row->id_equipo,
			imei => $row->imei,
			nombre => $row->nombre
		});
	}

	return $listOfEquipment;
}

sub createEquipment() {

}

sub readEquipment() {
	my ($self, $id) = @_;

	return $self->model->findById($id);
}


sub updateEquipment() {

}

sub deleteEquipment() {
	my ($self, $id) = @_;

	return $self->model->delete($id);		
}

1;

__END__
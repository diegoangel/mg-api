=pod

=head1 PACKAGE NAME

	Service::ClientService

=head2 DESCRIPTION

=head2 LICENSE AND COPYRIGHT

Copyright E<0169> 2015 Movilgate
Cannot modify source-code for any purpose (cannot create derivative works)

=cut

package Service::ClientService;

use Moo;
use Types::Standar;

has model => (
	is => 'rwp',
	required => 1,
	isa => InstanceOf['ClientModel']
);

sub listClients() {
	my ($self) = @_;

}

sub createClient() {
	my ($self) = @_;

}

sub readClient() {
	my ($self, $id) = @_;

}

sub updateClient() {
	my ($self, $id) = @_;

}

sub deleteClient() {
	my ($self, $id) = @_;
}

1;

__END__
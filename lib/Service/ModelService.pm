=pod

=head1 PACKAGE NAME

	Service::ModelService

=head2 DESCRIPTION

=head2 LICENSE AND COPYRIGHT

Copyright E<0169> 2015 Movilgate
Cannot modify source-code for any purpose (cannot create derivative works)

=cut

package Service::ModelService;

use Moo;
use Types::Standar;

has model => (
	is => 'rwp',
	required => 1,
	isa => InstanceOf['ModelModel']
);

sub listModels() {
	my ($self) = @_;

}

sub createModel() {
	my ($self) = @_;

}

sub readModel() {
	my ($self, $id) = @_;

}

sub updateModel() {
	my ($self, $id) = @_;

}

sub deleteModel() {
	my ($self, $id) = @_;

}

1;

__END__
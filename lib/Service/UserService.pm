=pod

=head1 PACKAGE NAME

	Service::UserService 

=head2 DESCRIPTION

=head2 LICENSE AND COPYRIGHT

Copyright E<0169> 2015 Movilgate
Cannot modify source-code for any purpose (cannot create derivative works)

=cut

package Service::UserService;

use Moo;
use Types::Standard qw(Str Int InstanceOf);

has model => (
	is => 'rwp',
	isa => InstanceOf['Domain::Model::UserModel'],
	required => 1,
);


=pod

=head3 DESCRIPTION

=head3 PARAMS

=head3 RETURN

=cut

sub listUsers() {
	my ($self) = @_;
	my $usersResultset = $self->model->findAll();
	my $listOfUsers = [];

	while (my $row = $usersResultset->next){
		push($listOfUsers, {
			id_usuario => $row->id_usuario,
			user => $row->user,
			pass => $row->pass,
			id_tipo_usuario => $row->id_tipo_usuario,
			id_cliente => $row->get_column('id_cliente'),
			cliente => $row->id_cliente->nombre,
			descripcion => $row->descripcion,
			estado => $row->estado,
			timezone => $row->timezone
		});
	}

	return $listOfUsers;
}

=pod

=head3 DESCRIPTION

=head3 PARAMS

=head3 RETURN

=cut

sub createUser() {
	my ($self, $username, $pass, $id_tipo_usuario, $id_cliente, $descripcion, $estado, $timezone) = @_;
	
	my $data =
	{
		'user' => $username,
		'pass' => $pass,
		'id_tipo_usuario'   => $id_tipo_usuario,
		'id_cliente' => $id_cliente,
		'descripcion' => $descripcion,
		'estado'   => $estado,
		'timezone' => $timezone,
	};

	return $self->model->save(undef, $data);
}

=pod

=head3 METHOD

	getUser

=over 

=item PARAMS

=item RETURN

=back 

=cut

sub readUser() {
	my ($self, $id) = @_;

	my %user = $self->model->findById($id);
	return %user;
}

=pod

=head3 DESCRIPTION

=head3 PARAMS

=head3 RETURN

=cut

sub updateUser() {
	my ($self, $id, $username, $pass, $id_tipo_usuario, $id_cliente, $descripcion, $estado, $timezone) = @_;

	my $data =
	{
		'user' => $username,
		'pass' => $pass,
		'id_tipo_usuario'   => $id_tipo_usuario,
		'id_cliente' => $id_cliente,
		'descripcion' => $descripcion,
		'estado'   => $estado,
		'timezone' => $timezone,
	};

	return $self->model->save($id, $data);
}

=pod

=head3 DESCRIPTION

=head3 PARAMS

=head3 RETURN

=cut

sub deleteUser() {
	my ($self, $id) = @_;

	return $self->model->delete($id);
}


1;

__END__
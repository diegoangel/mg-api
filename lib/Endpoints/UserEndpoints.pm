package Endpoints::UserEndpoints;

=pod

=head1 USER ENDPOINTS PACKAGE

=cut

use Dancer2 appname => 'API';

my $userService = setting('ioc')->resolve(
	service => 'UserService'
);

my $authService = setting('ioc')->resolve(
	service => 'AuthService'
);

=pod

=head1 GET /USERS

=head2 DESCRIPTION

=head2 RETURN

A JSON array with objects as elements

=cut

get '/users' => sub {
	my $users = $userService->listUsers();

	return $users;
};

=pod

=head1 GET /USERS/:ID

=head2 DESCRIPTION

=head2 PARAMS

=over

=item ID

INT ID del usuario

=back

=head2 RETURN

A JSON object

=cut

get '/users/:id' => sub {
	my %user = $userService->readUser(params->{id});
	return \%user;
};

any ['options', 'del'] => '/users/:id' => sub {
	my $user = $userService->deleteUser(params->{id});
	return $user;
};

any ['options', 'put'] => '/users/:id' => sub {
	my $user = $userService->updateUser(params->{id}, params->{username}, params->{pass}, params->{id_tipo_usuario}, params->{id_cliente}, params->{descripcion}, params->{estado}, params->{timezone});
	return $user;
};

post '/users' => sub {
	my $user = $userService->createUser(params->{username}, params->{pass}, params->{id_tipo_usuario}, params->{id_cliente}, params->{descripcion}, params->{estado}, params->{timezone});
	return $user;
};

get '/login' => sub {
	my $user =  'movilgate';
	my $pass = 'mgadmin'; 
	#params->{username},params->{password}
	my $login = $authService->authenticateUser($user, $pass);
	#header('Authorization' => $login);
	#session token => $login;
	template 'index', {
		response => to_dumper($login)
	}
	
};

get '/logout' => sub {

};

true;

__END__
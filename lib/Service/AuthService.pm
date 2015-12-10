=pod

=head1 PACKAGE NAME

	Service::AuthService

=head2 DESCRIPTION

=head2 LICENSE AND COPYRIGHT

Copyright E<0169> 2015 Movilgate
Cannot modify source-code for any purpose (cannot create derivative works)

=cut

package Service::AuthService;

use Moo;
use Types::Standard qw(Str Int InstanceOf Object);
use JSON::WebToken;
use Data::Dumper;

has model => (
	is => 'rwp',
	isa => InstanceOf['Domain::Model::UserModel'],
	required => 1
);

has secretKey => (
	is => 'ro',
	isa => Str
);

has currentTime => (
	is => 'rw',
	default => sub {
		time
	}
);

has encryption => (
	is => 'ro',
	default => 'HS512',
	isa => Str
);

sub authenticateUser() {
	my ($self, $username, $password) = @_;
	my $jwt = undef;

	my $user = $self->model->login($username, $password);
	return $user->first;

	#if ($user->in_storage) {
	#	return createToken();
	#}

	#return $jwt;
}

sub _createToken() {
	my $self = shift;

	return JSON::WebToken->encode(
		{
			iss => '',
			sub => '',
			aud => '',
			exp => $self->currentTime + 120,
			iat => $self->currentTime,
			jti => 'random',
			scope => 'crearToken',
			userid => ''
		}, 
		$self->secretKey, 
		$self->encryption, 
		{
			typ => 'JWT'
		}
	);
}

sub _refreshToken() {
	my ($self) = @_;

	# TODO: implementarlo
}

sub _verifyToken() {
	my ($self, $token, $tokenList) = @_;

	my $jwt = JSON::WebToken->decode({$token});

	return $jwt;
}

1;

__END__
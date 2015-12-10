package Endpoints::ModelEndpoints;

=pod

=head1 MODELS ENDPOINTS SECTION

=cut

use Dancer2 appname => 'API';

get '/models' => sub {
	my $response = [
		{
			husband  => "barney",
			wife     => "betty",
			son      => "bamm bamm",
		}
	];

	response => $response;
};

true;

__END__
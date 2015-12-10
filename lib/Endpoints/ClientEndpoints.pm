package Endpoints::ClientEndpoints;

=pod

=head1 CLIENT ENDPOINTS SECTION

=cut

use Dancer2 appname => 'API';

get '/clients' => sub {
	my $response = [
		{
			husband  => "barney",
			wife     => "betty",
			son      => "bamm bamm",
		}
	];
	return $response;
};

get '/clients/:id' => sub {
	my $response = {
		'client' => 'get' 
	};
	response => to_json($response);
};

any ['options', 'del'] => '/clients/:id' => sub {
	my $response = {
		'client' => 'delete' 
	};	
	response => to_json($response);
};

any ['options', 'put'] => '/clients/:id' => sub {
	my $response = {
		'client' => 'update' 
	};	
	response => to_json($response);
};

post '/clients' => sub {
	my $response = {
		'client' => 'post' 
	};	
	response => to_json($response);
};

true;

__END__
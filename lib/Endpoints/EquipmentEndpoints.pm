package Endpoints::EquipmentEndpoints;

=pod

=head1 EQUIPMENT ENDPOINTS SECTION

=cut

use Dancer2 appname => 'API';

my $equipmentService = setting('ioc')->resolve(
	service => 'EquipmentService'
);

get '/equipment' => sub {
	my $equipment = $equipmentService->listEquipment();

	return $equipment
};

get '/equipment/:id' => sub {
	my $equipment = $equipmentService->readEquipment(params->{id});
	
	return {
		'response' => $equipment->imei
	}
};

any ['options', 'del'] => '/equipment/:id' => sub {
	my $equipment = $equipmentService->deleteEquipment(867755000792904);

	return {
		'equipment' => $equipment->in_storage
	};	
};

get '/g' => sub {
	return {
		'response' => ''
	};
};

true;

__END__
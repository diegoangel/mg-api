=pod

=head1 PACKAGE NAME

API

=head2 DESCRIPTION

RESTful API level 2 according to Richardson Maturity Model.

This is the entry point for the app.

=head2 AVAILABILITY

C<git clone git@bitbucket.org:Movilgate/test.git>

=head2 BUGS

=head2 AUTHOR

L<Alejandro Solarz|mailto:asolarz@movilgate.com>
L<Diego Rivarola|mailto:drivarola@movilgate.com>

=head2 LICENSE AND COPYRIGHT

Copyright E<0169> 2015 Movilgate
Cannot modify source-code for any purpose (cannot create derivative works)

=cut

package API;

use Dancer2;
use Bread::Board;

our $VERSION = '0.1';

=pod

=head1 SETTINGS SECTION

=cut

set serializer => 'JSON';

set ioc => container setting('appname') => as {
	service AuthService => (
		class => 'Service::AuthService',
		lifecycle => 'Singleton',
		dependencies => {
			model => depends_on('UserModel')
		}
	);
	service UserService => (
		class => 'Service::UserService',
		lifecycle => 'Singleton',
		dependencies => {
			model => depends_on('UserModel')
		}		
	);
	service UserModel => (
		class => 'Domain::Model::UserModel'
	);
	service EquipmentService => (
		class => 'Service::EquipmentService',
		lifecycle => 'Singleton',
		dependencies => {
			model => depends_on('EquipmentModel')
		}	
	);
	service EquipmentModel => (
		class => 'Domain::Model::EquipmentModel',
		lifecycle => 'Singleton',
	);
};

=pod

=head1 HOOKS SECTION

=head2 DESCRIPTION

=cut 

hook before => sub {
	session token => 'dummyTokenJustForTesting';

	if (!session('token') && request->dispatch_path !~ m{^/login}) {
		forward '/login', { 
			requested_path => request->dispatch_path 
		};
	}
};

hook after => sub {
	header('Content-Type' => 'application/json');
	header('Cache-Control' =>  'no-store, no-cache, must-revalidate');
	header('Access-Control-Allow-Origin' => '*');
	header('Access-Control-Allow-Methods' =>  'POST, GET, OPTIONS, PUT, DELETE');
	header('Access-Control-Allow-Headers' => 'Content-Type');
};

=pod

=head2 DEFAULT ENDPOINTS SECTION

=cut

get '/' => sub {
	return {
		'Application Name' => setting('appname'),
		'Version' => ''
	}
};

true;

__END__
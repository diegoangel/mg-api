requires "Dancer2" => "0.162000";
requires "Dancer2::Plugin::Cache::CHI" => "1.6.0";
requires "Dancer2::Plugin::DBIC" => "0.0009";
requires "Dancer2::Plugin::Deferred" => "0.007015";
requires "Dancer2::Plugin::Email" => "0";
requires "Dancer2::Plugin::Auth::Extensible" => "0.401";

requires "Type::Tiny" => "1.000005";
requires "Redis" => "1.980";
requires "Bread::Board" => "0.33";
requires "JSON::WebToken" => "0.10";

requires "Plack::Middleware::JSON::ForBrowsers" => "0.002000";
requires "Plack::Middleware::ETag" => "0.05";
requires "Plack::Middleware::Status" => "1.101150";
requires "Plack::Middleware::TrafficLog" => "0.04";
requires "Plack::Middleware::DetectMobileBrowsers" => "0.05";
requires "Plack::Middleware::Deflater" => "0.12";
requires "Plack::Middleware::Debug" => "0.16";
requires "Plack::Middleware::Debug::DBIProfile" => "0.102";

recommends "YAML"             => "0";
recommends "URL::Encode::XS"  => "0";
recommends "CGI::Deurl::XS"   => "0";
recommends "HTTP::Parser::XS" => "0";
recommends "namespace-autoclean" => "0";

on "build" => sub { 
	requires "App::FatPacker" => "0.010004";
};

on "test" => sub {
    requires "Test::More"            => "0";
    requires "Test::Fatal"            => "0";    
    requires "HTTP::Request::Common" => "0";
};

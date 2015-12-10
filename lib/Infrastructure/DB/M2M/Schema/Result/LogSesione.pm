use utf8;
package Infrastructure::DB::M2M::Schema::Result::LogSesione;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::LogSesione

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<log_sesiones>

=cut

__PACKAGE__->table("log_sesiones");

=head1 ACCESSORS

=head2 id_usuario

  data_type: 'integer'
  is_nullable: 0

=head2 id_session

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 login

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 1

=head2 logout

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 ip_address

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 user_agent

  data_type: 'varchar'
  is_nullable: 1
  size: 150

=head2 id_cliente

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_usuario",
  { data_type => "integer", is_nullable => 0 },
  "id_session",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "login",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 1,
  },
  "logout",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "ip_address",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "user_agent",
  { data_type => "varchar", is_nullable => 1, size => 150 },
  "id_cliente",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_usuario>

=item * L</id_session>

=back

=cut

__PACKAGE__->set_primary_key("id_usuario", "id_session");

=head1 UNIQUE CONSTRAINTS

=head2 C<idx_usuario_login>

=over 4

=item * L</id_usuario>

=item * L</login>

=back

=cut

__PACKAGE__->add_unique_constraint("idx_usuario_login", ["id_usuario", "login"]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bUSAne8CsGy11l9L2D78Sw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# Dumping friendly user DBIx::Class data. Use it inside the model like this:
# 
# use Data::Dumper;
# local $Data::Dumper::Freezer = '_dumper_hook';
#
# Then, dump some DBIx data: print Dumper($some_resulset);

sub _dumper_hook() {
  $_[0] = bless {
    %{ $_[0] },
    result_source => undef,
  }, ref($_[0]);
}

1;

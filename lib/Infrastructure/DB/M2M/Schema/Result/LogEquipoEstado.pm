use utf8;
package Infrastructure::DB::M2M::Schema::Result::LogEquipoEstado;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::LogEquipoEstado - Se almacenan los cambios de estados de los equipos

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

=head1 TABLE: C<log_equipo_estado>

=cut

__PACKAGE__->table("log_equipo_estado");

=head1 ACCESSORS

=head2 equipo_id

  data_type: 'bigint'
  is_nullable: 0

=head2 estado

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 sensor_id

  data_type: 'integer'
  is_nullable: 1

=head2 sensor_posicion

  data_type: 'integer'
  is_nullable: 1

=head2 fecha

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "equipo_id",
  { data_type => "bigint", is_nullable => 0 },
  "estado",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "sensor_id",
  { data_type => "integer", is_nullable => 1 },
  "sensor_posicion",
  { data_type => "integer", is_nullable => 1 },
  "fecha",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</equipo_id>

=item * L</fecha>

=back

=cut

__PACKAGE__->set_primary_key("equipo_id", "fecha");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AdFE9r8NPIGBCh3aDdwc3Q


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

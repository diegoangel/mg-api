use utf8;
package Infrastructure::DB::M2M::Schema::Result::Sensore;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::Sensore

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

=head1 TABLE: C<sensores>

=cut

__PACKAGE__->table("sensores");

=head1 ACCESSORS

=head2 id_sensor

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nombre

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 descripcion

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 id_tipo_sensor

  data_type: 'integer'
  is_nullable: 1

=head2 log

  data_type: 'text'
  is_nullable: 1

=head2 estado_alerta

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 escalamiento

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_sensor",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nombre",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "descripcion",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "id_tipo_sensor",
  { data_type => "integer", is_nullable => 1 },
  "log",
  { data_type => "text", is_nullable => 1 },
  "estado_alerta",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "escalamiento",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_sensor>

=back

=cut

__PACKAGE__->set_primary_key("id_sensor");

=head1 RELATIONS

=head2 avisos

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::Aviso>

=cut

__PACKAGE__->has_many(
  "avisos",
  "Infrastructure::DB::M2M::Schema::Result::Aviso",
  { "foreign.id_sensor" => "self.id_sensor" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 delay_avisos

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::DelayAviso>

=cut

__PACKAGE__->has_many(
  "delay_avisos",
  "Infrastructure::DB::M2M::Schema::Result::DelayAviso",
  { "foreign.id_sensor" => "self.id_sensor" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 equipo_sensors

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::EquipoSensor>

=cut

__PACKAGE__->has_many(
  "equipo_sensors",
  "Infrastructure::DB::M2M::Schema::Result::EquipoSensor",
  { "foreign.id_sensor" => "self.id_sensor" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 grupo_sensors

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::GrupoSensor>

=cut

__PACKAGE__->has_many(
  "grupo_sensors",
  "Infrastructure::DB::M2M::Schema::Result::GrupoSensor",
  { "foreign.id_sensor" => "self.id_sensor" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sensor_parametros

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::SensorParametro>

=cut

__PACKAGE__->has_many(
  "sensor_parametros",
  "Infrastructure::DB::M2M::Schema::Result::SensorParametro",
  { "foreign.id_sensor" => "self.id_sensor" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 id_grupoes

Type: many_to_many

Composing rels: L</grupo_sensors> -> id_grupo

=cut

__PACKAGE__->many_to_many("id_grupoes", "grupo_sensors", "id_grupo");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kz2LIUhtLyBB29Ro7X8NCA


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

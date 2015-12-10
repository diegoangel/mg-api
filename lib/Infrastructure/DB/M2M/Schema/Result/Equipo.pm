use utf8;
package Infrastructure::DB::M2M::Schema::Result::Equipo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::Equipo

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

=head1 TABLE: C<equipos>

=cut

__PACKAGE__->table("equipos");

=head1 ACCESSORS

=head2 id_equipo

  data_type: 'bigint'
  is_nullable: 0

=head2 id_cliente

  data_type: 'integer'
  is_nullable: 0

=head2 mkey

  data_type: 'integer'
  is_nullable: 1

=head2 ukey

  data_type: 'integer'
  is_nullable: 1

=head2 apn

  data_type: 'integer'
  is_nullable: 1

=head2 usr

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 pwd

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 ip1

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 prt1

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 ip2

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 prt2

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 trg1

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 trg2

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 imei

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 estado

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 timeout

  data_type: 'smallint'
  default_value: 10
  extra: {unsigned => 1}
  is_nullable: 0

=head2 timezone

  data_type: 'smallint'
  default_value: 0
  is_nullable: 0

=head2 nombre

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 refresco

  data_type: 'smallint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 telefono

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 carrier

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 imagen

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 estado_alerta

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 calibrado

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 buzzer

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 set_parametros

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 delay

  data_type: 'smallint'
  default_value: 1
  is_nullable: 0

=head2 escalamiento

  data_type: 'smallint'
  default_value: 10
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_equipo",
  { data_type => "bigint", is_nullable => 0 },
  "id_cliente",
  { data_type => "integer", is_nullable => 0 },
  "mkey",
  { data_type => "integer", is_nullable => 1 },
  "ukey",
  { data_type => "integer", is_nullable => 1 },
  "apn",
  { data_type => "integer", is_nullable => 1 },
  "usr",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "pwd",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "ip1",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "prt1",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "ip2",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "prt2",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "trg1",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "trg2",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "imei",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "estado",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "timeout",
  {
    data_type => "smallint",
    default_value => 10,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "timezone",
  { data_type => "smallint", default_value => 0, is_nullable => 0 },
  "nombre",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "refresco",
  {
    data_type => "smallint",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "telefono",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "carrier",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "imagen",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "estado_alerta",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "calibrado",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "buzzer",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "set_parametros",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "delay",
  { data_type => "smallint", default_value => 1, is_nullable => 0 },
  "escalamiento",
  { data_type => "smallint", default_value => 10, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_equipo>

=back

=cut

__PACKAGE__->set_primary_key("id_equipo");

=head1 RELATIONS

=head2 delay_avisos

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::DelayAviso>

=cut

__PACKAGE__->has_many(
  "delay_avisos",
  "Infrastructure::DB::M2M::Schema::Result::DelayAviso",
  { "foreign.id_equipo" => "self.id_equipo" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 equipo_escalamientoes

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::EquipoEscalamiento>

=cut

__PACKAGE__->has_many(
  "equipo_escalamientoes",
  "Infrastructure::DB::M2M::Schema::Result::EquipoEscalamiento",
  { "foreign.id_equipo" => "self.id_equipo" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 equipo_sensors

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::EquipoSensor>

=cut

__PACKAGE__->has_many(
  "equipo_sensors",
  "Infrastructure::DB::M2M::Schema::Result::EquipoSensor",
  { "foreign.id_equipo" => "self.id_equipo" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 equipo_usuarios

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::EquipoUsuario>

=cut

__PACKAGE__->has_many(
  "equipo_usuarios",
  "Infrastructure::DB::M2M::Schema::Result::EquipoUsuario",
  { "foreign.id_equipo" => "self.id_equipo" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 id_usuarios

Type: many_to_many

Composing rels: L</equipo_escalamientoes> -> id_usuario

=cut

__PACKAGE__->many_to_many("id_usuarios", "equipo_escalamientoes", "id_usuario");

=head2 id_usuarios_2s

Type: many_to_many

Composing rels: L</equipo_usuarios> -> id_usuario

=cut

__PACKAGE__->many_to_many("id_usuarios_2s", "equipo_usuarios", "id_usuario");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CyvBrDcFd3Z4ozYosCMKNg


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

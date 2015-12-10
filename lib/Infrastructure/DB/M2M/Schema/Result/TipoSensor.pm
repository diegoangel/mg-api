use utf8;
package Infrastructure::DB::M2M::Schema::Result::TipoSensor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::TipoSensor

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

=head1 TABLE: C<tipo_sensor>

=cut

__PACKAGE__->table("tipo_sensor");

=head1 ACCESSORS

=head2 id_tipo_sensor

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 tipo

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 unidad

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 descripcion

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 min

  data_type: 'float'
  is_nullable: 1

=head2 max

  data_type: 'float'
  is_nullable: 1

=head2 normalizador

  data_type: 'float'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_tipo_sensor",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "tipo",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "unidad",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "descripcion",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "min",
  { data_type => "float", is_nullable => 1 },
  "max",
  { data_type => "float", is_nullable => 1 },
  "normalizador",
  { data_type => "float", default_value => 0, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_tipo_sensor>

=back

=cut

__PACKAGE__->set_primary_key("id_tipo_sensor");

=head1 RELATIONS

=head2 tipo_sensor_mensajes

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::TipoSensorMensaje>

=cut

__PACKAGE__->has_many(
  "tipo_sensor_mensajes",
  "Infrastructure::DB::M2M::Schema::Result::TipoSensorMensaje",
  { "foreign.id_tipo_sensor" => "self.id_tipo_sensor" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wj7b5rbNxdgDgWkJOmWNkA


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

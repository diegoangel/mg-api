use utf8;
package Infrastructure::DB::M2M::Schema::Result::Grupo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::Grupo

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

=head1 TABLE: C<grupos>

=cut

__PACKAGE__->table("grupos");

=head1 ACCESSORS

=head2 id_grupo

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

=head2 imagen

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 id_cliente

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_grupo",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nombre",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "descripcion",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "imagen",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "id_cliente",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_grupo>

=back

=cut

__PACKAGE__->set_primary_key("id_grupo");

=head1 RELATIONS

=head2 grupo_sensors

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::GrupoSensor>

=cut

__PACKAGE__->has_many(
  "grupo_sensors",
  "Infrastructure::DB::M2M::Schema::Result::GrupoSensor",
  { "foreign.id_grupo" => "self.id_grupo" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 id_cliente

Type: belongs_to

Related object: L<Infrastructure::DB::M2M::Schema::Result::Cliente>

=cut

__PACKAGE__->belongs_to(
  "id_cliente",
  "Infrastructure::DB::M2M::Schema::Result::Cliente",
  { id_cliente => "id_cliente" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 id_sensors

Type: many_to_many

Composing rels: L</grupo_sensors> -> id_sensor

=cut

__PACKAGE__->many_to_many("id_sensors", "grupo_sensors", "id_sensor");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Jpr3FzuuMx1kOS/wUlLWUg


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

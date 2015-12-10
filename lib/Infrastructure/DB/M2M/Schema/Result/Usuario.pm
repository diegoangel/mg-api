use utf8;
package Infrastructure::DB::M2M::Schema::Result::Usuario;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::Usuario

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

=head1 TABLE: C<usuarios>

=cut

__PACKAGE__->table("usuarios");

=head1 ACCESSORS

=head2 id_usuario

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 user

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 pass

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 id_tipo_usuario

  data_type: 'smallint'
  default_value: 3
  is_nullable: 0

=head2 id_cliente

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 telefono

  data_type: 'bigint'
  is_nullable: 1

=head2 carrier

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 descripcion

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 estado

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 timezone

  data_type: 'smallint'
  default_value: -3
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_usuario",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "user",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "pass",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "id_tipo_usuario",
  { data_type => "smallint", default_value => 3, is_nullable => 0 },
  "id_cliente",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "telefono",
  { data_type => "bigint", is_nullable => 1 },
  "carrier",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "descripcion",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "estado",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "timezone",
  { data_type => "smallint", default_value => -3, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_usuario>

=back

=cut

__PACKAGE__->set_primary_key("id_usuario");

=head1 UNIQUE CONSTRAINTS

=head2 C<Unique_user>

=over 4

=item * L</user>

=back

=cut

__PACKAGE__->add_unique_constraint("Unique_user", ["user"]);

=head1 RELATIONS

=head2 aviso_usuarios

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::AvisoUsuario>

=cut

__PACKAGE__->has_many(
  "aviso_usuarios",
  "Infrastructure::DB::M2M::Schema::Result::AvisoUsuario",
  { "foreign.id_usuario" => "self.id_usuario" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 equipo_escalamientoes

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::EquipoEscalamiento>

=cut

__PACKAGE__->has_many(
  "equipo_escalamientoes",
  "Infrastructure::DB::M2M::Schema::Result::EquipoEscalamiento",
  { "foreign.id_usuario" => "self.id_usuario" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 equipo_usuarios

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::EquipoUsuario>

=cut

__PACKAGE__->has_many(
  "equipo_usuarios",
  "Infrastructure::DB::M2M::Schema::Result::EquipoUsuario",
  { "foreign.id_usuario" => "self.id_usuario" },
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

=head2 id_avisoes

Type: many_to_many

Composing rels: L</aviso_usuarios> -> id_aviso

=cut

__PACKAGE__->many_to_many("id_avisoes", "aviso_usuarios", "id_aviso");

=head2 id_equipoes

Type: many_to_many

Composing rels: L</equipo_escalamientoes> -> id_equipo

=cut

__PACKAGE__->many_to_many("id_equipoes", "equipo_escalamientoes", "id_equipo");

=head2 id_equipoes_2s

Type: many_to_many

Composing rels: L</equipo_usuarios> -> id_equipo

=cut

__PACKAGE__->many_to_many("id_equipoes_2s", "equipo_usuarios", "id_equipo");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9SGFnUBKCkd+oLZfsMtHYQ


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


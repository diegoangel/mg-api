use utf8;
package Infrastructure::DB::M2M::Schema::Result::Aviso;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::Aviso

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

=head1 TABLE: C<avisos>

=cut

__PACKAGE__->table("avisos");

=head1 ACCESSORS

=head2 id_aviso

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 id_sensor

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 menorque

  data_type: 'float'
  is_nullable: 1

=head2 mayorque

  data_type: 'float'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_aviso",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "id_sensor",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "menorque",
  { data_type => "float", is_nullable => 1 },
  "mayorque",
  { data_type => "float", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_aviso>

=back

=cut

__PACKAGE__->set_primary_key("id_aviso");

=head1 RELATIONS

=head2 aviso_usuarios

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::AvisoUsuario>

=cut

__PACKAGE__->has_many(
  "aviso_usuarios",
  "Infrastructure::DB::M2M::Schema::Result::AvisoUsuario",
  { "foreign.id_aviso" => "self.id_aviso" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 delay_aviso

Type: might_have

Related object: L<Infrastructure::DB::M2M::Schema::Result::DelayAviso>

=cut

__PACKAGE__->might_have(
  "delay_aviso",
  "Infrastructure::DB::M2M::Schema::Result::DelayAviso",
  { "foreign.id_aviso" => "self.id_aviso" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 id_sensor

Type: belongs_to

Related object: L<Infrastructure::DB::M2M::Schema::Result::Sensore>

=cut

__PACKAGE__->belongs_to(
  "id_sensor",
  "Infrastructure::DB::M2M::Schema::Result::Sensore",
  { id_sensor => "id_sensor" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 id_usuarios

Type: many_to_many

Composing rels: L</aviso_usuarios> -> id_usuario

=cut

__PACKAGE__->many_to_many("id_usuarios", "aviso_usuarios", "id_usuario");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jGy3Geq0vjlmacqDcd+m9Q


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

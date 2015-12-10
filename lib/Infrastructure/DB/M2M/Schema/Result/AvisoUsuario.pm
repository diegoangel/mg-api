use utf8;
package Infrastructure::DB::M2M::Schema::Result::AvisoUsuario;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::AvisoUsuario

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

=head1 TABLE: C<aviso_usuario>

=cut

__PACKAGE__->table("aviso_usuario");

=head1 ACCESSORS

=head2 id_aviso

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 id_usuario

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_aviso",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "id_usuario",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_aviso>

=item * L</id_usuario>

=back

=cut

__PACKAGE__->set_primary_key("id_aviso", "id_usuario");

=head1 RELATIONS

=head2 id_aviso

Type: belongs_to

Related object: L<Infrastructure::DB::M2M::Schema::Result::Aviso>

=cut

__PACKAGE__->belongs_to(
  "id_aviso",
  "Infrastructure::DB::M2M::Schema::Result::Aviso",
  { id_aviso => "id_aviso" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 id_usuario

Type: belongs_to

Related object: L<Infrastructure::DB::M2M::Schema::Result::Usuario>

=cut

__PACKAGE__->belongs_to(
  "id_usuario",
  "Infrastructure::DB::M2M::Schema::Result::Usuario",
  { id_usuario => "id_usuario" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZdHI0WI6uTrbe53I7m59ig


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

use utf8;
package Infrastructure::DB::M2M::Schema::Result::Cliente;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::Cliente

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

=head1 TABLE: C<clientes>

=cut

__PACKAGE__->table("clientes");

=head1 ACCESSORS

=head2 id_cliente

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nombre

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 appid

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 logo

  data_type: 'varchar'
  default_value: 'Header2.png'
  is_nullable: 0
  size: 50

=head2 estilo

  data_type: 'varchar'
  default_value: 'style.css'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "id_cliente",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nombre",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "appid",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "logo",
  {
    data_type => "varchar",
    default_value => "Header2.png",
    is_nullable => 0,
    size => 50,
  },
  "estilo",
  {
    data_type => "varchar",
    default_value => "style.css",
    is_nullable => 0,
    size => 50,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_cliente>

=back

=cut

__PACKAGE__->set_primary_key("id_cliente");

=head1 RELATIONS

=head2 grupos

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::Grupo>

=cut

__PACKAGE__->has_many(
  "grupos",
  "Infrastructure::DB::M2M::Schema::Result::Grupo",
  { "foreign.id_cliente" => "self.id_cliente" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 usuarios

Type: has_many

Related object: L<Infrastructure::DB::M2M::Schema::Result::Usuario>

=cut

__PACKAGE__->has_many(
  "usuarios",
  "Infrastructure::DB::M2M::Schema::Result::Usuario",
  { "foreign.id_cliente" => "self.id_cliente" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:q4ClO0qXzaHgBTxkmpc1sQ


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

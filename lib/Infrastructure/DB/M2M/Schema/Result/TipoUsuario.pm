use utf8;
package Infrastructure::DB::M2M::Schema::Result::TipoUsuario;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::TipoUsuario

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

=head1 TABLE: C<tipo_usuario>

=cut

__PACKAGE__->table("tipo_usuario");

=head1 ACCESSORS

=head2 id_tipo_usuario

  data_type: 'smallint'
  is_auto_increment: 1
  is_nullable: 0

=head2 tipo

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=cut

__PACKAGE__->add_columns(
  "id_tipo_usuario",
  { data_type => "smallint", is_auto_increment => 1, is_nullable => 0 },
  "tipo",
  { data_type => "varchar", is_nullable => 1, size => 20 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_tipo_usuario>

=back

=cut

__PACKAGE__->set_primary_key("id_tipo_usuario");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Yr6zQQKvhkmpONZtBxA6uw


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

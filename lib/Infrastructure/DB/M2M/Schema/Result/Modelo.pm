use utf8;
package Infrastructure::DB::M2M::Schema::Result::Modelo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::Modelo

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

=head1 TABLE: C<modelos>

=cut

__PACKAGE__->table("modelos");

=head1 ACCESSORS

=head2 modelo

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 orden

  data_type: 'smallint'
  is_nullable: 0

=head2 id_tipo_sensor

  data_type: 'smallint'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "modelo",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "orden",
  { data_type => "smallint", is_nullable => 0 },
  "id_tipo_sensor",
  { data_type => "smallint", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</modelo>

=item * L</orden>

=back

=cut

__PACKAGE__->set_primary_key("modelo", "orden");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UMdK+1PisbSjeMsuqgjPqw


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

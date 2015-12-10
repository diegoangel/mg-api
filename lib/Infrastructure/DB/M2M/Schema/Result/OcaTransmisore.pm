use utf8;
package Infrastructure::DB::M2M::Schema::Result::OcaTransmisore;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::OcaTransmisore

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

=head1 TABLE: C<oca_transmisores>

=cut

__PACKAGE__->table("oca_transmisores");

=head1 ACCESSORS

=head2 id_transmisor

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 nombre

  data_type: 'varchar'
  is_nullable: 1
  size: 4

=head2 n

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 zigbee

  data_type: 'varchar'
  is_nullable: 1
  size: 1

=head2 subred

  data_type: 'varchar'
  is_nullable: 1
  size: 4

=head2 id_concentrador

  data_type: 'integer'
  is_nullable: 1

=head2 id_equipo

  data_type: 'bigint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_transmisor",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "nombre",
  { data_type => "varchar", is_nullable => 1, size => 4 },
  "n",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "zigbee",
  { data_type => "varchar", is_nullable => 1, size => 1 },
  "subred",
  { data_type => "varchar", is_nullable => 1, size => 4 },
  "id_concentrador",
  { data_type => "integer", is_nullable => 1 },
  "id_equipo",
  { data_type => "bigint", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_transmisor>

=back

=cut

__PACKAGE__->set_primary_key("id_transmisor");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u0VIsi8INa/FpCzINxloYA


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

use utf8;
package Infrastructure::DB::M2M::Schema::Result::DatoMedicion;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::DatoMedicion

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

=head1 TABLE: C<dato_medicion>

=cut

__PACKAGE__->table("dato_medicion");

=head1 ACCESSORS

=head2 id_dato_medicion

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 id_sensor

  data_type: 'integer'
  is_nullable: 0

=head2 valor

  data_type: 'float'
  is_nullable: 1

=head2 fecha

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 1

=head2 paquete

  data_type: 'integer'
  is_nullable: 1

=head2 alerta

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_dato_medicion",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "id_sensor",
  { data_type => "integer", is_nullable => 0 },
  "valor",
  { data_type => "float", is_nullable => 1 },
  "fecha",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 1,
  },
  "paquete",
  { data_type => "integer", is_nullable => 1 },
  "alerta",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_dato_medicion>

=back

=cut

__PACKAGE__->set_primary_key("id_dato_medicion");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4PZG1R/tEYNobQQ39t/A8w


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

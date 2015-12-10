use utf8;
package Infrastructure::DB::M2M::Schema::Result::DelayAviso;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::DelayAviso

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

=head1 TABLE: C<delay_avisos>

=cut

__PACKAGE__->table("delay_avisos");

=head1 ACCESSORS

=head2 id_aviso

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 id_sensor

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 id_equipo

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 valor

  data_type: 'float'
  is_nullable: 1

=head2 fecha

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 count

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 avisado

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 buzzer

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 escalado

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_aviso",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "id_sensor",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "id_equipo",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "valor",
  { data_type => "float", is_nullable => 1 },
  "fecha",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "count",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "avisado",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "buzzer",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "escalado",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_aviso>

=back

=cut

__PACKAGE__->set_primary_key("id_aviso");

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

=head2 id_equipo

Type: belongs_to

Related object: L<Infrastructure::DB::M2M::Schema::Result::Equipo>

=cut

__PACKAGE__->belongs_to(
  "id_equipo",
  "Infrastructure::DB::M2M::Schema::Result::Equipo",
  { id_equipo => "id_equipo" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:d7JbdtwoWlZ/5CT661E+Ow


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

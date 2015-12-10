use utf8;
package Infrastructure::DB::M2M::Schema::Result::MedicionesStatus;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::MedicionesStatus

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

=head1 TABLE: C<mediciones_status>

=cut

__PACKAGE__->table("mediciones_status");

=head1 ACCESSORS

=head2 id_medicion

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 imei

  data_type: 'bigint'
  is_nullable: 1

=head2 paquete

  data_type: 'integer'
  is_nullable: 1

=head2 posicion

  data_type: 'integer'
  is_nullable: 1

=head2 valor

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 fecha

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 estado

  data_type: 'enum'
  extra: {list => ["CRITICAL","WARNING","OK"]}
  is_nullable: 1

=head2 estado_alerta

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 1

=head2 id_usuario

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id_medicion",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "imei",
  { data_type => "bigint", is_nullable => 1 },
  "paquete",
  { data_type => "integer", is_nullable => 1 },
  "posicion",
  { data_type => "integer", is_nullable => 1 },
  "valor",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "fecha",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "estado",
  {
    data_type => "enum",
    extra => { list => ["CRITICAL", "WARNING", "OK"] },
    is_nullable => 1,
  },
  "estado_alerta",
  { data_type => "tinyint", default_value => 1, is_nullable => 1 },
  "id_usuario",
  { data_type => "integer", is_nullable => 1 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<uk_status>

=over 4

=item * L</imei>

=item * L</posicion>

=back

=cut

__PACKAGE__->add_unique_constraint("uk_status", ["imei", "posicion"]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9AFofnIv26XvLdG73koL5g


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

use utf8;
package Infrastructure::DB::M2M::Schema::Result::Mensaje;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Infrastructure::DB::M2M::Schema::Result::Mensaje

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

=head1 TABLE: C<mensajes>

=cut

__PACKAGE__->table("mensajes");

=head1 ACCESSORS

=head2 id_mensaje

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 tipo

  data_type: 'enum'
  extra: {list => ["EMAIL","SMS"]}
  is_nullable: 0

=head2 senderid

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 recipientid

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 subject

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 message

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 id_cliente

  data_type: 'integer'
  is_nullable: 1

=head2 id_aviso

  data_type: 'integer'
  is_nullable: 1

=head2 estado

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 fecha

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id_mensaje",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "tipo",
  {
    data_type => "enum",
    extra => { list => ["EMAIL", "SMS"] },
    is_nullable => 0,
  },
  "senderid",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "recipientid",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "subject",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "message",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "id_cliente",
  { data_type => "integer", is_nullable => 1 },
  "id_aviso",
  { data_type => "integer", is_nullable => 1 },
  "estado",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "fecha",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id_mensaje>

=back

=cut

__PACKAGE__->set_primary_key("id_mensaje");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-30 06:35:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:psAhUqRXP2XtpUT7i6SHuA


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

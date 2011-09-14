package FbM::Model::Base;
use strict;
use warnings;
use v5.14;
use base qw/Mojo::Base/;



sub alphabet {
  my $class = shift;
  #my @alphabet = map { { SUB => "<a href=/letter/$_>$_&nbsp</a>" } } [1..10];
  my $sth = FbM::Model->dbh->prepare("SELECT DISTINCT SUBSTRING (F FROM 1 FOR 1) AS SUB FROM MAIN ORDER BY F");
  $sth->execute;
  my @alphabet = map { { SUB => "<a href=/letter/$_->{'SUB'}>$_->{'SUB'}&nbsp</a>" } }
  @{ $sth->fetchall_arrayref( {} ) };
  return @alphabet;
}




#### Class Methods ####

#sub select {
#    my $class = shift;
# 
#    FastNotes::Model->db->select($class->table_name, '*', @_);
#}
#
#sub insert {
#    my $class = shift;
#    my $db = FastNotes::Model->db;
#    $db->insert($class->table_name, @_)   or die $db->error();
#    $db->last_insert_id('','','','')  or die $db->error();
#}
#
#sub update {
#    my $class = shift;
#    my $db = FastNotes::Model->db;
#    $db->update($class->table_name, @_) or die $db->error();
#}
#
#sub delete {
#    my $class = shift;
#    my $db = FastNotes::Model->db;
#    $db->delete($class->table_name, @_) or die $db->error();
#}
#
1;
__END__

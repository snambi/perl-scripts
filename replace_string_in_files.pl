#  author nambi sankaran
#  copyright (C) 2012 nambi sankaran.
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

use strict;

if( $#ARGV != 2 ){
    usage();
}

my $extenstion = $ARGV[0];
my $pattern = $ARGV[1];
my $replacement = $ARGV[2];

## find all the files from current directory
my @files = `find . -name \*\.$extenstion -print`;

foreach my $f ( @files ){
    chomp $f;
    print "changing $f\n";
    my $new_content = `sed 's/$pattern/$replacement/g' $f`;
    open( MYFILE , ">$f");
    #print $new_content . "\n";
    print MYFILE $new_content;
    close( MYFILE);
}

sub usage(){
    print "replace_string extension pattern replacement\n";
    print "               extension : java, php\n";
    print "               pattern : value\n";
    print "               replacement : newvalue\n";
    exit(-1);
}


#!/usr/bin/perl

use strict;
use warnings;

sub leetspeak {
    my ($password,$type,$whitespace) = @_; # @_ is used to receive arguments 
    $password = uc($password); # change to uppercase

    my %leetspeak_mapping = ( # hash
        'A' => ['4', '@', '/\\', '/-\\', '|-\\'], # 'A' is the key => is the 'fat comma' sometimes used in perl for hashes
        'B' => ['8', '|3', '13'],
        'C' => ['(', '<', '['],
        'D' => ['[)', '|>', '|)', '|]'],
        'E' => ['3', '[-'],
        'F' => ['|=', '/='],
        'G' => ['6', '(_+'],
        'H' => ['#', '/-/', '[-]', ']-[', ')-(', '(-)', ':-:', '|~|', '|-|', ']~[', '}{'],
        'I' => ['1', '!', '|', '][', ']'],
        'J' => ['_|', '_/', '(/', ';'],
        'K' => ['X', '|<', '|{',],
        'L' => ['1_', '|_', '[_'],
        'M' => ['|V|', '|\/|', '\/\/', '/\/\\', '/V\\'],
        'N' => ['|V', '|\\|', '/\/', '[\]', '/V'],
        'O' => ['[]', '0', '()'],
        'P' => ['|*', '|o', '/*'],
        'Q' => [ '(_,)', '()_', '0_', '<|', '0,'],
        'R' => ['2', '|?', '/2', '|2'],
        'S' => ['5', '$', '_/¯'],
        'T' => ['7', '¯|¯'],
        'U' => ['(_)', '|_|', 'L|'],
        'V' => ['\/', '|/'],
        'W' => ['\/\/', 'vv', '\//'.' \^/', '\V/', '\|/', '\_|_/', '\_:_/'],
        'X' => ['><', '}{', ')('],
        'Y' => ['`/', '\/'],
        'Z' => ['≥', "'", '7_', '>_'],
    );

    my $leetspeak_password = '';
    foreach my $char (split('', $password)) {
        if (exists $leetspeak_mapping{$char}) { # see if character is in the hash
            my @letter = @{$leetspeak_mapping{$char}}; #grab the value of the hash which is an array
            if ($type eq 1 || $type eq 2) { # using the eq opperator instead of ==
                my $variation = $letter[$type-1];
                $leetspeak_password .= $variation . ' '; # string cat is done by .
            } elsif ($type eq 'rand' || $type eq 'random') {
                my $variation = $letter[rand @letter];
                $leetspeak_password .= $variation . ' ';
            } else {
                die "Error: type is not 1 or 2 or rand gave: $type";
            }
        } else {
            $leetspeak_password .= $char . ' ';
        }
    }
    if ($whitespace eq 'Y' || $whitespace eq 'y'){
        return $leetspeak_password;
    }else{
        $leetspeak_password =~ s/\s+//g;
        # s/ start
        # \s represents the whitespace characters
        # + is one or more
        # // delimiters for the regular expression pattern
        # g is global; meaning apply to whole string
        return $leetspeak_password;
    }
     
}


print "What password do you want to convert? ";
my $input_password = <STDIN>;
chomp $input_password;
# gets password from the standard input 
print "What style type would you like; 1, 2 or random? ";
my $type = <STDIN>;
chomp $type;
# gets sytle type from the standard input 
print "Include whitespace between characters? (y/n) ";
my $whitespace = <STDIN>;
chomp $whitespace;
# asks the user if they want whitespace inbetween the characters
my $leetspeak_password = leetspeak($input_password,$type,$whitespace);
print "Original Password: $input_password\n";
print "Leetspeak Password: $leetspeak_password\n";

# #!/usr/bin/perl

# Take in a password from the user, and modify it to be more secure with substitutions and additions

use strict;
use warnings;

sub intermittent_char_count {
    my ($password) = @_;

    # Convert string to array of characters
    my @password_chars = split(//, $password);

    # For each character, perform a substitution or addition
    my $scalar_index = 0;
    while ( $scalar_index < scalar @password_chars ) {
        if ($scalar_index % 10 == 0) {
            splice @password_chars, $scalar_index, 0, "$scalar_index";
            $scalar_index = $scalar_index + 1;
        }
        $scalar_index = $scalar_index + 1;
    }
    return join('', @password_chars);
}

sub replace_with_leet {
    my ($password) = @_;

    # Convert string to array of characters
    my @password_chars = split(//, $password);

    my $l_leet = 1;

    my $e_leet = 3;

    my $t_leet = 7;

    my $scalar_index = 0; 
    while ( $scalar_index < scalar @password_chars ) {
        if ($password_chars[$scalar_index] eq 'l') {
            $password_chars[$scalar_index] = $l_leet;
        } elsif ($password_chars[$scalar_index] eq 'e') {
            $password_chars[$scalar_index] = $e_leet;
        } elsif ($password_chars[$scalar_index] eq 't') {
            $password_chars[$scalar_index] = $t_leet;
        }
        $scalar_index = $scalar_index + 1;
    } 
    return join('', @password_chars);
}

sub ending_hash {
    my ($password,$p_length) = @_;

    # Convert string to array of characters
    my @password_chars = split(//, $password);

    my $scalar_index = 0;
    my $sum = 0;
    while ( $scalar_index < scalar @password_chars ) {
        my $char = ord($password_chars[$scalar_index]);
        $sum = $sum + ((128**$scalar_index) * $char);
        $scalar_index = $scalar_index + 1;
    }

    my $return_password = join('', @password_chars);

    my $sum_string = "$sum";

    # $return_password = "${return_password}${sum}";

    return "${return_password}${sum}";
}

sub modify_password {
    my ($password) = @_;

    # my $new_password = intermittent_char_count($password);

    # $new_password = replace_with_leet($new_password);

    # $new_password = ending_hash($new_password);

    my $new_password = ending_hash($password);

    return $new_password;
}

print "Enter your crappy password: ";
my $firstpassword = <STDIN>;

chomp $firstpassword;

my $newpassword = modify_password($firstpassword);

print "Your new password: $newpassword\n";

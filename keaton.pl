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

sub replace_a_with_4 {
    my ($password) = @_;

    # Convert string to array of characters
    my @password_chars = split(//, $password);

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

sub modify_password {
    my ($password) = @_;

    my $new_password = intermittent_char_count($password);

    return join('', @password_chars);
}

print "Your crappy password: ";
my $firstpassword = <STDIN>;

my $newpassword = modify_password($firstpassword);

print "Your new password: $newpassword\n";

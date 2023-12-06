# #!/usr/bin/perl

use strict;
use warnings;

# Password generation function
sub generate_password {
    my ($length, $use_symbols, $use_numbers, $use_uppercase) = @_;

    # Define character sets
    my $lowercase_chars = 'abcdefghijklmnopqrstuvwxyz';
    my $uppercase_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    my $number_chars = '0123456789';
    my $symbol_chars = '!@#$%^&*()-=_+[]{}|;:,.<>?';

    # Build character set based on user preferences
    my $charset = $lowercase_chars;
    $charset .= $uppercase_chars if $use_uppercase;
    $charset .= $number_chars if $use_numbers;
    $charset .= $symbol_chars if $use_symbols;

    # Check if at least one character set is selected
    die "Error: At least one character set must be selected.\n" unless length($charset) > 0;

    # Generate password
    my $password = '';
    for (1 .. $length) {
        my $random_char = substr($charset, int(rand(length($charset))), 1);
        $password .= $random_char;
    }

    return $password;
}

# Get user preferences
print "Password Length: ";
my $length = <STDIN>;
chomp $length;

print "Include Uppercase Letters? (y/n): ";
my $use_uppercase = lc(<STDIN>);
chomp $use_uppercase;
$use_uppercase = ($use_uppercase eq 'y') ? 1 : 0;

print "Include Numbers? (y/n): ";
my $use_numbers = lc(<STDIN>);
chomp $use_numbers;
$use_numbers = ($use_numbers eq 'y') ? 1 : 0;

print "Include Symbols? (y/n): ";
my $use_symbols = lc(<STDIN>);
chomp $use_symbols;
$use_symbols = ($use_symbols eq 'y') ? 1 : 0;

# Generate and print password
my $password = generate_password($length, $use_symbols, $use_numbers, $use_uppercase);
print "Generated Password: $password\n";

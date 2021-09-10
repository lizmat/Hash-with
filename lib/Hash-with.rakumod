use v6.c;

role Hash-with:ver<0.0.4>:auth<zef:lizmat>[&mapper] {
    method AT-KEY(::?ROLE:D: \key)              { nextwith(mapper(key))        }
    method EXISTS-KEY(::?ROLE:D: \key)          { nextwith(mapper(key))        }
    method DELETE-KEY(::?ROLE:D: \key)          { nextwith(mapper(key))        }
    method STORE_AT_KEY(::?ROLE:D: \key,\value) { nextwith(mapper(key), value) }
    method BIND-KEY(::?ROLE:D: \key,\value)     { nextwith(mapper(key), value) }
}

role Hash-lc {
    method AT-KEY(::?ROLE:D: \key)              { nextwith(key.lc)        }
    method EXISTS-KEY(::?ROLE:D: \key)          { nextwith(key.lc)        }
    method DELETE-KEY(::?ROLE:D: \key)          { nextwith(key.lc)        }
    method STORE_AT_KEY(::?ROLE:D: \key,\value) { nextwith(key.lc, value) }
    method BIND-KEY(::?ROLE:D: \key,\value)     { nextwith(key.lc, value) }
}

role Hash-uc {
    method AT-KEY(::?ROLE:D: \key)              { nextwith(key.uc)        }
    method EXISTS-KEY(::?ROLE:D: \key)          { nextwith(key.uc)        }
    method DELETE-KEY(::?ROLE:D: \key)          { nextwith(key.uc)        }
    method STORE_AT_KEY(::?ROLE:D: \key,\value) { nextwith(key.uc, value) }
    method BIND-KEY(::?ROLE:D: \key,\value)     { nextwith(key.uc, value) }
}

=begin pod

=head1 NAME

Hash-with - Roles for automatically mapping keys in hashes

=head1 SYNOPSIS

  use Hash-with;

  my %h1 does Hash-lc = A => 42;             # map all keys to lowercase
  say %h1<a>;    # 42

  my %h2 does Hash-uc = a => 42;             # map all keys to uppercase
  say %h2<A>;    # 42

  sub ordered($a) { $a.comb.sort.join }
  my %h3 does Hash-with[&ordered] = oof => 42;  # sort characters of key
  say %h3<foo>;  # 42

=head1 DESCRIPTION

Hash::with provides several C<role>s that can be mixed in with a C<Hash>.

=head2 Hash-lc

The role that will convert all keys of a hash to their B<lowercase> equivalent
before being used to access the hash.

  my %h1 does Hash-lc = A => 42;             # map all keys to lowercase
  say %h1<a>;    # 42

This is in fact an optimized version of C<does Hash-with[&lc]>.

=head2 Hash-uc

The role that will convert all keys of a hash to their B<uppercase> equivalent
before being used to access the hash.

  my %h2 does Hash-uc = a => 42;             # map all keys to uppercase
  say %h2<A>;    # 42

This is in fact an optimized version of C<does Hash-with[&uc]>.

=head2 Hash-with

The role that will convert all keys of a hash according to a C<mapper> function
before being used to access the hash.

  sub ordered($a) { $a.comb.sort.join }
  my %h3 does Hash-with[&ordered] = oof => 42;  # order all keys
  say %h3<foo>;  # 42

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Hash-with . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018, 2021 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4

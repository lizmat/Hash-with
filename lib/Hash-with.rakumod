role Hash-with[&mapper] {
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

# vim: expandtab shiftwidth=4

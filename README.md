# NAME

Linux::Wireguard - [Wireguard](https://www.wireguard.com/) in Perl

# SYNOPSIS

    my @names = Linux::Wireguard::list_device_names();

    my %device = map { $_ => Linux::Wireguard::get_device($_) } @names;

# DESCRIPTION

Linux::Wireguard provides an interface to Wireguard via the
embedded wireguard C library.

# FUNCTIONS

## @names = list\_device\_names()

Returns a list of strings.

## $dev\_hr = get\_device( $NAME )

Returns a reference to a hash that describes the $NAME’d device:

- `name`
- `ifindex`
- `public_key` and `private_key` (raw strings, or undef)
- `fwmark` (can be undef)
- `listen_port` (can be undef)
- `peers` - reference to an array of hash references. Each hash is:
    - `public_key` and `preshared_key` (raw strings, or undef)
    - `endpoint` - Raw sockaddr data (a string), or undef. To parse
    the sockaddr, use [Socket](https://metacpan.org/pod/Socket)’s `sockaddr_family()` to determine the
    address family, then `unpack_sockaddr_in()` for Socket::AF\_INET or
    `unpack_sockaddr_in6()` for Socket::AF\_INET6.
    - `rx_bytes` and `tx_bytes`
    - `persistent_keepalive_interval` (can be undef)
    - `last_handshake_time_sec` and `last_handshake_time_nsec`
    - `allowed_ips` - reference to an array of hash references. Each hash is:
        - `family` - Socket::AF\_INET or Socket::AF\_INET6
        - `addr` - A packed IPv4 or IPv6 address. Unpack with [Socket](https://metacpan.org/pod/Socket)’s
        `inet_ntoa()` or `inet_ntop()`.
        - `cidr`

## $bin = generate\_private\_key()

Returns a newly-generated private key (raw string).

## $bin = generate\_public\_key( $PRIVATE\_KEY )

Takes a private key and returns its public key. (Both raw strings.)

## $bin = generate\_preshared\_key()

Returns a newly-generated preshared key (raw string).

# TODO

The interface is incomplete. It would be nice for it to be complete.

# LICENSE & COPYRIGHT

Copyright 2022 Gasper Software Consulting. All rights reserved.

Linux::Wireguard is licensed under the same terms as Perl itself (cf.
[perlartistic](https://metacpan.org/pod/perlartistic)); **HOWEVER**, the embedded C wireguard library has its
own copyright terms. Use of Linux::Wireguard _may_ imply acceptance of
that embedded C library’s own copyright terms. See
`wireguard-tools/contrib/embeddable-wg-library/README` in this
distribution for details.

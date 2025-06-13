module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::math_u256 {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun add_check(a0: u256, a1: u256): bool;
    #[native_interface]
    native public fun checked_shlw(a0: u256): (u256, bool);
    #[native_interface]
    native public fun div_mod(a0: u256, a1: u256): (u256, u256);
    #[native_interface]
    native public fun div_round(a0: u256, a1: u256, a2: bool): u256;
    #[native_interface]
    native public fun shlw(a0: u256): u256;
    #[native_interface]
    native public fun shrw(a0: u256): u256;

}

module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::math_u128 {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun max(a0: u128, a1: u128): u128;
    #[native_interface]
    native public fun min(a0: u128, a1: u128): u128;
    #[native_interface]
    native public fun wrapping_add(a0: u128, a1: u128): u128;
    #[native_interface]
    native public fun wrapping_sub(a0: u128, a1: u128): u128;
    #[native_interface]
    native public fun overflowing_add(a0: u128, a1: u128): (u128, bool);
    #[native_interface]
    native public fun overflowing_sub(a0: u128, a1: u128): (u128, bool);
    #[native_interface]
    native public fun full_mul(a0: u128, a1: u128): (u128, u128);
    #[native_interface]
    native public fun add_check(a0: u128, a1: u128): bool;
    #[native_interface]
    native public fun checked_div_round(a0: u128, a1: u128, a2: bool): u128;
    #[native_interface]
    native public fun from_lo_hi(a0: u64, a1: u64): u128;
    #[native_interface]
    native public fun lo(a0: u128): u64;
    #[native_interface]
    native public fun hi(a0: u128): u64;
    #[native_interface]
    native public fun hi_u128(a0: u128): u128;
    #[native_interface]
    native public fun lo_u128(a0: u128): u128;
    #[native_interface]
    native public fun overflowing_mul(a0: u128, a1: u128): (u128, bool);
    #[native_interface]
    native public fun wrapping_mul(a0: u128, a1: u128): u128;

}

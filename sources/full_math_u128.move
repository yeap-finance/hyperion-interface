module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::full_math_u128 {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun full_mul(a0: u128, a1: u128): u256;
    #[native_interface]
    native public fun full_mul_v2(a0: u128, a1: u128): u256;
    #[native_interface]
    native public fun mul_div_ceil(a0: u128, a1: u128, a2: u128): u128;
    #[native_interface]
    native public fun mul_div_floor(a0: u128, a1: u128, a2: u128): u128;
    #[native_interface]
    native public fun mul_div_round(a0: u128, a1: u128, a2: u128): u128;
    #[native_interface]
    native public fun mul_shl(a0: u128, a1: u128, a2: u8): u128;
    #[native_interface]
    native public fun mul_shr(a0: u128, a1: u128, a2: u8): u128;

}

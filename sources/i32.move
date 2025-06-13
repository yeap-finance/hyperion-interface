module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::i32 {

    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::i32;

    struct I32 has copy, drop, store {
        bits: u32,
    }
    struct I32_RES has copy, drop {
        sign: bool,
        value: u32,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun from(a0: u32): i32::I32;
    #[native_interface]
    native public fun add(a0: i32::I32, a1: i32::I32): i32::I32;
    #[native_interface]
    native public fun cmp(a0: i32::I32, a1: i32::I32): u8;
    #[native_interface]
    native public fun sub(a0: i32::I32, a1: i32::I32): i32::I32;
    #[native_interface]
    native public fun zero(): i32::I32;
    #[native_interface]
    native public fun div(a0: i32::I32, a1: i32::I32): i32::I32;
    #[native_interface]
    native public fun eq(a0: i32::I32, a1: i32::I32): bool;
    #[native_interface]
    native public fun mul(a0: i32::I32, a1: i32::I32): i32::I32;
    #[native_interface]
    native public fun sign(a0: i32::I32): u8;
    #[native_interface]
    native public fun abs(a0: i32::I32): i32::I32;
    #[native_interface]
    native public fun abs_u32(a0: i32::I32): u32;
    #[native_interface]
    native public fun and(a0: i32::I32, a1: i32::I32): i32::I32;
    #[native_interface]
    native public fun as_u32(a0: i32::I32): u32;
    #[native_interface]
    native public fun from_u32(a0: u32): i32::I32;
    #[native_interface]
    native public fun gt(a0: i32::I32, a1: i32::I32): bool;
    #[native_interface]
    native public fun gte(a0: i32::I32, a1: i32::I32): bool;
    #[native_interface]
    native public fun i32_res(a0: i32::I32): i32::I32_RES;
    #[native_interface]
    native public fun is_neg(a0: i32::I32): bool;
    #[native_interface]
    native public fun lt(a0: i32::I32, a1: i32::I32): bool;
    #[native_interface]
    native public fun lte(a0: i32::I32, a1: i32::I32): bool;
    #[native_interface]
    native public fun mod(a0: i32::I32, a1: i32::I32): i32::I32;
    #[native_interface]
    native public fun neg_from(a0: u32): i32::I32;
    #[native_interface]
    native public fun or(a0: i32::I32, a1: i32::I32): i32::I32;
    #[native_interface]
    native public fun round_to_spacing(a0: i32::I32, a1: u32, a2: bool): i32::I32;
    #[native_interface]
    native public fun shl(a0: i32::I32, a1: u8): i32::I32;
    #[native_interface]
    native public fun shr(a0: i32::I32, a1: u8): i32::I32;
    #[native_interface]
    native public fun wrapping_add(a0: i32::I32, a1: i32::I32): i32::I32;
    #[native_interface]
    native public fun wrapping_sub(a0: i32::I32, a1: i32::I32): i32::I32;

}

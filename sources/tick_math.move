module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::tick_math {

    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::i32;

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun check_tick(a0: i32::I32, a1: i32::I32);
    #[native_interface]
    native public fun check_tick_spacing(a0: i32::I32, a1: u32);
    #[native_interface]
    native public fun get_sqrt_price_at_tick(a0: i32::I32): u128;
    #[native_interface]
    native public fun get_sqrt_price_at_tick_u32(a0: u32): u128;
    #[native_interface]
    native public fun get_tick_at_sqrt_price(a0: u128): i32::I32;
    #[native_interface]
    native public fun is_valid_index(a0: i32::I32, a1: u32): bool;
    #[native_interface]
    native public fun max_sqrt_price(): u128;
    #[native_interface]
    native public fun max_tick(): i32::I32;
    #[native_interface]
    native public fun min_sqrt_price(): u128;
    #[native_interface]
    native public fun min_tick(): i32::I32;
    #[native_interface]
    native public fun tick_bound(): u32;

}

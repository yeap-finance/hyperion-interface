module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::liquidity_math {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun add_delta(a0: u128, a1: u128): u128;
    #[native_interface]
    native public fun sub_delta(a0: u128, a1: u128): u128;

}

module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::bit_math {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun least_significant_bit(a0: u256): u8;
    #[native_interface]
    native public fun most_significant_bit(a0: u256): u8;

}

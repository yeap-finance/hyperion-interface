module dex_contract::bit_math {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun least_significant_bit(a0: u256): u8;
    #[native_interface]
    native public fun most_significant_bit(a0: u256): u8;

}

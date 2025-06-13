module dex_contract::liquidity_math {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun add_delta(a0: u128, a1: u128): u128;
    #[native_interface]
    native public fun sub_delta(a0: u128, a1: u128): u128;

}

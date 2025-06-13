module dex_contract::swap_math {

    use dex_contract::i32;

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun compute_swap_step(a0: u128, a1: u128, a2: u128, a3: u64, a4: u64, a5: bool, a6: bool): (u64, u64, u128, u64);
    #[native_interface]
    native public fun fee_rate_denominator(): u64;
    #[native_interface]
    native public fun get_amount_by_liquidity(a0: i32::I32, a1: i32::I32, a2: i32::I32, a3: u128, a4: u128, a5: bool): (u64, u64);
    #[native_interface]
    native public fun get_delta_a(a0: u128, a1: u128, a2: u128, a3: bool): u64;
    #[native_interface]
    native public fun get_delta_a_check(a0: u128, a1: u128, a2: u128, a3: bool): (u256, u256);
    #[native_interface]
    native public fun get_delta_b(a0: u128, a1: u128, a2: u128, a3: bool): u64;
    #[native_interface]
    native public fun get_delta_down_from_output(a0: u128, a1: u128, a2: u128, a3: bool): u256;
    #[native_interface]
    native public fun get_delta_up_from_input(a0: u128, a1: u128, a2: u128, a3: bool): u256;
    #[native_interface]
    native public fun get_liquidity_by_amount(a0: i32::I32, a1: i32::I32, a2: i32::I32, a3: u128, a4: u64, a5: bool): (u128, u64, u64);
    #[native_interface]
    native public fun get_liquidity_from_a(a0: u128, a1: u128, a2: u64, a3: bool): u128;
    #[native_interface]
    native public fun get_liquidity_from_b(a0: u128, a1: u128, a2: u64, a3: bool): u128;
    #[native_interface]
    native public fun get_next_sqrt_price_a_up(a0: u128, a1: u128, a2: u64, a3: bool): u128;
    #[native_interface]
    native public fun get_next_sqrt_price_b_down(a0: u128, a1: u128, a2: u64, a3: bool): u128;
    #[native_interface]
    native public fun get_next_sqrt_price_from_input(a0: u128, a1: u128, a2: u64, a3: bool): u128;
    #[native_interface]
    native public fun get_next_sqrt_price_from_output(a0: u128, a1: u128, a2: u64, a3: bool): u128;

}

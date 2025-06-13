module dex_contract::router_v3 {

    use 0x1::fungible_asset;
    use 0x1::object;
    use dex_contract::pool_v3;
    use dex_contract::position_v3;

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun get_amount_by_liquidity(a0: object::Object<position_v3::Info>): (u64, u64);
    #[native_interface]
    native public entry fun add_incentive(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: object::Object<fungible_asset::Metadata>, a4: u64);
    #[native_interface]
    native public entry fun add_rewarder(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: object::Object<fungible_asset::Metadata>, a3: u64, a4: u64, a5: u64);
    #[native_interface]
    native public entry fun claim_rewards(a0: &signer, a1: object::Object<position_v3::Info>, a2: address);
    #[native_interface]
    native public entry fun remove_incentive(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64);
    #[native_interface]
    native public entry fun update_emissions_rate(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64);
    #[native_interface]
    native public entry fun add_liquidity(a0: &signer, a1: object::Object<position_v3::Info>, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u8, a5: u64, a6: u64, a7: u64, a8: u64, a9: u64);
    #[native_interface]
    native public entry fun claim_fees(a0: &signer, a1: vector<address>, a2: address);
    #[native_interface]
    native public entry fun open_position(a0: &signer, a1: object::Object<fungible_asset::Metadata>, a2: object::Object<fungible_asset::Metadata>, a3: u8, a4: u32, a5: u32, a6: u64);
    #[native_interface]
    native public entry fun remove_liquidity(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128, a3: u64, a4: u64, a5: address, a6: u64);
    #[native_interface]
    native public entry fun add_coin_incentive<T0>(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64);
    #[native_interface]
    native public entry fun add_coin_incentive_v2<T0>(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64, a4: u64);
    #[native_interface]
    native public entry fun add_incentive_v2(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: object::Object<fungible_asset::Metadata>, a4: u64, a5: u64);
    #[native_interface]
    native public entry fun create_pool(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8, a3: u32);
    #[native_interface]
    native public entry fun add_coin_rewarder<T0>(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64, a4: u64);
    #[native_interface]
    native public entry fun add_liquidity_both_coins<T0, T1>(a0: &signer, a1: object::Object<position_v3::Info>, a2: u8, a3: u64, a4: u64, a5: u64, a6: u64, a7: u64);
    #[native_interface]
    native public entry fun add_liquidity_coin<T0>(a0: &signer, a1: object::Object<position_v3::Info>, a2: object::Object<fungible_asset::Metadata>, a3: u8, a4: u64, a5: u64, a6: u64, a7: u64, a8: u64);
    #[native_interface]
    native public fun apt_transfer_to_coin(a0: &signer);
    #[native_interface]
    native public entry fun claim_fees_and_rewards(a0: &signer, a1: vector<address>, a2: address);
    #[native_interface]
    native public entry fun claim_fees_and_rewards_direct_deposit(a0: &signer, a1: vector<address>);
    #[native_interface]
    native public entry fun claim_fees_direct_deposit(a0: &signer, a1: vector<address>);
    #[native_interface]
    native public entry fun claim_rewards_direct_deposit(a0: &signer, a1: object::Object<position_v3::Info>);
    #[native_interface]
    native public entry fun create_liquidity(a0: &signer, a1: object::Object<fungible_asset::Metadata>, a2: object::Object<fungible_asset::Metadata>, a3: u8, a4: u32, a5: u32, a6: u32, a7: u64, a8: u64, a9: u64, a10: u64, a11: u64);
    #[native_interface]
    native public entry fun create_liquidity_both_coins<T0, T1>(a0: &signer, a1: u8, a2: u32, a3: u32, a4: u32, a5: u64, a6: u64, a7: u64, a8: u64, a9: u64);
    #[native_interface]
    native public entry fun create_liquidity_coin<T0>(a0: &signer, a1: object::Object<fungible_asset::Metadata>, a2: u8, a3: u32, a4: u32, a5: u32, a6: u64, a7: u64, a8: u64, a9: u64, a10: u64);
    #[native_interface]
    native public entry fun create_pool_both_coins<T0, T1>(a0: u8, a1: u32);
    #[native_interface]
    native public entry fun create_pool_coin<T0>(a0: object::Object<fungible_asset::Metadata>, a1: u8, a2: u32);
    #[native_interface]
    native public entry fun exact_input_asset_for_coin_direct_deposit_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: u64);
    #[native_interface]
    native public entry fun exact_input_asset_for_coin_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: address, a7: u64);
    #[native_interface]
    native public entry fun exact_input_coin_for_asset_direct_deposit_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: u64);
    #[native_interface]
    native public entry fun exact_input_coin_for_asset_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: address, a7: u64);
    #[native_interface]
    native public entry fun exact_input_coin_for_coin_direct_deposit_entry<T0, T1>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: u64);
    #[native_interface]
    native public entry fun exact_input_coin_for_coin_entry<T0, T1>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: address, a6: u64);
    #[native_interface]
    native public entry fun exact_input_swap_direct_deposit_entry(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: object::Object<fungible_asset::Metadata>, a7: u64);
    #[native_interface]
    native public entry fun exact_input_swap_entry(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: object::Object<fungible_asset::Metadata>, a7: address, a8: u64);
    #[native_interface]
    native public entry fun exact_output_asset_for_coin_direct_deposit_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: u64);
    #[native_interface]
    native public entry fun exact_output_asset_for_coin_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: address, a7: u64);
    #[native_interface]
    native public entry fun exact_output_coin_for_asset_direct_deposit_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: u64);
    #[native_interface]
    native public entry fun exact_output_coin_for_asset_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: address, a7: u64);
    #[native_interface]
    native public entry fun exact_output_coin_for_coin_direct_deposit_entry<T0, T1>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: u64);
    #[native_interface]
    native public entry fun exact_output_coin_for_coin_entry<T0, T1>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: address, a6: u64);
    #[native_interface]
    native public entry fun exact_output_swap_direct_deposit_entry(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: object::Object<fungible_asset::Metadata>, a7: u64);
    #[native_interface]
    native public entry fun exact_output_swap_entry(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: object::Object<fungible_asset::Metadata>, a7: address, a8: u64);
    #[native_interface]
    native public fun get_batch_amount_in(a0: vector<address>, a1: u64, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>): u64;
    #[native_interface]
    native public fun get_batch_amount_out(a0: vector<address>, a1: u64, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>): u64;
    #[native_interface]
    native public entry fun open_position_both_coins<T0, T1>(a0: &signer, a1: u8, a2: u32, a3: u32, a4: u64);
    #[native_interface]
    native public entry fun open_position_coin<T0>(a0: &signer, a1: object::Object<fungible_asset::Metadata>, a2: u8, a3: u32, a4: u32, a5: u64);
    #[native_interface]
    native public fun optimal_liquidity_amounts(a0: u32, a1: u32, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u8, a5: u64, a6: u64, a7: u64, a8: u64): (u128, u64, u64);
    #[native_interface]
    native public fun optimal_liquidity_amounts_from_a(a0: u32, a1: u32, a2: u32, a3: object::Object<fungible_asset::Metadata>, a4: object::Object<fungible_asset::Metadata>, a5: u8, a6: u64, a7: u64, a8: u64): (u128, u64);
    #[native_interface]
    native public fun optimal_liquidity_amounts_from_b(a0: u32, a1: u32, a2: u32, a3: object::Object<fungible_asset::Metadata>, a4: object::Object<fungible_asset::Metadata>, a5: u8, a6: u64, a7: u64, a8: u64): (u128, u64);
    #[native_interface]
    native public entry fun remove_liquidity_both_coins<T0, T1>(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128, a3: u64, a4: u64, a5: address, a6: u64);
    #[native_interface]
    native public entry fun remove_liquidity_both_coins_direct_deposit<T0, T1>(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128, a3: u64, a4: u64, a5: u64);
    #[native_interface]
    native public entry fun remove_liquidity_coin<T0>(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128, a3: u64, a4: u64, a5: address, a6: u64);
    #[native_interface]
    native public entry fun remove_liquidity_coin_direct_deposit<T0>(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128, a3: u64, a4: u64, a5: u64);
    #[native_interface]
    native public entry fun remove_liquidity_direct_deposit(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128, a3: u64, a4: u64, a5: u64);
    #[native_interface]
    native public entry fun swap_batch(a0: &signer, a1: vector<address>, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u64, a5: u64, a6: address);
    #[native_interface]
    native public entry fun swap_batch_coin_direct_deposit_entry<T0>(a0: &signer, a1: vector<address>, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u64, a5: u64);
    #[native_interface]
    native public entry fun swap_batch_coin_entry<T0>(a0: &signer, a1: vector<address>, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u64, a5: u64, a6: address);
    #[native_interface]
    native public entry fun swap_batch_direct_deposit(a0: &signer, a1: vector<address>, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u64, a5: u64);

}

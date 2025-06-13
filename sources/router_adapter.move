module dex_contract::router_adapter {

    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x1::table;
    use dex_contract::lp;

    struct Version has key {
        migrated: table::Table<address, bool>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public entry fun initialize();
    #[native_interface]
    native public fun is_initialized(): bool;
    #[native_interface]
    native public entry fun exact_input_asset_for_coin_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: bool, a7: address, a8: u64);
    #[native_interface]
    native public entry fun exact_input_coin_for_asset_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: bool, a7: address, a8: u64);
    #[native_interface]
    native public entry fun exact_input_coin_for_coin_entry<T0, T1>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: bool, a6: address, a7: u64);
    #[native_interface]
    native public entry fun exact_input_swap_entry(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: object::Object<fungible_asset::Metadata>, a7: bool, a8: address, a9: u64);
    #[native_interface]
    native public entry fun exact_output_asset_for_coin_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: bool, a7: address, a8: u64);
    #[native_interface]
    native public entry fun exact_output_coin_for_asset_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: bool, a7: address, a8: u64);
    #[native_interface]
    native public entry fun exact_output_coin_for_coin_entry<T0, T1>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: bool, a6: address, a7: u64);
    #[native_interface]
    native public entry fun exact_output_swap_entry(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: object::Object<fungible_asset::Metadata>, a7: bool, a8: address, a9: u64);
    #[native_interface]
    native public entry fun add_liquidity_both_coin_entry<T0, T1>(a0: &signer, a1: address, a2: u8, a3: bool, a4: u64, a5: u64, a6: u64, a7: u64, a8: u64);
    #[native_interface]
    native public entry fun add_liquidity_coin_entry<T0>(a0: &signer, a1: object::Object<lp::LPObjectRef>, a2: object::Object<fungible_asset::Metadata>, a3: u8, a4: bool, a5: u64, a6: u64, a7: u64, a8: u64, a9: u64);
    #[native_interface]
    native public entry fun add_liquidity_entry(a0: &signer, a1: object::Object<lp::LPObjectRef>, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u8, a5: bool, a6: u64, a7: u64, a8: u64, a9: u64, a10: u64);
    #[native_interface]
    native public entry fun create_liquidity_both_coin_entry<T0, T1>(a0: &signer, a1: u8, a2: bool, a3: u32, a4: u32, a5: u32, a6: u64, a7: u64, a8: u64, a9: u64, a10: u64);
    #[native_interface]
    native public entry fun create_liquidity_coin_entry<T0>(a0: &signer, a1: object::Object<fungible_asset::Metadata>, a2: u8, a3: bool, a4: u32, a5: u32, a6: u32, a7: u64, a8: u64, a9: u64, a10: u64, a11: u64);
    #[native_interface]
    native public entry fun create_liquidity_entry(a0: &signer, a1: object::Object<fungible_asset::Metadata>, a2: object::Object<fungible_asset::Metadata>, a3: u8, a4: bool, a5: u32, a6: u32, a7: u32, a8: u64, a9: u64, a10: u64, a11: u64, a12: u64);
    #[native_interface]
    native public entry fun create_pool_both_coins_v2<T0, T1>(a0: u8, a1: u32, a2: bool);
    #[native_interface]
    native public entry fun create_pool_coin_v2<T0>(a0: object::Object<fungible_asset::Metadata>, a1: u8, a2: u32, a3: bool);
    #[native_interface]
    native public entry fun create_pool_v2(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8, a3: u32, a4: bool);
    #[native_interface]
    native public entry fun remove_liquidity_both_coins_entry_v2<T0, T1>(a0: &signer, a1: object::Object<lp::LPObjectRef>, a2: u128, a3: u64, a4: u64, a5: address, a6: u64);
    #[native_interface]
    native public entry fun remove_liquidity_coin_entry_v2<T0>(a0: &signer, a1: object::Object<lp::LPObjectRef>, a2: u128, a3: u64, a4: u64, a5: address, a6: u64);
    #[native_interface]
    native public entry fun remove_liquidity_entry_v2(a0: &signer, a1: object::Object<lp::LPObjectRef>, a2: u128, a3: u64, a4: u64, a5: address, a6: u64);

}

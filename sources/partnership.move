module dex_contract::partnership {

    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x1::string;
    use dex_contract::pool_v3;

    struct PartnerSwapEvent has copy, drop, store {
        pool_id: address,
        partner: string::String,
        amount_in: u64,
        token_in: object::Object<fungible_asset::Metadata>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun swap(a0: object::Object<pool_v3::LiquidityPoolV3>, a1: bool, a2: bool, a3: u64, a4: fungible_asset::FungibleAsset, a5: u128, a6: string::String): (u64, fungible_asset::FungibleAsset, fungible_asset::FungibleAsset);
    #[native_interface]
    native public entry fun exact_input_asset_for_coin_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: address, a7: string::String, a8: u64);
    #[native_interface]
    native public entry fun exact_input_coin_for_asset_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: address, a7: string::String, a8: u64);
    #[native_interface]
    native public entry fun exact_input_coin_for_coin_entry<T0, T1>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: address, a6: string::String, a7: u64);
    #[native_interface]
    native public entry fun exact_input_swap_entry(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: object::Object<fungible_asset::Metadata>, a7: address, a8: string::String, a9: u64);
    #[native_interface]
    native public entry fun exact_output_asset_for_coin_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: address, a7: string::String, a8: u64);
    #[native_interface]
    native public entry fun exact_output_coin_for_asset_entry<T0>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: address, a7: string::String, a8: u64);
    #[native_interface]
    native public entry fun exact_output_coin_for_coin_entry<T0, T1>(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: address, a6: string::String, a7: u64);
    #[native_interface]
    native public entry fun exact_output_swap_entry(a0: &signer, a1: u8, a2: u64, a3: u64, a4: u128, a5: object::Object<fungible_asset::Metadata>, a6: object::Object<fungible_asset::Metadata>, a7: address, a8: string::String, a9: u64);
    #[native_interface]
    native public entry fun swap_batch(a0: &signer, a1: vector<address>, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u64, a5: u64, a6: address, a7: string::String);
    #[native_interface]
    native public entry fun swap_batch_coin_entry<T0>(a0: &signer, a1: vector<address>, a2: object::Object<fungible_asset::Metadata>, a3: object::Object<fungible_asset::Metadata>, a4: u64, a5: u64, a6: address, a7: string::String);

}

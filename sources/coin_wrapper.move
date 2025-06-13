module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::coin_wrapper {

    use 0x1::coin;
    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x1::string;

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun format_fungible_asset(a0: object::Object<fungible_asset::Metadata>): string::String;
    #[native_interface]
    native public fun get_coin_type(a0: object::Object<fungible_asset::Metadata>): string::String;
    #[native_interface]
    native public fun get_original(a0: object::Object<fungible_asset::Metadata>): string::String;
    #[native_interface]
    native public fun get_wrapper<T0>(): object::Object<fungible_asset::Metadata>;
    #[native_interface]
    native public fun is_supported<T0>(): bool;
    #[native_interface]
    native public fun is_wrapper(a0: object::Object<fungible_asset::Metadata>): bool;
    #[native_interface]
    native public fun unwrap<T0>(a0: fungible_asset::FungibleAsset): coin::Coin<T0>;
    #[native_interface]
    native public fun wrap<T0>(a0: coin::Coin<T0>): fungible_asset::FungibleAsset;

}

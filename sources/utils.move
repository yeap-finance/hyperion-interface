module dex_contract::utils {

    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x1::string;

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun check_diff_tolerance(a0: u64, a1: u64, a2: u64);
    #[native_interface]
    native public fun is_sorted(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>): bool;
    #[native_interface]
    native public fun lp_token_name(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>): string::String;
    #[native_interface]
    native public fun u64_to_u64x64(a0: u64): u128;
    #[native_interface]
    native public fun u64x64_to_u64(a0: u128): u64;

}

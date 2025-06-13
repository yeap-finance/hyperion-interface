module dex_contract::rate_limiter_check {

    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x1::smart_table;
    use dex_contract::rate_limiter;
    use dex_contract::rate_limiter_check;
    use dex_contract::router_v3;

    friend router_v3;

    struct AssetRateLimiterHub has key {
        asset_limiter: smart_table::SmartTable<address, rate_limiter::RateLimiter>,
        user_limiter_configs: smart_table::SmartTable<address, rate_limiter_check::UserConfig>,
    }
    struct UserConfig has copy, drop, store {
        capacity: u64,
        interval: u64,
    }
    struct UserRateLimiterHub has key {
        user_asset_limiter: smart_table::SmartTable<address, rate_limiter::RateLimiter>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public(friend) fun check_asset_request(a0: address, a1: u64): bool;
    #[native_interface]
    native public(friend) fun check_user_asset_request(a0: &signer, a1: address, a2: u64): bool;
    #[native_interface]
    native public fun global_asset_rate_limiter(a0: object::Object<fungible_asset::Metadata>): (u64, u64, u64);
    #[native_interface]
    native public fun user_asset_rate_limiter(a0: address, a1: object::Object<fungible_asset::Metadata>): (u64, u64, u64);

}

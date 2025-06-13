module dex_contract::pool_v3 {

    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x1::option;
    use 0x1::smart_table;
    use 0x1::smart_vector;
    use 0x1::string;
    use dex_contract::i32;
    use dex_contract::lp;
    use dex_contract::pool_v3;
    use dex_contract::position_blacklist;
    use dex_contract::position_v3;
    use dex_contract::rewarder;
    use dex_contract::router_v3;
    use dex_contract::tick;
    use dex_contract::tick_bitmap;

    friend router_v3;

    struct AddLiquidityEvent has drop, store {
        pool_id: address,
        object_id: address,
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_tier: u8,
        is_delete: bool,
        added_lp_amount: u128,
        previous_liquidity_amount: u128,
        amount_a: u64,
        amount_b: u64,
    }
    struct AddLiquidityEventV2 has drop, store {
        pool_id: address,
        object_id: address,
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_tier: u8,
        is_delete: bool,
        added_lp_amount: u128,
        previous_liquidity_amount: u128,
        amount_a: u64,
        amount_b: u64,
        pool_reserve_a: u64,
        pool_reserve_b: u64,
    }
    struct ClaimFeesEvent has drop, store {
        pool: object::Object<pool_v3::LiquidityPoolV3>,
        lp_object: object::Object<position_v3::Info>,
        token: object::Object<fungible_asset::Metadata>,
        amount: u64,
        owner: address,
    }
    struct ClaimFeesEventV2 has drop, store {
        pool: object::Object<pool_v3::LiquidityPoolV3>,
        lp_object: object::Object<position_v3::Info>,
        token: object::Object<fungible_asset::Metadata>,
        amount: u64,
        owner: address,
        token_a_liquidity_after_claim: u64,
        token_b_liquidity_after_claim: u64,
    }
    struct CreatePoolEvent has drop, store {
        pool: object::Object<pool_v3::LiquidityPoolV3>,
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_rate: u64,
        fee_tier: u8,
        sqrt_price: u128,
        tick: i32::I32,
    }
    struct LiquidityPoolConfigsV3 has key {
        all_pools: smart_vector::SmartVector<object::Object<pool_v3::LiquidityPoolV3>>,
        is_paused: bool,
        fee_manager: address,
        pauser: address,
        pending_fee_manager: address,
        pending_pauser: address,
        tick_spacing_list: vector<u64>,
    }
    struct LiquidityPoolInfoV3 has copy, drop {
        pool: object::Object<pool_v3::LiquidityPoolV3>,
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_rate: u64,
        token_a_reserve: u64,
        token_b_reserve: u64,
        liquidity_total: u128,
    }
    struct LiquidityPoolV3 has key {
        token_a_liquidity: object::Object<fungible_asset::FungibleStore>,
        token_b_liquidity: object::Object<fungible_asset::FungibleStore>,
        token_a_fee: object::Object<fungible_asset::FungibleStore>,
        token_b_fee: object::Object<fungible_asset::FungibleStore>,
        sqrt_price: u128,
        liquidity: u128,
        tick: i32::I32,
        observation_index: u64,
        observation_cardinality: u64,
        observation_cardinality_next: u64,
        fee_rate: u64,
        fee_protocol: u64,
        unlocked: bool,
        fee_growth_global_a: u128,
        fee_growth_global_b: u128,
        seconds_per_liquidity_oracle: u128,
        seconds_per_liquidity_incentive: u128,
        position_blacklist: position_blacklist::PositionBlackList,
        last_update_timestamp: u64,
        tick_info: smart_table::SmartTable<i32::I32, tick::TickInfo>,
        tick_map: tick_bitmap::BitMap,
        tick_spacing: u32,
        protocol_fees: pool_v3::ProtocolFees,
        lp_token_refs: lp::LPTokenRefs,
        max_liquidity_per_tick: u128,
        rewarder_manager: rewarder::RewarderManager,
    }
    struct PageInfo has copy, drop {
        offset: u64,
        limit: u64,
        total: u64,
        take: u64,
    }
    struct PoolSnapshot has drop, store {
        pool_id: address,
        sqrt_price: u128,
        liquidity: u128,
        tick: i32::I32,
        observation_index: u64,
        observation_cardinality: u64,
        observation_cardinality_next: u64,
        fee_rate: u64,
        fee_rate_denominatore: u64,
        fee_growth_global_a: u128,
        fee_growth_global_b: u128,
        tick_spacing: u32,
    }
    struct PoolSnapshotV2 has drop, store {
        pool_id: address,
        sqrt_price: u128,
        liquidity: u128,
        tick: i32::I32,
        observation_index: u64,
        observation_cardinality: u64,
        observation_cardinality_next: u64,
        fee_rate: u64,
        fee_rate_denominatore: u64,
        fee_growth_global_a: u128,
        fee_growth_global_b: u128,
        tick_spacing: u32,
        token_a_reserve: u64,
        token_b_reserve: u64,
    }
    struct PoolTemporaryStorage has key {
        store: object::Object<fungible_asset::FungibleStore>,
    }
    struct PoolTemporaryStorageV2 has key {
        stores: vector<object::Object<fungible_asset::FungibleStore>>,
    }
    struct ProtocolFees has store {
        token_a: object::Object<fungible_asset::FungibleStore>,
        token_b: object::Object<fungible_asset::FungibleStore>,
    }
    struct RemoveLiquidityEvent has drop, store {
        pool_id: address,
        object_id: address,
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_tier: u8,
        is_delete: bool,
        burned_lp_amount: u128,
        previous_liquidity_amount: u128,
        amount_a: u64,
        amount_b: u64,
    }
    struct RemoveLiquidityEventV2 has drop, store {
        pool_id: address,
        object_id: address,
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_tier: u8,
        is_delete: bool,
        burned_lp_amount: u128,
        previous_liquidity_amount: u128,
        amount_a: u64,
        amount_b: u64,
        pool_reserve_a: u64,
        pool_reserve_b: u64,
    }
    struct StepComputations has drop, store {
        sqrt_price_current: u128,
        sqrt_price_next: u128,
        amount_in: u64,
        amount_out: u64,
        fee_amount: u64,
        current_liquidity: u128,
    }
    struct SwapAfterEvent has drop, store {
        pool_id: address,
        tick: i32::I32,
        sqrt_price: u128,
        liquidity: u128,
    }
    struct SwapBeforeEvent has drop, store {
        pool_id: address,
        tick: i32::I32,
        sqrt_price: u128,
        liquidity: u128,
    }
    struct SwapEvent has drop, store {
        pool_id: address,
        from_token: object::Object<fungible_asset::Metadata>,
        to_token: object::Object<fungible_asset::Metadata>,
        amount_in: u64,
        amount_out: u64,
        fee_amount: u64,
        protocol_fee_amount: u64,
    }
    struct SwapEventV2 has drop, store {
        pool_id: address,
        from_token: object::Object<fungible_asset::Metadata>,
        to_token: object::Object<fungible_asset::Metadata>,
        amount_in: u64,
        amount_out: u64,
        fee_amount: u64,
        protocol_fee_amount: u64,
        pool_reserve_a: u64,
        pool_reserve_b: u64,
    }
    struct SwapState has drop {
        amount_specified_remaining: u64,
        amount_calculated: u64,
        sqrt_price: u128,
        tick: i32::I32,
        fee_growth_global: u128,
        seconds_per_liquidity: u128,
        protocol_fee: u64,
        liquidity: u128,
        fee_amount_total: u64,
    }
    struct UpdateRemoveLiqudityAmount has copy, drop, store {
        pool_id: address,
        liquidity_delta: u128,
        tick_lower: u32,
        tick_upper: u32,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun swap(a0: object::Object<pool_v3::LiquidityPoolV3>, a1: bool, a2: bool, a3: u64, a4: fungible_asset::FungibleAsset, a5: u128): (u64, fungible_asset::FungibleAsset, fungible_asset::FungibleAsset);
    #[native_interface]
    native public entry fun initialize();
    #[native_interface]
    native public fun is_initialized(): bool;
    #[native_interface]
    native public entry fun update_net_only(a0: &signer, a1: address, a2: u128, a3: u32, a4: u32);
    #[native_interface]
    native public fun add_incentive(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: object::Object<fungible_asset::Metadata>, a4: u64);
    #[native_interface]
    native public fun add_rewarder(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: object::Object<fungible_asset::Metadata>, a3: u64, a4: u64, a5: u64);
    #[native_interface]
    native public fun claim_rewards(a0: &signer, a1: object::Object<position_v3::Info>): vector<fungible_asset::FungibleAsset>;
    #[native_interface]
    native public entry fun remove_incentive(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64);
    #[native_interface]
    native public entry fun remove_incentive_to_pause(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64);
    #[native_interface]
    native public entry fun update_emissions_rate(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64);
    #[native_interface]
    native public entry fun update_emissions_rate_max(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64);
    #[native_interface]
    native public entry fun update_rewarder_owed(a0: &signer, a1: address, a2: u64, a3: u64);
    #[native_interface]
    native public fun add_liquidity(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128, a3: fungible_asset::FungibleAsset, a4: fungible_asset::FungibleAsset): (u64, u64, fungible_asset::FungibleAsset, fungible_asset::FungibleAsset);
    #[native_interface]
    native public fun claim_fees(a0: &signer, a1: object::Object<position_v3::Info>): (fungible_asset::FungibleAsset, fungible_asset::FungibleAsset);
    #[native_interface]
    native public fun open_position(a0: &signer, a1: object::Object<fungible_asset::Metadata>, a2: object::Object<fungible_asset::Metadata>, a3: u8, a4: u32, a5: u32): object::Object<position_v3::Info>;
    #[native_interface]
    native public fun remove_liquidity(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128): (option::Option<fungible_asset::FungibleAsset>, option::Option<fungible_asset::FungibleAsset>);
    #[native_interface]
    native public(friend) fun remove_liquidity_v2(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128): (option::Option<fungible_asset::FungibleAsset>, option::Option<fungible_asset::FungibleAsset>);
    #[native_interface]
    native public fun current_tick(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): i32::I32;
    #[native_interface]
    native public fun add_coin_incentive<T0>(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64);
    #[native_interface]
    native public fun add_coin_incentive_v2<T0>(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64, a4: u64);
    #[native_interface]
    native public fun add_incentive_v2(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: object::Object<fungible_asset::Metadata>, a4: u64, a5: u64);
    #[native_interface]
    native public(friend) fun add_liquidity_v2(a0: &signer, a1: object::Object<position_v3::Info>, a2: u128, a3: fungible_asset::FungibleAsset, a4: fungible_asset::FungibleAsset): (u64, u64, fungible_asset::FungibleAsset, fungible_asset::FungibleAsset);
    #[native_interface]
    native public fun add_rewarder_coin<T0>(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: u64, a4: u64);
    #[native_interface]
    native public fun all_pools(): vector<object::Object<pool_v3::LiquidityPoolV3>>;
    #[native_interface]
    native public fun all_pools_with_info(a0: u64, a1: u64): (vector<pool_v3::LiquidityPoolInfoV3>, pool_v3::PageInfo);
    #[native_interface]
    native public entry fun block_position(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: object::Object<position_v3::Info>);
    #[native_interface]
    native public entry fun block_position_batch(a0: &signer, a1: vector<object::Object<position_v3::Info>>);
    #[native_interface]
    native public entry fun claim_protocol_fees_all(a0: &signer, a1: object::Object<fungible_asset::Metadata>, a2: object::Object<fungible_asset::Metadata>, a3: u8);
    #[native_interface]
    native public fun create_pool(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8, a3: u32): object::Object<pool_v3::LiquidityPoolV3>;
    #[native_interface]
    native public fun current_price(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): u128;
    #[native_interface]
    native public fun current_tick_and_price(a0: address): (u32, u128);
    #[native_interface]
    native public entry fun deposit_liquidity_token(a0: &signer, a1: address, a2: object::Object<fungible_asset::Metadata>, a3: u64);
    #[native_interface]
    native public fun get_amount_in(a0: object::Object<pool_v3::LiquidityPoolV3>, a1: object::Object<fungible_asset::Metadata>, a2: u64): (u64, u64);
    #[native_interface]
    native public fun get_amount_out(a0: object::Object<pool_v3::LiquidityPoolV3>, a1: object::Object<fungible_asset::Metadata>, a2: u64): (u64, u64);
    #[native_interface]
    native public fun get_blocked_position(a0: object::Object<pool_v3::LiquidityPoolV3>): vector<address>;
    #[native_interface]
    native public fun get_fee_rate(a0: u8): u64;
    #[native_interface]
    native public fun get_pending_fees(a0: object::Object<position_v3::Info>): vector<u64>;
    #[native_interface]
    native public fun get_pending_fees_blocked(a0: object::Object<position_v3::Info>): vector<u64>;
    #[native_interface]
    native public fun get_pending_rewards(a0: object::Object<position_v3::Info>): vector<rewarder::PendingReward>;
    #[native_interface]
    native public fun get_pending_rewards_blocked(a0: object::Object<position_v3::Info>): vector<rewarder::PendingReward>;
    #[native_interface]
    native public fun get_pool_liquidity(a0: object::Object<pool_v3::LiquidityPoolV3>): u128;
    #[native_interface]
    native public fun get_pool_tick_info(a0: object::Object<pool_v3::LiquidityPoolV3>, a1: u32): tick::TickInfo;
    #[native_interface]
    native public fun get_pool_tick_info_batch(a0: object::Object<pool_v3::LiquidityPoolV3>, a1: vector<u32>): vector<tick::TickInfo>;
    #[native_interface]
    native public fun get_position_emission_rate(a0: object::Object<position_v3::Info>): vector<rewarder::RewardRate>;
    #[native_interface]
    native public fun get_protocol_fee_rate(a0: object::Object<pool_v3::LiquidityPoolV3>): u64;
    #[native_interface]
    native public fun get_protocol_fee_receiver(): address;
    #[native_interface]
    native public fun get_remaining_incentive(a0: object::Object<pool_v3::LiquidityPoolV3>): vector<rewarder::RemainingIncentive>;
    #[native_interface]
    native public fun get_rewarder_numbers(a0: object::Object<pool_v3::LiquidityPoolV3>): vector<rewarder::Numbers>;
    #[native_interface]
    native public fun get_tick_spacing(a0: u8): u32;
    #[native_interface]
    native public fun liquidity_pool(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): object::Object<pool_v3::LiquidityPoolV3>;
    #[native_interface]
    native public fun liquidity_pool_address(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): address;
    #[native_interface]
    native public fun liquidity_pool_address_safe(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): (bool, address);
    #[native_interface]
    native public fun liquidity_pool_exists(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): bool;
    #[native_interface]
    native public fun liquidity_pool_info(a0: object::Object<pool_v3::LiquidityPoolV3>): vector<string::String>;
    #[native_interface]
    native public fun liquidity_pool_info_both_coin<T0, T1>(a0: u8): vector<string::String>;
    #[native_interface]
    native public fun liquidity_pool_info_both_fa(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): vector<string::String>;
    #[native_interface]
    native public fun liquidity_pool_info_with_coin_fa<T0>(a0: object::Object<fungible_asset::Metadata>, a1: u8): vector<string::String>;
    #[native_interface]
    native public entry fun pause_protocol(a0: &signer);
    #[native_interface]
    native public entry fun pause_rewarder_manager(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>);
    #[native_interface]
    native public fun pool_next_initialize_tick(a0: object::Object<pool_v3::LiquidityPoolV3>, a1: bool): (i32::I32, bool);
    #[native_interface]
    native public fun pool_reserve_amount(a0: object::Object<pool_v3::LiquidityPoolV3>): (u64, u64);
    #[native_interface]
    native public fun pool_rewarder_list(a0: object::Object<pool_v3::LiquidityPoolV3>): vector<rewarder::Rewarder>;
    #[native_interface]
    native public entry fun relocate_fee(a0: &signer, a1: address, a2: object::Object<fungible_asset::Metadata>, a3: u64);
    #[native_interface]
    native public entry fun remove_position_block(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: object::Object<position_v3::Info>);
    #[native_interface]
    native public entry fun restart_rewarder_manager(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>);
    #[native_interface]
    native public entry fun start_protocol(a0: &signer);
    #[native_interface]
    native public fun supported_inner_assets(a0: object::Object<pool_v3::LiquidityPoolV3>): vector<object::Object<fungible_asset::Metadata>>;
    #[native_interface]
    native public entry fun update_pool_liquidity(a0: &signer, a1: address, a2: u128);
    #[native_interface]
    native public entry fun update_protocol_fee_rate(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64);
    #[native_interface]
    native public entry fun update_remove_liquidity_amount(a0: &signer, a1: address, a2: u128, a3: u32, a4: u32);
    #[native_interface]
    native public entry fun update_reward_amount(a0: &signer, a1: address, a2: object::Object<fungible_asset::Metadata>, a3: u64);
    #[native_interface]
    native public entry fun withdraw_temporary_coin<T0>(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: u64, a3: address);
    #[native_interface]
    native public entry fun withdraw_temporary_token(a0: &signer, a1: object::Object<pool_v3::LiquidityPoolV3>, a2: object::Object<fungible_asset::Metadata>, a3: u64, a4: address);

}

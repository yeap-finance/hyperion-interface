module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::position_v3 {

    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::i32;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::pool_v3;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::position_v3;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::rewarder;

    friend pool_v3;

    struct CreatePositionEvent has drop, store {
        object_id: address,
        pool_id: address,
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_tier: u8,
        tick_lower: i32::I32,
        tick_upper: i32::I32,
    }
    struct Info has key {
        initialized: bool,
        liquidity: u128,
        tick_lower: i32::I32,
        tick_upper: i32::I32,
        fee_growth_inside_a_last: u128,
        fee_growth_inside_b_last: u128,
        fee_owed_a: u64,
        fee_owed_b: u64,
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_tier: u8,
        rewards: vector<rewarder::PositionReward>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public(friend) fun add_liquidity(a0: object::Object<position_v3::Info>, a1: u128, a2: u128, a3: u128): (u128, u128, bool);
    #[native_interface]
    native public(friend) fun calc_fees(a0: object::Object<position_v3::Info>, a1: u128, a2: u128): (u64, u64);
    #[native_interface]
    native public(friend) fun claim_fees(a0: object::Object<position_v3::Info>, a1: u128, a2: u128): (u64, u64);
    #[native_interface]
    native public(friend) fun copy_position_rewards(a0: object::Object<position_v3::Info>): vector<rewarder::PositionReward>;
    #[native_interface]
    native public fun get_liquidity(a0: object::Object<position_v3::Info>): u128;
    #[native_interface]
    native public fun get_pool_info(a0: object::Object<position_v3::Info>): (object::Object<fungible_asset::Metadata>, object::Object<fungible_asset::Metadata>, u8);
    #[native_interface]
    native public(friend) fun get_position_rewards(a0: &signer, a1: object::Object<position_v3::Info>): vector<rewarder::PositionReward>;
    #[native_interface]
    native public(friend) fun get_position_rewards_v2(a0: object::Object<position_v3::Info>): vector<rewarder::PositionReward>;
    #[native_interface]
    native public fun get_tick(a0: object::Object<position_v3::Info>): (i32::I32, i32::I32);
    #[native_interface]
    native public(friend) fun open_position(a0: &object::ConstructorRef, a1: i32::I32, a2: i32::I32, a3: object::Object<fungible_asset::Metadata>, a4: object::Object<fungible_asset::Metadata>, a5: u8, a6: address): object::Object<position_v3::Info>;
    #[native_interface]
    native public(friend) fun refresh_position_owed_fee_to_zero(a0: object::Object<position_v3::Info>);
    #[native_interface]
    native public(friend) fun remove_liquidity(a0: object::Object<position_v3::Info>, a1: u128, a2: u128, a3: u128): (u128, u128, bool);
    #[native_interface]
    native public(friend) fun remove_liquidity_v2(a0: object::Object<position_v3::Info>, a1: u128, a2: u128, a3: u128, a4: bool): (u128, u128, bool);
    #[native_interface]
    native public(friend) fun update_rewards(a0: object::Object<position_v3::Info>, a1: vector<rewarder::PositionReward>);

}

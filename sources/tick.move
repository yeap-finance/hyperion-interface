module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::tick {

    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::i128;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::i32;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::pool_v3;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::tick;

    friend pool_v3;

    struct TickInfo has copy, drop, store {
        liquidity_gross: u128,
        liquidity_net: i128::I128,
        fee_growth_outside_a: u128,
        fee_growth_outside_b: u128,
        tick_cumulative_outside: u64,
        seconds_per_liquidity_oracle_outside: u128,
        seconds_per_liquidity_incentive_outside: u128,
        emissions_per_liquidity_incentive_outside: vector<u128>,
        seconds_outside: u64,
        initialized: bool,
    }
    struct TickNetGrossUpdate has drop, store {
        tick: i32::I32,
        liquidity_gross_before: u128,
        liquidity_gross_after: u128,
        liquidity_net_before: i128::I128,
        liquidity_net_after: i128::I128,
        flipped: bool,
    }
    struct TickUpdatedEvent has drop, store {
        tick: i32::I32,
        liquidity_gross_before: u128,
        liquidity_gross_after: u128,
        liquidity_net_before: i128::I128,
        liquidity_net_after: i128::I128,
        flipped: bool,
        fee_growth_updated: bool,
        fee_growth_outside_a_before: u128,
        fee_growth_outside_b_before: u128,
        emissions_per_liquidity_incentive_outside_before: vector<u128>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public(friend) fun update(a0: &mut tick::TickInfo, a1: i32::I32, a2: u128, a3: u128, a4: u128, a5: u128, a6: vector<u128>, a7: bool, a8: u128, a9: i32::I32, a10: bool): bool;
    #[native_interface]
    native public fun empty(): tick::TickInfo;
    #[native_interface]
    native public(friend) fun cross(a0: &mut tick::TickInfo, a1: u128, a2: u128, a3: u128, a4: u128, a5: u64, a6: vector<u128>, a7: u64): i128::I128;
    #[native_interface]
    native public(friend) fun get_emissions_per_liquidity_incentive_inside(a0: tick::TickInfo, a1: tick::TickInfo, a2: i32::I32, a3: i32::I32, a4: i32::I32, a5: vector<u128>): vector<u128>;
    #[native_interface]
    native public(friend) fun get_emissions_per_liquidity_outside(a0: &tick::TickInfo): vector<u128>;
    #[native_interface]
    native public(friend) fun get_fee_growth_inside(a0: tick::TickInfo, a1: tick::TickInfo, a2: i32::I32, a3: i32::I32, a4: i32::I32, a5: u128, a6: u128): (u128, u128);
    #[native_interface]
    native public(friend) fun get_liquidity_net(a0: &tick::TickInfo): i128::I128;
    #[native_interface]
    native public(friend) fun get_seconds_per_liquidity_incentive_inside(a0: tick::TickInfo, a1: tick::TickInfo, a2: i32::I32, a3: i32::I32, a4: i32::I32, a5: u128): u128;
    #[native_interface]
    native public(friend) fun get_seconds_per_liquidity_oracle_inside(a0: tick::TickInfo, a1: tick::TickInfo, a2: i32::I32, a3: i32::I32, a4: i32::I32, a5: u128): u128;
    #[native_interface]
    native public(friend) fun padding_emissions_list(a0: &mut tick::TickInfo, a1: u64);
    #[native_interface]
    native public(friend) fun tick_spacing_to_max_liquidity_per_tick(a0: u32): u128;
    #[native_interface]
    native public(friend) fun update_net_and_gross(a0: &mut tick::TickInfo, a1: i32::I32, a2: bool, a3: u128, a4: bool): bool;
    #[native_interface]
    native public(friend) fun update_net_only(a0: &mut tick::TickInfo, a1: i32::I32, a2: bool, a3: u128, a4: bool);

}

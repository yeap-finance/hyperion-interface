module dex_contract::rewarder {

    use 0x1::fungible_asset;
    use 0x1::object;
    use dex_contract::pool_v3;
    use dex_contract::rewarder;

    friend pool_v3;

    struct AddIncentiveEvent has drop, store {
        pool_id: address,
        reward_metadata: object::Object<fungible_asset::Metadata>,
        amount: u64,
        index: u64,
    }
    struct ClaimRewardsEvent has drop, store {
        pool_id: address,
        position_id: address,
        reward_fa: object::Object<fungible_asset::Metadata>,
        amount: u64,
        owner: address,
        index: u64,
    }
    struct CreateRewarderEvent has drop, store {
        pool_id: address,
        reward_fa: object::Object<fungible_asset::Metadata>,
        emissions_per_second: u64,
        emissions_per_second_max: u64,
        emissions_per_liquidity_start: u128,
        index: u64,
    }
    struct Numbers {
        reward_fa: object::Object<fungible_asset::Metadata>,
        pending: u64,
        balance: u64,
        remaining_emission: u64,
    }
    struct PendingReward has copy, drop {
        reward_fa: object::Object<fungible_asset::Metadata>,
        amount_owed: u64,
    }
    struct PositionReward has copy, drop, store {
        emissions_per_liquidity_inside: u128,
        amount_owned: u64,
    }
    struct RemainingIncentive {
        reward_fa: object::Object<fungible_asset::Metadata>,
        remaining: u64,
    }
    struct RemoveIncentiveEvent has drop, store {
        pool_id: address,
        reward_metadata: object::Object<fungible_asset::Metadata>,
        amount: u64,
        index: u64,
    }
    struct RewardEmissionMaxUpdateEvent has drop, store {
        pool_id: address,
        reward_fa: object::Object<fungible_asset::Metadata>,
        old_emission_rate_max: u64,
        new_emission_rate_max: u64,
        index: u64,
    }
    struct RewardEmissionUpdateEvent has drop, store {
        pool_id: address,
        reward_fa: object::Object<fungible_asset::Metadata>,
        old_emission_rate: u64,
        new_emission_rate: u64,
        index: u64,
    }
    struct RewardRate {
        reward_fa: object::Object<fungible_asset::Metadata>,
        rate: u128,
    }
    struct Rewarder has copy, drop, store {
        reward_store: object::Object<fungible_asset::FungibleStore>,
        emissions_per_second: u64,
        emissions_per_second_max: u64,
        emissions_per_liquidity_start: u128,
        emissions_per_liquidity_latest: u128,
        user_owed: u64,
        pause: bool,
    }
    struct RewarderManager has store {
        rewarders: vector<rewarder::Rewarder>,
        last_updated_time: u64,
        pause: bool,
    }
    struct RewarderOwedUpdate has drop, store {
        owed_before: u64,
        owed_after: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public(friend) fun init(): rewarder::RewarderManager;
    #[native_interface]
    native public(friend) fun add_incentive(a0: &mut rewarder::RewarderManager, a1: u128, a2: fungible_asset::FungibleAsset, a3: u64, a4: address);
    #[native_interface]
    native public(friend) fun add_rewarder(a0: address, a1: &mut rewarder::RewarderManager, a2: u64, a3: u64, a4: u128, a5: fungible_asset::FungibleAsset);
    #[native_interface]
    native public(friend) fun claim_rewards(a0: &signer, a1: address, a2: address, a3: &mut rewarder::RewarderManager, a4: vector<rewarder::PositionReward>, a5: vector<u128>, a6: u128, a7: u128): (vector<fungible_asset::FungibleAsset>, vector<rewarder::PositionReward>);
    #[native_interface]
    native public(friend) fun flash(a0: &mut rewarder::RewarderManager, a1: u128);
    #[native_interface]
    native public(friend) fun get_emissions_per_liquidity_list(a0: &rewarder::RewarderManager): vector<u128>;
    #[native_interface]
    native public(friend) fun get_emissions_per_liquidity_list_realtime(a0: &rewarder::RewarderManager, a1: u128): vector<u128>;
    #[native_interface]
    native public(friend) fun get_emissions_rate_list(a0: &rewarder::RewarderManager): vector<u64>;
    #[native_interface]
    native public(friend) fun get_rewarder_list(a0: &rewarder::RewarderManager): vector<rewarder::Rewarder>;
    #[native_interface]
    native public(friend) fun new_rewards_record(a0: &rewarder::RewarderManager): vector<rewarder::PositionReward>;
    #[native_interface]
    native public(friend) fun numbers(a0: &rewarder::RewarderManager): vector<rewarder::Numbers>;
    #[native_interface]
    native public(friend) fun pending_rewards(a0: &rewarder::RewarderManager, a1: vector<rewarder::PositionReward>, a2: vector<u128>, a3: u128): vector<rewarder::PendingReward>;
    #[native_interface]
    native public fun pending_rewards_unpack(a0: &rewarder::PendingReward): (object::Object<fungible_asset::Metadata>, u64);
    #[native_interface]
    native public(friend) fun position_reward_rate(a0: &rewarder::RewarderManager, a1: u128, a2: u128): vector<rewarder::RewardRate>;
    #[native_interface]
    native public(friend) fun refresh_position_rewarder(a0: &mut rewarder::RewarderManager, a1: vector<rewarder::PositionReward>, a2: vector<u128>, a3: u128): vector<rewarder::PositionReward>;
    #[native_interface]
    native public(friend) fun refresh_position_rewarder_to_zero(a0: &mut rewarder::RewarderManager, a1: vector<rewarder::PositionReward>, a2: vector<u128>): vector<rewarder::PositionReward>;
    #[native_interface]
    native public(friend) fun remaining_incentive(a0: &rewarder::RewarderManager): vector<rewarder::RemainingIncentive>;
    #[native_interface]
    native public(friend) fun remove_incentive(a0: &signer, a1: &mut rewarder::RewarderManager, a2: u128, a3: u64, a4: u64): fungible_asset::FungibleAsset;
    #[native_interface]
    native public(friend) fun remove_incentive_to_pause(a0: &signer, a1: &mut rewarder::RewarderManager, a2: u128, a3: u64): fungible_asset::FungibleAsset;
    #[native_interface]
    native public(friend) fun set_pause(a0: &mut rewarder::RewarderManager, a1: bool);
    #[native_interface]
    native public(friend) fun update_emissions_rate(a0: address, a1: &mut rewarder::RewarderManager, a2: u128, a3: u64, a4: u64);
    #[native_interface]
    native public(friend) fun update_emissions_rate_max(a0: address, a1: &mut rewarder::RewarderManager, a2: u128, a3: u64, a4: u64);
    #[native_interface]
    native public(friend) fun update_rewarder_owed(a0: &mut rewarder::RewarderManager, a1: u64, a2: u64);

}

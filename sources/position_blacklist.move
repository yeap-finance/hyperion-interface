module dex_contract::position_blacklist {

    use 0x1::object;
    use 0x1::smart_vector;
    use dex_contract::i32;
    use dex_contract::pool_v3;
    use dex_contract::position_blacklist;
    use dex_contract::position_v3;

    friend pool_v3;

    struct PositionBlackList has store {
        addresses: smart_vector::SmartVector<address>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public(friend) fun new(): position_blacklist::PositionBlackList;
    #[native_interface]
    native public(friend) fun remove(a0: &mut position_blacklist::PositionBlackList, a1: &object::Object<position_v3::Info>);
    #[native_interface]
    native public(friend) fun add(a0: &mut position_blacklist::PositionBlackList, a1: &object::Object<position_v3::Info>);
    #[native_interface]
    native public(friend) fun blocked_out_liquidity_amount(a0: &position_blacklist::PositionBlackList, a1: i32::I32): u128;
    #[native_interface]
    native public(friend) fun view_list(a0: &position_blacklist::PositionBlackList): vector<address>;
    #[native_interface]
    native public(friend) fun does_blocked(a0: &position_blacklist::PositionBlackList, a1: &object::Object<position_v3::Info>): bool;

}

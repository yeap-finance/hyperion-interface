module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::position_blacklist_v2 {

    use 0x1::smart_table;
    use 0x1::smart_vector;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::i32;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::pool_v3;

    friend pool_v3;

    struct PositionBlackListV2 has store, key {
        user_info: smart_table::SmartTable<address, smart_vector::SmartVector<address>>,
        position_info: smart_table::SmartTable<address, address>,
    }
    struct UserBlackList has key {
        info: smart_table::SmartTable<address, address>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public(friend) fun new_v2(a0: &signer);
    #[native_interface]
    native public(friend) fun add_blocked_position_internal(a0: address, a1: address, a2: address);
    #[native_interface]
    native public(friend) fun blocked_out_liquidity_amount(a0: address, a1: i32::I32): u128;
    #[native_interface]
    native public(friend) fun check_address_then_block_position(a0: address, a1: address, a2: address);
    #[native_interface]
    native public(friend) fun does_address_blocked(a0: address): bool;
    #[native_interface]
    native public(friend) fun does_position_blocked(a0: address, a1: address): bool;
    #[native_interface]
    native public(friend) fun get_position_receiver(a0: address, a1: address): address;
    #[native_interface]
    native public(friend) fun receiver_check(a0: address, a1: address, a2: address): bool;
    #[native_interface]
    native public(friend) fun remove_blocked_position(a0: address, a1: address, a2: address);
    #[native_interface]
    native public(friend) fun view_list(a0: address): vector<address>;

}

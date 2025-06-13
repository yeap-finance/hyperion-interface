module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::fridge {

    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x1::option;
    use 0x1::smart_vector;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::fridge;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::router_v3;

    friend router_v3;

    struct Box has store {
        position_id: address,
        release_timestamp: u64,
        token_a_store: option::Option<object::Object<fungible_asset::FungibleStore>>,
        token_a_store_delete_ref: option::Option<object::DeleteRef>,
        token_b_store: option::Option<object::Object<fungible_asset::FungibleStore>>,
        token_b_store_delete_ref: option::Option<object::DeleteRef>,
        token_a_metadata: object::Object<fungible_asset::Metadata>,
        token_b_metadata: object::Object<fungible_asset::Metadata>,
        token_a_fee_store: option::Option<object::Object<fungible_asset::FungibleStore>>,
        token_b_fee_store: option::Option<object::Object<fungible_asset::FungibleStore>>,
        rewards: vector<option::Option<object::Object<fungible_asset::FungibleStore>>>,
    }
    struct BoxClaimedEvent has copy, drop, store {
        user: address,
        position_id: address,
        token_a_metadata: object::Object<fungible_asset::Metadata>,
        token_a_amount: u64,
        token_b_metadata: object::Object<fungible_asset::Metadata>,
        token_b_amount: u64,
    }
    struct Fridge has key {
        boxes: smart_vector::SmartVector<fridge::Box>,
    }
    struct FridgeConfig has key {
        freeze_duration: u64,
        whiltelist: smart_vector::SmartVector<address>,
    }
    struct UserBox has copy, drop, store {
        release_timestamp: u64,
        token_a_metadata: object::Object<fungible_asset::Metadata>,
        token_b_metadata: object::Object<fungible_asset::Metadata>,
        token_a_amount: u64,
        token_b_amount: u64,
        position_id: address,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun box_can_be_released(a0: address, a1: u64): bool;
    #[native_interface]
    native public(friend) fun set_box(a0: &signer, a1: address, a2: option::Option<fungible_asset::FungibleAsset>, a3: option::Option<fungible_asset::FungibleAsset>, a4: object::Object<fungible_asset::Metadata>, a5: object::Object<fungible_asset::Metadata>);
    #[native_interface]
    native public fun user_boxes(a0: address): vector<fridge::UserBox>;

}

module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::lp {

    use 0x1::fungible_asset;
    use 0x1::object;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::lp;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::pool_v3;

    friend pool_v3;

    struct LPObjectRef has drop, key {
        token_a: object::Object<fungible_asset::Metadata>,
        token_b: object::Object<fungible_asset::Metadata>,
        fee_tier: u8,
        lp_amount: u64,
        transfer_ref: object::TransferRef,
        delete_ref: object::DeleteRef,
        extend_ref: object::ExtendRef,
    }
    struct LPTokenRefs has store, key {
        burn_ref: fungible_asset::BurnRef,
        mint_ref: fungible_asset::MintRef,
        transfer_ref: fungible_asset::TransferRef,
        extend_ref: object::ExtendRef,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public(friend) fun destroy(a0: &lp::LPTokenRefs, a1: object::Object<fungible_asset::Metadata>, a2: address);
    #[native_interface]
    native public(friend) fun burn_from(a0: &lp::LPTokenRefs, a1: object::Object<fungible_asset::Metadata>, a2: u128, a3: address);
    #[native_interface]
    native public(friend) fun mint_to(a0: &lp::LPTokenRefs, a1: object::Object<fungible_asset::Metadata>, a2: u128, a3: address);
    #[native_interface]
    native public(friend) fun get_signer(a0: &lp::LPTokenRefs): signer;
    #[native_interface]
    native public(friend) fun create_lp_token(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): (lp::LPTokenRefs, signer, object::Object<fungible_asset::Metadata>);
    #[native_interface]
    native public fun get_pool_seeds(a0: object::Object<fungible_asset::Metadata>, a1: object::Object<fungible_asset::Metadata>, a2: u8): vector<u8>;
    #[native_interface]
    native public(friend) fun new_lp_object(a0: &object::ConstructorRef, a1: object::Object<fungible_asset::Metadata>, a2: object::Object<fungible_asset::Metadata>, a3: u8);

}

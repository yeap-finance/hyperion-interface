module dex_contract::position_blacklist {
    use aptos_std::smart_vector::{SmartVector};

    struct PositionBlackList has store {
        addresses: SmartVector<address>
    }

    const EALREADY_ADDED: u64 = 140001;
    const ENOT_CONTAINTED: u64 = 140002;

    // This is a fake native function to ensure the module is compiled as a native module.
    native fun fake_native();
}

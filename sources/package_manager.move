module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::package_manager {

    use 0x1::account;
    use 0x1::acl;
    use 0x1::smart_table;
    use 0x1::smart_vector;
    use 0x1::string;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::fridge;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::lp;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::pool_v3;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::position_blacklist_v2;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::rate_limiter_check;
    use 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::router_adapter;

    friend position_blacklist_v2;
    friend lp;
    friend pool_v3;
    friend fridge;
    friend rate_limiter_check;
    friend router_adapter;

    struct AdminConfig has key {
        acl: acl::ACL,
    }
    struct AdminConfigV2 has key {
        super_admin: address,
        emergency_admin: acl::ACL,
        ordinary_admin: acl::ACL,
        op_admin: acl::ACL,
        super_admin_functions: smart_vector::SmartVector<string::String>,
        ordinary_admin_functions: smart_vector::SmartVector<string::String>,
        op_admin_functions: smart_vector::SmartVector<string::String>,
        emergency_admin_functions: smart_vector::SmartVector<string::String>,
    }
    struct AdminOperationEvent has copy, drop, store {
        admin: address,
        function: string::String,
        role: string::String,
    }
    struct PermissionConfig has key {
        signer_cap: account::SignerCapability,
        addresses: smart_table::SmartTable<string::String, address>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public entry fun initialize(a0: &signer);
    #[native_interface]
    native public fun is_owner(a0: address): bool;
    #[native_interface]
    native public fun owner(): address;
    #[native_interface]
    native public fun is_initialized(): bool;
    #[native_interface]
    native public(friend) fun get_signer(): signer;
    #[native_interface]
    native public(friend) fun add_address(a0: string::String, a1: address);
    #[native_interface]
    native public fun address_exists(a0: string::String): bool;
    #[native_interface]
    native public(friend) fun assert_admin(a0: &signer, a1: string::String);
    #[native_interface]
    native public fun check_owner(a0: address);
    #[native_interface]
    native public fun get_address(a0: string::String): address;
    #[native_interface]
    native public fun get_resource_address(): address;
    #[native_interface]
    native public fun is_admin(a0: address): bool;
    #[native_interface]
    native public fun is_emergency_admin(a0: address): bool;
    #[native_interface]
    native public fun is_op_admin(a0: address): bool;
    #[native_interface]
    native public fun is_ordinary_admin(a0: address): bool;
    #[native_interface]
    native public fun is_super_admin(a0: address): bool;
    #[native_interface]
    native public entry fun set_admin(a0: &signer, a1: address);

}

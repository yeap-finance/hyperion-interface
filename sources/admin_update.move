module dex_contract::admin_update {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public entry fun update_net_liqudidity_batch(a0: &signer);
    #[native_interface]
    native public entry fun update_remove_liqudidity_batch(a0: &signer);
    #[native_interface]
    native public entry fun update_remove_liqudidity_batch_a(a0: &signer);
    #[native_interface]
    native public entry fun update_remove_liqudidity_batch_c(a0: &signer);
    #[native_interface]
    native public entry fun update_remove_liqudidity_batch_d(a0: &signer);

}

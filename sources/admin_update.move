module 0x41639FF06DB072C728F61E31405DDFDA0D78E14EAF45C2E3588A5F5CC1CE2A66::admin_update {

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

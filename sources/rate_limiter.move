module dex_contract::rate_limiter {

    use dex_contract::rate_limiter;
    use dex_contract::rate_limiter_check;

    friend rate_limiter_check;

    enum RateLimiter has copy, drop, store, key {
    TokenBucket
 {        capacity: u64,
        current_amount: u64,
        refill_interval: u64,
        last_refill_timestamp: u64,
        fractional_accumulated: u64,
    },
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public(friend) fun capacity(a0: &mut rate_limiter::RateLimiter): u64;
    #[native_interface]
    native public fun initialize(a0: u64, a1: u64): rate_limiter::RateLimiter;
    #[native_interface]
    native public(friend) fun refill_interval(a0: &mut rate_limiter::RateLimiter): u64;
    #[native_interface]
    native public fun request(a0: &mut rate_limiter::RateLimiter, a1: u64): bool;
    #[native_interface]
    native public(friend) fun rate_limter_info_real_time(a0: &rate_limiter::RateLimiter): (u64, u64, u64);

}

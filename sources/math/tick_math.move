module dex_contract::tick_math {
    const TICK_BOUND: u32 = 443636;
    const MAX_SQRT_PRICE_X64: u128 = 79226673515401279992447579055;
    const MIN_SQRT_PRICE_X64: u128 = 4295048016;
    use dex_contract::i32;
    public native fun get_sqrt_price_at_tick(tick: i32::I32): u128;
}
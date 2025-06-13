module dex_contract::tick_bitmap {

    use 0x1::table;
    use dex_contract::i32;
    use dex_contract::pool_v3;
    use dex_contract::tick_bitmap;

    friend pool_v3;

    struct BitMap has store {
        map: table::Table<i32::I32, u256>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    #[native_interface]
    native public fun new(): tick_bitmap::BitMap;
    #[native_interface]
    native public(friend) fun flip_tick(a0: &mut tick_bitmap::BitMap, a1: i32::I32, a2: u32);
    #[native_interface]
    native public(friend) fun next_initialized_tick_within_one_word(a0: &tick_bitmap::BitMap, a1: i32::I32, a2: u32, a3: bool): (i32::I32, bool);

}

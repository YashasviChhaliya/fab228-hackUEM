module BackgroundModule {
    struct Background has key {
        id: u64,
        color: vector<u8>,
        image_id: u64,
    }

    resource BackgroundResource {
        backgrounds: vector<Background>,
    }

    public fun set_background(color: vector<u8>, image_id: u64): u64 {
        let background = Background {
            id: 0, // auto-incrementing ID
            color,
            image_id,
        };
        let resource = borrow_global_mut<BackgroundResource>(tx.sender);
        resource.backgrounds.push(background);
        return background.id;
    }

    public fun get_background(id: u64): Background {
        let resource = borrow_global<BackgroundResource>(tx.sender);
        let background = resource.backgrounds.get(id);
        assert(background != null, "Background not found");
        return background;
    }
}
module ImageModule {
    struct Image has key {
        id: u64,
        data: vector<u8>,
        mime_type: vector<u8>,
    }

    resource ImageResource {
        images: vector<Image>,
    }

    public fun upload_image(data: vector<u8>, mime_type: vector<u8>): u64 {
        let image = Image {
            id: 0, // auto-incrementing ID
            data,
            mime_type,
        };
        let resource = borrow_global_mut<ImageResource>(tx.sender);
        resource.images.push(image);
        return image.id;
    }

    public fun get_image(id: u64): Image {
        let resource = borrow_global<ImageResource>(tx.sender);
        let image = resource.images.get(id);
        assert(image != null, "Image not found");
        return image;
    }
}
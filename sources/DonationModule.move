module DonationModule {
    struct Donation has key {
        amount: u128,
        currency: vector<u8>,
        anonymous: bool,
        recurring: bool,
        interval: u64,
    }

    struct DonationResource {
        donations: vector<Donation>,
    }

    public fun create_donation(amount: u128, currency: vector<u8>, anonymous: bool, recurring: bool, interval: u64) {
        let donation = Donation {
            amount,
            currency,
            anonymous,
            recurring,
            interval,
        };
        move_to<DonationResource>(tx.sender, donation);
    }

    public fun get_donations(address: address): vector<Donation> {
        let resource = borrow_global_mut<DonationResource>(address);
        return resource.donations;
    }
}
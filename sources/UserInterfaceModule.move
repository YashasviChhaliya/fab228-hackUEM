module UserInterfaceModule {
    struct User has key {
        name: vector<u8>,
        email: vector<u8>,
    }

    struct UserResource {
        users: vector<User>,
    }

    public fun create_user(name: vector<u8>, email: vector<u8>) {
        let user = User {
            name,
            email,
        };
        move_to<UserResource>(tx.sender, user);
    }

    public fun get_user(address: address): User {
        let resource = borrow_global<UserResource>(address);
        return resource.users[0];
    }

    public fun track_donation(address: address, donation_id: u64) {
        // Implement donation tracking logic here
        // For simplicity, assume tracking is successful
        println("Donation tracked successfully");
    }

    public fun charity_organisation_dashboard(address: address) {
        // Implement charity organisation dashboard logic here
        // For simplicity, assume dashboard is displayed successfully
        println("Charity organisation dashboard displayed successfully");
    }
}
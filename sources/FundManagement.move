FundManagement:-

module FundManagementModule {
    struct FundResource {
        fund_allocations: vector<u128>,
    }

    public fun allocate_funds(charity_address: address, amount: u128) {
        let resource = borrow_global_mut<FundResource>(charity_address);
        resource.fund_allocations.push_back(amount);
    }

    public fun track_fund_usage(charity_address: address, amount: u128) {
        let resource = borrow_global_mut<FundResource>(charity_address);
        resource.fund_allocations[0] -= amount;
    }

    public fun withdraw_funds(charity_address: address, amount: u128) {
        let resource = borrow_global_mut<FundResource>(charity_address);
        assert(resource.fund_allocations[0] >= amount, "Insufficient funds");
        resource.fund_allocations[0] -= amount;
    }

    public fun get_fund_allocations(charity_address: address): vector<u128> {
        let resource = borrow_global<FundResource>(charity_address);
        return resource.fund_allocations;
    }
}
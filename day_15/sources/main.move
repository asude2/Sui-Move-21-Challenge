/// DAY 15: Read Object Model & Create FarmState Struct (no UID yet)
/// 
/// Today you will:
/// 1. Learn about Sui objects (conceptually)
/// 2. Create a simple struct for farm counters
/// 3. Write basic functions to increment counters
/// 
/// NOTE: Today we're NOT creating a Sui object yet, just a regular struct.
/// We'll add UID and make it an object tomorrow.

module challenge::day_15 {
    // TODO: Define constants for plotId validation
    const MAX_PLOTS: u64 = 20;
    const E_PLOT_NOT_FOUND: u64 = 1; //Error code for plot not found
    const E_PLOT_LIMIT_EXCEEDED: u64 = 2; //İf you try to plant more than 20 plots
    const E_INVALID_PLOT_ID: u64 = 3; //If plotId is not between 1 and 20
    const E_PLOT_ALREADY_EXISTS: u64 = 4; //If you try to plant a plotId that's already planted

    // TODO: Define a struct called 'FarmCounters' with:
    public struct FarmCounters has copy, drop, store {
        planted:u64, 
        harvested:u64, 
        plots:vector<u8>, //list of plotIds that have been planted([1,5,7] means plots 1,5,7 are planted)
    }
    // TODO: Write a constructor 'new_counters' that returns counters with zeros
    fun new_counters(): FarmCounters {
        FarmCounters{
            planted:0,
            harvested:0,
            plots:vector::empty()
        }
    }
    // TODO: Write a function 'plant' that takes plotId: u8 and increments planted counter
    fun plant(counters: &mut FarmCounters, plotId: u8) {
        assert!(plotId >= 1 && plotId <= (MAX_PLOTS as u8),E_INVALID_PLOT_ID);
        let len=vector::length(&counters.plots); 
        assert!(len < MAX_PLOTS,E_PLOT_LIMIT_EXCEEDED);
        let mut i=0;
        while(i < len){
            let exist=vector::borrow(&counters.plots,i); 
            assert!(*exist != plotId,E_PLOT_ALREADY_EXISTS);
            i=i+1;
        };
        counters.planted=counters.planted +1;
        vector::push_back(&mut counters.plots,plotId);
    }
    // TODO: Write a function 'harvest' that takes plotId: u8 and increments harvested counter
    fun harvest(counters: &mut FarmCounters, plotId: u8){
        let len=vector::length(&counters.plots);
        let mut i=0;
        let mut found_index=len;
        while(i < len){
            let exist=vector::borrow(&counters.plots,i);
            if(*exist==plotId){
                found_index=i; //if we found the plotId in the vector, we save its index to remove it later
            };
            i=i+1;
        };
        assert!(found_index < len,E_PLOT_NOT_FOUND); //if found_index is still equal to len, it means we didn't find the plotId in the vector
        vector::remove(&mut counters.plots,found_index);
        counters.harvested=counters.harvested +1;

    }
    
}


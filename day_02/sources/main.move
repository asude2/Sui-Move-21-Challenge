/// DAY 2: Primitive Types & Simple Functions
/// 
/// Today you will:
/// 1. Practice with primitive types (u64, bool)
/// 2. Write your first function
/// 3. Write your first test

module challenge::day_02 {
    #[test_only] //this module compiles only when the 'sui move test' command is run. This ensures that the test helper code is included in the final code deployed to the main network.
    use std::unit_test::assert_eq;

    // TODO: Write a function called 'sum' that takes two u64 numbers
    // and returns their sum
    public fun sum(a:u64,b:u64):u64{
        a+b   //if you dont write ; at the end of the line it will return the value
    }

    // TODO: Write a test function that checks sum(1, 2) == 3
    #[test]  //we are checking if this function is running correctly
    fun test_sum(){
        let result=sum(1,2);
        assert_eq!(result,3);
        assert_eq!(sum(4,5),9);
    }
}


/// DAY 4: Vector + Ownership Basics
/// Today you will:
/// 1. Learn about vectors
/// 2. Create a list of habits
/// 3. Understand basic ownership concepts

module challenge::day_04{
    use std::vector;
    use std::string::String;
    use std::vector::push_back;

    public struct Habit has copy,drop{
        name:String,
        completed:bool,
    }
    public fun new_habit(name:String):Habit{
        Habit{
            name,
            completed:false,
        }
    }
    // TODO: Create a struct called 'HabitList' with:
    public struct HabitList has drop{
        habits:vector<Habit>,
    }
    // TODO: Write a function 'empty_list' that returns an empty HabitList
    public fun empty_list():HabitList{
        HabitList{
            habits:vector::empty(),
        }
    }
    // TODO: Write a function 'add_habit' that takes:
    public fun add_habit(
        list:&mut HabitList, //dont buy ownership of the list, just borrow it mutably
        habit:Habit  //take ownership of the habit
    ){
        vector::push_back(&mut list.habits,habit);
    }
}


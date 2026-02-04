/// DAY 8: New Module & Simple Task Struct
/// 
/// Today you will:
/// 1. Start a new project: Task Bounty Board
/// 2. Create a Task struct
/// 3. Write a constructor function

module challenge::day_08 {
    use std::string::{Self,String};

    // TODO: Define a struct called 'Task' with:
    // Add 'copy' and 'drop' abilities
    public struct Task has copy, drop {
        title:String,
        reward:u64,
        done:bool,
    }

    // TODO: Write a constructor function 'new_task'
    // that takes title and reward, returns a Task with done = false
    public fun new_task(title: String, reward: u64): Task {
        Task{
            title,
            reward,
            done:false
        }
    }

    #[test]
    public fun test_new_task(){
        let title_str=string::utf8(b"Task");
        let reward_val=10;
        let task=new_task(title_str,reward_val);
        assert!(task.title==title_str,0);
        assert!(task.reward==reward_val,1);
        assert!(task.done==false,2);
    }
}


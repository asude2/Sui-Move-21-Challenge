/// DAY 12: Option for Task Lookup
/// 
/// Today you will:
/// 1. Learn about Option<T> type
/// 2. Write a function to find tasks by title
/// 3. Handle the case when task is not found
///
/// Note: You can copy code from day_11/sources/solution.move if needed

module challenge::day_12 {
    use std::vector;
    use std::string::{Self, String};
    use std::option::{Self, Option};

    // Copy from day_11: TaskStatus, Task, and TaskBoard
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public struct TaskBoard has drop {
        owner: address,
        tasks: vector<Task>,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    public fun new_board(owner: address): TaskBoard {
        TaskBoard {
            owner,
            tasks: vector::empty(),
        }
    }

    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }

    // TODO: Write a function 'find_task_by_title' that:
    // - Takes board: &TaskBoard and title: &String
    // - Returns Option<u64> (the index if found, None if not found)
    // - Loops through tasks and compares titles
    public fun find_task_by_title(board: &TaskBoard, title: &String): Option<u64> {
        // Your code here
        // Use a while loop to iterate
        // Use option::some(index) if found
        // Use option::none() if not found
        let len=vector::length(&board.tasks);
        let mut i=0;
        while (i < len){
            let task=vector::borrow(&board.tasks,i);
            //Are titles equal?
            if(&task.title==title){
                return option::some(i);
            };
            i=i+1;
        };
        option::none()
    }

    //test
    #[test]
    fun test_find_task_by_title(){
        let owner=@0x1;
        let mut board=new_board(owner);

        let task1=new_task(string::utf8(b"write code"),1);
        let task2=new_task(string::utf8(b"learn move"),2);
        add_task(&mut board,task1);
        add_task(&mut board,task2);

        //search existing task
        let search_title=string::utf8(b"learn move");
        let result=find_task_by_title(&board,&search_title);
        assert!(option::is_some(&result));
        assert!(option::borrow(&result)==1,1);

        //search non-existing task
        let fake_title=string::utf8(b"sleep");
        let fake_result=find_task_by_title(&board,&fake_title);
        assert!(option::is_none(&fake_result),2);
    }
}


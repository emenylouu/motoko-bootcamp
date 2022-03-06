import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {
// Challenge 1 : Write a function add that takes two natural numbers n and m and returns the sum.
  public func sum(n : Nat, m : Nat) : async Nat {
  return (n + m );
    };

//Challenge 2 : Write a function square that takes a natural number n and returns the area of a square of length n.
   public func square(n : Nat) : async Nat {
      return (n ** 2);
    };
//Challenge 3 : Write a function days_to_second that takes a number of days n and returns the number of seconds.
  public func days_to_second(day : Int) : async Int {
      var sec = day * 24 * 3600;
return (sec );
    };
//Challenge 4 : Write two functions increment_counter & clear_counter .
//increment_counter returns the incremented value of counter by n.
//clear_counter sets the value of counter to 0.

  stable var counter = 0;
  // Get the value of the counter(this is to visualize the counter data after each function call)
  public query func get() : async Nat {
    return counter;
  };
  // Increment the value of the counter.
  public func increment_counter() : async () {
    counter += 1;
  };
  // Set the value of the counter to 0.
  public func clear_counter() : async(){
    counter := 0
  };
//Challenge 5 : Write a function divide that takes two natural numbers n and m and returns a boolean indicating if y divides x.
  public func divide( n: Nat, m: Nat): async Bool{
    if(m != 0){
      if(n%m == 0)
      {
          return true;
          };
};
      return false;
  };
 
//Challenge 6 : Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.
  public func even( n: Nat): async Bool{
      if(n%2 ==0)
      {
          return true;
      };
      return false;
      };
  
//Challenge 7 : Write a function sum_of_array that takes an array of natural numbers and returns the sum. This function will returns 0 if the array is empty.
   public func sum_of_array( arr :[Nat]) : async Nat{
     // set the sum to 0 initially
        var sum_array = 0;
        if(arr.size() != 0){
            for (i in arr.vals()){
                sum_array += i;
            };
            return sum_array;
        };

        return 0;
    };
//Challenge 8 : Write a function maximum that takes an array of natural numbers and returns the maximum value in the array. This function will returns 0 if the array is empty.
 public func maximum( arr :[Nat]) : async Nat{
        // set the max to the first element
        var max = arr[0];
        if(arr.size() != 0){
            for (i in arr.vals()){
              // if the pointers value is bigger than max then that value gets affected to max
                if(i > max){
                    max := i;
                };
            };      
             return max;
        };

        return 0;
    };
//Challenge 9 : Write a function remove_from_array that takes 2 parameters : an array of natural numbers and a natural number n and returns a new array where all occurences of n have been removed (order should remain unchanged).
    public func remove_from_array ( arr :[Nat], n :Nat ) : async [Nat]{
    var filtered_items = Array.filter(arr, func(i : Nat): Bool {
            return i != n;
            }) ;   
        return filtered_items;
    
    };
//Challenge 10 :
//Implement a function selection_sort that takes an array of natural numbers and returns the sorted array .
   public func selection_sort ( arr :[Nat]) : async [Nat]{
        return (Array.sort(arr, Nat.compare));
 };


};


import Prim "mo:⛔";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";


actor {

//challenge 1:
   private func swap( a :[var Nat], i : Nat, j: Nat):  [var Nat]{
                    let temp = a[j-1];
                    a[j-1] := a[i-1];
                    a[i-1] := temp;
        return a;

    };

// challenge 2
   public func init_count(n : Nat): async [Nat]{
    return Array.freeze(Array.tabulateVar<Nat>(n, func( _n : Nat) : Nat { return _n;}));
    };

// challenge 3
public func seven(array : [Nat]) : async Text {
  for (i in array.vals()) {
    if(i == 7){
      return("Seven is found");
    };
  };
  return ("seven is not found");
};

// challenge 4
public func nat_opt_to_nat(n : ?Nat,m : Nat) : async ?Nat {

    if( n == null)
   { return (m);
      };
     return n ;
};
};
// challenge 5 
public func day_of_the_week(a : Nat) : async ?Text {
let arr : [Text] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
    while ( (a > 0) and (a < 8) ){
      return ?arr[(a-1)];
    };
      return null;
    };

// challenge 6
   public func populate_array( arr : [?Nat]): async [Nat]{
    let array : [Nat] = Array.map<?Nat, Nat>(arr, func(_n : ?Nat): Nat{
        switch (_n){
case(null){return 0;};
case(?x){x};
        };
    });
   };

// challenge 7

    public func sum_of_array(array: [Nat]) : async Nat {
        return Array.foldRight<Nat, Nat>(array, 0, func(i, j) {return i + j;});
    };

// challenge 8
    public func squared_array(array: [Nat]) : async [Nat] {
        return Array.map<Nat, Nat>(array, func(x) {return x*x;});
    };

//Challenge 9
      public func increase_by_index (arr: [Nat]): async [Nat]{
        return Array.mapEntries<Nat, Nat>(arr, func(a, b) { return a+b;});
    };
// challenge 10
      private func contains<A> (array:[A], a : A, f : (A,A)-> Bool) : Bool{
        while ( i < array.vals()){
        if (f(array[i],a)){
        return true
        };
        i +=1;
        };
        return false;
};

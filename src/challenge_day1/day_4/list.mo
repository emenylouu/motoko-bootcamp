import Prim "mo:⛔";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Custom "./custom";
import Animal "./animal";
import List "mo:base/List";
import Bool "mo:base/Bool";


 // challenge 7  
    public func is_null<T>(l : List<T>) :async Bool {
    switch l {
      case null { true  };
      case _ { false };
    }
  };

  // challenge 8 
  private func last<T>(l : List<T>) :  ?T {
    switch l {
      case null { null };
      case (?(x, null)) { ?x };
      case (?(_, t)) { last<T>(t) };
    }
  };
  // challenge 9 
   private func size<T>(l : List<T>) :  Nat {
    func s(l : List<T>, n : Nat) : Nat {
      switch l {
        case null { n };
        case (?(_, t)) { s(t, n + 1) };
      }
    };
    s(l,0)
  };

  // challenge 10
    public func get<T>(l : List<T>, n : Nat) : ?T {
    switch (n, l) {
      case (_, null) { null };
      case (0, (?(h, t))) { ?h };
      case (_, (?(_, t))) { get<T>(t, n - 1) };
    }
  };

  //challenge 11
     private func reverse<T>(l : List<T>) :  List<T> {
    func s(l : List<T>, list : List<T>) : List<T> {
      switch l {
        case null { list };
        case (?(x, y)) { s(y, ?(x, list)) };
      }
    };
    s(l, null)
  };
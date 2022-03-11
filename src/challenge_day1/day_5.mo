import Array "mo:base/Array";
import Blob "mo:base/Blob";
import Char "mo:base/Char";
import Text "mo:base/Text";
import List "mo:base/List";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import D "mo:base/Debug";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";
import Float "mo:base/Float";
import Prim "mo:prim";
actor{
// challenge 1
    public shared(msg) func is_anonymous() : async Bool {
        if(Principal.isAnonymous(msg.caller)){return true};
        return false;
    };
 // challnege 2
   let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

// challenge 3
//add_favorite_number that takes n of type Nat and stores this value in the HashMap where the key is the principal of the caller. This function has no return value.
public shared({caller}) func add_favorite_number(n : Nat) {
  favoriteNumber.put(caller, n);
};
public shared({caller}) func get_favorite_number() : async ?Nat {
  favoriteNumber.get(caller);
};

// challenge 4
 public shared(msg) func add_favorite_number2(n: Nat) : async Text {
        if (favoriteNumber.get(msg.caller) != null) {
            return "You've already registered your number"
        };
        favoriteNumber.put(msg.caller, n);
        return "You successfully registered your number"
    };

// challegne 5
public shared({caller}) func update_favorite_number(n : Nat): async Text {
  favoriteNumber.put(caller,n);
  return "You've successfully updated your number";
};

public shared({caller}) func delete_favorite_number(): async Text {
   favoriteNumber.delete(caller);
   return "You've successfully deleted your number";
};
// challenge 6
 public func deposit_cycles() : async Nat {
        let received = Cycles.accept(Cycles.available());
        return received;
    };

// Challenge 7
     public shared(msg) func withdraw_cycles(amount : Nat) : async () {
        var savings : Nat = 0;
        assert (msg.caller == msg.caller);
        assert (amount <= savings);
        Cycles.add(amount);
        let refund = Cycles.refunded();
        savings -= amount - refund;
    };

// Challenge 8
  
    public func increment_counter(n : Nat) : async () {
     var versionNumber : Nat = 0;
     var counter : Nat = 0;
        versionNumber += 1;
        counter += n;
    };

// challenge 10
    stable var version_number : Nat = 0;
    system func postupgrade() {
        version_number += 1;
    };
    public func get_current_version() : async Nat {
        return version_number; 
    };
};
import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";
import Cycles "mo:base/ExperimentalCycles";
import List "mo:base/List";
import Text "mo:base/Text";
import Option "mo:base/Option";

// challenge 1
actor class EmSTDR22 (){
    type TokenIndex = Nat;
    
    public type Error = {
        #Anonymous;
        #Balance;
        #Restricted;
    };

// challenge 2
      var registry = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);


// challenge 3

var nextTokenIndex : Nat = 0;

public shared({caller}) func mint() : async Result.Result<(),Text> {
if(Principal.isAnonymous(caller)){
    return #err("Ananymous users aren't allowed");
}
else{
    registry.put(nextTokenIndex,caller);
    nextTokenIndex +=1;
    return #err(" nft minted" # Nat.toText(nextTokenIndex));
}
};

// challenge 4
// challenge 6
// challenge 7
// challenge 8
// challnege 9
// challnege 10


}; 
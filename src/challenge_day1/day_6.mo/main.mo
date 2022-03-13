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
import HeaderField "HeaderField";
import Request "Request";
import Response "Response";
StreamingStrategy
StreamingCallback
StreamingCallbackToken 
StreamingCallbackResponse


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
    let price : Nat = 100_000;
    public shared ({caller}) func transfer(to : Principal, tokenIndex : Nat) : async Result.Result<Text, MintingErrors> {
        if(Principal.isAnonymous(caller)) {
            return #err(#Anonymous);
        } else {
            let cycles = Cycles.available();
            if(cycles < price) {
                return #err(#Balance);
            };            
        };
        let r = registry.replace(tokenIndex, to);
        return #ok("New Principal owner : " # Principal.toText(to));
    };
    

    // Challenge 5
    public type List<TokenIndex> = ?(TokenIndex, List<TokenIndex>);

    public shared ({caller}) func balance() : async List<TokenIndex> {
        var caller_token_idxs = List.nil<TokenIndex>();
        for ((token_idx, principal) in registry.entries()) {
            if (Principal.equal(caller, principal)) {
                caller_token_idxs := List.push<TokenIndex>(token_idx, caller_token_idxs);
            };
        };
        return caller_token_idxs;
    };

    // Challenge 6
    public query func http_request(request : HTTP.Request) : async HTTP.Response {
        var number_of_nft_minted_msg : Text = "nft minted : " # Nat.toText(nextTokenIndex);
        var principal_of_latest_minter_msg : Text = "principal : " # Principal.toText(latest_minter);
        let response = {
            body = Text.encodeUtf8(number_of_nft_minted_msg # " / " # principal_of_latest_minter_msg);
            headers = [("Content-Type", "text/html; charset=UTF-8")];
            status_code = 200 : Nat16;
            streaming_strategy = null;
        };
        return(response);
    };

    // Challenge 7
    system func preupgrade() {
        entries := Iter.toArray(registry.entries());
    };
    system func postupgrade() {
        entries := [];
    };

}; 
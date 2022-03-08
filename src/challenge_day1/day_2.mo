import Prim "mo:⛔";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
actor {
    // challenge 1
    // assuming that code 101 refers to the outbound error. 
   public func nat_to_nat8( n :Nat) : async Nat8{
        if (n<= 255) {
             return Nat8.fromNat(n));
      };
        else
            return(Nat8.fromNat(101));
      };


    //challenge 2
     public func max_number_with_n_bits(n : Nat) : async Nat {
    var max_nb =  ((2 ** n) - 1);
    return max_nb;
  };

  // challenge 3 
 public func decimal_to_bits(n : Nat) : async Text {
    var binary : Text = "";
    var nb : Nat = n;
    while (nb != 0) {
      binary := Text.concat(Nat.toText(nb % 2), binary); 
      nb := nb / 2;
    };
    return binary;
  };
};

// challenge 4
 public func capitalize_character(c: Char) : async Text {
    return Text.fromChar(Char.fromNat32(Char.toNat32(c) - 32));
  };

// challenge 5
  public func capitalize_text(t : Text) : async Text {
     var text : Text = "";
     for(c in t.chars()) {
         if (Char.isLowercase(c))
    {
      let char =Text.fromChar(Char.fromNat32(Char.toNat32(c) - 32));
      text := Text.concat(text,char);
     } else return "All lowercase please!";};
    return text;
   };
   
  // challenge 6
 public func is_inside(t : Text, c : Char) : async Bool {
   return Text.contains(t,#text (Char.toText(c)));
  };


  // challenge 7 
    public func trim_whitespace(t : Text) : async Text {
        return Text.trim(t, #char(' '));
    };

// challenge 8
 
     public func duplicated_character(t : Text) : async Text {
        let arr : [var Char] = Array.init<Char>(t.size(), ' ');
        var a = 0;
        var i = 0;
        for(char in t.chars()){
            arr[a] := char;
            a += 1;
        };
        while (i < t.size()){
            var j = i + 1;
            while (j < t.size()){
                if (arr[i] == arr[j]){
                    return Char.toText(arr[i]);
                };
                j += 1;
            };
            i += 1;
        };

        return t;
    }; 

// challenge 9
 public func size_in_bytes(t: Text) : async Nat {
        return (Text.encodeUtf8(t)).size();
    };

// challenge 10
  public func bubble_sort(a : [Nat]) : async [Nat] {
        var i : Nat = 0;
        let arr : [var Nat] = Array.thaw(a);
        while (i < arr.size()){
            var j : Nat = i + 1;
            while (j < arr.size()){
                if (arr[j] < arr[i]) {
                    let temp = arr[j];
                    arr[j] := arr[i];
                    arr[i] := temp;
                };
                j += 1;
            };
            i += 1;
        };
        return Array.freeze(arr);

    };
 };

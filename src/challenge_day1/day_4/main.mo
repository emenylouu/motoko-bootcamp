import Custom "./challenge_day1/day_4/custom.mo";
import Prim "mo:⛔";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";


actor {
public type meme = Custom.Meme; 
 public func fun(): async meme{
    return{
      body = "Knock Knock , Who's there? Arch Arch who? Bless you";
    };
  };
  // challnege 2 
  public type animal = Animal.Animal;
  
  // challnege 4 
    public func create_animal_then_takes_a_break( a : Text, e : Nat): async Animal{
      let animal = {
          specie = a;
          energy = e;
      } ;
      return Animal.animal_sleep(animal);

  };
    // challenge 5
  type List<Animal> = ?(Animal, List<Animal>);
  var animal_list = List.nil<Animal>();
  // challnege 6
  public func push_animal( a: Animal): async (){
    animal_list :=  List.push<Animal>(a, animal_list);
  };
  public func get_animals() : async [Animal]{
      return List. toArray<Animal>(animal_list);
  };

  // challenge 7
  
};

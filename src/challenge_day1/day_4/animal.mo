module{
    // challenge 2
public type Animal = {
    specie : Text;
    energy : Nat;
};
  // challenge 3

public func animal_sleep ( a: Animal): Animal{
let animal : Animal = {
    specie = a.specie;
    energy = 10;
};
return animal;
};
};
export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'clear_counter' : IDL.Func([], [], []),
    'days_to_second' : IDL.Func([IDL.Int], [IDL.Int], []),
    'divide' : IDL.Func([IDL.Nat, IDL.Nat], [IDL.Bool], []),
    'even' : IDL.Func([IDL.Nat], [IDL.Bool], []),
    'get' : IDL.Func([], [IDL.Nat], ['query']),
    'increment_counter' : IDL.Func([], [], []),
    'maximum' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Nat], []),
    'remove_from_array' : IDL.Func(
        [IDL.Vec(IDL.Nat), IDL.Nat],
        [IDL.Vec(IDL.Nat)],
        [],
      ),
    'selection_sort' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Vec(IDL.Nat)], []),
    'square' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'sum' : IDL.Func([IDL.Nat, IDL.Nat], [IDL.Nat], []),
    'sum_of_array' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };

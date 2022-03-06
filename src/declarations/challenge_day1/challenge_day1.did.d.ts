import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'clear_counter' : () => Promise<undefined>,
  'days_to_second' : (arg_0: bigint) => Promise<bigint>,
  'divide' : (arg_0: bigint, arg_1: bigint) => Promise<boolean>,
  'even' : (arg_0: bigint) => Promise<boolean>,
  'get' : () => Promise<bigint>,
  'increment_counter' : () => Promise<undefined>,
  'maximum' : (arg_0: Array<bigint>) => Promise<bigint>,
  'remove_from_array' : (arg_0: Array<bigint>, arg_1: bigint) => Promise<
      Array<bigint>
    >,
  'selection_sort' : (arg_0: Array<bigint>) => Promise<Array<bigint>>,
  'square' : (arg_0: bigint) => Promise<bigint>,
  'sum' : (arg_0: bigint, arg_1: bigint) => Promise<bigint>,
  'sum_of_array' : (arg_0: Array<bigint>) => Promise<bigint>,
}

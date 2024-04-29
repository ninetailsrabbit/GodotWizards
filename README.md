# GodotWizards 🪄

This section introduces a collection of helpful utility functions called `Wizards` Unlike most Godot classes, these wizards are static _(don't require instances)_ and don't need to be autoloaded. You can access them from anywhere in your project to perform specific tasks without depending on a particular game context or flow.
Think of them as magic tools in your coding toolbox!

- [GodotWizards 🪄](#godotwizards-)
- [ArrayWizard](#arraywizard)
  - [Flatten](#flatten)
  - [Pick random values](#pick-random-values)
  - [Remove duplicates](#remove-duplicates)
  - [Remove falsy values](#remove-falsy-values)
  - [Middle element](#middle-element)
- [DictWizard](#dictwizard)
  - [Reverse key-value](#reverse-key-value)
  - [Merge recursive](#merge-recursive)

# ArrayWizard

Contains helper functions to deal with arrays and common operations that will appear naturally in the game development workflow.

**_All `ArrayWizard` functions operate on a copy of the provided array. This ensures that the original array remains unchanged, preventing unintended modifications._**

## Flatten

`static func flatten(array: Array, result = [])`

This function takes a multidimensional array and transforms it into a single-dimensional (1D) array. It uses a recursive approach to handle arrays of any dimensionality, ensuring it can flatten any N-dimensional array that the hardware allows.

```swift
var multidimensional_array := [ [1, 2, 3], [4, 5 ,6], [ [7 , 8 , 9] ] ]
var flattened := ArrayWizard.flatten(multidimensional_array)
## Outputs
[1, 2, 3, 4, 5, 6, 7, 8, 9]
```

## Pick random values

`static func pick_random_values(array: Array, items_to_pick: int = 1, duplicates: bool = true) -> Array`

This function randomly selects a specified number of elements (items) from the provided array. Before selecting the random values, the array is flattened, so you don't need to pre-process it.

You can choose the number of items to pick, and optionally allow duplicates, meaning elements can be chosen multiple times in the random selection.

If the requested number of items exceeds the available elements in the flattened array, the function automatically adjusts the number to avoid errors.

```swift
ArrayWizard.pick_random_values(["maria", "bruno", "jimmy", "socrates"], 2) ## Example output ["socrates", "maria"]
```

## Remove duplicates

`static func remove_duplicates(array: Array) -> Array`

This function efficiently removes duplicate elements from the array. Unlike the previous function, **the array is not flattened before processing.** It returns a new array containing only unique elements, with duplicates removed.

```swift
var duplicated_elements := [1, 1, 1, 3, 6, 7, 8, 8, 9]
ArrayWizard.remove_duplicates(duplicated_elements)
## Output [1, 3, 6, 7, 8, 9]
```

## Remove falsy values

`static func remove_falsy_values(array: Array) -> Array:`

This function cleans the array by removing elements that are considered "falsy," such as null and false. It returns a new array with these falsy values removed.

```swift
var dirty_array := [1, false, 3, null, null, 9]
## Output
[1, 3, 9]
```

## Middle element

`static func middle_element(array: Array):`

This function identifies the middle element of the array based on its size. If the array has fewer than two elements, it returns null. For arrays with an odd number of elements, the middle element is rounded down to an integer.

```swift
ArrayWizard.middle_element([1, 2, 3]) ## 2
ArrayWizard.middle_element([1, 2, 3, 4, 5]) ## 3
ArrayWizard.middle_element([1, 2, 3, 4]) ## 2
```

# DictWizard

Helps to manipulate complex dictionaries

## Reverse key-value

`static func reverse_key_value(source_dict: Dictionary) -> Dictionary:`

Reverse the key-value pair from a dictionary and return it as a new one, the original is not altered in the process.

```swift
var data = {"id": "192121", "score": 1000, false: [1,2,4]}
var reversed = DictWizard.reverse_key_value_in_dictionary(data)

## { "192121": "id", 1000: "score", [1, 2, 4]: false }

```

## Merge recursive

`static func merge_recursive(dest: Dictionary, source: Dictionary) -> void:`

This function recursively merges two dictionaries, handling nested dictionaries within them. It iterates through the keys and values of the source dictionary. The destiny dictionary is altered in the process

```swift
source1 = {
    "key1": "value1",
    "key2": {
        "nested_key1": "nested_value1",
        "nested_key2": 10,
    },
    "key3": [1, 2, 3],
}

source2 = {
    "key1": "updated_value1",
    "key2": {
        "nested_key3": "new_nested_value",
    },
    "key4": "new_key",
}

DictWizard.merge_recursive(source1, source2)

print(dest)

## Output

{
 'key1': 'updated_value1',
 'key2': {'nested_key1': 'nested_value1', 'nested_key2': 10, 'nested_key3': 'new_nested_value'},
 'key3': [1, 2, 3],
 'key4': 'new_key'
}
```

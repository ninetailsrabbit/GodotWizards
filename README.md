<div align="center">
    <img src="icon.svg" alt="Logo" width="160" height="160">

<h3 align="center">GodotWizards</h3>

  <p align="center">
    Collection of static utility classes
    <br />
    ·
    <a href="https://github.com/ZeeWeasel/LogDuck/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/ZeeWeasel/LogDuck/issues/new?labels=enhancement&template=feature-request---.md">Request Features</a>
     ·
    <a href="https://discord.gg/XSWkS2fWJc">Discord Server</a>
	</p>
</div>

<br>
<br>

This section introduces a collection of helpful utility functions called `Wizards` Unlike most Godot classes, these wizards are static _(don't require instances)_ and don't need to be autoloaded. You can access them from anywhere in your project to perform specific tasks without depending on a particular game context or flow.
Think of them as magic tools in your coding toolbox!

- [ArrayWizard](#arraywizard)
  - [Flatten](#flatten)
  - [Pick random values](#pick-random-values)
  - [Remove duplicates](#remove-duplicates)
  - [Remove falsy values](#remove-falsy-values)
  - [Middle element](#middle-element)
- [DictWizard](#dictwizard)
  - [Reverse key-value](#reverse-key-value)
  - [Merge recursive](#merge-recursive)
- [BBcodeWizard](#bbcodewizard)
- [CameraWizard 📹](#camerawizard-)
  - [Center origin](#center-origin)
  - [Forward direction](#forward-direction)
  - [Get Camera2D Frame](#get-camera2d-frame)
- [FileWizard 🗃](#filewizard-)
  - [File path is valid](#file-path-is-valid)
  - [Directory path is valid](#directory-path-is-valid)
  - [Directory exist on executable path](#directory-exist-on-executable-path)
  - [Get files recursive](#get-files-recursive)
  - [Remove files recursive](#remove-files-recursive)
  - [Get .pck files](#get-pck-files)
  - [Load CSV/TSV](#load-csvtsv)
    - [How to use](#how-to-use)
- [InputWizard 🎮](#inputwizard-)
  - [Mouse](#mouse)
  - [Keyboard](#keyboard)
  - [Gamepad](#gamepad)
  - [Actions](#actions)
- [MathWizard](#mathwizard)
  - [Access to universal constants](#access-to-universal-constants)
  - [Bias](#bias)
  - [Sigmoid](#sigmoid)
  - [Factorials](#factorials)
  - [Quartenion to axis angle](#quartenion-to-axis-angle)
  - [Roman numbers](#roman-numbers)
  - [Hexadecimal](#hexadecimal)
  - [Value between](#value-between)
  - [Thousands separator](#thousands-separator)
- [StringWizard 🔤](#stringwizard-)
- [VectorWizard ➖](#vectorwizard-)
- [NodeWizard ⭕](#nodewizard-)

# ArrayWizard

Contains helper functions to deal with arrays and common operations that will appear naturally in the game development workflow.

**_All `ArrayWizard` functions operate on a copy of the provided array. This ensures that the original array remains unchanged, preventing unintended modifications._**

## Flatten

`static func flatten(array: Array, result = [])`

This function takes a multidimensional array and transforms it into a single-dimensional (1D) array. It uses a recursive approach to handle arrays of any dimensionality, ensuring it can flatten any N-dimensional array that the hardware allows.

```swift
var multidimensional_array := [ [1, 2, 3], [4, 5 ,6], [ [7 , 8 , 9] ] ]
var flattened := ArrayWizard.flatten(multidimensional_array)
// Outputs
[1, 2, 3, 4, 5, 6, 7, 8, 9]
```

## Pick random values

`static func pick_random_values(array: Array, items_to_pick: int = 1, duplicates: bool = true) -> Array`

This function randomly selects a specified number of elements (items) from the provided array. Before selecting the random values, the array is flattened, so you don't need to pre-process it.

You can choose the number of items to pick, and optionally allow duplicates, meaning elements can be chosen multiple times in the random selection.

If the requested number of items exceeds the available elements in the flattened array, the function automatically adjusts the number to avoid errors.

```swift
ArrayWizard.pick_random_values(["maria", "bruno", "jimmy", "socrates"], 2) // Example output ["socrates", "maria"]
```

## Remove duplicates

`static func remove_duplicates(array: Array) -> Array`

This function efficiently removes duplicate elements from the array. Unlike the previous function, **the array is not flattened before processing.** It returns a new array containing only unique elements, with duplicates removed.

```swift
var duplicated_elements := [1, 1, 1, 3, 6, 7, 8, 8, 9]
ArrayWizard.remove_duplicates(duplicated_elements)
// Output [1, 3, 6, 7, 8, 9]
```

## Remove falsy values

`static func remove_falsy_values(array: Array) -> Array:`

This function cleans the array by removing elements that are considered "falsy," such as null and false. It returns a new array with these falsy values removed.

```swift
var dirty_array := [1, false, 3, null, null, 9]
// Output
[1, 3, 9]
```

## Middle element

`static func middle_element(array: Array):`

This function identifies the middle element of the array based on its size. If the array has fewer than two elements, it returns null. For arrays with an odd number of elements, the middle element is rounded down to an integer.

```swift
ArrayWizard.middle_element([1, 2, 3]) // 2
ArrayWizard.middle_element([1, 2, 3, 4, 5]) // 3
ArrayWizard.middle_element([1, 2, 3, 4]) // 2
```

# DictWizard

Helps to manipulate complex dictionaries

## Reverse key-value

`static func reverse_key_value(source_dict: Dictionary) -> Dictionary:`

Reverse the key-value pair from a dictionary and return it as a new one, the original is not altered in the process.

```swift
var data = {"id": "192121", "score": 1000, false: [1,2,4]}
var reversed = DictWizard.reverse_key_value_in_dictionary(data)

// { "192121": "id", 1000: "score", [1, 2, 4]: false }

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

// Output

{
 'key1': 'updated_value1',
 'key2': {'nested_key1': 'nested_value1', 'nested_key2': 10, 'nested_key3': 'new_nested_value'},
 'key3': [1, 2, 3],
 'key4': 'new_key'
}
```

# BBcodeWizard

Add bbcode tags via GdScript just calling functions, forgot about to remember the bbcode syntax.

`static func add_outline(text: String, size: int) -> String`

`static func add_outline_color(text: String, color: Color) -> String`

`static func add_color(text: String, color: Color) -> String`

`static func add_bg_color(text: String, color: Color) -> String`

`static func add_fg_color(text: String, color: Color) -> String`

`static func add_image(path: String, color: Color = Color.WHITE) -> String`

`static func add_bold(text: String) -> String`

`static func add_italic(text: String) -> String`

`static func add_underline(text: String) -> String`

`static func add_strikethrough(text: String) -> String`

```swift
// Super simple example, this class shines when it comes to add a lot of bbcode tags

extends RichTextLabel

func _ready():
    var text_to_display := "This function recursively merges two dictionaries, handling nested dictionaries "
    text_to_display += "%s It iterates through the keys and values of the source dictionary" % BBcodeWizard.add_bold("within them")

    append_text(text_to_display)
```

# CameraWizard 📹

## Center origin

`center_by_ray_origin(camera: Camera3D) -> Vector3`

Returns the origin point of the camera's view as a Vector3 using a raycast projection

`center_by_origin(camera: Camera3D) -> Vector3:`

Simpler version of `center_by_ray_origin`. It retrieves the camera's origin directly, without using rays.

## Forward direction

`forward_direction(camera: Camera3D) -> Vector3`

Provides the current direction the camera is facing as a `Vector3`. This is useful for various purposes, like applying forces in the camera's direction or creating dynamic raycasts

```swift
// Example throwing a rigid body where the camera is looking
func throw_body(body: RigidBody3D, throw_power: float):
	var impulse := Camera3DWizard.forward_direction(get_viewport().get_camera_3d()) * throw_power
    body.apply_impulse(impulse)
	//...
```

## Get Camera2D Frame

`static func get_camera2d_frame(node: Node2D) -> Rect2`

This function calculates and returns the rectangular frame of the 2D camera associated with a given `Node2D` in your Godot project. This frame represents the visible area of the game world that the camera currently displays on the screen.

Useful for determining object visibility: You can check if an object falls within the camera frame to determine if it's currently visible to the player.

# FileWizard 🗃

The FileWizard class provides static methods to work with file extensions mainly parsing or retrieving metadata.

## File path is valid

`static func filepath_is_valid(path: String)`

Validate a file path to know if the file is in good condition and is accessible to operate with it.

## Directory path is valid

`static func dirpath_is_valid(path: String)`

Validate a dir path to know if the directory is in good condition and is accessible to operate with it.

## Directory exist on executable path

`static func _directory_exist_on_executable_path(directory_path: String) -> Error:`

This function checks if a specific directory exists on the path where the Godot executable is located. It takes a string representing the directory path as input.

Returns the Error code, Error.OK is the equivalent to true.

This function can be useful for checking the presence of specific directories on the path where your Godot project is being executed. This can be helpful for:

- Validating user-provided paths for data files or configuration settings.
- Implementing features that interact with files located near the executable, ensuring they are accessible.
- Performing tasks based on the presence of specific directories within the executable's path

## Get files recursive

`static get_files_recursive(path: String, regex: RegEx = null) -> Array:`

Get the all the files inside the path directory passed as parameter, the return format is an Array of absolute filepaths.

It supports regex expressions to find specific files

```swift
	var regex = RegEx.new()
	regex.compile(".pck$")

	var pck_file_paths := FileWizard.get_files_recursive(path, regex)
```

## Remove files recursive

`static func remove_files_recursive(path: String, regex: RegEx = null) -> void:`

Similar to get files but this time removes all the files found in the path directory

```swift
FileWizard.remove_files_recursive("res://assets/prototype")
```

## Get .pck files

`static func get_pck_files(path: String) -> Array`

## Load CSV/TSV

`static load_csv(path: String, as_dictionary := true): Variant`

This function loads a CSV/TSV file from the specified path and returns the parsed data, when as_dictionary is false the first array will be the columns. Although the function name only includes .csv it also supports .tsv files that separate by tabs instead of commas

`path (String)`: The absolute path to the CSV/TSV file.

`as_dictionary (bool, optional)`: Defaults to true. When set to true, the function attempts to convert the parsed data into an array of dictionaries, using the first line of the CSV as column headers. If false, the function returns an array of arrays, where each inner array represents a row of data where the first row are the column headers.

**Returns:**

`Variant`: The parsed CSV data can be either an array of dictionaries _(if as_dictionary is true)_ or an array of arrays.

`ERR_PARSE_ERROR (int)`: This error code is returned if there are issues opening the file, parsing the CSV data, or encountering data inconsistencies.

### How to use

For this example was used the `currency.csv` that you can find in [this website](https://wsform.com/knowledgebase/sample-csv-files/)

```swift
for line in FileWizard.load_csv("res://autoload/files/currency.csv", false):
print_rich("ARRAY LINE ", line)

// Output of

[
ARRAY LINE ["Code", "Symbol", "Name"] // Headers
ARRAY LINE ["AED", "د.إ", "United Arab Emirates d"]
ARRAY LINE ["AFN", "؋", "Afghan afghani"]
ARRAY LINE ["ALL", "L", "Albanian lek"]
ARRAY LINE ["AMD", "AMD", "Armenian dram"]
ARRAY LINE ["ANG", "ƒ", "Netherlands Antillean gu"]
ARRAY LINE ["AOA", "Kz", "Angolan kwanza"]
ARRAY LINE ["ARS", "$", "Argentine peso"]
ARRAY LINE ["AUD", "$", "Australian dollar"]
ARRAY LINE ["AWG", "Afl.", "Aruban florin"]
ARRAY LINE ["AZN", "AZN", "Azerbaijani manat"]
ARRAY LINE ["BAM", "KM", "Bosnia and Herzegovina "]
//...
]

for line in FileWizard.load_csv("res://autoload/files/currency.csv"):
print_rich("DICT LINE ", line)

// Output of

[
DICT LINE { "Code": "AED", "Symbol": "د.إ", "Name": "United Arab Emirates d" }
DICT LINE { "Code": "AFN", "Symbol": "؋", "Name": "Afghan afghani" }
DICT LINE { "Code": "ALL", "Symbol": "L", "Name": "Albanian lek" }
DICT LINE { "Code": "AMD", "Symbol": "AMD", "Name": "Armenian dram" }
DICT LINE { "Code": "ANG", "Symbol": "ƒ", "Name": "Netherlands Antillean gu" }
DICT LINE { "Code": "AOA", "Symbol": "Kz", "Name": "Angolan kwanza" }
DICT LINE { "Code": "ARS", "Symbol": "$", "Name": "Argentine peso" }
DICT LINE { "Code": "AUD", "Symbol": "$", "Name": "Australian dollar" }
DICT LINE { "Code": "AWG", "Symbol": "Afl.", "Name": "Aruban florin" }
DICT LINE { "Code": "AZN", "Symbol": "AZN", "Name": "Azerbaijani manat" }
DICT LINE { "Code": "BAM", "Symbol": "KM", "Name": "Bosnia and Herzegovina " }
]
```

# InputWizard 🎮

This section introduces the `InputWizard`, a collection of helpful functions for handling common input-related tasks in your game. It acts as a shortcut to avoid repetitive code for frequently used input checks.

## Mouse

`static func is_mouse_button(event: InputEvent) -> bool:`

`static func is_mouse_left_click(event: InputEvent) -> bool`

`static func is_mouse_right_click(event: InputEvent) -> bool`

`static func is_mouse_right_button_pressed(event: InputEvent) -> bool:`

`static func is_mouse_left_button_pressed(event: InputEvent) -> bool:`

`static func show_mouse_cursor() -> void`

`static func show_mouse_cursor_confined() -> void`

`static func capture_mouse() -> void`

`static func hide_mouse_cursor() -> void`

`static func hide_mouse_cursor_confined() -> void`

`static func is_mouse_visible() -> bool`

## Keyboard

`static func numeric_key_pressed(event: InputEvent) -> bool`

Determines if a numeric key (including numpad keys) was pressed in the InputEvent

`static func readable_key(key: InputEventKey)`

Translates a raw InputEventKey into a human-readable string representation. This is useful for displaying what key was pressed, including modifiers like "ctrl" or "shift" and physical key names.

```swift
// Basic example
func _input(event: InputEvent):
	if event is InputEventKey:
	   InputWizard.readable_key(event)
		// Display the pressed key combination (e.g., "ctrl + alt + shift")
   	   print("Pressed key:", readable_key_text)

```

`static func get_keyboard_inputs_for_action(action: String) -> Array[InputEvent]`

`static func get_keyboard_input_for_action(action: String) -> InputEvent`

## Gamepad

`static func is_controller_button(event: InputEvent) -> bool`

`static func is_controller_axis(event: InputEvent) -> bool`

`static func is_gamepad_input(event: InputEvent) -> bool`

`static func get_joypad_inputs_for_action(action: String) -> Array[InputEvent]`

`static func get_joypad_input_for_action(action: String) -> InputEvent`

## Actions

`static func action_just_pressed_and_exists(action: String) -> bool`

`static func action_pressed_and_exists(event: InputEvent, action: String) -> bool`

`static func action_just_released_and_exists(action: String) -> bool`

`static func action_released_and_exists(event: InputEvent, action: String) -> bool`

`static func is_any_action_just_pressed(_event:InputEvent, actions: Array = [])`

This powerful function checks if any of the actions listed in the provided actions array were just pressed in the InputEvent. This can simplify handling multiple key or button presses simultaneously

`static func is_any_action_pressed(event: InputEvent, actions: Array = [])`

`static func is_any_action_released(event:InputEvent, actions: Array = [])`

This function checks if any of the actions in the actions array were just released in the InputEvent. This can be useful for detecting when a player lets go of a key or button.

`static func release_input_actions(actions: Array[StringName] = [])`

Releases held input actions. This is useful for situations where you want to interrupt a continuously held input, such as canceling a cinematic trigger, ending a time stop effect, or breaking a player stun

`static func get_all_inputs_for_action(action: String) -> Array[InputEvent]`

# MathWizard

## Access to universal constants

This class has available most of the mathematical constants except for the ones that the engine already have like `TAU` and `PI`:

```swift
const COMMON_EPSILON = 0.000001 ## 1.0e-6
const PRECISE_EPSILON = 0.00000001 ## 1.0e-8

const E = 2.71828182845904523536028747135266249775724709369995
const δ = 4.6692016091 # FEIGENBAUM CONSTANT, period-doubling bifurcation. This bifurcation describes the behavior of a system that exhibits a doubling of its periodic cycle when a certain parameter is gradually changed
const FEIGENBAUM_ALPHA = 2.5029078750 # FEIGENBAUM ALPHA, another bifurcation constant
const APERY_CONSTANT = 1.2020569031 # APERY'S CONSTANT, related to zeta function
const GOLDEN_RATIO = 1.6180339887 # GOLDEN RATIO, (1 + sqrt(5)) / 2
const EULER_MASCHERONI_CONSTANT = 0.5772156649 # EULER-MASCHERONI CONSTANT, gamma minus harmonic series
const KHINCHINS_CONSTANT = 2.6854520010 # KHINCHIN'S CONSTANT, optimal embedding dimension
const GAUSS_KUZMIN_WIRSING_CONSTANT = 0.3036630028 # GAUSS-KUZMIN-WIRSING CONSTANT, sphere packing
const BERNSTEINS_CONSTANT = 0.2801694990 # BERNSTEIN'S CONSTANT, derivative of Dirichlet eta function
const HAFNER_SARNAK_MCCURLEY_CONSTANT = 0.3532363718 # HAFNER-SARNAK-MCCURLEY CONSTANT, number theory
const MEISSEL_MERTENS_CONSTANT = 0.2614972128 # MEISSEL-MERTENS CONSTANT, prime number distribution
const GLAISHER_KINKELIN_CONSTANT = 1.2824271291 # GLAISHER-KINKELIN CONSTANT, zeta function
const OMEGA = 0.5671432904 # OMEGA CONSTANT, alternating harmonic series
const GOLOMB_DICKMAN_CONSTANT = 0.6243299885 # GOLOMB-DICKMAN CONSTANT, prime number distribution
const CAHENS_CONSTANT = 0.6434105462 # CAHEN'S CONSTANT, Diophantine approximation
const TWIN_PRIME = 0.6601618158 # TWIN PRIME CONSTANT, probability of twin prime
const LAPLACE_LIMIT = 0.6627434193 # LAPLACE LIMIT, cosmic microwave background radiation
const LANDAU_RAMANUJAN_CONSTANT = 0.7642236535 # LANDAU-RAMANUJAN CONSTANT, constant in quantum field theory
const CATALANS_CONSTANT = 0.9159655941 # CATALAN'S CONSTANT, sum of reciprocals of squares
const VISWANATHS_CONSTANT = 1.13198824 # VISWANATH'S CONSTANT, number theory
const CONWAYS_CONSTANT = 1.3035772690 # CONWAY'S CONSTANT, sphere packing
const MILLS_CONSTANT = 1.3063778838 # MILLS' CONSTANT, normal number
const PLASTIC_CONSTANT = 1.3247179572 # PLASTIC CONSTANT, golden raio analogue
const RAMANUJAN_SOLDNER_CONSTANT = 1.4513692348 # RAMANUJAN-SOLDNE CONSTANT, elliptic integrals
const BACKHOUSE_CONSTANT = 1.4560749485 # BACKHOUSE'S CONSTANT, gamma function
const PORTERS_CONSTANT = 1.4670780794 # PORTER'S CONSTANT, geometry
const LIEBS_SQUARE_ICE_CONSTANT = 1.5396007178 # LIEB'S SQUARE ICE CONSTANT, statistical mechanics
const ERDOS_BORWEIN_CONSTANT = 1.6066951524 # ERDOS-BORWEIN CONSTANT, normal number
const NIVENS_CONSTANT = 1.7052111401 # NIVENS' CONSTANT, number theory
const UNIVERSAL_PARABOLIC_CONSTANT = 2.2955871493 # UNIVERSAL PARABOLIC CONSTANT, reflection coefficient
const SIERPINSKIS_CONSTANT = 2.5849817595 # SIERPINSKI'S CONSTANT, Sierpinski triangle fractal
const FRANSEN_ROBINSON_CONSTANT = 2.807770 # represents the area between the graph of the reciprocal Gamma function and the positive x-axis

const HEX_CHARACTERS = "0123456789ABCDEF"
```

## Bias

`static func bias(x : float, _bias : float) -> float`

`x`: This is the input value between 0 and 1 that you want to apply the bias to.
It could represent a probability, a random number between 0 and 1, or any other value in that range.

`bias`: This is the bias factor, also between 0 and 1. It controls how much the function pushes the x value away from 0.5 _(the center)_.

**Example:**

By adjusting the bias value, you can control how much the dice is skewed towards higher numbers.
A bias of 0.5 would result in a fair die roll. A bias closer to 1 would make it more likely to roll higher numbers.

## Sigmoid

`static func sigmoid(x: float, scaling_factor: float = 0.0) -> float`

The sigmoid function acts like a translator, taking any real number `(x)` as input and transforming it into a value between 0 and 1 _(but never exactly 0 or 1)_. Think of it as a dimmer switch for numbers.

The `scaling factor` allows you to adjust the steepness of the sigmoid curve, controlling how quickly it transitions between its output values of 0 and 1. This can be helpful for fine-tuning the behavior of the sigmoid function in different applications

**Use Case:** Imagine you're building an AI that recognizes handwritten digits. The sigmoid function can be used to convert the confidence level of the network's prediction (_e.g., how sure it is that a scribble is a "7")_ into a value between 0 _(not confident)_ and 1 _(highly confident)_.

**Probabilistic Events:** If you're implementing a system with a chance of something happening _(e.g., a random critical hit in combat)_, you could use the sigmoid function to translate a random value _(between 0 and 1)_ into a more "squashed" probability distribution. This can be useful for creating events that are more likely to occur near the average value and less likely at the extremes _(very low or very high chance)_.

## Factorials

`static func factorial(number) -> float`

This function calculates the factorial of a given non-negative integer number and it uses a recursive approach.

If the number is 0 or 1, the function returns 1 _(base case)_.
Otherwise, it multiplies the number by the factorial of the previous number _(number - 1)_ and returns the result

`static func factorials_from(number) -> Array[float]`
Calculate all the factorial numbers from the one passed as parameter returning the values inside an array.

```swift
MathWizard.factorial(5) // 120 --> 5! = 5 * 4 * 3 * 2 * 1

MathWizard.factorials_from(5) // [1, 1, 2, 6, 24, 120]
/*
0! = 1 (by definition)
1! = 1 (by definition)
2! = 2 * 1 = 2
3! = 3 * 2 * 1 = 6
4! = 4 * 3 * 2 * 1 = 24
5! = 5 * 4 * 3 * 2 * 1 = 120
*/

MathWizard.factorials_from(7) // [1, 1, 2, 6, 24, 120, 720, 5040]
```

## Quartenion to axis angle

`static func quaternion_to_axis_angle(quaternion : Quaternion) -> Quaternion`

`Quaternions` are a mathematical representation commonly used in 3D graphics to represent rotations.

`Axis-angle` representation specifies a rotation by an axis vector and the angle of rotation around that axis.

Useful for Animation or Inverse Kinematics, Gimbal lock _(when rotations get stuck or limited)_, Data storage or Transmission

## Roman numbers

`static func integer_to_roman_number(number: int) -> String`

`static func roman_number_to_integer(roman_number: String) -> int`

```swift

// Integer to Roman Numeral Examples:
MathWizard.integer_to_roman_number(3)  // III
MathWizard.integer_to_roman_number(47)  // XLVII
MathWizard.integer_to_roman_number(1999) // MCMXCIX
MathWizard.integer_to_roman_number(3549) // MMMDXLIX
MathWizard.integer_to_roman_number(2024) // MMXXIV

// Roman Numeral to Integer Examples:
MathWizard.roman_number_to_integer("III") // 3
MathWizard.roman_number_to_integer("XLVII") // 47
MathWizard.roman_number_to_integer("MCMXCIX") // 1999
MathWizard.roman_number_to_integer("MMMDXLIX") // 3549
MathWizard.roman_number_to_integer("MMXXIV") // 2024
```

Transform from integer to roman or from roman to integer easily with this functions.

## Hexadecimal

`static func hexadecimal_to_decimal(hex: String) -> int`

`static func decimal_to_hexadecimal(decimal: int) -> String`

```swift
// Hexadecimal to Decimal Examples
MathWizard.hexadecimal_to_decimal("FF")   // 255
MathWizard.hexadecimal_to_decimal("1A")   // 26
MathWizard.hexadecimal_to_decimal("C131") // 49457
MathWizard.hexadecimal_to_decimal("E01D") // 57373
MathWizard.hexadecimal_to_decimal("12345") // -1 (Invalid hex string)

// Decimal to Hexadecimal Examples:
MathWizard.decimal_to_hexadecimal(255)   // FF
MathWizard.decimal_to_hexadecimal(49457) // C131
MathWizard.decimal_to_hexadecimal(57373) // E01D
MathWizard.decimal_to_hexadecimal(1024)  // 400
MathWizard.decimal_to_hexadecimal(-1)  // ""
```

## Value between

`static func value_is_between(number: int, min_value: int, max_value: int, inclusive: = true) -> bool`

`static func decimal_value_is_between(number: float, min_value: float, max_value: float, inclusive: = true, precision: float = 0.00001) -> bool`

This functions checks if a given number _(integer or float)_ falls within a specified range defined by min*value and max_value.The function returns true if the number is within the specified range *(based on the inclusive flag)\_, and false otherwise.

```swift
if MathWizard.value_is_between(10, 5, 15):  //True, Inclusive range (default)
 // do stuff..

MathWizard.value_is_between(15, 5, 15, false):  //False, not Inclusive range

```

## Thousands separator

`static func add_thousand_separator(number) -> String`

Formats a number _(integer or float)_ with comma separators for thousands. This improves readability for large numbers.
If the absolute value of the number is less than 1000, it is simply converted to a string and returned without any modification

```swift
MathWizard.add_thousand_separator(1000) ## 1,000
MathWizard.add_thousand_separator(1000000) ## 1,000,000
MathWizard.add_thousand_separator(9999448828) ## 1,289,128,918,921
MathWizard.add_thousand_separator(1289128918921) ## 9,999,448,828

```

# StringWizard 🔤

# VectorWizard ➖

# NodeWizard ⭕

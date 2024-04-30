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
- [MathWizard 🧮](#mathwizard-)
  - [Access to universal constants](#access-to-universal-constants)
  - [Probability](#probability)
    - [Spread](#spread)
    - [Chance](#chance)
    - [Random byte](#random-byte)
    - [Bias](#bias)
    - [Sigmoid](#sigmoid)
  - [Factorials](#factorials)
  - [Quartenion to axis angle](#quartenion-to-axis-angle)
  - [Roman numbers](#roman-numbers)
  - [Hexadecimal](#hexadecimal)
  - [Value between](#value-between)
  - [Thousands separator](#thousands-separator)
  - [Big round](#big-round)
  - [Average](#average)
  - [Areas \& Volumes](#areas--volumes)
  - [Angles](#angles)
  - [Segment circle intersects](#segment-circle-intersects)
  - [Segment Rect intersects](#segment-rect-intersects)
  - [Rect difference](#rect-difference)
- [StringWizard 🔤](#stringwizard-)
  - [Access to common constants](#access-to-common-constants)
  - [Format time](#format-time)
  - [URL is valid](#url-is-valid)
  - [Generate random string](#generate-random-string)
  - [Snake to camel case](#snake-to-camel-case)
  - [Camel to snake case](#camel-to-snake-case)
  - [Clean](#clean)
  - [Wrap text](#wrap-text)
  - [Integer to ordinal](#integer-to-ordinal)
  - [Pretty number](#pretty-number)
  - [Number to Binary](#number-to-binary)
  - [Strip bbcode](#strip-bbcode)
  - [Strip file paths](#strip-file-paths)
- [TranslationWizard 🗺️](#translationwizard-️)
  - [Shortcut functions](#shortcut-functions)
- [VectorWizard ➖](#vectorwizard-)
  - [Up direction opposite](#up-direction-opposite)
  - [Generate random directions](#generate-random-directions)
  - [Generate random angles](#generate-random-angles)
  - [Generate random mesh surface position](#generate-random-mesh-surface-position)
  - [Random position on circle](#random-position-on-circle)
  - [Random point in Rect](#random-point-in-rect)
  - [Translate axis to vector](#translate-axis-to-vector)
  - [Normalization](#normalization)
    - [Directions](#directions)
    - [Angles](#angles-1)
  - [Manhattan](#manhattan)
  - [Chebysev](#chebysev)
  - [Closest point on line](#closest-point-on-line)
  - [Rotate randomly](#rotate-randomly)
  - [Is Withing distance squared](#is-withing-distance-squared)
  - [Direction from rotation](#direction-from-rotation)
  - [Scale vector](#scale-vector)
  - [Clamp vector](#clamp-vector)
  - [Flip \& Reverse](#flip--reverse)
  - [Topdown vector](#topdown-vector)
  - [Side angles](#side-angles)
  - [Position by polar coordinates](#position-by-polar-coordinates)
    - [Examples](#examples)
  - [Colors](#colors)
  - [Polygon bounding box](#polygon-bounding-box)
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

# MathWizard 🧮

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

## Probability

### Spread

`static func spread(scale: float = 1.0) -> float`

This function generates a random number between -1 and 1, scaled by the provided scale factor.

The scale parameter allows you to control the range of the generated random values.

```swift
// Generate a random number between -1 and 1 (default scale)
random_value = spread()

// Generate a random number between -2 and 2 with a larger scale
random_value = spread(2.0)
```

### Chance

`static func chance(probability_chance: float = 0.5) -> bool`

The `probability_chance` parameter specifies the likelihood of the function returning True. A value of 0.5 indicates a 50% chance of True.

```swift
// Check if a coin toss simulation results in heads (50% chance)
heads = chance(0.5)

// Check if a die roll simulation results in a 6 (approximately 16.67% chance)
rolled_a_six = chance(1.0 / 6)
```

### Random byte

`static func random_byte() -> int`

### Bias

`static func bias(x : float, _bias : float) -> float`

`x`: This is the input value between 0 and 1 that you want to apply the bias to.
It could represent a probability, a random number between 0 and 1, or any other value in that range.

`bias`: This is the bias factor, also between 0 and 1. It controls how much the function pushes the x value away from 0.5 _(the center)_.

**Example:**

By adjusting the bias value, you can control how much the dice is skewed towards higher numbers.
A bias of 0.5 would result in a fair die roll. A bias closer to 1 would make it more likely to roll higher numbers.

### Sigmoid

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

## Big round

`static func big_round(num: int) -> int`

This function rounds a large integer number to the nearest significant digit based on its magnitude.

```swift
// Round 1234567890 to the nearest billion
MathWizard.big_round(1234567890)  // Output: 1000000000

// Round 987654321 to the nearest million
MathWizard.big_round(987654321)  // Output: 987000000

// Round 12345678 to the nearest thousand
MathWizard.big_round(12345678)  // Output: 12345000

// Round 12345 to the nearest ten
MathWizard.big_round(12345)  // Output: 12340

// No rounding for numbers below 10,000
MathWizard.big_round(5678)  // Output: 5678
```

## Average

`static func average(numbers: Array = []) -> float`

The **middle** value in a set of numbers

For example, the mean average of the numbers 2, 3, 4, 7, and 9 _(summing to 25)_ is 5

```swift
MathWizard.average([2, 3, 4, 7, 9]) // 5
```

## Areas & Volumes

`static func volume_of_sphere(radius: float) -> float`

`static func volume_of_hollow_sphere(outer_radius: float, inner_radius: float) -> float`

`static func area_of_circle(radius: float) -> float`

`static func area_of_triangle(base: float, perpendicular_height: float) -> float`

## Angles

`static func angle_from_cardinal_direction(cardinal_direction: float) -> float`

This function takes a cardinal direction represented as a floating-point angle in radians and converts it to a standardized angle within the range of -π/4 to π/4.

```swift
North (N): 0° = 360°
East (E): 90°
South (S): 180°
West (W): 270°

Northeast (NE), 45°, halfway between north and east, is the opposite of southwest.
Southeast (SE), 135°, halfway between south and east, is the opposite of northwest.
Southwest (SW), 225°, halfway between south and west, is the opposite of northeast.
Northwest (NW), 315°, halfway between north and west, is the opposite of southeast.
```

**Example of Use:**

Imagine you have a character in a game facing a direction represented by an angle in radians. This function can be used to convert that angle to a standardized format within the range of -π/4 to π/4

```swift
var direction_angle = deg_to_rad(270)  // Convert degrees to radians
var standardized_angle = MathWizard.angle_from_cardinal_direction(direction_angle)
```

`static func limit_horizontal_angle(direction: Vector2, limit_angle: float) -> Vector2`

This function takes a `Vector2` representing a direction and a `limit_angle` in radians. It then modifies the direction vector by limiting its horizontal angle within the specified range.

**Example of use:**

Imagine you have a character aiming a weapon with a limited horizontal firing range. This function can be used to ensure the aiming direction stays within the allowed range while preserving the vertical direction

```swift
// Character aiming direction with an angle of 120 degrees (slightly outside the limit)
var aiming_direction = Vector2(1, -0.5)  // Extracting direction from vector
var max_horizontal_angle = PI / 3  // Limit angle to 60 degrees
var limited_direction = MathWizard.limit_horizontal_angle(aiming_direction, max_horizontal_angle)

print("Limited aiming direction:", limited_direction)  // Output: (0.5, -0.866)
```

## Segment circle intersects

`static func segment_circle_intersects(start, end, center, radius)`

[Circle line segment collision detection](https://stackoverflow.com/questions/1073336/circle-line-segment-collision-detection-algorithm)

This function checks for intersections between a line segment and a circle in 2D space.

Returns an array containing the `Vector2` coordinates of all valid intersection points between the line segment and the circle. If there are no intersections, an empty array is returned.

## Segment Rect intersects

`static func segment_rect_intersects(a, b, rect) -> Array`

This function determines the intersection point(s) between a line segment and a rectangle in 2D space, returning them in order of increasing distance from the segment's starting point.

Returns the points array containing the intersection point(s) in order of increasing distance from the starting point `a` of the line segment. If no intersections are found, the returned array will be empty

## Rect difference

`static func rect_difference(r1: Rect2, r2: Rect2)`

[Rectangle difference](https://en.wikibooks.org/wiki/Algorithm_Implementation/Geometry/Rectangle_difference)

This function calculates the difference between two rectangles in 2D space, returning an array of Rect2 objects representing the remaining area after removing the overlapping region

Returns the result array containing `Rect2` objects representing the remaining rectangular areas after removing the overlapping region between `r1` and `r2`. If there's no overlap, **the array will be empty.**

# StringWizard 🔤

This wizard provides helpful functions for manipulate or generate strings.

## Access to common constants

There is some common constants that can be accessed from this class and are useful to work with strings

```swift
const ASCII_ALPHANUMERIC = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
const ASCII_LETTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
const ASCII_LOWERCASE = "abcdefghijklmnopqrstuvwxyz"
const ASCII_UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const ASCII_DIGITS = "0123456789"
const ASCII_HEXDIGITS = "0123456789ABCDEF"
const ASCII_PUNCTUATION =  "!\"#$%&'()*+, -./:;<=>?@[\\]^_`{|}~"
```

## Format time

`static func format_seconds(time: float, use_milliseconds: bool = false) -> String`

Formats a time value into a string representation of minutes, seconds, and optionally milliseconds.

- `time (float)`: The time value to format, in seconds.
- `use_milliseconds (bool, optional)`: Whether to include milliseconds in the formatted string. Defaults to false.

**Returns:**

A string representation of the formatted time in the format "MM:SS" or "MM:SS:mm", depending on the value of use_milliseconds.

```swift
// Format 123.456 seconds without milliseconds
var formatted_time = StringWizard.format_seconds(123.456)
// Result: "02:03"

// Format 123.456 seconds with milliseconds
var formatted_time_with_ms =  StringWizard.format_seconds(123.456, true)
// Result: "02:03:45"
```

## URL is valid

`static func is_valid_url(url: String) -> bool`

## Generate random string

`static func generate_random_string(length: int = 25, characters: String = ASCII_ALPHANUMERIC) -> String`

Generates a random string of a specified length using the provided character set. Defaults to a length of 25 and ASCII_ALPHANUMERIC constant.

To ensure a valid string, **it requires a length greater than 1 and at least one valid character**. Otherwise, it returns `null`.

## Snake to camel case

`static func snake_to_camel_case(screaming_snake_case: String) -> String`

Converts snake_case_string or SCREAMING_SNAKE_CASE into PascalCaseString

## Camel to snake case

`static func camel_to_snake(camel_string: String) -> String`

Converts PascalCaseString into snake_case_string

## Clean

`static func clean(string: String) -> String`

Clean a string by removing characters that are not letters _(uppercase or lowercase)_ or spaces, tabs or newlines. This returns a new string and does not modify the original.

## Wrap text

`static func wrap_text(text: String = "", max_line_length: int = 120)`

Wraps the provided text into multiple lines if it exceeds the specified `max_line_length`

## Integer to ordinal

`static func integer_to_ordinal(number: int) -> String`

Converts the number into the ordinal representation, useful to display positions on a leaderboard or inside a car race.

- **Units digit only:**
  If the units digit is 1, 2, or 3, the corresponding suffix _("st", "nd", "rd")_ is added.
  Otherwise, "th" is added.
- **Tens digit is 1:**
  If the tens digit is 1, "th" is added regardless of the units digit _(except for the special cases of 11, 12, and 13)_.
  Special cases:

The function handles specific cases where the last two digits are 11 _(e.g., 11th, 211th)_, 12 _(e.g., 12th, 212th)_, or 13 _(e.g., 13th, 213th)_ due to their unique pronunciations.

```swift

ordinal_representation = StringWizard.integer_to_ordinal(1) // 1st
ordinal_representation = StringWizard.integer_to_ordinal(2) // 2nd
ordinal_representation = StringWizard.integer_to_ordinal(3) // 3rd
ordinal_representation = StringWizard.integer_to_ordinal(4) // 4th


ordinal_representation = StringWizard.integer_to_ordinal(21)
//Output: 21st

ordinal_representation = StringWizard.integer_to_ordinal(32)
//Output: 32nd

ordinal_representation = StringWizard.integer_to_ordinal(43)
//Output: 43rd

ordinal_representation = StringWizard.integer_to_ordinal(54)
//Output: 54th

ordinal_representation = StringWizard.integer_to_ordinal(101)
//Output: 101st

ordinal_representation = StringWizard.integer_to_ordinal(111)
//Output: 111th

ordinal_representation = StringWizard.integer_to_ordinal(212)
//Output: 212th

```

## Pretty number

For more complex cases take a look at this addon [GodotBigNumberClass](https://github.com/ChronoDK/GodotBigNumberClass)

`static func pretty_number(number: float, suffixes: Array[String] = ["", "K", "M", "B", "T"]) -> String`

This function formats a floating-point number into a human-readable string with appropriate suffixes based on its magnitude _(thousands, millions, billions, etc.)_

It allows to pass more suffixes in Array[String] format. They are sorted by exponent, so later suffixes are applied on larger exponents.

```swift
StringWizard.pretty_number(1234.56) // 1.2K
StringWizard.pretty_number(1234567.89) // 1.2M
StringWizard.pretty_number(1234567890.123) // 1.2B
```

## Number to Binary

`static func to_binary_string(num: int) -> String`

```swift
StringWizard.to_binary_string(5) // 101
StringWizard.to_binary_string(13) // 1101
StringWizard.to_binary_string(255) // 11111111
```

## Strip bbcode

`static func strip_bbcode(source:String) -> String`

Removes the bbcode tags for the given text.

## Strip file paths

`static func strip_filepaths(source: String) -> String`

Removes any text starting with `"res://"` followed by one or more non-space characters.

# TranslationWizard 🗺️

This wizard acts as a container for accessing language information that you can implement in your game.

The language data are accessed using the provided LANGUAGE enum as key:

```swift
enum LANGUAGES {
	ENGLISH,
	CZECH,
	DANISH,
	GERMAN,
	GREEK,
	ESPERANTO,
	SPANISH,
	FRENCH,
	INDONESIAN,
	ITALIAN,
	LATVIAN,
	POLISH,
	PORTUGUESE_BRAZILIAN,
	PORTUGUESE,
	RUSSIAN,
	CHINESE_SIMPLIFIED,
	CHINESE_TRADITIONAL,
	NORWEGIAN_BOKMAL,
	HUNGARIAN,
	ROMANIAN,
	KOREAN,
	TURKISH,
	JAPANESE,
	UKRAINIAN
}

const AVAILABLE_LANGUAGES = {
	LANGUAGES.ENGLISH: ["en", "en_US", "English", "English"],
	LANGUAGES.FRENCH: ["fr", "fr_FR", "Français", "French"],
	LANGUAGES.CZECH: ["cs", "cs_CZ", "Czech", "Czech"],
	LANGUAGES.DANISH: ["da", "da_DK", "Dansk", "Danish"],
	LANGUAGES.GERMAN: ["de", "de_DE", "Deutsch", "German"],
	LANGUAGES.GREEK: ["el", "el_GR", "Ελληνικά", "Greek"],
	LANGUAGES.ESPERANTO: ["eo", "eo_UY", "Esperanto", "Esperanto"],
	LANGUAGES.SPANISH: ["es", "es_ES", "Español", "Spanish"],
	LANGUAGES.INDONESIAN: ["id", "id_ID", "Indonesian", "Indonesian"],
	LANGUAGES.ITALIAN: ["it", "it_IT", "Italiano", "Italian"],
	LANGUAGES.LATVIAN: ["lv", "lv_LV", "Latvian", "Latvian"],
	LANGUAGES.POLISH: ["pl", "pl_PL", "Polski", "Polish"],
	LANGUAGES.PORTUGUESE_BRAZILIAN: ["pt_BR", "pt_BR", "Português Brasileiro", "Brazilian Portuguese"],
	LANGUAGES.PORTUGUESE: ["pt", "pt_PT", "Português", "Portuguese"],
	LANGUAGES.RUSSIAN: ["ru", "ru_RU", "Русский", "Russian"],
	LANGUAGES.CHINESE_SIMPLIFIED: ["zh_CN", "zh_CN", "简体中文", "Chinese Simplified"],
	LANGUAGES.CHINESE_TRADITIONAL: ["zh_TW", "zh_TW", "繁體中文", "Chinese Traditional"],
	LANGUAGES.NORWEGIAN_BOKMAL: ["nb", "nb_NO", "Norsk Bokmål", "Norwegian Bokmål"],
	LANGUAGES.HUNGARIAN: ["hu", "hu_HU", "Magyar", "Hungarian"],
	LANGUAGES.ROMANIAN: ["ro", "ro_RO", "Română", "Romanian"],
	LANGUAGES.KOREAN: ["ko", "ko_KR", "한국어", "Korean"],
	LANGUAGES.TURKISH: ["tr", "tr_TR", "Türkçe", "Turkish"],
	LANGUAGES.JAPANESE: ["ja", "ja_JP", "日本語", "Japanese"],
	LANGUAGES.UKRAINIAN: ["uk", "uk_UA", "Українська", "Ukrainian"]
}
```

## Shortcut functions

Each language data can be accesed by the corresponding function so for example If you want to access english or french:

```swift
TranslationWizard.english() // ["en", "en_US", "English", "English"]
TranslationWizard.french() // ["fr", "fr_FR", "Français", "French"]
```

# VectorWizard ➖

The `VectorWizard` static class provides a collection of commonly used vector methods that can simplify your everyday game development tasks. While it offers a wide range of functions, in-depth documentation might not be available for every method. However, the method names themselves are designed to be clear and descriptive.

## Up direction opposite

`static func up_direction_opposite_vector2(up_direction: Vector2) -> Vector2`

This method calculates the opposite of a given upward direction vector in 2D space. For example, if your CharacterBody2D uses Vector2.UP as its up direction, the opposite would be Vector2.DOWN.

This function is useful for applying gravity in the opposite direction of the player, allowing you to create inverted gravity or flipped worlds. Even when your player changes their up direction to `Vector2.DOWN`, this method will correctly return `Vector2.UP` so you can set gravity pulls player in that direction.

`static func up_direction_opposite_vector3(up_direction: Vector3) -> Vector3`
This method functions similarly to the `up_direction_opposite_vector2` but for 3D space. It takes a 3D up direction vector and returns its opposite. This is helpful for manipulating gravity and character movement in a 3D environment.

```swift
extends CharacterBody2D

func apply_gravity() -> void:
  // Let's take it for granted that the current up direction it's Vector2.UP
    var gravity_force_dir := VectorWizard.up_direction_opposite_vector2(up_direction)
  // Returns Vector2.DOWN, so the gravity force should be applied in this direction

  // Do your gravity stuff...
```

## Generate random directions

Generate a number of random directions defining the min and max angle ranges in degrees / radians from an origin Vector

`static func generate_2d_random_directions_using_degrees(num_directions: int = 10, origin: Vector2 = Vector2.UP, min_angle: float = 0.0, max_angle: float = 360.0) -> Array[Vector2]`

`static func generate_2d_random_directions_using_radians(num_directions: int = 10, origin: Vector2 = Vector2.UP, min_angle: float = 0.0, max_angle: float = 6.2831853072) -> Array[Vector2]`

`static func generate_3d_random_directions_using_degrees(num_directions: int = 10, origin: Vector3 = Vector3.UP, min_angle: float = 0.0, max_angle: float = 360.0) -> Array[Vector3]`

`static func generate_3d_random_directions_using_radians(num_directions: int = 10, origin: Vector3 = Vector3.UP, min_angle: float = 0.0, max_angle: float = 6.2831853072) -> Array[Vector3]`

`static func generate_2d_random_direction() -> Vector2`

Generates a random 2D direction vector with floating-point values representing a unit vector in space _(magnitude of 1)_.
This function is useful for creating diverse movement directions or raycasts.

`static func generate_2d_random_fixed_direction() -> Vector2`

Generates a random 2D direction vector with integer values representing cardinal directions _(e.g., Vector2(1, 0), Vector2(0, -1))_ or other fixed directional combinations.
This function can be used for grid-based movement or discrete directional checks.

`static func generate_3d_random_direction() -> Vector3`

Generates a random 3D direction vector with floating-point values representing a unit vector in space.
This function is useful for creating random 3D movement directions or raycasts.

`static func generate_3d_random_fixed_direction() -> Vector3`

Generates a random 3D direction vector with integer values representing axes or other fixed directional combinations in 3D space _(e.g., Vector3(1, 0, 0), Vector3(0, 1, -1))_.
This function can be used for checks or movement along specific axes or predefined directions.

## Generate random angles

Generates a random angle in radians within the specified range _(defaults to 0 to 2π)_ or _(defaults to 0 to 360 degrees)_

`static func generate_random_angle_in_radians(min_angle: float = 0.0, max_angle: float = 6.2831853072) -> float`

`static func generate_random_angle_in_degrees(min_angle: float = 0.0, max_angle: float = 360.0) -> float`

## Generate random mesh surface position

`static func generate_random_mesh_surface_position(target: MeshInstance3D) -> Vector3`

Generate a random point in the mesh surface passed as parameter. If the MeshInstance3D does not have a MeshShape set, it returns `Vector3.ZERO`

## Random position on circle

`static func random_inside_unit_circle(position: Vector2, radius: float = 1.0)`

This function generates a random position vector within a unit circle on provided radius centered at the provided position vector.

**Use Case:** Imagine creating a particle effect that emits particles in random directions around a specific point. This function can be used to generate the initial positions for each particle within a circular area.

`static func random_on_unit_circle(position: Vector2) -> Vector2`

This function generates a random position vector on the edge _(or slightly inside)_ of a unit circle centered at the provided position vector. It's similar to `random_inside_unit_circle` but adds a random radius factor.

**Use Case:** Imagine creating a visual effect that simulates fireflies flying around a specific location. This function can be used to generate random starting positions for the fireflies, potentially placing them slightly closer to the center or more spread out on the edge of the circle.

`static func random_point_in_annulus(center, radius_small, radius_large) -> Vector2`

Two concentric circles _(donut basically)_

## Random point in Rect

`static func random_point_in_rect(rect: Rect2) -> Vector2`

Retrieves a random point inside a given Rect2

## Translate axis to vector

`static func translate_x_axis_to_vector(axis: float) -> Vector2`

Converts a value from the horizontal axis of user input _(typically obtained using Input.get_axis("move_left", "move_right"))_ to a corresponding 2D direction vector. This function simplifies translating user input for horizontal movement into a usable direction vector.

`static func translate_y_axis_to_vector(axis: float) -> Vector2`

Converts a value from the vertical axis of user input _(typically obtained using Input.get_axis("move_up", "move_down"))_ to a corresponding 2D direction vector. This function simplifies translating user input for horizontal movement into a usable direction vector.

## Normalization

### Directions

`static func normalize_vector2(value: Vector2) -> Vector2`

`static func normalize_diagonal_vector2(direction: Vector2) -> Vector2`

`static func is_diagonal_direction_v2(direction: Vector2) -> bool`

`static func normalize_vector3(value: Vector3) -> Vector3`

`static func normalize_diagonal_vector3(direction: Vector3) -> Vector3`

`static func is_diagonal_direction_v3(direction: Vector3) -> bool`

These functions normalize a given 2D or 3D vector while accounting for diagonal directions. While Godot provides a built-in `.normalized()` function for vector normalization, these functions potentially offer a more nuanced approach.

The standard `.normalized()` function in Godot scales the vector to a magnitude (length) of 1. However, for diagonal vectors, it might not perfectly represent the intended unit vector along the diagonal.

**_Only uses this if you need to take into account diagonal directions_**

### Angles

`static func normalize_degrees_angle(degrees_angle: float) -> float`

`static func normalize_radian_angle(radian_angle: float) -> float`

Angles in both degrees and radians are cyclical, meaning they repeat after a full circle.

These functions are essential for game development because they ensure that angles are always interpreted within a specific range _(0 to 360 degrees or 0 to 2π radians)._

```swift
normalized_angle_degrees = VectorWizard.normalize_degrees_angle(450) // 90 degrees
normalized_angle_degrees = VectorWizard.normalize_degrees_angle(-135) // 225 degrees

normalized_angle_radians = VectorWizard.normalize_radian_angle(5 * PI) // 3.14159 (PI)
normalized_angle_radians = VectorWizard.normalize_radian_angle(-2 * PI) // 6.28318 (TAU)
```

## Manhattan

`static func distance_manhattan_v2(a: Vector2, b: Vector2) -> float`

`static func  distance_manhattan_v3(a: Vector3, b: Vector3) -> float`

`static func  length_manhattan_v2(a : Vector2) -> float`

`static func  length_manhattan_v3(a : Vector3) -> float`

Also known as the "city distance" or "L1 distance". It measures the distance between two points as the sum of the absolute differences of their coordinates in each dimension.

**Explanation:** These functions calculate the Manhattan distance _(also known as L1 distance or city block distance)_ between two points. It represents the total distance traveled by moving horizontally and vertically along a grid, ignoring any diagonal movement.

**Use Case:** Imagine a pathfinding algorithm on a grid-based map. Manhattan distance can be used to estimate the distance between two points on the grid, as movement is restricted to horizontal and vertical steps.

## Chebysev

`static func distance_chebyshev_v2(a: Vector2, b: Vector2) -> float`

`static func distance_chebyshev_v3(a: Vector3, b: Vector3) -> float`

`static func length_chebyshev_v2(a : Vector2) -> float`

`static func length_chebyshev_v3(a : Vector3) -> float`

Also known as the "chess distance" or "L∞ distance". It measures the distance between two points as the greater of the absolute differences of their coordinates in each dimension.

**Explanation:** These functions calculate the Chebyshev distance (also known as L∞ distance or chessboard distance) between two points. It represents the maximum absolute difference of the coordinates between the points, similar to a king's movement in chess (only horizontal, vertical, or diagonal steps of one square).

**Use Case:** Imagine a tower defense game where enemies can only move horizontally or vertically along pre-defined paths. Chebyshev distance can be used to determine the enemy's "attack range" based on the maximum distance they can travel in a single move.

## Closest point on line

`static func closest_point_on_line_clamped_v2(a: Vector2, b: Vector2, c: Vector2) -> Vector2`

`static func closest_point_on_line_clamped_v3(a: Vector3, b: Vector3, c: Vector3) -> Vector3`

**Explanation:** These functions calculate the closest point on a line segment _(defined by points a and b)_ to a third point c. Additionally, they clamp the result to ensure the closest point lies within the line segment _(between a and b)._

**Use Case:** Imagine a character trying to navigate around an obstacle. This function can be used to find the closest point on the obstacle's edge _(line segment)_ that the character can reach from their current position (c).

---

`static func closest_point_on_line_v2(a: Vector2, b: Vector2, c: Vector2) -> Vector2`

`static func closest_point_on_line_v3(a: Vector3, b: Vector3, c: Vector3) -> Vector3`

`static func closest_point_on_line_normalized_v2(a: Vector2, b: Vector2, c: Vector2) -> float`

`static func closest_point_on_line_normalized_v3(a: Vector3, b: Vector3, c: Vector3) -> float`

This function is similar to the previous one but does not clamp the result. It calculates the closest point on the line segment defined by a and b to a third point c. It uses the same vector operations as the previous `closest_point_on_line_clamped_v2` function.

**Explanation:** These functions are similar to the clamped versions, but they calculate the closest point on the line segment without clamping. The non-normalized versions return the actual vector representing the closest point, while the normalized versions might return a parameter along the line segment that represents the closest point.

**Use Case:** Imagine a projectile being fired towards a moving target. These functions can be used to determine the point on the target's projected path _(line segment)_ that the projectile is most likely to collide with, even if the collision happens outside the actual line segment itself.

---

## Rotate randomly

`static func rotate_horizontal_random(origin: Vector3 = Vector3.ONE) -> Vector3`

`static func rotate_vertical_random(origin: Vector3 = Vector3.ONE) -> Vector3`

These functions generate a random rotation around a specified axis.

`rotate_horizontal_random` generates a random rotation around the Y-axis, while `rotate_vertical_random` generates a random rotation around the X-axis.

The origin parameter allows you to specify the center of rotation _(defaults to Vector3.ONE, which represents the origin)_.

**Use Case:** Imagine creating a dynamic light source that simulates a flickering torch or a spotlight with a slight wobble. You can leverage the `rotate_horizontal_random` and `rotate_vertical_random` functions to achieve this effect.

## Is Withing distance squared

`static func is_withing_distance_squared_v2(vector: Vector2, second_vector: Vector2, distance: float) -> bool`

`static func is_withing_distance_squared_v3(vector: Vector3, second_vector: Vector3, distance: float) -> bool`

**Explanation:** These functions perform a distance check between two vectors but use a squared distance comparison instead of calculating the actual distance. They determine if the squared distance between the `vector` and `second_vector` is less than or equal to the square of the provided distance.

**Reason for Squared Distance:** Calculating the squared distance is computationally cheaper than calculating the actual distance using a square root operation. This can be beneficial for performance optimization when checking distances frequently.

**Use Case:** Imagine having a large number of enemies in a game and needing to check if they are within a certain attack range of the player. Using is*withing_distance_squared can be more efficient than calculating the actual distance for each enemy, especially if the result *(being within range)\_ is only used for a binary decision _(attack or not)._

**_Important Note:_**

While using squared distances offers a performance benefit, keep in mind that it doesn't give you the actual distance between the points. If you need the actual distance for calculations or other purposes, you'll need to perform a square root operation on the result of `is_withing_distance_squared`

## Direction from rotation

`static func direction_from_rotation_v2(rotation: float) -> Vector2`

`static func direction_from_rotation_v3(rotation: float) -> Vector3`

`static func direction_from_rotation_degrees_v2(rotation_degrees: float) -> Vector2`

`static func direction_from_rotation_degrees_v3(rotation_degrees: float) -> Vector3`

**Explanation:** These functions take a rotation angle _(in radians)_ as input and return a corresponding direction vector. The specific direction calculation depends on the dimensionality _(2D or 3D)_ and the rotation convention used by your game engine _(e.g., Godot uses Z-axis for 2D rotations)_.

**Use Case:** Imagine having a spaceship that can rotate freely. These functions can be used to convert the spaceship's current rotation angle _(obtained from its transform)_ into a direction vector representing the orientation it's facing. This direction vector can then be used for various purposes, such as applying thrust in the forward direction or firing projectiles in the direction the spaceship is facing.

## Scale vector

`static func scale_vector2(vector: Vector2, length: float) -> Vector2`

`static func scale_vector3(vector: Vector3, length: float) -> Vector3`

These functions **normalizes** and **scale** a given vector to a new specified length. You can use this functions for example to scale this direction vector to the player's movement speed, resulting in a final movement vector with the desired direction and speed _(magnitude)_

```swift
// An alternative approach for velocity = direction * speed
velocity = VectorWizard.scale_vector2(direction, speed)
```

## Clamp vector

`static func clamp_vector2(vector: Vector2, min_length: float, max_length: float)-> Vector2`

`static func clamp_vector3(vector: Vector3, min_length: float, max_length: float)-> Vector3`

These functions clamp the magnitude _(length)_ of a vector within a specified minimum and maximum range. Imagine having a force applied to an object, represented by a vector. You can use `clamp_vector` to restrict the force's magnitude to a specific range, preventing the object from accelerating too quickly.

## Flip & Reverse

This functions does not modify the original Vector.

`static func flip_v2(vector: Vector2) -> Vector2`

`static func flip_v3(vector: Vector3) -> Vector3`

Flip the sign of the given vector

```swift
VectorWizard.flip_v2(Vector2(-1, 0)) // Vector2(1, 0)
VectorWizard.flip_v3(Vector2(-1, 0, -1)) // Vector2(1, 0, 1)
```

`static func reverse_v2(vector: Vector2) -> Vector2`

`static func reverse_v3(vector: Vector3) -> Vector3`

Reverse the values from the given vector

```swift
VectorWizard.reverse_v2(Vector2(3, 5)) // Vector2(5, 3)
VectorWizard.reverse_v3(Vector3(3, 5, 7)) // Vector2(7, 5, 3)
```

## Topdown vector

Removes the y component from a Vector3 and return a new Vector2

`static func get_topdown_vector(from_vector: Vector3) -> Vector2`

```swift
VectorWizard.get_top_down_vector(Vector3(100, 40, 150)) // Vector2(100, 150)
```

Many games utilize a top-down perspective, where the camera looks down on the game world from above.

This function can be used to convert 3D positions of objects _(represented by Vector3)_ to their corresponding 2D coordinates on the screen _(represented by Vector2)._

By ignoring the y-component _(height)_ of the `Vector3`, the function effectively projects the object's position onto the top-down plane, which is crucial for rendering and gameplay logic in such games.

Overall, this function provides a convenient way to extract relevant 2D information from 3D data, making it a valuable tool for various game development tasks involving top-down perspectives, 2D physics, UI positioning, and pathfinding.

## Side angles

`static func side_angle_by_angles(start_rad_angle: float, end_rad_angle: float)`

`static func side_angle_by_vectors(vector_start, vector_end)`

These functions essentially calculate the angle formed by two sides in 2D space, given either the angles of the sides or their unit vectors.

This functionality is highly useful in various game development scenarios:

- **Character Movement and Direction:**
  Calculating the angle between a character's facing direction and a target object can be used for aiming, movement control, and pathfinding.
- **Collision Detection:**
  Determining the angle of impact between two colliding objects can be crucial for calculating accurate collision responses and physics interactions.
- **Camera Orientation:**
  Calculating the angle between the camera's current orientation and a point of interest can be used for smooth camera movements and tracking.
- **Field of View Calculations:**
  Determining the angle between the edges of a character's field of view can be used for visibility checks and awareness mechanics

## Position by polar coordinates

`static func get_position_by_polar_coordinates_v2(center_position: Vector2, angle_radians: float, radius: float) -> Vector2`

`static func get_position_by_polar_coordinates_v3(center_position: Vector3, angle_radians: float, radius: float) -> Vector3`

Both functions take three arguments:

- `center_position`: A Vector2 or Vector3 representing the center point around which the position will be calculated.
- `angle_radians`: The angle in radians specifying the direction from the center point.
- `radius`: The distance from the center point along the specified angle.

### Examples

**Projectile Trajectory**

```swift
// Define launch parameters
var center_position = Vector2(0, 0)  // Center of the launch point
var angle_radians = PI / 4  // Launch angle in radians (45 degrees)
var initial_velocity = 10.0  // Initial velocity of the projectile

// Calculate position after 1.2 second
var time_step = 1.2
var radius = initial_velocity * time_step

var projectile_position = get_position_by_polar_coordinates_v2(center_position, angle_radians, radius)

print("Projectile position after 1.2s :", projectile_position)
```

**Camera position around a Target (3D)**

```swift
// Define target position and camera parameters
var target_position = Vector3(10, 5, 2)  // Target object's position
var angle_radians = PI / 4  // Camera angle around the target (45 degrees)
var distance = 5.0  // Distance of the camera from the target

var camera_position = get_position_by_polar_coordinates_v3(target_position, angle_radians, distance)

print("Camera position: ", camera_position)
```

## Colors

`static func color_from_vector(vec) -> Color`

Returns a Color class from the given Vector _(Vector3 or Vector4)_

`static func vec3_from_color_rgb(color: Color) -> Vector3`

`static func vec3_from_color_hsv(color: Color) -> Vector3`

Return a Vector3 from a Color value in both RGB and HSV

A common use case it's convert color data from textures or materials into vector representations for calculations or manipulation.

## Polygon bounding box

`static func polygon_bounding_box(polygon: PackedVector2Array) -> Rect2`

Takes a `PackedVector2Array` as input, which represents a polygon defined by an array of 2D vectors _(points)_. The function's purpose is to calculate the bounding box rectangle that encloses the entire polygon.

# NodeWizard ⭕

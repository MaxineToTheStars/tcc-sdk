# Class Declaration
class_name TSDKPlayer

# Inheriting From
extends CharacterBody2D

# File Docstring
# --------------------------------
# @author @MaxineToTheStars <https://github.com/MaxineToTheStars>
# ----------------------------------------------------------------

# Signals

# Enums

# Constants
const MOVEMENT_SPEED: int = 125

# Exported Variables

# Public Variables

# Private Variables

# OnReady Variables

# _init()

# _enter_tree()

# _ready()

# _other()
func _physics_process(_delta: float) -> void:
	# Get input direction
	var wish_dir = Input.get_vector("tsdk_left", "tsdk_right", "tsdk_up", "tsdk_down")

	# Set velocity
	velocity = wish_dir * self.MOVEMENT_SPEED

	# Move
	self.move_and_slide()

# Public Methods

# Private Methods

# Subclasses

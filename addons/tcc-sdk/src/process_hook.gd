# Class Declaration

# Inheriting From
extends Node

# File Docstring
# --------------------------------
# tcc-sdk/src/process_hook.gd || TSDKProcessHook
#
## Hooks itself at startup and runs SDK initialization.
#
# @author @MaxineToTheStars <https://github.com/MaxineToTheStars>
# ----------------------------------------------------------------

# Signals

# Enums

# Constants

# Exported Variables

# Public Variables

# Private Variables

# OnReady Variables

# _init()

# _enter_tree()

# _ready()
func _ready() -> void:
    # Build the mod list
    TSDKParser.build_mod_list()

# _other()

# Public Methods

# Private Methods

# Subclasses

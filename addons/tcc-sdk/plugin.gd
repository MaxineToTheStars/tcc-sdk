@tool

# Class Declaration

# Inheriting From
extends EditorPlugin

# File Docstring
# --------------------------------
# tcc-sdk/plugin.gd || Plugin
#
# @author @MaxineToTheStars <https://github.com/MaxineToTheStars>
# ----------------------------------------------------------------

# Signals

# Enums

# Exported Variables

# Public Variables

# Private Variables

# OnReady Variables

# _init()

# _enter_tree()
func _enter_tree() -> void:
    pass

# _ready()

# _other()
func _enable_plugin() -> void:
    # Add process hook
    add_autoload_singleton("TCCSDKProcessHook", "res://addons/tcc-sdk/src/process_hook.gd")

func _disable_plugin() -> void:
    # Remove process hook
    remove_autoload_singleton("TCCSDKProcessHook")

func _exit_tree() -> void:
    # Clean-up of the plugin goes here.
    pass

# Public Methods

# Private Methods

# Subclasses

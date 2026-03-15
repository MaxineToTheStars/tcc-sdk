# Class Declaration
class_name TSDKLogging

# Inheriting From
extends Node

# File Docstring
# --------------------------------
# tcc-sdk/src/modules/logging.gd || TSDKLogging
#
## A simple to use logging utility.
#
# @author @MaxineToTheStars <https://github.com/MaxineToTheStars>
# ----------------------------------------------------------------

# Signals

# Enums
## Different logging types supported by ``TSDKLogging``
enum LoggingType {
	## Logs an informative message to the console
	INFO = 0,
	## Logs a debugging message to the console
	DEBUG = 1,
	## Logs a warning message to the console
	WARNING = 2,
	## Logs an error message to the console
	ERROR = 3,
	## Logs a critical message to the console
	CRITICAL = 4,
}

# Constants

# Exported Variables

# Public Variables

# Private Variables
## Enables or disabled the logging module
static var enable_logging: bool: set = set_enable_logging, get = get_enable_logging

# OnReady Variables

# _init()

# _enter_tree()

# _ready()

# _other()

# Public Methods
## Returns the status of the logging module
## @returns ``bool``
static func get_enable_logging() -> bool:
	# Return logging state
	return enable_logging

## Logs a message to the console
## @returns ``void``
static func log(type: LoggingType, ...message) -> void:
	# Check if the logger is enabled
	if TSDKLogging.get_enable_logging(): return;

	# Get the caller information
	var stack: Array = get_stack()
	var caller: String = stack[1]["function"]
	var caller_source: String = stack[1]["source"]

	# Build the message
	var built_message: String = ""
	for object in message:
		built_message += str(object) + " "

	# Match on type
	match type:
		LoggingType.INFO:
			# Print to STDIO
			prints("[INF @ %s, %s]" % [caller, caller_source], built_message)

			# Break
			return
		LoggingType.DEBUG:
			# Print to STDIO
			prints("[DBG @ %s, %s]" % [caller, caller_source], built_message)

			# Break
			return
		LoggingType.WARNING:
			# Print to STDIO
			prints("[WRN @ %s, %s]" % [caller, caller_source], built_message)

			# Break
			return
		LoggingType.ERROR:
			# Print to STDIO
			prints("[ERR @ %s, %s]" % [caller, caller_source], built_message)

			# Break
			return
		LoggingType.CRITICAL:
			# Print to STDIO
			prints("[INF @ %s, %s]" % [caller, caller_source], built_message)

			# Break
			return
		_:
			return

## Set the enabled state for the logging module
## @returns ``void``
static func set_enable_logging(state: bool) -> void:
	# Toggle logging state
	enable_logging = state

# Private Methods

# Subclasses

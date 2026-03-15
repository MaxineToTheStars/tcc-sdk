# Class Declaration
class_name TSDKParser

# Inheriting From
extends Node

# File Docstring
# --------------------------------
# tcc-sdk/src/modules/parser.gd || TSDKParser
#
## Responsible for handling the parsing of mods.
#
# @author @MaxineToTheStars <https://github.com/MaxineToTheStars>
# ----------------------------------------------------------------

# Signals

# Enums

# Constants
const TSDK_MODS_DIRECTORY: String = "res://mods"

# Exported Variables

# Public Variables

# Private Variables
## A key, value pair (ID, Directory) of each mod directory
static var _found_mod_directories: Dictionary[String, String] = {}
## A key, value pair (ID, Manifest) of each mod manifest
static var _found_mod_manifests: Dictionary[String, Dictionary] = {}

# OnReady Variables

# _init()

# _enter_tree()

# _ready()

# _other()

# Public Methods
## Builds the mod list from the current mods residing in the mod directory.
## @returns ``void``
static func build_mod_list() -> void:
    # Check if the mod directory exists
    if not DirAccess.dir_exists_absolute(TSDKParser.TSDK_MODS_DIRECTORY): TSDKLogging.log(TSDKLogging.LoggingType.ERROR, "Directory \"%s\" not found!" % [TSDKParser.TSDK_MODS_DIRECTORY]); return;

    # Open the mod directory
    var mod_directory = DirAccess.open(TSDKParser.TSDK_MODS_DIRECTORY)
    # Get all found directories
    var found_mod_directories: PackedStringArray = mod_directory.get_directories()

    # Loop it
    for current_mod_directory in found_mod_directories:
        # Build the manifest file path
        var current_manifest_filepath: String = "%s/%s/manifest.json" % [TSDKParser.TSDK_MODS_DIRECTORY, current_mod_directory]

        # Check if the manifest exists
        var current_manifest_exists: bool = FileAccess.file_exists(current_manifest_filepath)
        if not current_manifest_exists:
            # Log
            TSDKLogging.log(TSDKLogging.LoggingType.WARNING, "\"%s/%s\" is missing a manifest.json!" % [TSDKParser.TSDK_MODS_DIRECTORY, current_mod_directory])

            # Skip this entry
            continue

        # Grab the manifest and convert to Dictionary objet
        var current_manifest_data: Dictionary = JSON.parse_string(FileAccess.open(current_manifest_filepath, FileAccess.READ).get_as_text())

        # For now we assume the manifest is valid
        # TODO: Add further checking

        # Add to datasets
        TSDKParser._found_mod_directories.set(current_manifest_data.get("mod").get("uuid"), "%s/%s" % [TSDKParser.TSDK_MODS_DIRECTORY, current_mod_directory])
        TSDKParser._found_mod_manifests.set(current_manifest_data.get("mod").get("uuid"), current_manifest_data)

    # Log
    TSDKLogging.log(TSDKLogging.LoggingType.INFO, "Found \"%s\" mod(s)!" % [TSDKParser._found_mod_manifests.size()])

## Returns a mod's directory from the given ``UUID``. Returns an empty ``String`` if the UUID did not match any mod.
## @returns ``String``
static func get_directory_from_uuid(uuid: String) -> String:
    return TSDKParser._found_mod_directories.get(uuid, "")

## Lists the mods currently active/enabled
## @returns ``void``
static func list_mods() -> void:
    # Iterate
    for current_mod_manifest in _found_mod_manifests.values():
        # Build authors string
        var built_current_authors_string: String = ""
        for current_author in current_mod_manifest.get("authors", []):
            # Sanity check
            if current_author.is_empty():
                # Set
                built_current_authors_string = "N/A"

                # Exit
                break

            # Append
            built_current_authors_string += "Name: %s, Site: %s" % [current_author.get("name", "N/A"), current_author.get("url", "N/A")]

        # Log
        TSDKLogging.log(TSDKLogging.LoggingType.INFO, "Name: %s, ID: %s, Author(s): %s" % [current_mod_manifest["mod"]["name"], current_mod_manifest["mod"]["uuid"], built_current_authors_string])

# Private Methods

# Subclasses

# Class Declaration
class_name TSDKResource

# Inheriting From
extends Node

# File Docstring
# --------------------------------
# tcc-sdk/src/modules/resource.gd || TSDKResource
#
## Responsible for the loading/preloading of modded resources
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

# _other()

# Public Methods
## Loads a resource from a given path
## @returns ``Resource``
static func load_resource(path: String) -> Resource:
    # Extract the UUID
    var extracted_uuid: String = path.replace("mod://", "").split("/")[0]
    var extracted_filepath: String = path.replace("mod://%s" % [extracted_uuid], "")

    # Grab
    var found_directory: String = TSDKParser.get_directory_from_uuid(extracted_uuid)

    # Verify
    if found_directory.is_empty():
        # Nothing found
        return null

    # Return and load
    return load(found_directory + "/assets" + extracted_filepath)


# Private Methods

# Subclasses

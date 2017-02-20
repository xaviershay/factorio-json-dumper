A WIP mod for Factorio to dump all available recipes to JSON. It currently
outputs them to Factorio log (`factorio-current.log` in app data directory),
though it would be nice some day to go to a separate file (not sure if
possible).

Includes a vendored copy of a JSON library I didn't write.

## Usage

    /c remote.call("json-dumper", "recipes")

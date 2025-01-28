function cleanzip() {
    alias zip="/usr/bin/zip"

    local zipname=$1
    local path=${2:-$(pwd)}

    if [[ -z "$zipname" ]]; then
        echo "Usage: cleanzip <zipname> [path]"
        return 1
    fi

    if [[ ! "$zipname" == *.zip ]]; then
        zipname="${zipname}.zip"
    fi

    if [[ ! -d "$path" ]]; then
        echo "Error: $path is not a valid directory."
        return 1
    fi

    # Remove existing zip file if it exists
    if [[ -f "$zipname" ]]; then
        rm "$zipname"
    fi

    # Create a new zip file excluding unwanted files
    zip -r "$zipname" "$path" -x "*.DS_Store" -x "__MACOSX" -x "*.git*"

    echo "Created $zipname from $path"
}

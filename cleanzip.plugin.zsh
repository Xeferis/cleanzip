alias zip=/usr/bin/zip
alias rm=/bin/rm

function cleanzip() {
    local zipname=$1
    local path=${2:-"."}

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

    if [[ -f "$zipname" ]]; then
        echo "Created $zipname from $path"
    else
        echo "Creation failed!"
    fi
}

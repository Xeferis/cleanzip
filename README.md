# cleanzip

This a plugin for [zsh](https://github.com/zsh-users/zsh) and [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh). It adds a command to compresses to zip without data that should not be in the zip. It's targeted towards mac users specifically, since the standard compressions adds "garbage" to the .zip itself.

To use it, copy the folder _cleanzip_ to your zsh plugins folder and add _cleanzip_ to the plugins array of your zshrc file:
```
plugins=(... cleanzip)
```

## Plugin commands

* `cleanzip <zipname> [path]`

### Blacklist
```
*__MACOSX
*.git*
*.DS_Store
```

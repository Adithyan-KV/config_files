# ZSH configuration

Configuration files for the zsh shell. Install `zsh`, change it to default shell
using `chsh -s $(which zsh)`. 

## Usage
copy or symlink `.zshenv` to `$HOME/.zshenv` and copy all other files to `$HOME/.config/zsh/`.

`zsh` looks for config files in the `$ZDOTENV` directory, or the `$HOME` directory
if that is not set. So we use a `.zshenv` file in the `$HOME` directory to set
`$ZDOTENV` as `.config/zsh` so as not to pollute home directory.

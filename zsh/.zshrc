# import relevant configurations from relevant files if they exist
for file in ~/.{zsh_prompt,zsh_profile,aliases}
do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

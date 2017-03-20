# Add our binaries to the path
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles
# * ~/.path can be used to extend `$PATH`
# * ~/.extra can be used for private settings
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file" > /dev/null 2>&1
done;
unset file;

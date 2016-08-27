
for file in ~/.{prompt,aliases,path,bash_funcs,docker_funcs,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

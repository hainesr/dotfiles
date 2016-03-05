
for file in ~/.{prompt,aliases,path,bash_funcs,docker_funcs,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

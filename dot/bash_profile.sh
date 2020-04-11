. /etc/profile

for file in ~/.{prompt,aliases,path,env,bash_funcs,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

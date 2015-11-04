
for file in ~/.{prompt,aliases,path,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

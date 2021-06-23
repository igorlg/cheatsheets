---
tags: [ bash, zsh ]
---
# Run commands in parallel in For loop (from: https://unix.stackexchange.com/a/216475)
N=4
(
for i in * ; do
    ((i=i%N)); ((i++==0)) && wait
    do_something "$i" &
done
wait
)

# Fill line until terminal window size
#   - terminal window size from: https://stackoverflow.com/a/263900
#   - repeat char in bash from:  https://stackoverflow.com/a/5799353
# E.g.:
#
#   $ msg "hello!!"
#   -------------------------------------------------------------------------
#   hello!!
#   -------------------------------------------------------------------------
function msg() {
    l=$(echo -e "cols" | tput -S)
    s=$(printf "%-${l}s" "-")
    echo -e -n "${s// /-}\n${1}\n${s// /-}\n"
}


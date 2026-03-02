#! /bin/bash
# Scores for different sections of the homework
#
compile=25
hello_world=25
hello_argv=25
return_code=25

# Warn the caller if the Author or Netid fields are missing.
grep -P "Author:" hw1.c
if [[ $? -ne 0 ]]; then
    echo "Warning: Author field missing."
    echo "Your code must have a comment with the following:"
    echo -e "\tAuthor: your name"
fi

grep -P "Netid:" hw1.c
if [[ $? -ne 0 ]]; then
    echo "Warning: Netid field missing."
    echo "Your code must have a comment with the following:"
    echo -e "\tNetid: your netid"
fi

# Remove any old copy of the file
rm hw1
gcc hw1.c -o hw1
if [ ! -e "hw1" ]; then
    echo "Failed to compile."
    compile=0
fi

out=$(./hw1)
if [[ $? -ne 22 ]]; then
    echo "Failed to return 22."
    return_code=0
fi

out=$(./hw1)
if [[ "$out" != "Hello World" ]]; then
    echo "Failed to print 'Hello World'."
    hello_world=0
fi

out=$(./hw1 Moon)
if [[ "$out" != "Hello Moon" ]]; then
    echo "Failed to print 'Hello Moon' when given Bob as an argument."
    hello_argv=0
fi

out=$(./hw1 Sun)
if [[ "$out" != "Hello Sun" ]]; then
    echo "Failed to print 'Hello Sun' when given Bob as an argument."
    hello_argv=0
fi

echo "Score is $(( compile + return_code + hello_world + hello_argv))"




#! /bin/bash
# Scores for different sections of the homework
#
compile=10
return_0=10
return_1=10
right_shift=10
left_shift=10
handle_0=10
right_rotate=10
left_rotate=10
right_rotate_around=10
left_rotate_around=10

# Warn the caller if the Author or Netid fields are missing.
grep -P "Author:" hw2.c
if [[ $? -ne 0 ]]; then
    echo "Warning: Author field missing."
    echo "Your code must have a comment with the following:"
    echo -e "\tAuthor: your name"
fi

grep -P "Netid:" hw2.c
if [[ $? -ne 0 ]]; then
    echo "Warning: Netid field missing."
    echo "Your code must have a comment with the following:"
    echo -e "\tNetid: your netid"
fi

# Remove any old copy of the file
rm hw2
gcc hw2.c -o hw2
if [ ! -e "hw2" ]; then
    echo "Failed to compile."
    compile=0
fi

out=$(./hw2)
if [[ $? -ne 1 ]]; then
    echo "Should return 1 without enough inputs."
    return_1=0
fi

#### Test for 1 return
#
out=$(./hw2 10)
if [[ $? -ne 1 ]]; then
    echo "Should return 1 without enough inputs."
    return_1=0
fi

#### Test for 0 return
#
out=$(./hw2 10 5)
if [[ $? -ne 0 ]]; then
    echo "Should return 0 with proper inputs."
    return_0=0
fi

out=$(./hw2 0 0)
if [[ $? -ne 0 ]]; then
    echo "Should return 0 with proper inputs."
    return_0=0
fi

out=$(./hw2 3 -3)
if [[ $? -ne 0 ]]; then
    echo "Should return 0 with proper inputs."
    return_0=0
fi

#### Test for right shift without rotation
#

out=$(./hw2 16 1)
if [[ "$out" != "00000000 00000000 00000000 00001000" ]]; then
    echo "Failed to right shift 16 by 1"
    right_shift=0
fi

#### Test for left shift without rotation
#

out=$(./hw2 16 -1)
if [[ "$out" != "00000000 00000000 00000000 00100000" ]]; then
    echo "Failed to left shift 16 by 1"
    left_shift=0
fi

#### Test for 0 rotation
#

out=$(./hw2 255 0)
if [[ "$out" != "00000000 00000000 00000000 11111111" ]]; then
    echo "Failed to leave number unchanged with a 0 shift."
    handle_0=0
fi

#### Test for right rotation
#

out=$(./hw2 255 8)
if [[ "$out" != "11111111 00000000 00000000 00000000" ]]; then
    echo "Failed to right rotate 255 by 8."
    right_rotation=0
fi

#### Test for left rotation
#

out=$(./hw2 16711680 -16)
if [[ "$out" != "00000000 00000000 00000000 11111111" ]]; then
    echo "Failed to left rotate 4278190080 by 8."
    left_rotation=0
fi

#### Test for right rotation more than 32 bits
#


out=$(./hw2 65280 36)
if [[ "$out" != "00000000 00000000 00001111 11110000" ]]; then
    echo "Failed to right rotate 65280 by 36."
    right_rotate_around=0
fi

#### Test for left rotation more than 32 bits
#


out=$(./hw2 16711680 -48)
if [[ "$out" != "00000000 00000000 00000000 11111111" ]]; then
    echo "Failed to left rotate 4278190080 by 40."
    left_rotate_around=0
fi

echo "Score is $((compile + return_0 + return_1 + right_shift + left_shift + handle_0 + right_rotate + left_rotate + right_rotate_around + left_rotate_around))"



clear ''
it =: '~/Development/JProjects/Integers-as-letters/translate.ijs'

test =: ''
from =: {
length_of =: #
ascii_characters =: a.
get_index_of =: i.
shape_of =: $
dimensions =: length_of @ shape_of
box =: <

test_report =: smoutput

LENGTH_OF_ALPHABET =: 26
ASCII_FOR_A =: ascii_characters get_index_of 'A'
ALPHABET =: (ASCII_FOR_A + i.LENGTH_OF_ALPHABET) from ascii_characters

label_for =: verb define
 (second_character_of_label_for y), (rightmost_character_of_label_for y)
)

rightmost_character_of_label_for =: verb define
 last_digit =: LENGTH_OF_ALPHABET | y
 (last_digit in_base LENGTH_OF_ALPHABET) from ALPHABET 
)

second_character_of_label_for =: verb define
alphabets_gone_by =: <. y % LENGTH_OF_ALPHABET
if. alphabets_gone_by do. 
    rightmost_character_of_label_for (alphabets_gone_by - 1)
else.
    ''
end.
)

in_base =: dyad define
 y #.^:_1 x
)

matches =: dyad define
 result =. (y -: x)
 describe_result =. 'looking for ', (":x), ', got ', (":y)
 (box result), (box describe_result)
)

assertion =: dyad define
 name_of_test =. x
 'result describe_result' =. y
 smoutput (result from (('*FAILED ASSERTION*  ', describe_result) ,: 'success ')), x 
 smoutput '---'

)

verb define test
 test =. 'Rightmost character of column 0 is A.'
 test_character =. rightmost_character_of_label_for 0
 test assertion (,'A') matches test_character
)
 
verb define test
 test =. 'Bogus testing test'
 test assertion ('A') matches ('not A')
)

verb define test
 test =. 'Rightmost character of column 1 is B.'
 test_character =. rightmost_character_of_label_for 1
 test assertion (,'B') matches test_character
)

verb define test
 test =. 'Rightmost character of column 26 is A.'
 test_character =. rightmost_character_of_label_for 26
 test assertion (,'A') matches test_character
)

verb define test
 test =. 'Rightmost character of label for 701 is Z.'
 test_character =. rightmost_character_of_label_for 701
 test assertion (,'Z') matches test_character
)

verb define test
 test =. 'Rightmost character of label for 702 is A.'
 test_character =. rightmost_character_of_label_for 702
 test assertion (,'A') matches test_character
)

verb define test
 test =. 'Character before rightmost character of label for 27 is A.'
 test_character =. second_character_of_label_for 27
 test assertion (,'A') matches test_character
)

verb define test
 test =. 'Label for 25 is contains one letter-digit.'
 test assertion 1 matches length_of label_for 25
)

verb define test
 test =. 'Character before rightmost character of label for 52 is B.'
 test_character =. second_character_of_label_for 52
 test assertion (,'B') matches test_character
)

verb define test
 test =. 'Character before rightmost character of label for 26 is A.'
 test_character =. second_character_of_label_for 26
 test assertion (,'A') matches test_character
)

verb define test
 test =. 'Label for 701 is ZZ.' 
 test assertion ('ZZ') matches label_for 701
)


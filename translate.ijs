clear ''
it =: '~/Development/JProjects/Integers-as-letters/translate.ijs'

test =: ''
true =: 1
false =: 0
from =: {
length_of =: #
ascii_characters =: a.
get_index_of =: i.
shape_of =: $
dimensions =: # @ $
box =: <
unbox =: >
box_of_nothing =: < 0 0 $ 0
test_report =: smoutput

clear_screen =: ,"(0) 100 # ' '

LENGTH_OF_ALPHABET =: 26
ASCII_FOR_A =: ascii_characters get_index_of 'A'
ALPHABET =: (ASCII_FOR_A + i.LENGTH_OF_ALPHABET) from ascii_characters

label_for =: verb define
 number_to_translate =. y
 (third_character_of_label_for, second_character_of_label_for, rightmost_character_of_label_for) number_to_translate
)

rightmost_character_of_label_for =: verb define
 number_to_translate =. y
 if. needs_a_first_character number_to_translate do.
  last_digit =: LENGTH_OF_ALPHABET | y
  (last_digit in_base LENGTH_OF_ALPHABET) from ALPHABET 
 else.
     ''
 end.
)

second_character_of_label_for =: verb define
number_to_translate =. y
alphabet_iterations =. <. y % LENGTH_OF_ALPHABET
if. needs_a_second_character number_to_translate do.
    remainder =. alphabet_iterations - 1 
    second_character =. rightmost_character_of_label_for remainder 
else.
    ''
end.
)

needs_a_first_character =: verb define
(y % LENGTH_OF_ALPHABET) >: <. LENGTH_OF_ALPHABET^_1

)

needs_a_second_character =: verb define
(y % LENGTH_OF_ALPHABET) >: LENGTH_OF_ALPHABET^1
)

needs_a_third_character =: verb define
(y % LENGTH_OF_ALPHABET) >: 27 
)

third_character_of_label_for =: verb define
 if. needs_a_third_character y do.
     'A'
 else.
     '' 
 end.
)

in_base =: dyad define
 y #.^:_1 x
)

matches =: dyad define
 result =. (y -: x)
 describe_result =. 'Looking for ', (":x), ', got ', (":y)
 (box result), (box describe_result)
)

assertion =: dyad define
 name_of_test =. x
 'result describe_result' =. y
 failure_details =.  (name_of_test, LF, describe_result)
 failure_with_description =. ('*FAILED ASSERTION*  ', failure_details) 
 report_success =. '--- ', name_of_test, ' ---' 
 smoutput unbox (result from (box failure_with_description), (box report_success))
)

smoutput clear_screen

verb define test
 verify =. 'Rightmost character of column 0 is A.'
 test_character =. rightmost_character_of_label_for 0
 verify assertion (,'A') matches test_character
)

verb define test
 verify =. 'Rightmost character of column 1 is B.'
 test_character =. rightmost_character_of_label_for 1
 verify assertion (,'B') matches test_character
)

verb define test
 verify =. 'Rightmost character of column 26 is A.'
 test_character =. rightmost_character_of_label_for 26
 verify assertion (,'A') matches test_character
)

verb define test
 verify =. 'Rightmost character of label for 701 is Z.'
 test_character =. rightmost_character_of_label_for 701
 verify assertion (,'Z') matches test_character
)

verb define test
 verify =. 'Rightmost character of label for 702 is A.'
 test_character =. rightmost_character_of_label_for 702
 verify assertion (,'A') matches test_character
)

verb define test
 verify =. 'Character before rightmost character of label for 27 is A.'
 test_character =. second_character_of_label_for 27
 verify assertion (,'A') matches test_character
)

verb define test
 verify =. 'Label for 25 is contains one letter-digit.'
 verify assertion 1 matches length_of label_for 25
)

verb define test
 verify =. 'Character before rightmost character of label for 52 is B.'
 test_character =. second_character_of_label_for 52
 verify assertion (,'B') matches test_character
)

verb define test
 verify =. 'Character before rightmost character of label for 26 is A.'
 test_character =. second_character_of_label_for 26
 verify assertion (,'A') matches test_character
)

verb define test
 verify =. 'Label for 52 is BA.'
 verify assertion ('BA') matches label_for 52
)

verb define test
 verify =. 'There is no third character for 52.'
 verify assertion false matches needs_a_third_character 52
)

verb define test
 verify =. 'There is a third character for 702.'
 verify assertion true matches needs_a_third_character 702
)

verb define test
 verify =. 'Label for 701 is ZZ.' 
 verify assertion ('ZZ') matches label_for 701
)

verb define test
 verify =. 'Label for 702 is AAA.'
 verify assertion ('AAA') matches label_for 702
)

verb define test
 verify =. 'Label for -1 is nothing.'
 verify assertion 0 matches length_of label_for _1
)

NB. verb define test
NB.  verify =. 'Label for 1381 is BAD.'
NB.  verify assertion ('BAD') matches label_for 1381
NB. )

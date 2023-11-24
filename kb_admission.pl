% facts for tests

standardized_test('SAT', '1020').
standardized_test('ACT', '19').
standardized_test('IB', '29').
standardized_test('IELTS', '6').
standardized_test('TOEFL', '550').
standardized_test('KMITL TEP', 'B2').
standardized_test('GED', 'pass').


% Define the list of standardized tests
standardized_tests(['SAT', 'ACT', 'IB', 'IELTS', 'TOEFL', 'KMITL TEP']).

contain_test(Keyword, Option) :-
    standardized_test(Keyword, _),
    Option = 'valid'.

contain_test(Statement, Option) :-
    sub_atom(Statement, _, _, _, Keyword),
    standardized_test(Keyword, _),
    Option = 'valid'.

find_basic_require(Keyword, Return) :-
    standardized_test(Keyword, Return).
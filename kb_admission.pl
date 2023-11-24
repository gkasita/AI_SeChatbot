% facts for tests
standardized_test('sat', '1020').
standardized_test('act', '19').
standardized_test('ib', '29').
standardized_test('ielts', '6').
standardized_test('toefl', '550').
standardized_test('kmitl tep', 'B2').
standardized_test('ged', 'pass').

% Define the list of standardized tests
standardized_tests(['sat', 'act', 'ib', 'ielts', 'toefl', 'kmitl tep']).

contain_test(Keyword) :-
    standardized_test(Keyword, _).

contain_test(Statement) :-
    sub_atom(Statement, _, _, _, Keyword),
    standardized_test(Keyword, _).


find_basic_require(Keyword, Return) :-
    standardized_test(Keyword, Return).
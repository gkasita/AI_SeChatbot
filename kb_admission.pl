% facts for tests
standardized_test('sat', '1020', '600').
standardized_test('act', '19', '23').
standardized_test('ib', '29', '5').
standardized_test('ielts', '6', _).
standardized_test('toefl', '550', _).
standardized_test('kmitl tep', 'B2', _).
standardized_test('ged', 'pass', _).


% Define the list of standardized tests
standardized_tests(['SAT', 'ACT', 'IB', 'GED', 'IELTS', 'TOEFL', 'KMITL Tep', 'A level', 'Gaokao', 'GAT/ PAT', 'TGAT/ TPAT']).

contain_test(Keyword) :-
    standardized_test(Keyword, _, _).
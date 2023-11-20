%knowledge base for categorized intent behind user input for main keyword

is_keyword(Keyword, Option) :-
    member(Keyword, ['what is software engineer', 'faq', 'program']),
    Option = 'SE'.

is_keyword(Keyword, Option) :-
    member(Keyword, ['get in', 'admission', 'exam', 'application', 'apply', 'enrollment', 'enroll', 'eligibility', 'apply', 'entrance', 'accept']),
    Option = 'Admission'.

is_keyword(Keyword, Option) :-
    member(Keyword, ['syllabus', 'outlines', 'curriculum', 'lecture plan', 'topic covered', 'class details']),
    Option = 'Syllabus'.

is_keyword(Keyword, Option) :-
    member(Keyword, ['hello', 'hi', 'hey', 'good morning', 'good afternoon']),
    Option = 'Greeting'.

is_keyword(Keyword, Option) :-
    member(Keyword, ['thank', 'thx', 'okay', 'ok']),
    Option = 'Thank you'.

%categorized user intent
contains_option(Keyword, Option) :-
    is_keyword(Keyword, Option).

contains_option(Statement, Option) :-
    atom_contains(Statement, Keyword),
    is_keyword(Keyword, Option).

atom_contains(Atom, Substring) :-
    sub_atom(Atom, _, _, _, Substring).
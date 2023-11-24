:- consult('kb_main.pl').
:- consult('kb_syllabus.pl').

:- dynamic(user_name/1).

chat :-
    response_start,
    repeat,
    read_line_to_string(user_input, UserInput),
    downcase_atom(UserInput, LowerUserInput), 
    response(LowerUserInput),
    (LowerUserInput == 'bye'), !.

response(Statement) :-
    (    
     contains_option(Statement, Option) -> response_option(Option);
     (Statement == 'bye') -> write('Goodbye');
     write('I did not understand that. Can you please rephrase?')
    ).

response_start :-
    write('Hi, this is SE chatbot. Here are the basic functionalities we can assist you with: '), nl,
    write('- Ask about software engineering program'), nl,
    write('- Ask about admission procedure'), nl,
    write('- Ask about software engineering syllabus'), nl, nl,
    write('What should we call you?'), nl,
    read_line_to_string(user_input, Name),
    downcase_atom(Name, LowerName),
    assertz(user_name(LowerName)),
    write('Nice to meet you, '),
    write(LowerName), 
    write('! How can I assist you today?'), nl.

response_option('Greeting') :-
    write('Hi, How can I assist you today?'), nl.

response_option('Thank you') :-
    write('Your welcome, don\'t hesitate to ask me more if you have any questions.'), nl.

response_option('SE') :-
    write('SE'), nl.

response_option('Admission') :-
    write('Admission'), nl.

%-------Syllabus------------
response_option('Syllabus') :-
    write('For our study-plan in KMITL, student can select to go through a track of Metaverse, Industial IoT, or Artificial Intelligence.'), nl,
    write('- Subject for each track'), nl,
    write('- Subject in each semester'), nl,
    read_line_to_string(user_input, UserInput),
    downcase_atom(UserInput, LowerUserInput), nl,
    write('Receive: '), write(LowerUserInput),
    (contains_option_track(LowerUserInput, Option)) -> response_track(Option);
    (contains_option_yearsem(LowerUserInput, Option)) -> response_yearsem(Option).

%for handle track
response_track('All track') :-
    response_track('Metaverse'), nl,
    response_track('Industrial IoT'), nl,
    response_track('Artificial Intelligence'), !.

response_track(Option) :-
    write('Here is the subject for '), write(Option), write(' track:'), nl,
    subject_by_track(Option, Subjects),
    print_subjects_list(Subjects).

print_subjects_list([]).
print_subjects_list([Subject|Rest]) :-
    write('- '), write(Subject),nl,
    print_subjects_list(Rest).

%for query based on sem
response_yearsem(Option) :-
    write(Option), nl,
    subjects_by_year_sem(Option, Subjects),
    print_subjects_list(Subjects).

response_yearsem('All yearsem') :-
    write('Year 1 Semester 1'),nl,
    response_yearsem(year(1, 1)), nl, nl,
    write('Year 1 Semester 2'),nl,
    response_yearsem(year(1, 2)), nl,nl,
    write('Year 2 Semester 1'),nl,
    response_yearsem(year(2, 1)), nl,nl,
    write('Year 2 Semester 2'),nl,
    response_yearsem(year(2, 2)), nl,nl,
    write('Year 3 Semester 1'),nl,
    response_yearsem(year(3, 1)), nl,nl,
    write('Year 3 Semester 2'),nl,
    response_yearsem(year(3, 2)), nl,nl,
    write('Year 4 Semester 1'),nl,
    response_yearsem(year(4, 1)), nl,nl,
    write('Year 4 Semester 2'),nl,
    response_yearsem(year(4, 2)), !.
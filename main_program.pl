:- consult('kb_main.pl').
:-consult('kb_syllabus.pl').

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
    write('For our study-plan in KMITL, student can select to go through a track of Metaverse, Industial IoT, or Artificial Intelligence.'), nl, nl,
    write('Do you have a particular track you\'re interested in, or would you like us to provide syllabus for a specific semester, or perhaps all of them?'), nl,
    read_line_to_string(user_input, UserInput),
    contains_option_track(UserInput, Option) -> response_track(Option).

response_track(Option) :-
    write('Here is the subject for '), write(Option), write(' track:'), nl,
    findall(Subject, subject(Subject, _, Option), Subjects),
    print_subjects_list(Subjects).

print_subjects_list([]).
print_subjects_list([Subject|Rest]) :-
    write('- '), write(Subject),nl,
    print_subjects_list(Rest).





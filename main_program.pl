:- consult('kb_main.pl').
:- consult('se_about.pl').

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
    write('What would you like to know?'), nl,
    read_line_to_string(user_input, UserInput), % Get user input
    downcase_atom(UserInput, LowerUserInput),
    handle_SE_query(LowerUserInput, Response),
    write(Response),nl.

response_option('Admission') :-
    write('Admission'), nl.

response_option('Syllabus') :-
    write('Syllabus'), nl.

handle_SE_query(Query, Response) :-
    is_SE_keyword(Query, Option), % Check if the query matches any keyword in se_kb
    rule(Option, [_, action(Action)]), % Get the action associated with the matched keyword
    Response = Action, !. % Set the response to the action

handle_SE_query(_, 'I did not understand that. Can you please rephrase?').
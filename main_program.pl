:- consult('kb_main.pl').
:- consult('kb_syllabus.pl').
:- consult('kb_admission.pl').

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

%-------Admission-----------
response_option('Admission') :-
    admission_rules('Bachelor'), nl,
    repeat,
    read_line_to_string(user_input, Input),
    downcase_atom(Input, LowercaseInput),
    process_input_admission(LowercaseInput),
    (LowercaseInput == 'back'), !.

process_input_admission(Input) :-
    write(Input),
    (contain_test(Input)) -> write('Yes, that is a valid test.');
    (Input == 'back') -> write('Quit admission section, How can I assists you today?');
    write('I did not understand that. Can you please rephrase?'), nl.  

admission_rules('Bachelor') :-
    admission_requirements('Basic'),
    further_info.

admission_requirements('Basic') :-
    write('To apply for the Software Engineering program, you will need to submit the following documents:'), nl,
    application_form,
    photocopy_id,
    academic_records,
    english_proficiency,
    recommendation_letters,
    personal_statement,
    optional_items.
    
application_form :-
    write('1. Application form'), nl.
    
photocopy_id :-
    write('2. A photocopy of the applicant\'s national ID card or passport'), nl.
    
academic_records :-
    write('3. Academic Records such as High School Transcript, SAT, ACT, IB, etc.'), nl.
    
english_proficiency :-
    write('4. English Proficiency Test score - IELTS, TOEFL, etc.'), nl.
    
recommendation_letters :-
    write('5. Two recommendation letters from teachers.'), nl.
    
personal_statement :-
    write('6. Personal Statement'), nl.
    
optional_items :-
    write('7. Portfolios Achievements (optional)'), nl.
    
further_info :-
    write('Standardized Tests and their minimum scores:'), nl,
    standardized_tests(Tests),
    display_test_scores(Tests),
    write('If you have any further questions, please don\'t hesitate to ask!'), nl.

display_test_scores([]).
display_test_scores([Test | Rest]) :-
    standardized_test(Test, Score),
    write('      * '), write(Test), write(': '), write(Score), nl,
    display_test_scores(Rest).
    
%-------Syllabus------------
response_option('Syllabus') :-
    write('For our study-plan in KMITL, student can select to go through a track of Metaverse, Industial IoT, or Artificial Intelligence.'), nl,
    write('- Subject for each track'), nl,
    write('- Subject in each semester'), nl,
    write('[type back to exit syllabus section]'),nl,
    repeat,
    read_line_to_string(user_input, UserInput),
    downcase_atom(UserInput, LowerUserInput), nl,
    response_for_syllabus(LowerUserInput),
    (LowerUserInput == 'back'), !.

response_for_syllabus(Input) :-
    (contains_option_yearsem(Input, Option2)) -> response_yearsem(Option2);
    (contains_option_track(Input, Option)) -> response_track(Option);
    (Input == 'back') -> write('Quit syllabus section, How can I assists you today?');
    write('I did not understand that. Can you please rephrase?'), nl.

    

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
    response_yearsem(year(4, 2)),nl,nl, !.

response_yearsem(Option) :-
    write('Require course:'), nl,
    subjects_require_by_year_sem(Option, Subjects),
    print_subjects_list(Subjects).
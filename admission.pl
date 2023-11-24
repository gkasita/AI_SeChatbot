:- consult('kb_admission.pl').

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
    display_test_scores(Tests).

display_test_scores([]).
display_test_scores([Test | Rest]) :-
    standardized_test(Test, Score),
    write('      * '), write(Test), write(': '), write(Score), nl,
    display_test_scores(Rest).


    

:- discontiguous subject/3.

subject('Introduction to Calculus', year(1, 1), require).
subject('Circuits and Electronics', year(1, 1), require).
subject('Elementary Systems Programming', year(1, 1), require).
subject('Computer Programming', year(1, 1), require).
subject('Intercultural Communication skills in English 1', year(1, 1), require).
subject('Introduction to Logic', year(1, 1), require).

subject('Differential Equation', year(1, 2), require).
subject('Discrete Mathematics', year(1, 2), require).
subject('Digital System Fundamentals', year(1, 2), require).
subject('Object-Oriented Programming', year(1, 2), require).
subject('General Education Course', year(1, 2), require).
subject('Intercultural Communication skills in English2', year(1, 2), require).

subject('Probability Models and Data Analysis', year(2, 1), require).
subject('Computer Architecture and ORgnaization', year(2, 1), require).
subject('Data Structures and Algorithms', year(2, 1), require).
subject('Web Programming', year(2, 1), require).
subject('Digital Citizen', year(2, 1), require).
subject('Language and Communication Course', year(2, 1), require).

subject('Linear Algebra', year(2, 2), require).
subject('Computer Networks', year(2, 2), require).
subject('Algorithm Design and Analysis', year(2, 2), require).
subject('Software Engineering Principles', year(2, 2), require).
subject('Database Systems', year(2, 2), require).
subject('Seminar in Software Engineering', year(2, 2), require).
subject('Philosophy of Science', year(2, 2), require).

subject('Operating Systems', year(3, 1), require).
subject('Theory of Computation', year(3, 1), require).
subject('Software Design and Architecture', year(3, 1), require).
subject('Artificial Intelligence', year(3, 1), require).
subject('Computer Graphics and Mixed Reality', year(3, 1), 'Metaverse').
subject('Web Service Development and Service-Oriented Architecture', year(3, 1), 'Metaverse').
subject('Web Service Development and Service-Oriented Architecture', year(3, 1), 'Industrial IoT').
subject('Real-Time Embedded System Design and Development', year(3, 1), 'Industrial IoT').
subject('AI Programming', year(3, 1), 'Artificial Intelligence').
subject('Machine Learning', year(3, 1), 'Artificial Intelligence').
subject('Data Science and Data Analytics', year(3, 1), 'Artificial Intelligence').

subject('Compiler Construction', year(3, 2), require).
subject('Software Development Process and Project Management', year(3, 2), require).
subject('User Experience and User Interface Design', year(3, 2), require).
subject('Distributed Computing', year(3, 2), 'Metaverse').
subject('Advanced Database Systems', year(3, 2), 'Metaverse').
subject('Industrial IoT Networks and Communications', year(3, 2), 'Industrial IoT').
subject('Cyber-Physical Systems and Industry 4.0', year(3, 2), 'Industrial IoT').
subject('Knowledge Representation and Reasoning', year(3, 2), 'Artificial Intelligence').
subject('Deep Learning', year(3, 2), 'Artificial Intelligence').
subject('Team Software Project', year(3, 2), require).

subject('Free Elective', year(4, 1), require).
subject('Information and Computer Security', year(4, 1), require).
suject('Major Elective', year(4, 1), require).
subject('Software Engineering Project 1', year(4, 1), require).

subject('Free Elective', year(4, 2), require).
subject('Software Verification and Validation', year(4, 2), require).
subject('Software Engineering Project 2', year(4, 2), require).
subject('Professional Skills and Issues', year(4, 2), require).

track('Metaverse').
track('Industrial IoT').
track('Artificial Intelligence').

subject_by_track(Option, Subjects) :-
    findall(Subject, subject(Subject, _, Option), Subjects).

subjects_require_by_year_sem(Option, Subjects) :-
    findall(Subject, subject(Subject, Option, require), Subjects).
%-----------------------------capture keyword for syllabus section-------------------------
is_keyword_track(Keyword, Option) :-
    member(Keyword, ['metaverse', 'meta']),
    Option = 'Metaverse'.
    
is_keyword_track(Keyword, Option) :-
    member(Keyword, ['industrial', 'iot', 'internet of thing']),
    Option = 'Industrial IoT'.
    
is_keyword_track(Keyword, Option) :-
    member(Keyword, ['ai', 'artificial']),
    Option = 'Artificial Intelligence'.

is_keyword_track(Keyword, Option) :-
    member(Keyword, ['track']),
    Option = 'All track'.

contains_option_track(Keyword, Option) :-
    is_keyword_track(Keyword, Option).
    
contains_option_track(Statement, Option) :-
    atom_contains(Statement, Keyword),
    is_keyword_track(Keyword, Option).

% for based on year and sem
concat_Y_and_S_with_space(Y, YearNum, S, SemNum, Combined) :-
    atomic_list_concat([Y, YearNum, S, SemNum], ' ', Combined).

concat_Y_and_S(Y, YearNum, S, SemNum, Combined) :-
    atomic_list_concat([Y, YearNum, S, SemNum], '', Combined).

generate_keyword(YearNum, SemNum, ReturnList) :-
    findall(Combined,
        (   concat_Y_and_S_with_space('year', YearNum, 'sem', SemNum, Combined1),
            concat_Y_and_S_with_space('y', YearNum, 's', SemNum, Combined2),
            concat_Y_and_S_with_space('year', YearNum, 'semester', SemNum, Combined3),
            concat_Y_and_S('year', YearNum, 'sem', SemNum, Combined4),
            concat_Y_and_S('y', YearNum, 's', SemNum, Combined5),
            concat_Y_and_S('year', YearNum, 'semester', SemNum, Combined6),
            append([Combined1, Combined2, Combined3, Combined4, Combined5, Combined6], [], Combined)
        ),
        ReturnList).

is_keyword_yearsem(Keyword, Option) :-
    between(1, 4, YearNum),
    between(1, 2, SemNum),
    generate_keyword(YearNum, SemNum, KwList),
    member(SubList, KwList),
    member(Keyword, SubList),
    Option = year(YearNum, SemNum).
        

%use list to make input more dynamic
is_keyword_yearsem(Keyword, Option) :-
    member(Keyword, ['all']),
    Option = 'All yearsem'.

contains_option_yearsem(Keyword, Option) :-
    is_keyword_yearsem(Keyword, Option).
    
contains_option_yearsem(Statement, Option) :-
    atom_contains(Statement, Keyword),
    is_keyword_yearsem(Keyword, Option).
    

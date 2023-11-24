is_keyword_se(Keyword, Option) :-
    member(Keyword, ['jobs', 'occupation', 'career']),
    Option = 'Jobs'.

is_keyword_se(Keyword, Option) :-
    member(Keyword, ['overview', 'discipline', 'programe']),
    Option = 'What is SE'.
    
is_keyword_se(Keyword, Option) :-
    member(Keyword, ['dual', '2 + 2', '2+2', 'glasgow', 'queensland']),
    Option = '2+2'.
    
is_keyword_se(Keyword, Option) :-
    member(Keyword, ['exchange']),
    Option = 'Exchange'.

contains_option_se(Keyword, Option) :-
    is_keyword_se(Keyword, Option).
        
contains_option_se(Statement, Option) :-
    atom_contains(Statement, Keyword),
    is_keyword_se(Keyword, Option).

response_q('Jobs', 'graduates from the software engineering program have diverse career prospects, including roles as software engineers, architects, and developers across various platforms. They can also pursue careers as IT analysts, designers, consultants, and even venture into entrepreneurship. With a solid foundation in computer science and mathematics, graduates are well-equipped to pursue advanced studies in software engineering or related fields at the postgraduate level in universities worldwide.' ).
response_q('What is SE', 'Software engineering (SE) is an engineering discipline concerning all aspects of software production, including software analysis, design, development, testing, and deployment. SE requires profound abstract and logical thinking and the application of mathematics, logic, and computer science in order to produce efficient and reliable software with the available resources.').
response_q('2+2', 'Programme offer the choice for student to enroll and study abroad at university of glasgow or university of queensland during their year 3-4 and obtain both bachelor degree from kmitl and selected university. ').
response_q('Exchange', 'Programme offer the choice for student to enroll in exchange program in Frakfurt University of Applied Sciences at Germany during Year 3 semester 2').

response_by_q(Option, Response) :-
    response_q(Option, Response).
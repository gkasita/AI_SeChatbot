% Keyword for "What is Software Engineering?"
is_SE_keyword(Keyword, Option) :-
    member(Keyword, ['software engineering', 'definition', 'overview', 'discipline', 'software development', 'programming', 'engineering practices']),
    Option = 'What is SE'.

% Keyword for "Why Study Software Engineering?"
is_SE_keyword(Keyword, Option) :-
    member(Keyword, ['study software engineering', 'importance', 'advantages', 'pursue degree', 'career opportunities', 'technology industry']),
    Option = 'Why Study SE'.

is_SE_keyword(Keyword, Option) :-
    member(Keyword, ['syllabus', 'outlines', 'curriculum', 'lecture plan', 'topic covered', 'class details']),
    Option = 'Syllabus'.

is_SE_keyword(Keyword, Option) :-
    member(Keyword, ['hello', 'hi', 'hey', 'good morning', 'good afternoon']),
    Option = 'Greeting'.

% Rule for "Syllabus" response
rule('Syllabus',
     [condition_keywords(['syllabus', 'outlines', 'curriculum', 'lecture plan', 'topic covered', 'class details']),
      action('response_option(\'Syllabus\')')]).

% Rule for "What is Software Engineering?"
rule('What is SE',
     [condition_keywords(['software engineering', 'definition', 'overview', 'discipline']),
      action('Software Engineering (SE) is an engineering discipline that encompasses \nvarious aspects of software production. 
      \nIt involves the analysis, design, development, testing, and deployment of software. 
      \nSE requires abstract and logical thinking, along with the application of mathematics, logic, \nand computer science to produce efficient and reliable software with available resources.')]).

% Rule for "Why Study Software Engineering?"
rule('Why Study SE',
     [condition_keywords(['study software engineering', 'importance', 'advantages', 'pursue degree']),
      action('response("Studying Software Engineering is crucial because software plays a pivotal role in almost every aspect of our lives. Every computer system is governed by software, and the industry is one of the largest and fastest-growing worldwide. Skilled software engineers are in high demand. As software complexity increases, traditional computer science skills become insufficient. Software engineers need to analyze problem domains, understand customer requirements, and design software efficiently. Proper tools, techniques, and methodologies are essential for successful software development.")')]).

% Rule for "What Does the Program Curriculum Cover?"
rule('Program Curriculum',
     [condition_keywords(['program curriculum', 'subjects', 'courses', 'topics', 'software engineering program', 'academic content', 'study plan']),
      action('response("The program curriculum covers a range of subjects, courses, and topics essential for a well-rounded education in software engineering. It includes core computer science principles, programming languages, software development methodologies, and specialized topics such as algorithms, data structures, and more.")')]).

% Rule for "What Careers Can I Pursue After Graduation?"
rule('Careers After Graduation',
     [condition_keywords(['careers after graduation', 'job opportunities', 'career paths', 'software engineer', 'software developer', 'IT professional', 'employment prospects']),
      action('response("Graduates from the Software Engineering program have abundant career opportunities, such as software engineers, software architects, and developers working on various platforms, including enterprise software, web applications, mobile applications, games, and embedded systems. Additionally, they can pursue careers as analysts, designers, consultants, or even become software entrepreneurs.")')]).

% Rule for "Are There Internship Opportunities?"
rule('Internship Opportunities',
     [condition_keywords(['internship opportunities', 'practical experience', 'hands-on experience', 'industry exposure', 'intern positions', 'real-world projects']),
      action('response("Yes, the program offers internship opportunities to provide students with practical experience and industry exposure. Internships allow students to apply their knowledge in real-world projects and gain valuable hands-on experience in the field of software engineering.")')]).

% Rule for "2+2 Programs"
rule('2+2 Programs',
     [condition_keywords(['2+2 programs', 'dual degree', 'transfer program', 'collaborative degree', 'two-plus-two', 'joint programs']),
      action('response("2+2 programs, also known as dual degree or transfer programs, allow students to complete part of their education at one institution and transfer to another for the remainder. These collaborative degree programs offer unique opportunities for a broader academic experience.")')]).

% Rule for "Exchange/Study Abroad"
rule('Exchange/Study Abroad',
     [condition_keywords(['exchange programs', 'study abroad', 'international experience', 'global learning', 'overseas study', 'cultural exchange']),
      action('response("The program provides opportunities for students to participate in exchange programs and study abroad. This allows them to gain international experience, engage in global learning, and experience cultural exchange with students from around the world.")')]).

% Rule for any other input
rule('Other',
     [condition('anything else'),
      action('response("How can I assist you today?")')]).

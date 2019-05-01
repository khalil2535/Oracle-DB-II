
create or replace package body university 
is

--

PROCEDURE allcourse_credit (
    c_course   OUT SYS_REFCURSOR
)
    IS
BEGIN
    OPEN c_course FOR
        SELECT
            credits
       
        FROM
            course;--COURSE_ID

END;
--
 PROCEDURE tcourse_eq_ttakes (
    c_course   OUT SYS_REFCURSOR
)
    IS
BEGIN
    OPEN c_course FOR
        SELECT
            *
        FROM
            course c,
            takes t
        WHERE
            c.course_id = t.course_id;

END;
--
 PROCEDURE Student_name_and_ID (
    c_course   OUT SYS_REFCURSOR
)
    IS
BEGIN
    OPEN c_course FOR
        SELECT
        s.id,
        s.name
    FROM
        course c,
        takes t,
        student s
    WHERE
        c.course_id = t.course_id
    AND
        s.id = t.id;
END;
--
 PROCEDURE count_and_Title_of_course (
    count_and_Title_of_course   OUT SYS_REFCURSOR
)
    IS
BEGIN
    OPEN count_and_Title_of_course FOR
           -- SELECT  DisTINCT c.TITLE,(select count(t.id)from takes t where t.course_id = c.course_id)   FROM course c, takes t WHERE c.course_id = t.course_id  ;
select c.title, count(t.id)
  from takes t , course c 
  where t.course_id=c.course_id
  group by c.title;

END;
--
 PROCEDURE Insert_Student (
    ID   in Student.ID%type,
        Name   in Student.Name%type,
        DEPT_Name   in Student.DEPT_Name%type,
        TOT_CRED   in Student.TOT_CRED%type
)
    IS
BEGIN
INSERT INTO Student (ID, Name, DEPT_Name, TOT_CRED)
VALUES (ID, Name, DEPT_Name, TOT_CRED);
End;
PROCEDURE allstudent (
    allstudent   OUT SYS_REFCURSOR
)
    IS
BEGIN     
--select * into S_AllStudent  from Student where Student.ID='19991'; this is for test
OPEN  allstudent for
    SELECT
        *
    FROM
        student;

EXCEPTION
    WHEN others THEN
        dbms_output.put_line(sqlerrm);
END;
PROCEDURE allcourse (
    allcourse   OUT SYS_REFCURSOR
)
    IS
BEGIN     

--select * into C_AllCourse from COURSE where COURSE_ID='BIO-101';--COURSE_ID
OPEN allcourse for
    SELECT
        *
   
    FROM
        course;--COURSE_ID

EXCEPTION
    WHEN others THEN
        dbms_output.put_line(sqlerrm);
END;

PROCEDURE Insert_Course (
    C_COURSE_ID   in Course.COURSE_ID%type,
        C_Title   in Course.Title%type,
        DEPT_Name   in Course.DEPT_Name%type,
        C_CREDITS   in Course.CREDITS%type
)
    IS
BEGIN
INSERT INTO Course (COURSE_ID, Title, DEPT_Name, CREDITS)
VALUES (C_COURSE_ID, C_Title, DEPT_Name, C_CREDITS);
End;

PROCEDURE Get_Dept_Name (
    c_course   OUT SYS_REFCURSOR
)
    IS
BEGIN
    OPEN c_course FOR
        SELECT
            DEPT_NAME
       
        FROM
            course;--COURSE_ID

END;
End;


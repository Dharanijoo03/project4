-- query to insert the questions and answers
create database quiz;
use quiz;
create table questions(
id INT(11) AUTO_INCREMENT,
question VARCHAR(255) NOT NULL,
option1 VARCHAR(255) NOT NULL,
option2 VARCHAR(255) NOT NULL,
option3 VARCHAR(255) NOT NULL,
option4 VARCHAR(255) NOT NULL,
answer INT(11) NOT NULL,
PRIMARY KEY(id)
);
drop table questions;
INSERT INTO questions (question,option1,option2, option3, option4, answer) VALUES
('which is the largest state of india?', 'tamilnadu', 'kerala', 'panjab', 'rajasthan', 4),
('which is the longest river in india?', 'ganga', 'yamuna', 'krishna', 'narmatha', 1),
('Who painted the Mona Lisa?', 'Leonardo da Vinci', 'Pablo Picasso', 'Vincent van Gogh', 'Michelangelo', 1),
('What is the largest ocean on Earth?', 'Atlantic Ocean', 'Arctic Ocean', 'Indian Ocean', 'Pacific Ocean', 4),
('which is the longest river in the world?', 'nile', 'kaveri', 'niagara', 'indus', 1);
select  * from questions;
-- python connectivity code

import mysql.connector
mydb=mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="quiz"
)
cursor=mydb.cursor()
def display_questions(cursor):
    query=("select * from questions")
    cursor.execute(query)
    questions=cursor.fetchall()
    for question in questions:
        print("Questions:",question[1])
        print("Options:")
        print("1.",question[2])
        print("2.",question[3])
        print("3.",question[4])
        print("4.",question[5])
        print()
def take_quiz(cursor):
    score=0
    query=("select * from questions")
    cursor.execute(query)
    questions=cursor.fetchall()
    for question in questions:
        print("Questions:",question[1])
        print("Options:")
        print("1.",question[2])
        print("2.",question[3])
        print("3.",question[4])
        print("4.",question[5])
        print()
        print("Enter your answer(1-4):")
        user_ans=int(input())
        if user_ans==question[6]:
            score+=1
    return score
print("Questions:")
display_questions(cursor)
print("answers:")
user_score=take_quiz(cursor)
print(user_score)







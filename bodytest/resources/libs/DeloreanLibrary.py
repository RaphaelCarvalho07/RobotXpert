import psycopg2
from logging import info   

class DeloreanLibrary():

    # No Robot vira uma KW automágicamente => Remove Student      email@desejado.com
    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
        info(query)

        conn = psycopg2.connect(
            host='ec2-3-224-251-47.compute-1.amazonaws.com',
            database='d9tst8udmsk19k',
            user='nowakbqamurall',
            password='0239fedaacfbe33610b8932f0db87a61df10be1addeb5b27338c46dceb86733c',
        )

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close

    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
                "values('{}','{}',{},{},{}, NOW(), NOW());"
                .format(student['name'], student['email'], student['age'], student['weight'], student['feet_tall']))
        info(query)

        conn = psycopg2.connect(
            host='ec2-3-224-251-47.compute-1.amazonaws.com',
            database='d9tst8udmsk19k',
            user='nowakbqamurall',
            password='0239fedaacfbe33610b8932f0db87a61df10be1addeb5b27338c46dceb86733c',
        )

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close        
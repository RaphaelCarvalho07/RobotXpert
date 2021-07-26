import psycopg2
from logging import info   

class DeloreanLibrary():

    def connect(self):
        return psycopg2.connect(
            host='ec2-44-194-225-27.compute-1.amazonaws.com',
            database='d1rpankcr10lvq',
            user='zgrjrhzgqtawns',
            password='e387ce16fed0930e0b3c39319d6c617af497537b3282030826cbcd0b9accfc29',
        )

    # No Robot vira uma KW automágicamente => Remove Student      email@desejado.com
    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close

    def remove_student_by_name(self, name):
        query = "delete from students where name LIKE '%{}%'".format(name)
        info(query)

        conn = self.connect()

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

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close
        
    def remove_plan_by_title(self, title):
        query = ("delete from plans where title LIKE '%{}%'").format(title)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close            

    def insert_plan(self, plan):
        query = ("insert into plans (title, duration, price, created_at, updated_at)"
                "values('{}', {}, {}, NOW(), NOW());"
                .format(plan['title'], plan['duration'], plan['price']))
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close            
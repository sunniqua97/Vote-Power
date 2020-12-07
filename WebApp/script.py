import os
import psycopg2
DB_HOST = os.environ.get('DB_HOST')
DB_NAME = os.environ.get('DB_NAME')
DB_USER = os.environ.get('DB_USER')
DB_PASS = os.environ.get('DB_PASS')


db_connect = psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST)
db_cur = db_connect.cursor()

db_cur.execute("INSERT INTO vpusers VALUES(%s, %s ,%s ,%s)", (1, "Test Name", "TestName@email.com", "Test Name st"))
db_connect.commit()
db_cur.close()
db_connect.close()

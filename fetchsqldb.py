import mysql.connector

def fetchdata(dbname, tablename):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Abcd@1234",
        database=dbname
    )
    mycursor = mydb.cursor()
    
    searchcmd = f"SELECT * FROM {tablename}"
    mycursor.execute(searchcmd)
    fetchresult = mycursor.fetchall()
    return fetchresult
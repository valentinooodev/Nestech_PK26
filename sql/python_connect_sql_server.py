import pyodbc

server = 'VALENTINO'
database = 'my_database'
conn = pyodbc.connect('Trusted_Connection=yes', driver='{SQL Server}', server=server, database=database)
cursor = conn.cursor()

# Thực hiện các truy vấn
cursor.execute('SELECT * FROM bank_customers')
rows = cursor.fetchall()

# In kết quả
for row in rows:
    print(row)

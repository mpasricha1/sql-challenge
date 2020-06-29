from sqlalchemy import create_engine
from sqlalchemy import select

engine = create_engine('postgresql+psycopg2://postgres:postgres@localhost:5432/company_db', echo=False)
conn = engine.connect()

query = "SELECT * FROM departments"

depts = conn.execute(query)

for dept in depts:
	print(dept)
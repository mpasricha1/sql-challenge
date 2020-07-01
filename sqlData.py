from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import sessionmaker
import pandas as pd 

engine = create_engine('postgresql+psycopg2://postgres:postgres@localhost:5432/company_db', echo=False)

Base = declarative_base()

class Titles(Base): 
	__tablename__ = 'titles'

	title_id = Column(String, primary_key=True)
	title = Column(String)

class Employees(Base):
   __tablename__ = 'employees'
   
   emp_no = Column(Integer, primary_key=True)
   emp_title_id = Column(String, ForeignKey("Titles.title_id"))
   birth_date = Column(Date) 
   first_name = Column(String) 
   last_name = Column(String) 
   sex = Column(String) 
   hire_date = Column(Date)

class Salaries(Base):
	__tablename__  = 'salaries'

	emp_no = Column(Integer, primary_key=True)
	salary = Column(Integer)




Session = sessionmaker(bind=engine)
session = Session()

# result = session.query(Employees).all()
# results2 = session.query(Salaries).all() 
# results3 = session.query(Titles).all()

results = session.query(Employees, Titles).join(Titles, Titles.title_id == Employees.emp_title_id).all()

for emp in results: 
	for t in titles: 
		print(t.title)
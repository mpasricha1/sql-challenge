from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import sessionmaker
from config import database, password
import pandas as pd 
import matplotlib.pyplot as plt
import time
from tqdm import tqdm


engine = create_engine(f'postgresql+psycopg2://{database}:{password}@localhost:5432/company_db', echo=False)

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
s = Session()

# result = session.query(Employees).all()
# results2 = session.query(Salaries).all() 
# results3 = session.query(Titles).all()

results = s.query(Employees, Titles, Salaries).join(Titles,Titles.title_id == Employees.emp_title_id).join(Salaries,Employees.emp_no == Salaries.emp_no).all()
													
tList = []

for row in results: 
	tDict = {"title": row[1].title, 
		   "salary": row[2].salary
	}
	tList.append(tDict)

title_pd = pd.DataFrame(tList)
grouped_df = title_pd.groupby(["title"]).mean()

grouped_df.plot(kind = "bar", rot=45)
plt.title("Average Salary By Department")
plt.xlabel("Title")
plt.ylabel("Salary")
plt.tight_layout()

plt.savefig("salaryBar.png")
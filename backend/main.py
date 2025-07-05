from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import pyodbc

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],  # React frontend
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# SQL Server connection
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=DESKTOP-REC5BE2\\SQLEXPRESS;'  # Double backslashes!
    'DATABASE=ZERO_HEALTHCARE;'
    'UID=devdutt;'
    'PWD=mssql@123'
)


@app.get("/api/hospitals")
def get_hospitals():
    cursor = conn.cursor()
    cursor.execute("SELECT Id, Name, Location, Contact FROM hospitals")
    rows = cursor.fetchall()
    hospitals = [
        {
            "Id": row[0],
            "Name": row[1],
            "Location": row[2],
            "Contact": row[3]
        }
        for row in rows
    ]
    return hospitals
from django.shortcuts import render
from django.db import connection
def index(request):
    cursor = connection.cursor()
    cursor.execute("")
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    return render(request, 'table_patient/patient_list.html')
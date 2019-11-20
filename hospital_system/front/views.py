from django.shortcuts import render,redirect,reverse
from django.db import connection
from django.http import HttpResponse

def get_cursor():
    return connection.cursor()

def index(request):
    cursor = get_cursor()
    cursor.execute('select pid,pfname,plname from patient')
    patients = cursor.fetchall()
    return render(request,'index.html',context={'patients':patients})

def add_patient(request):
    if request.method == 'GET':
        return render(request,'add_patient.html')
    else:
        inputpid = request.POST.get('inputpid')
        inputpfn = request.POST.get('inputpfn')
        inputpln = request.POST.get('inputpln')
        inputpgender = request.POST.get('inputpgender')
        inputpbd = request.POST.get('inputpbd')
        inputprace = request.POST.get('inputprace')
        inputpstatus = request.POST.get('inputpstatus')
        cursor = get_cursor()
        cursor.execute("insert into patient(pid,pfname,plname,pgender,pbd,prace,pstatus) values('%s','%s','%s','%s','0000-00-00 00:00:00','%s','%s')"%(inputpid,inputpfn,inputpln,inputpgender,inputprace,inputpstatus))
        return redirect(reverse('index'))


def patient_detail(request,pid):
    cursor = get_cursor()
    cursor.execute("select * from patient where pid = %s" % pid)
    patient = cursor.fetchone()
    return render(request,'patient_detail.html',context={'patient': patient})


def delete_patient(request):
    if request.method == 'POST':
        pid = request.POST.get('pid')
        cursor = get_cursor()
        cursor.execute("delete from patient where pid =%s "%pid)
        return redirect(reverse('index'))
    else:
        raise RuntimeError("error in modify of patient!")


def modify_patient(request):
    if request.method == 'GET':
        return render(request,'modify_patient.html')
    else:
        modifypid = request.POST.get('modifypid')
        modifycontent = request.POST.get('modifycontent')
        modifyattribute = request.POST.get('modifyattribute')
        cursor = get_cursor()
        cursor.execute("update patient set %s='%s' where pid='%s'"%(modifyattribute,modifycontent,modifypid))
        return redirect(reverse('index'))


def select_patient(request):
    if request.method == 'GET':
        return render(request,'select_patient.html')
    else:
        selectcontent = request.POST.get('selectcontent')
        selectattribute = request.POST.get('selectattribute')
        cursor = get_cursor()
        cursor.execute("select * from patient where %s='%s'"%(selectattribute,selectcontent))
        result = cursor.fetchall()
        return render(request,'patient_detail_2.html',context={'result':result})



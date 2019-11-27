from django.shortcuts import render,redirect,reverse
from django.db import connection
from django.http import HttpResponse

def get_cursor():
    return connection.cursor()

def index(request):
    return render(request,'index.html')

#添加、修改、查询 存在拼接sql的情况

#PATIENT
def patient_list(request):
    cursor = get_cursor()
    cursor.execute('select pid,pfname,plname from patient')
    patients = cursor.fetchall()
    return render(request, 'table_patient/patient_list.html', context={'patients':patients})


def add_patient(request):
    if request.method == 'GET':
        return render(request, 'table_patient/add_patient.html')
    else:
        inputpid = request.POST.get('inputpid')
        inputpfn = request.POST.get('inputpfn')
        inputpln = request.POST.get('inputpln')
        inputpgender = request.POST.get('inputpgender')
        inputpbd = request.POST.get('inputpbd')
        inputprace = request.POST.get('inputprace')
        inputpstatus = request.POST.get('inputpstatus')
        cursor = get_cursor()
        sql = "insert into patient(pid,pfname,plname,pgender,pbd,prace,pstatus) values('%s','%s','%s','%s','0000-00-00 00:00:00','%s','%s')"
        cursor.execute(sql%(inputpid,inputpfn,inputpln,inputpgender,inputprace,inputpstatus))
        sql1 = "update patient set pbd = cast(substring('%s fdas',1,19) as datetime) where pid='%s'"
        cursor.execute(sql1%(inputpbd,inputpid))
        return redirect(reverse('index'))


def patient_detail(request,pid):
    cursor = get_cursor()
    sql = "select * from patient where pid = %s"
    cursor.execute(sql,(pid,))
    patient = cursor.fetchone()
    return render(request, 'table_patient/patient_detail.html', context={'patient': patient})


def delete_patient(request):
    if request.method == 'POST':
        pid = request.POST.get('pid')
        cursor = get_cursor()
        sql = "delete from patient where pid =%s "
        cursor.execute(sql,(pid,))
        return redirect(reverse('index'))
    else:
        raise RuntimeError("error in deletion of patient!")


def modify_patient(request):
    if request.method == 'GET':
        return render(request, 'table_patient/modify_patient.html')
    else:
        modifypid = request.POST.get('modifypid')
        modifycontent = request.POST.get('modifycontent')
        modifyattribute = request.POST.get('modifyattribute')
        cursor = get_cursor()
        if modifyattribute != "pdb":
            sql = "update patient set %s='%s' where pid='%s'"
            cursor.execute(sql%(modifyattribute,modifycontent,modifypid))
            return redirect(reverse('index'))
        else:
            sql = "update patient set pbd=cast(substring('%s fdas',1,19) as datetime) where pid='%s'"
            cursor.execute(sql%(modifycontent,modifypid))
            return redirect(reverse('index'))

def select_patient(request):
    if request.method == 'GET':
        return render(request, 'table_patient/select_patient.html')
    else:
        content = []
        selectcontent = request.POST.get('selectcontent')
        selectattribute = request.POST.get('selectattribute')
        cursor = get_cursor()
        sql = "select * from patient where %s='%s'"
        cursor.execute(sql%(selectattribute,selectcontent))
        rows = cursor.fetchall()
        content.append(rows)
        return render(request, 'table_patient/patient_detail_2.html', context={'content':content})


#HOSPITAL
def hospital_list(request):
    cursor = get_cursor()
    cursor.execute('select hid,hname from hospital')
    hospitals = cursor.fetchall()
    return render(request, 'table_hospital/hospital_list.html', context={'hospitals':hospitals})


def hospital_detail(request,hid):
    cursor = get_cursor()
    sql = "select * from hospital where hid = %s"
    cursor.execute(sql,(hid,))
    hospital = cursor.fetchone()
    return render(request, 'table_hospital/hospital_detail.html', context={'hospital': hospital})


def delete_hospital(request):
    if request.method == 'POST':
        hid = request.POST.get('hid')
        cursor = get_cursor()
        sql = "delete from hospital where hid =%s "
        cursor.execute(sql,(hid,))
        return redirect(reverse('index'))
    else:
        raise RuntimeError("error in deletion of hospital!")


def add_hospital(request):
    if request.method == 'GET':
        return render(request, 'table_hospital/add_hospital.html')
    else:
        inputhid = request.POST.get('inputhid')
        inputhname = request.POST.get('inputhname')
        inputhadd = request.POST.get('inputhadd')
        inputhcity = request.POST.get('inputhcity')
        inputhstate = request.POST.get('inputhstate')
        inputhzip = request.POST.get('inputhzip')
        cursor = get_cursor()
        sql = "insert into hospital(hid,hname,hst_address,hst_city,hstate,hzip) values('%s','%s','%s','%s','%s','%s')"
        cursor.execute(sql%(inputhid,inputhname,inputhadd,inputhcity,inputhstate,inputhzip))
        return redirect(reverse('index'))


def modify_hospital(request):
    if request.method == 'GET':
        return render(request, 'table_hospital/modify_hospital.html')
    else:
        modifyhid = request.POST.get('modifyhid')
        modifycontent = request.POST.get('modifycontent')
        modifyattribute = request.POST.get('modifyattribute')
        cursor = get_cursor()
        sql = "update hospital set %s='%s' where hid='%s'"
        cursor.execute(sql%(modifyattribute,modifycontent,modifyhid))
        return redirect(reverse('index'))


def select_hospital(request):
    if request.method == 'GET':
        return render(request, 'table_hospital/select_hospital.html')
    else:
        content = []
        selectcontent = request.POST.get('selectcontent')
        selectattribute = request.POST.get('selectattribute')
        cursor = get_cursor()
        sql = "select * from hospital where %s='%s'"
        cursor.execute(sql%(selectattribute,selectcontent))
        rows = cursor.fetchall()
        content.append(rows)
        return render(request, 'table_hospital/hospital_detail_2.html', context={'content':content})


#users
def users_list(request):
    cursor = get_cursor()
    cursor.execute('select usid,ufname,ulname from users')
    users = cursor.fetchall()
    return render(request, 'table_users/users_list.html', context={'users':users})

def users_detail(request,usid):
    cursor = get_cursor()
    sql = "select * from users where usid = %s"
    cursor.execute(sql,(usid,))
    users = cursor.fetchone()
    return render(request, 'table_users/users_detail.html', context={'users': users})

def delete_users(request):
    if request.method == 'POST':
        usid = request.POST.get('usid')
        cursor = get_cursor()
        sql = "delete from users where usid =%s "
        cursor.execute(sql,(usid,))
        return redirect(reverse('index'))
    else:
        raise RuntimeError("error in deletion of users!")


def add_users(request):
    if request.method == 'GET':
        return render(request, 'table_users/add_users.html')
    else:
        inputusid = request.POST.get('inputusid')
        inputufname = request.POST.get('inputufname')
        inputulname = request.POST.get('inputulname')
        inputurole = request.POST.get('inputurole')
        inputdid = request.POST.get('inputdid')
        cursor = get_cursor()
        sql = "insert into users(usid,ufname,ulname,urole,did) values('%s','%s','%s','%s','%s')"
        cursor.execute(sql%(inputusid,inputufname,inputulname,inputurole,inputdid))
        return redirect(reverse('index'))

def modify_users(request):
    if request.method == 'GET':
        return render(request, 'table_users/modify_users.html')
    else:
        modifyusid = request.POST.get('modifyusid')
        modifycontent = request.POST.get('modifycontent')
        modifyattribute = request.POST.get('modifyattribute')
        cursor = get_cursor()
        sql = "update users set %s='%s' where usid='%s'"
        cursor.execute(sql%(modifyattribute,modifycontent,modifyusid))
        return redirect(reverse('index'))

def select_users(request):
    if request.method == 'GET':
        return render(request, 'table_users/select_users.html')
    else:
        content = []
        selectcontent = request.POST.get('selectcontent')
        selectattribute = request.POST.get('selectattribute')
        cursor = get_cursor()
        sql = "select * from users where %s='%s'"
        cursor.execute(sql%(selectattribute,selectcontent))
        rows = cursor.fetchall()
        content.append(rows)
        return render(request, 'table_users/users_detail_2.html', context={'content':content})
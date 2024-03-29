from django.shortcuts import render
from django.db import connection

from django.shortcuts import render,redirect,reverse
from django.db import connection
from django.http import HttpResponse, JsonResponse

from django.template import loader
import json
import pymysql


def get_cursor():
    return connection.cursor()


cnx = pymysql.connect(host='localhost',
                              user='root',
                              password='Nyuxzj1234',
                              db='webapp',
                              charset='utf8mb4',
                              cursorclass=pymysql.cursors.DictCursor)


def run_q(q, arg, fetch=False):
    cursor = cnx.cursor()
    try:
        cursor.execute(q, arg)
    except Exception as e:
        print("Exception:",e)
        raise e
    
    if fetch:
        result = cursor.fetchall()
    else:
        result = None
    cnx.commit()
    return result


def index(request):
    if request.method == "GET":
        return render(request, 'login/login.html')
    elif request.is_ajax():
        result = 'success'
        return HttpResponse(json.dumps(result))
    elif request.method == "POST":
        if "signin" in request.POST:
            email = request.POST.get('inputEmail')
            pwd = request.POST.get('inputPassword')
            query_sql = "SELECT * from account where email = %s and pwd = %s;"
            t  = (str(email),str(pwd))
            res = run_q(query_sql,t,True)
            if len(res) == 0:
                return render(request, 'login/login.html', context={'msg':"Your email doesn't match the password, please try again"})
            return render(request, 'welcome.html')


def log_create(request):
    if request.method == "GET":
        return render(request, 'login/logcreate.html')
    elif request.method == "POST":
        email = request.POST.get('inputEmail')
        pwd = request.POST.get('inputPassword')
        query_sql = "INSERT INTO account VALUES(%s, %s)"
        t  = (str(email),str(pwd))
        try:
            run_q(query_sql, t)
        except:
            return render(request, 'login/logcreate.html', context={'msg':"Your account already exists"})
        return redirect(reverse('index'))


def welcome(request):
    return render(request, 'welcome.html')


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
        query_sql = "insert into patient(pid,pfname,plname,pgender,pbd,prace,pstatus) values(%s,%s,%s,%s, STR_TO_DATE(%s,'%%Y-%%m-%%d'),%s,%s);"
        t = (str(inputpid),str(inputpfn),str(inputpln),str(inputpgender),str(inputpbd), str(inputprace),str(inputpstatus))
        try:
            run_q(query_sql, t)
        except:
            return render(request, 'table_patient/add_patient.html', context={'msg':"Add Patient Error, patient ID already exists"})
        return redirect(reverse('patient_list'))


def patient_detail(request,pid):
    cursor = get_cursor()
    sql = "select * from patient where pid = %s"
    cursor.execute(sql,(str(pid),))
    patient = cursor.fetchone()
    return render(request, 'table_patient/patient_detail.html', context={'patient': patient})


def delete_patient(request):
    if request.method == 'POST':
        pid = request.POST.get('pid')
        cursor = get_cursor()
        sql = "delete from patient where pid =%s "
        try:
            cursor.execute(sql,(pid,))
        except:
            return render(request, 'table_patient/patient_detail.html', context={'msg':"Cannot delete this record"})
        return redirect(reverse('patient_list'))
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
            sql = "update patient set %s=%s where pid=%s;"
            try:
                cursor.execute(sql%(modifyattribute,modifycontent,modifypid))
            except Exception as e:
                return render(request, 'table_patient/modify_patient.html', context={'msg':str(e)})
            return redirect(reverse('patient_list'))
        else:
            sql = "update patient set pbd=STR_TO_DATE(%s,'%%Y-%%m-%%d') where pid=%s;"
            t = (modifycontent,modifypid)
            try:
                run_q(sql, t)
            except Exception as e:
                return render(request, 'table_patient/modify_patient.html', context={'msg':str(e)})
            return redirect(reverse('patient_list'))


def select_patient(request):
    if request.method == 'GET':
        return render(request, 'table_patient/select_patient.html')
    else:
        content = []
        selectcontent = request.POST.get('selectcontent')
        selectattribute = request.POST.get('selectattribute')
        cursor = get_cursor()
        sql = "select * from patient where %s=%s;"
        cursor.execute(sql%(selectattribute,selectcontent))
        rows = cursor.fetchall()
        if len(rows) == 0:
            return render(request, 'table_patient/select_patient.html', context={'msg':"Do not exists"})
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
        sql = "delete from hospital where hid =%s; "
        try:
            cursor.execute(sql,(hid,))
        except:
            return render(request, 'table_hospital/hospital_detail.html', context={'msg':"Cannot delete this record"})
        return redirect(reverse('hospital_list'))
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
        sql = "insert into hospital(hid,hname,hst_address,hst_city,hstate,hzip) values(%s,%s,%s,%s,%s,%s);"
        t = (str(inputhid),inputhname,inputhadd,inputhcity,inputhstate,str(inputhzip))
        try:
            run_q(sql, t)
        except:
            return render(request, 'table_hospital/add_hospital.html', context={'msg': "Add hospital error, hospital ID already exists!"})
        return redirect(reverse('hospital_list'))


def modify_hospital(request):
    if request.method == 'GET':
        return render(request, 'table_hospital/modify_hospital.html')
    else:
        modifyhid = request.POST.get('modifyhid')
        modifycontent = request.POST.get('modifycontent')
        modifyattribute = request.POST.get('modifyattribute')
        cursor = get_cursor()
        sql = "update hospital set %s='%s' where hid='%s'"
        try:
            cursor.execute(sql%(modifyattribute,modifycontent,modifyhid))
        except Exception as e:
            return render(request, 'table_hospital/modify_hospital.html', context={'msg':str(e)})
        return redirect(reverse('hospital_list'))


def select_hospital(request):
    if request.method == 'GET':
        return render(request, 'table_hospital/select_hospital.html')
    else:
        content = []
        selectcontent = request.POST.get('selectcontent')
        selectattribute = request.POST.get('selectattribute')
        cursor = get_cursor()
        sql = "select * from hospital where %s=%s"
        cursor.execute(sql%(selectattribute,selectcontent))
        rows = cursor.fetchall()
        if len(rows) == 0:
            return render(request, 'table_hospital/select_hospital.html', context={'msg':"Do not exists"})
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
        sql = "delete from users where usid =%s;"
        try:
            cursor.execute(sql,(usid,))
        except:
            return render(request, 'table_users/users_detail.html', context={'msg':"Cannot delete this record"})
        return redirect(reverse('users_list'))
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
        sql = "insert into users(usid,ufname,ulname,urole,did) values(%s,%s,%s,%s,%s);"
        t = (str(inputusid),inputufname,inputulname,inputurole,str(inputdid))
        try:
            run_q(sql, t)
        except:
            return render(request, 'table_users/add_users.html', context={'msg':"Add User Error"})
        return redirect(reverse('users_list'))


def modify_users(request):
    if request.method == 'GET':
        return render(request, 'table_users/modify_users.html')
    else:
        modifyusid = request.POST.get('modifyusid')
        modifycontent = request.POST.get('modifycontent')
        modifyattribute = request.POST.get('modifyattribute')
        cursor = get_cursor()
        sql = "update users set %s='%s' where usid='%s'"
        try:
            cursor.execute(sql%(modifyattribute,modifycontent,modifyusid))
        except Exception as e:
            return render(request, 'table_users/modify_users.html', context={'msg':str(e)})
        return redirect(reverse('users_list'))


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
        if rows == 0:
            return render(request, 'table_users/select_users.html', context="Do not exists")
        content.append(rows)
        return render(request, 'table_users/users_detail_2.html', context={'content':content})
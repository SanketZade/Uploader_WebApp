pro_userid=request.form['pro_userid']
accesstype=request.form['accesstype']
accesstime=request.form['accesstime']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_professional_login_log(pro_userid,accesstype,accesstime)VALUES(%s,%s,%s)",(pro_userid,accesstype,accesstime))

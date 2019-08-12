pro_userid=request.form['pro_userid']
role=request.form['role']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_professional_role(pro_userid,role)VALUES(%s,%s)",(pro_userid,role))

prouser_id=request.form['prouser_id']
pro_username=request.form['pro_username']
pro_password=request.form['pro_password']
account_active=request.form['account_active']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_professional_login_account(pro_userid,pro_username,pro_password,account_active)VALUES(%s,%s,%s,%s)",(prouser_id,pro_username,pro_password,account_active))

prouser_id=request.form['prouser_id']
patient_name=request.form['patient_name']
affiliation=request.form['affiliation']
institute=request.form['institute']
address=request.form['address']
contact=request.form['contact']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_professional_account_master(prouser_id,patient_name,affiliation,institute,address,contact)VALUES(%s,%s,%s,%s,%s,%s)",(prouser_id,patient_name,affiliation,institute,address,contact))

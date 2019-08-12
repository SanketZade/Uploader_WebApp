examination_id=request.form['examination_id']
medical_data_id=request.form['medical_data_id']
examination_time=request.form['examination_time']
entry_by=request.form['entry_by']
entry_time=request.form['entry_time']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_medicaldata_entry(examination_id,medical_data_id,examination_time,entry_by,entry_time)VALUES(%s,%s,%s,%s,%s)",(examination_id,medical_data_id,examination_time,entry_by,entry_time)

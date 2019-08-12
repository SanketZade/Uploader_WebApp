medical_data_id=request.form['medicaldata_id']
patient_name=request.form['patient_name']
age=request.form['age']
gender=request.form['gender']
address=request.form['address']
contact=request.form['contact']
entry_by=request.form['entry_by']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_medicaldata_clinical_master(medical_data_id,patient_name,age,gender,address,contact,entry_by)VALUES(%s,%s,%s,%s,%s,%s,%s)",(medical_data,patient_name,age,gender,address,contact,entry_by))

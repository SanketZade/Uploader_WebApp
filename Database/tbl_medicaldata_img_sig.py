imgsig_id=request.form['imgsig_id']
examination_id=request.form['examination_id']
medicaldata_imgsignal=request.form['medicaldata_imgsignal']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_medicaldata_img_sig(imgsig_id,examination_id,medicaldata_imgsignal)VALUES(%s,%s,%s)",(imgsig_id,examination_id,medicaldata_imgsignal)

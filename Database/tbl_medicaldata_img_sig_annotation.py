imgsig_id=request.form['imgsig_id']
label_info=request.form['label_info']
annotated_by=request.form['annotated_by']
disease_code=request.form['disease_code']
entry_time=request.form['entry_time']
update_time=request.form['update_time']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_medicaldata_img_sig_annotation(imgsig_id,label_info,annotated_by,disease_code,entry_time,update_time)VALUES(%s,%s,%s,%s,%s,%s)",(imgsig_id,label_info,annotated_by,disease_code,entry_time,update_time))

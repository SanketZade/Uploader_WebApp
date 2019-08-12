imgsig_id=request.form['imgsig_id']
diseasecode=request.form['diseasecode']
diseasename=request.form['diseasename']
cur=mysql.connection.cursor()
cur.execute("INSERT INTO tbl_imgsig_disease_label(imgsig_id,diseasecode,diseasename)VALUES(%s,%s,%s)",(imgsig_id,diseasecode,diseasename))

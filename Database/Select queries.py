SELECT tpla.pro_userid FROM tbl_professional_login_account AS tpla WHERE tpla.pro_username = %s AND tpla.pro_password = %s AND tpla.account_active = 'TRUE'


SELECT
tpam.uname,
tpam.affiliation,
tpam.institute,
tpam.address,
tpam.contact
FROM
tbl_professional_account_master AS tpam
WHERE
tpam.pro_userid = '%s'


SELECT
tpr.role
FROM
tbl_professional_role AS tpr
WHERE
tpr.pro_userid = '%s'


SELECT
tbl_medicaldata_clinical_master.medical_data_id,
tbl_medicaldata_entry.examination_id,
tbl_medicaldata_clinical_master.patient_name,
tbl_imgsig_disease_label.diseasecode,
tbl_medicaldata_clinical_master.age,
tbl_medicaldata_clinical_master.gender,
DATE(tbl_medicaldata_entry.entry_time)
FROM
tbl_medicaldata_clinical_master
INNER JOIN tbl_medicaldata_entry ON tbl_medicaldata_entry.medical_data_id = tbl_medicaldata_clinical_master.medical_data_id
LEFT JOIN  tbl_imgsig_disease_label ON tbl_imgsig_disease_label.examination_id = tbl_medicaldata_entry.examination_id
WHERE
tbl_medicaldata_entry.examination_type = 'ecg' AND
DATE(tbl_medicaldata_entry.entry_time) BETWEEN '2012-08-12' AND '2019-12-12' AND
tbl_medicaldata_clinical_master.access_role = '1'
ORDER BY
tbl_medicaldata_entry.entry_time DESC


SELECT
tbl_medicaldata_img_sig.examination_id,
tbl_medicaldata_img_sig.medicaldata_imgsignal
FROM
tbl_medicaldata_img_sig
WHERE
tbl_medicaldata_img_sig.imgsig_id = '%s'


SELECT
tbl_medicaldata_img_sig_annotation.label_info,
tbl_medicaldata_img_sig_annotation.disease_code,
tbl_medicaldata_img_sig_annotation.entry_time,
tbl_medicaldata_img_sig_annotation.update_time
FROM
tbl_medicaldata_img_sig_annotation
WHERE
tbl_medicaldata_img_sig_annotation.imgsig_id = '%s'


SELECT
tbl_imgsig_disease_label.diseasecode,
tbl_imgsig_disease_label.diseasename
FROM
tbl_imgsig_disease_label
WHERE
tbl_imgsig_disease_label.examination_id = '%s'

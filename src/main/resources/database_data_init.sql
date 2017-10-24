# Init Data

# init patient
INSERT INTO patient (patient_number, id_number, real_name, ethnicity, gender, age, height, weight)
VALUES (123456, '351234199009281234', '李四', '汉族', '男', 22, 180, 75);
INSERT INTO patient (patient_number, id_number, real_name, ethnicity, gender, age, height, weight)
VALUES (123457, '354321199009281234', '陈小二', '回族', '女', 33, 168, 65);

# init imaging_examination_category
INSERT INTO imaging_examination_category (imaging_examination_category_name)
VALUES ('全脊柱');
INSERT INTO imaging_examination_category (imaging_examination_category_name)
VALUES ('下肢');

# init imaging_examination_item
INSERT INTO imaging_examination_item (imaging_examination_category_id, imaging_examination_category_name, imaging_examination_item_name)
VALUES ((SELECT id
         FROM imaging_examination_category
         WHERE imaging_examination_category.imaging_examination_category_name = '下肢'), '下肢', '髋关节');

INSERT INTO imaging_examination_item (imaging_examination_category_id, imaging_examination_category_name, imaging_examination_item_name)
VALUES ((SELECT id
         FROM imaging_examination_category
         WHERE imaging_examination_category.imaging_examination_category_name = '下肢'), '下肢', '膝关节');

INSERT INTO imaging_examination_item (imaging_examination_category_id, imaging_examination_category_name, imaging_examination_item_name)
VALUES ((SELECT id
         FROM imaging_examination_category
         WHERE imaging_examination_category.imaging_examination_category_name = '下肢'), '下肢', '踝关节');


# init imaging_examination_item_option
INSERT INTO imaging_examination_item_option (imaging_examination_item_id, imaging_examination_item_name, imaging_examination_item_option_name)
VALUES ((SELECT id
         FROM imaging_examination_item
         WHERE imaging_examination_item.imaging_examination_item_name = '髋关节'), '髋关节', '左侧');

INSERT INTO imaging_examination_item_option (imaging_examination_item_id, imaging_examination_item_name, imaging_examination_item_option_name)
VALUES ((SELECT id
         FROM imaging_examination_item
         WHERE imaging_examination_item.imaging_examination_item_name = '髋关节'), '髋关节', '右侧');

INSERT INTO imaging_examination_item_option (imaging_examination_item_id, imaging_examination_item_name, imaging_examination_item_option_name)
VALUES ((SELECT id
         FROM imaging_examination_item
         WHERE imaging_examination_item.imaging_examination_item_name = '膝关节'), '膝关节', '左侧');

INSERT INTO imaging_examination_item_option (imaging_examination_item_id, imaging_examination_item_name, imaging_examination_item_option_name)
VALUES ((SELECT id
         FROM imaging_examination_item
         WHERE imaging_examination_item.imaging_examination_item_name = '膝关节'), '膝关节', '右侧');

INSERT INTO imaging_examination_item_option (imaging_examination_item_id, imaging_examination_item_name, imaging_examination_item_option_name)
VALUES ((SELECT id
         FROM imaging_examination_item
         WHERE imaging_examination_item.imaging_examination_item_name = '踝关节'), '踝关节', '左侧');

INSERT INTO imaging_examination_item_option (imaging_examination_item_id, imaging_examination_item_name, imaging_examination_item_option_name)
VALUES ((SELECT id
         FROM imaging_examination_item
         WHERE imaging_examination_item.imaging_examination_item_name = '踝关节'), '踝关节', '右侧');


# init patient_imaging_examination_record

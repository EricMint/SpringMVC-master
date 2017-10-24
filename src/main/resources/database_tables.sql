##############################################################################
USE bysy;
# 0.病人基本信息
CREATE TABLE IF NOT EXISTS `patient`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `patient_number` INT(11) NOT NULL COMMENT '人员编号',
  `id_number` VARCHAR(255) NOT NULL COMMENT '身份证号',
  `real_name` VARCHAR(45) NULL COMMENT '真实姓名',
  `ethnicity` VARCHAR(45) NULL COMMENT '民族',
  `gender` VARCHAR(45) NULL COMMENT  '性别',
  `age` INT(11) NULL COMMENT '年龄',
  `height` INT(11) NULL COMMENT '身高',
  `weight` INT(11) NULL COMMENT '体重',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '病人基本信息表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_patient_real_name ON patient(`real_name`);

##############################################################################
# 1.影像检查
CREATE TABLE IF NOT EXISTS `imaging_examination_category`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `imaging_examination_category_name` VARCHAR(45) NULL COMMENT '身体部位名称: 全脊柱/下肢/',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '影像检查部位表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_imaging_examination_category_category_name ON imaging_examination_category(`imaging_examination_category_name`);

CREATE TABLE IF NOT EXISTS `imaging_examination_item`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `imaging_examination_category_id` INT(11) NOT NULL COMMENT '影像检查部位ID',
  `imaging_examination_category_name` VARCHAR(45) NULL COMMENT '影像检查部位类别: 全脊柱/下肢/',
  `imaging_examination_item_name` VARCHAR(45) NULL COMMENT '影像检查具体事项: 髋关节/膝关节/踝关节',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '影像检查具体事项表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_imaging_examination_item_item_name ON imaging_examination_item(`imaging_examination_item_name`);
CREATE INDEX ix_imaging_examination_item_category_id ON imaging_examination_item(`imaging_examination_category_id`);

CREATE TABLE IF NOT EXISTS `imaging_examination_item_option`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `imaging_examination_item_id` INT(11) NOT NULL COMMENT '影像检查具体事项ID',
  `imaging_examination_item_name` VARCHAR(45) NULL COMMENT '影像检查具体事项: 髋关节/膝关节/踝关节',
  `imaging_examination_item_option_name` VARCHAR(45) NULL COMMENT '影像检查事项选项: 左侧/右侧/',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '影像检查具体事项表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_imaging_examination_item_option_option_name ON imaging_examination_item_option(`imaging_examination_item_option_name`);
CREATE INDEX ix_imaging_examination_item_option_item_id ON imaging_examination_item_option(`imaging_examination_item_id`);


CREATE TABLE IF NOT EXISTS `patient_imaging_examination_record`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `patient_id` INT(11) NOT NULL COMMENT '用户ID',
  `patient_number` INT(11) NOT NULL COMMENT '病人ID',
  `imaging_examination_category_id` INT(11) NOT NULL COMMENT '影像检查部位ID',
  `imaging_examination_category_name` VARCHAR(45) NULL COMMENT '影像检查部位名称',
  `imaging_examination_item_id` INT(11) NOT NULL COMMENT '影像检查具体事项ID',
  `imaging_examination_item_name` VARCHAR(45) NULL COMMENT '影像检查具体事项名称',
  `imaging_examination_item_option_id` INT(11) NOT NULL COMMENT '影像检查事项选项ID',
  `imaging_examination_item_option_name` VARCHAR(45) NULL COMMENT '影像检查事项选项名称',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '病人影像检查记录表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_patient_imaging_examination_record_patient_id ON patient_imaging_examination_record(patient_number);



##############################################################################
# 2.体格检查

CREATE TABLE IF NOT EXISTS `patient_physical_examination_record`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `physical_examination_category_id` INT(11) NOT NULL COMMENT '体格检查类别ID',
  `physical_examination_category_name` VARCHAR(45) NULL COMMENT '体格检查类别名称',
  `physical_examination_item_id` INT(11) NOT NULL COMMENT '体格检查事项ID',
  `physical_examination_item_name` VARCHAR(45) NULL COMMENT '体格检查事项名称',
  `physical_examination_item_option_id` INT(11) NOT NULL COMMENT '体格检查事项选项ID',
  `physical_examination_item_option_name` VARCHAR(45) NULL COMMENT '体格检查事项选项名称',
  `physical_examination_item_option_sub_id` INT(11) NOT NULL COMMENT '体格检查事项选项的子选项ID',
  `physical_examination_item_option_sub_name` VARCHAR(45) NULL COMMENT '体格检查事项选项的子选项名称',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '病人体格检查记录表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_patient_real_name ON patient(`real_name`);

CREATE TABLE IF NOT EXISTS `physical_examination_category`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `physical_examination_category_name` VARCHAR(45) NOT NULL COMMENT '体格检查类别: 脊柱组/髋关节/',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '体格检查类别表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_physical_examination_category_physical_examination_category_name ON physical_examination_category(`physical_examination_category_name`);

CREATE TABLE IF NOT EXISTS `physical_examination_item`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `physical_examination_category_id` INT(11) NOT NULL COMMENT '体格检查类别ID',
  `physical_examination_category_name` VARCHAR(45) NOT NULL COMMENT '体格检查类别: 脊柱组/髋关节/',
  `physical_examination_item_name` VARCHAR(45) NOT NULL COMMENT '体格检查事项名称: 侧突畸形/活动度/压痛/叩击痛/压颈试验/臂丛牵拉试验',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '体格检查事项表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_physical_examination_item_physical_examination_item_name ON physical_examination_item(`physical_examination_item_name`);
CREATE INDEX ix_physical_examination_item_physical_examination_category_id ON physical_examination_item(`physical_examination_category_id`);
# CREATE INDEX ix_physical_examination_item_physical_examination_category_name ON physical_examination_item(`physical_examination_category_name`);

CREATE TABLE IF NOT EXISTS `physical_examination_item_option`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `physical_examination_item_id` INT(11) NOT NULL COMMENT '体格检查事项ID',
  `physical_examination_item_name` VARCHAR(45) NOT NULL COMMENT '体格检查事项名称: 侧突畸形/活动度/压痛/叩击痛/压颈试验/臂丛牵拉试验',
  `physical_examination_item_option_name` VARCHAR(45) NOT NULL COMMENT '体格检查事项选项: 前突/后突/颈椎/胸椎/腰椎',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '体格检查事项选项表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_physical_examination_item_option_physical_examination_item_option_name ON physical_examination_item_option(`physical_examination_item_option_name`);
CREATE INDEX ix_physical_examination_item_option_physical_examination_item_id ON physical_examination_item_option(`physical_examination_item_id`);

CREATE TABLE IF NOT EXISTS `physical_examination_item_option_sub`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `physical_examination_item_option_id` INT(11) NOT NULL COMMENT '体格检查事项ID',
  `physical_examination_item_option_name` VARCHAR(45) NOT NULL COMMENT '体格检查事项选项: 前突/后突/颈椎/胸椎/腰椎',
  `physical_examination_item_option_sub_name` VARCHAR(45) NOT NULL COMMENT '体格检查事项选项的子选项: 前屈/后伸/左侧弯/右侧弯/左侧旋',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '体格检查事项选项子选项表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_physical_examination_item_option_sub_physical_examination_item_option_sub_name ON physical_examination_item_option_sub(`physical_examination_item_option_sub_name`);
CREATE INDEX ix_physical_examination_item_option_sub_physical_examination_item_option_id ON physical_examination_item_option_sub(`physical_examination_item_option_id`);


##############################################################################
# 3.数据测量

CREATE TABLE IF NOT EXISTS `patient_data_measure_record`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `data_measure_category_name_id` INT(11) NOT NULL COMMENT '数据测量类别ID',
  `data_measure_category_name` VARCHAR(45) NULL COMMENT '数据测量类别名称',
  `data_measure_item_id` INT(11) NOT NULL COMMENT '数据测量事项ID',
  `data_measure_item_name` VARCHAR(45) NULL COMMENT '数据测量事项名称',
  `data_measure_item_option_id` INT(11) NOT NULL COMMENT '数据测量事项选项ID',
  `data_measure_item_option_name` VARCHAR(45) NULL COMMENT '数据测量事项选项名称',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '病人数据测量记录表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_patient_real_name ON patient(`real_name`);

CREATE TABLE IF NOT EXISTS `data_measure_category`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `data_measure_category_name` VARCHAR(45) NOT NULL COMMENT '数据测量类别: 脊柱/髋关节/',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '数据测量类别表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_data_measure_category_data_measure_category_name ON data_measure_category(`data_measure_category_name`);

CREATE TABLE IF NOT EXISTS `data_measure_item`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `data_measure_category_id` INT(11) NOT NULL COMMENT '数据测量类别ID',
  `data_measure_category_name` VARCHAR(45) NOT NULL COMMENT '数据测量类别: 脊柱/髋关节/',
  `data_measure_item_name` VARCHAR(45) NOT NULL COMMENT '数据测量事项: 颈椎/胸椎/腰椎',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '数据测量事项表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_data_measure_item_data_measure_item_name ON data_measure_item(`data_measure_item_name`);
CREATE INDEX ix_data_measure_item_data_measure_category_id ON data_measure_item(`data_measure_category_id`);

CREATE TABLE IF NOT EXISTS `data_measure_item_option`(
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `data_measure_item_id` INT(11) NOT NULL COMMENT '数据测量类别ID',
  `data_measure_item_name` VARCHAR(45) NOT NULL COMMENT '数据测量事项: 颈椎/胸椎/腰椎',
  `data_measure_item_option_name` VARCHAR(45) NOT NULL COMMENT '数据测量事项选项: 颈1/颈7/胸12',
  `create_time` TIMESTAMP NOT NULL DEFAULT 0 COMMENT '创建时间',
  `create_by` VARCHAR(45) NOT NULL DEFAULT 'system' COMMENT '创建者',
  `update_time` TIMESTAMP NULL COMMENT '更新时间',
  `update_by` VARCHAR(45) NULL COMMENT '更新者',
   PRIMARY KEY (`id`)
) COMMENT = '数据测量事项选项表' ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE INDEX ix_data_measure_item_option ON data_measure_item_option(`data_measure_item_name`);
CREATE INDEX ix_data_measure_item_option ON data_measure_item_option(`data_measure_item_id`);

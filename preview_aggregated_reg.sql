CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `reomi`@`%` 
    SQL SECURITY DEFINER
VIEW `db_center`.`preview_aggregated_reg` AS
    SELECT 
        `r`.`semester` AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        `r`.`grade` AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        `r`.`crelec` AS `crelec`,
        `r`.`crelab` AS `crelab`,
        `r`.`regist_type` AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        `c`.`bulletin_id` AS `bulletin_id`,
        0 AS `yearly`
    FROM
        (`db_center`.`tbl_reg` `r`
        LEFT JOIN `db_center`.`aggregated_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = `r`.`semester`)
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`))))
    WHERE
        (`r`.`transfer_to_acad` = 0) 
    UNION SELECT 
        `r`.`semester` AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        NULL AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        `r`.`crelec` AS `crelec`,
        `r`.`crelab` AS `crelab`,
        `r`.`regist_type` AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        `c`.`bulletin_id` AS `bulletin_id`,
        0 AS `yearly`
    FROM
        (`db_regist`.`tbl_reg` `r`
        LEFT JOIN `db_center`.`aggregated_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = `r`.`semester`)
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`)))) 
    UNION SELECT 
        '1' AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        NULL AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        `r`.`crelec` AS `crelec`,
        `r`.`crelab` AS `crelab`,
        `r`.`regist_type` AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        `c`.`bulletin_id` AS `bulletin_id`,
        1 AS `yearly`
    FROM
        (`db_center`.`tbl_reg_yearly` `r`
        LEFT JOIN `db_center`.`aggregated_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = '1')
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`))))
    WHERE
        (`r`.`transfer_to_acad` = 0) 
    UNION SELECT 
        '1' AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        NULL AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        `r`.`crelec` AS `crelec`,
        `r`.`crelab` AS `crelab`,
        `r`.`regist_type` AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        `c`.`bulletin_id` AS `bulletin_id`,
        1 AS `yearly`
    FROM
        (`db_regist`.`tbl_reg_yearly` `r`
        LEFT JOIN `db_center`.`aggregated_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = 1)
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`)))) 
    UNION SELECT 
        '1' AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        NULL AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        `r`.`crelec` AS `crelec`,
        `r`.`crelab` AS `crelab`,
        `r`.`regist_type` AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        `c`.`bulletin_id` AS `bulletin_id`,
        1 AS `yearly`
    FROM
        (`db_regist_yearly`.`tbl_reg_yearly` `r`
        LEFT JOIN `db_center`.`aggregated_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = '1')
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`))))
    WHERE
        (`r`.`year` = 2565) 
    UNION SELECT 
        `r`.`semester` AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        NULL AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        `mr`.`crelec` AS `crelec`,
        `mr`.`crelab` AS `crelab`,
        `r`.`regist_type` AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        `c`.`bulletin_id` AS `bulletin_id`,
        0 AS `yearly`
    FROM
        ((`db_regist`.`tbl_reg_lab` `r`
        LEFT JOIN `db_regist`.`tbl_reg` `mr` ON (((`r`.`year` = `mr`.`year`)
            AND (`r`.`semester` = `mr`.`semester`)
            AND (`r`.`courseno` = `mr`.`courseno`)
            AND (`r`.`student_id` = `mr`.`student_id`))))
        LEFT JOIN `db_center`.`aggregated_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = `r`.`semester`)
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`)))) 
    UNION SELECT 
        `r`.`semester` AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        `r`.`grade` AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        IF((`b`.`crelec` IS NOT NULL),
            `b`.`crelec`,
            `ab`.`crelec`) AS `crelec`,
        IF((`b`.`crelab` IS NOT NULL),
            `b`.`crelab`,
            `ab`.`crelab`) AS `crelab`,
        NULL AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        IF((`b`.`bulletin_id` IS NOT NULL),
            `b`.`bulletin_id`,
            `ab`.`bulletin_id`) AS `bulletin_id`,
        `r`.`yearly` AS `yearly`
    FROM
        (((`db_center`.`tbl_acad` `r`
        LEFT JOIN `db_center`.`tbl_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = `r`.`semester`)
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`))))
        LEFT JOIN `db_center`.`tbl_bulletin` `b` ON ((`c`.`bulletin_id` = `b`.`bulletin_id`)))
        LEFT JOIN `db_center`.`tbl_bulletin` `ab` ON ((`r`.`bulletin_id` = `ab`.`bulletin_id`)))
    WHERE
        ((`r`.`semester` <> '0')
            AND (`r`.`year` <> '0000')) 
    UNION SELECT 
        `r`.`semester` AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        `r`.`grade` AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        IF((`b`.`crelec` IS NOT NULL),
            `b`.`crelec`,
            `ab`.`crelec`) AS `crelec`,
        IF((`b`.`crelab` IS NOT NULL),
            `b`.`crelab`,
            `ab`.`crelab`) AS `crelab`,
        NULL AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        IF((`b`.`bulletin_id` IS NOT NULL),
            `b`.`bulletin_id`,
            `ab`.`bulletin_id`) AS `bulletin_id`,
        `r`.`yearly` AS `yearly`
    FROM
        (((`db_center`.`tbl_acad_grad` `r`
        LEFT JOIN `db_center`.`tbl_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = `r`.`semester`)
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`))))
        LEFT JOIN `db_center`.`tbl_bulletin` `b` ON ((`c`.`bulletin_id` = `b`.`bulletin_id`)))
        LEFT JOIN `db_center`.`tbl_bulletin` `ab` ON ((`r`.`bulletin_id` = `ab`.`bulletin_id`)))
    WHERE
        ((`r`.`semester` <> '0')
            AND (`r`.`year` <> '0000')) 
    UNION SELECT 
        `r`.`semester` AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        `r`.`grade` AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec` AS `seclec`,
        `r`.`seclab` AS `seclab`,
        IF((`b`.`crelec` IS NOT NULL),
            `b`.`crelec`,
            `ab`.`crelec`) AS `crelec`,
        IF((`b`.`crelab` IS NOT NULL),
            `b`.`crelab`,
            `ab`.`crelab`) AS `crelab`,
        NULL AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        IF((`b`.`bulletin_id` IS NOT NULL),
            `b`.`bulletin_id`,
            `ab`.`bulletin_id`) AS `bulletin_id`,
        `r`.`yearly` AS `yearly`
    FROM
        (((`db_center`.`tbl_acad_out` `r`
        LEFT JOIN `db_center`.`tbl_cmr30` `c` ON (((`c`.`year` = `r`.`year`)
            AND (`c`.`semester` = `r`.`semester`)
            AND (`c`.`courseno` = `r`.`courseno`)
            AND (`c`.`seclec` = `r`.`seclec`)
            AND (`c`.`seclab` = `r`.`seclab`))))
        LEFT JOIN `db_center`.`tbl_bulletin` `b` ON ((`c`.`bulletin_id` = `b`.`bulletin_id`)))
        LEFT JOIN `db_center`.`tbl_bulletin` `ab` ON ((`r`.`bulletin_id` = `ab`.`bulletin_id`)))
    WHERE
        ((`r`.`semester` <> '0')
            AND (`r`.`year` <> '0000')) 
    UNION SELECT 
        `r`.`semester` AS `semester`,
        `r`.`year` AS `year`,
        `r`.`student_id` AS `student_id`,
        `r`.`grade` AS `grade`,
        `r`.`courseno` AS `courseno`,
        `r`.`seclec_lifelong` AS `seclec`,
        `r`.`seclab_lifelong` AS `seclab`,
        `b`.`crelec` AS `crelec`,
        `b`.`crelab` AS `crelab`,
        NULL AS `regist_type`,
        `r`.`input_date` AS `input_date`,
        `b`.`bulletin_id` AS `bulletin_id`,
        0 AS `yearly`
    FROM
        (`cmu_lifelong`.`tbl_acad` `r`
        LEFT JOIN `db_center`.`tbl_bulletin` `b` ON ((`b`.`bulletin_id` = `r`.`bulletin_id`)))

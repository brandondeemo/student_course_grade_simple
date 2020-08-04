# 课程-学生-成绩网页登录 简易模型 

###  项目目标  

设计一个学生成绩管理系统，包括以下功能：  
1.学生基础信息支持新增、修改和删除。  
 a.基础信息包含：姓名、性别、学号(要求唯一)、年龄等，可自行发挥增加字段。  
2.学科信息维护。  
3.学科成绩录入。  
4.学生学科成绩分析，例如：展示高等数学成绩高于90分的学生。  

###  所用工具  
1. mysql, JDBC  
2. tomcat  
3. JAVA,JSP,JavaScript  
4. html,css  

###  数据库建表
1.course表  
```  
CREATE TABLE `course` (
  `course_id` int NOT NULL,
  `course_name` varchar(45) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```  

2.student表  
```  
CREATE TABLE `student` (
  `name` varchar(20) NOT NULL,
  `id` int NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```  

3.course_student表  
```  
CREATE TABLE `course_student` (
  `course_id` int NOT NULL,
  `student_id` int NOT NULL,
  `grade` int NOT NULL,
  PRIMARY KEY (`course_id`,`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```  

###  结果展示  

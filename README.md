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

####  课程信息界面  
1. 学科基础信息支持新增、修改和删除    
2. 当前状态记录（第一次访问、成功添加、返回该网页）  
![course](https://github.com/brandondeemo/student_course_grade_simple/blob/master/web/images/ScreenFlow1.gif)  

####  学生信息界面
1. 学生基础信息支持新增、修改和删除     
   基础信息包含：姓名、性别、学号(要求唯一)、年龄  
2. 当前状态记录（第一次访问、成功添加、返回该网页） 
![student](https://github.com/brandondeemo/student_course_grade_simple/blob/master/web/images/ScreenFlow2.gif)  

####  成绩信息界面
1.学科成绩录入   
4.学生学科成绩分析，例如：展示平均分、最低分、最高分以及具体分数线以上分数人数  
![grade](https://github.com/brandondeemo/student_course_grade_simple/blob/master/web/images/ScreenFlow3.gif)  



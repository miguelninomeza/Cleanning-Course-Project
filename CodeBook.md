CodeBook
Getting and Cleaning Data course Project

After exploring, understanding and viewing the data the following steps where 
taken to address the activities requested to CLEAN AND GET TIDY DATA TABLES.

Step 1. I read all the files that will be needed into R using function 
read.table() since the file have a .txt format.
All the tables loaded are given the name of the files. 

Step 2. Since the tables loaded have no column names, we change it from the 
begining to make it more managle data. This step will complete the Activities 
numbers 3 and 4 of the assignment. 

        For this step the funciton used was colnames() for tables
        y_test & y_train corresponding to the 6 activities (Walking,laying,etc.)
        x_test & x_train corresponding to the 561 variables calculated.
        
        After this, 2 general tables were created using the cbind() funciton 
        for the test data set (containing 30% of the individuals studied)
        and the train data set (containing the other 70%). The names of these 
        tables are: test_data & train_data

Step 3. As I only wanted the variables calculated that contained mean and std
deviation calulatons out of the complete 561, I used the grep() function, 
resulting in 2 tables: train_ms (70% of the data) and t_ms (30% of the data).

Step 4. Finally I just combined both tables to get the full 100% data using the
funciton rbind(). Resulting in a table called project_dataset with the dimension
of 81 columuns containing the Activity Name, Subject and 79 calculated variables
that include mean and standard deviation out of the total 561. 

RESULT: project_dataset

Step 5. A final request to get a second independent tidy table with the average
of each activity and each indivdual or subject.
        
        For this task, I first grouped the table using group_by() funtion
        and then caluclated the average of the variables using the summarize()
        function. finally I "deleted" the column "subject" containing the 
        indivuals studied since you cant average people :)
        this new table containing averages by activity was named: a_data
        
        I did the same grouping once again but this time for the subjects (indi-
        viduals) and "deleted" the column activity since you cant average the
        activities. the table containing averages by subjects (individuals) was
        named: s_data
        
        Since I end up with 2 tables, I merged them using the funtion merge()
        and then ordered the table by getting activity and subject 
        columns at the begining of the table using the funtions select() and
        arrange(). 

RESULT: avg_data







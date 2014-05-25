 #A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data
 Variables:
 Subjects: Data from 30 subjects doing different activites.
 Activities: walking, walking upstairs, walking downstairs, sitting, standing, laying.
 measurments: average of mean and standard deviation of the measurment of various sensors
 
 Transformations:
 The data has been merged into one dataframe from  test and  training datasets by rbind, then the activities and subjects
 merged into the dataframe using cbinf command.
 
 The numeric values of the activities has been replaced with names through the activity lookup text file
 
 Then the columns were given header names from the features file using the merge function.
 
 Then the dataframe was reshaped using the melting function to aggregate the measurment per activity and per subject.
 

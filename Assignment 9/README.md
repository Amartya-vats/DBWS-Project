For this assignement we had to obtain all the logs from /var/log/apache2/access_log
This was achieved by the pyhton program parse_log.py this program uses the above mentioned 
log file and looks for matches with ~avats which is the login which has all the public files
and the database access. Once the py program opens the logs and obtians all the occurences of
~avats we output them into all_logs in the home directory for ~avats. Similarly we do the above
for the error log. We obtain the file all_error_logs.

Now we can work wth these new file with only our logs. Now we can do a parse just to get the IP,
the timeStamp, the webpage, and finally the browser. This is done by the python file data_extract.py
Now that we have all the data we can work on the timeline diagram. This can viewed in the Timeline PDF's. 

The timelines for error are :

    - Timeline what error occured and when

    - Website with error and time

    - All Client Errors with time

    - Types of error occured - just an aggregate for all the errors not an timeline

    - All Client Errors - just an aggregate for all the errors not an timeline

The timelines for the access log are :

    - For two example browsers are :

        - Timeline for Browser1 access

        - Timeline for Browser2 access

    - For access log with time and number of pages accessed : 

        - access_log_timeline_10_Nov

        - access_log_timeline_11_Nov 

        - access_log_timeline_12_Nov

        - access_log_timeline_13_Nov

        - all_access_log_timeline - just an aggregate for all access
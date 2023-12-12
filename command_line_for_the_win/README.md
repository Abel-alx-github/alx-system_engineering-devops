# Project title "command line for the win"
here is a description how i did this task

#firs i need the following information:
     1: Server address: IP address or hostname
         "9e5f2.........alx-cod.online"

     2: Username: Username for accessing the above server
        "9e5f.........3a68"

     3: Password: Password for the username
        "******************"

     4: Port number: Port used for SFTP (usually 22) but i did not spcified any 
        i used the defualt(22)

     5: command like "sftp" "put" "cd" "ls"

     6: Local file path: Path to the file(screenshots)

     7: Remote directory path: path to send on your local machine


# It looks like this on terminal
 1: first i esablished connection with remote server using
   
     #sftp username@server_address
       sftp 9e5f.........3a68@9e5f2.........alx-cod.online

 2: second authentication: as i wrote the above commamd it asked password
       password: ******************

 3: now i connecte with server machine
    to transfer file i used the following command

       put Local/file/path to/Remote/directory/path

       now the file is transfered to remote you can check 
       the file by changeing wordking directory using "cd"
       and list using "ls" 

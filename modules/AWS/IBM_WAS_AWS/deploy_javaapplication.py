import sys
from com.ibm.ws.scripting import *

server = AdminConfig.getid('/Servers/' + sys.argv[0])
app_name = "my_application"
app_file_path = "/path/to/application.war"
AdminApp.install(app_file_path, ['-server', server])

AdminConfig.save()
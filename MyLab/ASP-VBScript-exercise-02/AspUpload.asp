<%
dim uploadWorkNo
dim fileNewName

uploadWorkNo = Request.QueryString("WorkNo")
fileNewName = uploadWorkNo & ".pdf"

%>

<html>

<head>
<title>Please Upload Your File</title>
</head>

<body>

<!--<form enctype="multipart/form-data" method="post" action="upload.asp?FileName=<% Response.Write fileNewName %>">-->
<form enctype="multipart/form-data" method="post" action="upload.asp?FileName=<% Response.Write fileNewName %>">

Enter filename to upload:
<input type="file" id="myFile" name="myFile" /><br />
<input type="text" name="FileName" value=<% Response.Write fileNewName %> hidden />
<input type="submit" />

</form>
</body>
</html>
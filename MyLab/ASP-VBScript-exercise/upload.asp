<%@ language="vbscript" %>
<html>

<head>
<title>Upload File Results</title>
</head>

<body>
<%
Dim fileUpload
Set fileUpload = Server.CreateObject("SoftArtisans.FileUp")

fileUpload.Path = "D:\SayLingWen\Htmlroot\test\uploads"

'--- Check to be sure there was a file selected in the form
'--- If so, continue processing
If IsObject(fileUpload.Form("myFile")) Then
If Not fileUpload.Form("myFile").IsEmpty Then

'fileUpload.SaveAs "D:\SayLingWen\Htmlroot\test\uploads\upload.pdf" 
fileUpload.Save

Response.Write "FileUp Saved the File Successfully."
Else
Response.Write "There was no file submitted in the form field."
End If
Else
Response.Write "The referenced field does not exist " & _
"or is not of type=""file"""
End If

'--- Dereference FileUp
Set fileUpload = Nothing
%>
</body>
</html>
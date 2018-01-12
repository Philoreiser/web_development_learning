<%@ language="vbscript" %>
<html>

<head>
<title>Upload File Results</title>
</head>

<body>
<%

Dim fileName
Dim filePath

fileName = Request.QueryString("FileName")
filePath = "/Path/to/Save/Your/Uploads/"

Dim fileUpload
Set fileUpload = Server.CreateObject("SoftArtisans.FileUp")

fileUpload.Path = filePath

'--- Check to be sure there was a file selected in the form
'--- If so, continue processing
If IsObject(fileUpload.Form("myFile")) Then

    Response.Write "<h2>SchoolName: " & Session("MySchoolName") & "</h2>"

    If Not fileUpload.Form("myFile").IsEmpty Then


        'fileUpload.SaveAs "D:\SayLingWen\Htmlroot\test\uploads\upload.pdf" 
        'fileUpload.Save
        fileUpload.SaveAs filePath & "\" & fileName

        Response.Write "FileUp Saved the File Successfully: " & fileName & "<br>"
    
    Else
        Response.Write "There was no file submitted in the form field." & "<br>"
    End If
Else
    Response.Write "The referenced field does not exist " & _
    "or is not of type=""file""" & "<br>"
End If

Response.Write "<button id='btn-close'>Close Window</button>"

'--- Dereference FileUp
Set fileUpload = Nothing
%>

<!--<button id="btn-close">Close Window</button>-->

<script language='javascript' type='text/javascript'>

    var btnCloseWindow = document.getElementById('btn-close');

    btnCloseWindow.addEventListener('click', closeWindow, false);

    function closeWindow() {

        window.open('', '_self','');
        window.close();
    }
</script>

</body>
</html>
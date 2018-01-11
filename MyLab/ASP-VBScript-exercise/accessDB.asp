<%

'You may possibly need to save your source code in BIG5 or not, depending on your environment 
'(e.g. Windows Server 2003 in Chinese version)

myDBPath = Mid(Server.MapPath("/"), 1, InStrRev(Server.MapPath("/"), "\")) & "Directory\of\My\DataBase\myAccessDB.accdb;"

response.write Server.MapPath("/") & "<br>"
response.write InStrRev(Server.MapPath("/"), "\") & "<br>"
response.write myDBPath & "<br>"

Set myDBConn = Server.CreateObject("ADODB.Connection")

myConnStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & myDBPath

myDBConn.open myConnStr

Dim myArea, mySchoolName
myArea = "新北市"
mySchoolName = "市立新莊國中"

Dim query
query = "SELECT * FROM [作品] WHERE [縣市] = '" & myArea &"' AND [學校名稱] = '" & mySchoolName & "'"

'Set cmd = CreateObject("ADODB.Command")
'cmd.CommandText = query
'Set rs = cmd.Execute

Set rs = Server.CreateObject("ADODB.Recordset")
'rs.open query, myDBConn, adOpenStatic, adLockOptimistic
rs.open query, myDBConn, 3, 3

Dim htmlResWrite

htmlResWrite = ""

htmlResWrite = htmlResWrite & "<head>"
htmlResWrite = htmlResWrite & "<style>"
htmlResWrite = htmlResWrite & "table, th, td { border: 1px solid black; border-collapse: collapse;}"
htmlResWrite = htmlResWrite & "</style>"
htmlResWrite = htmlResWrite & "</head>"

htmlResWrite = htmlResWrite & "<table>"
htmlResWrite = htmlResWrite & "<tr>"
htmlResWrite = htmlResWrite & "<th>" & "作品編號" & "</th>"
htmlResWrite = htmlResWrite & "<th>" & "年級" & "</th>"
htmlResWrite = htmlResWrite & "<th>" & "學生姓名" & "</th>"
htmlResWrite = htmlResWrite & "<th>" & "指導老師" & "</th>"
htmlResWrite = htmlResWrite & "<th>" & "上傳作業" & "</th>"
htmlResWrite = htmlResWrite & "</tr>"
Do Until rs.EOF

    htmlResWrite = htmlResWrite & "<tr>"

    htmlResWrite = htmlResWrite & "<td>" & rs("作品編號") & "</td>"
    htmlResWrite = htmlResWrite & "<td>" & rs("年級") & "</td>"
    htmlResWrite = htmlResWrite & "<td>" & rs("學生姓名") & "</td>"
    htmlResWrite = htmlResWrite & "<td>" & rs("指導老師") & "</td>"

    htmlResWrite = htmlResWrite & "<td>" & "<a href='./AspUpload.html' target='_blank'>Upload</a>" & "</td>"

    htmlResWrite = htmlResWrite & "</tr>"

    rs.MoveNext
Loop

htmlResWrite = htmlResWrite & "</table>"

response.write htmlResWrite

%>
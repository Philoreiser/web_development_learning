<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10"/>

        <title>PDFObjet Example: Replace PDF with another one</title>

        <link rel="stylesheet" href="../css/demo_style.css">

        <style>
            .pdfobject-container {
                width: 100%;
                max-width: 600px;
                height: 600px;
                margin: 2em 0;
            }
            .pdfobject {
                border: solid 1px #666;
            }

            #result { padding: 1rem;}
            .hidden {display: none;}
            .success { color: #4F8A10; background-color: #DFF2BF; }
            .fail { color: #D8000C; background-color: #FFBABA; }

        </style>

        
        <script src="jquery-3.2.1.min.js"></script>
        <script src="../js/pdfobject.min.js"></script>

    </head>
    <body>
        <h1>PDFObject Example: Replace one PDF with another one</h1>

        <div id="result" class="hidden"></div>

        <div id="pdf-Dislay">
            <div>
                <p><a href="upload/sample1.pdf" class="pdf-link">Link to "sample1.pdf"</a></p>
                <p><a href="upload/sample2.pdf" class="pdf-link">Link to "sample2.pdf"</a></p>
                <p><a href="upload/wrong.pdf" class="pdf-link">Link to "wrong.pdf"</a></p>
                <!-- <p><a href="#" id="tryJS">Try JS</a></p> -->
            </div>

            <div id="pdf-List"></div>

            <div id="pdf"></div>
        </div>
        
        <script>
            // jquery used
            $(document).ready(function () {
                // alert("jQuery works");
                $("#result").attr("class", "success");
                $("#result").html("Ready!");

                $.ajax({
                    type: "POST",
                    url: "pdfControl.php",
                    data: {
                        "todo": "getList",
                    },
                    dataType: "json",
                    cache: false,
                    error: function () {
                        console.log("fail");
                    },
                    success: function (data) {
                        console.log("success");
                        console.log(data);
                    }
                });
            });


        
        </script>

        <script>

            function isUrlAlive(url) {

                var isAvail = false;

                var xhr = new XMLHttpRequest();
                var randNum = Math.round(Math.random() * 10000);

                try {
                    xhr.open('HEAD', url + "?rand=" + randNum, false);
                    xhr.send();
                    isAvail = (xhr.status == 200) ? true : false;
                } catch(err) {
                    return false;
                }

                return isAvail;
                
            }

            
            var pdfClickHandler = function (e) {
                e.preventDefault();
                
                var pdfURL = this.getAttribute("href");
                var options = {
                    pdfOpenParams: {
                        navpanes: 0,
                        toolbar: 0,
                        statusbar: 0,
                        view: "FitV"
                    }
                };

                var res = document.querySelector("#result") ;
                if (isUrlAlive(pdfURL)) {
                    var myPDF = PDFObject.embed(pdfURL, "#pdf", options );
                    
                    res.setAttribute("class", (myPDF) ? "success" : "fail");
                    res.innerHTML = (myPDF) ? "PDFObject successfully embbed '" + pdfURL + "'." : "The embed didn't work.";
                } else {
                    var pdfDiv = document.getElementById("pdf");
                    pdfDiv.innerHTML = "";

                    res.setAttribute("class", "fail");
                    res.innerHTML = "PDF is unavailable";
                }
            };

            var pdfEle = document.querySelectorAll(".pdf-link");
            for (var i=0; i < pdfEle.length; i++) {
                pdfEle[i].addEventListener("click", pdfClickHandler);
            }          
            
        </script>

       
        
    </body>
</html>

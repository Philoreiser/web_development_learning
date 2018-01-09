<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8;">
    </head>
    <body>

        <button id="btn-close">Close Window</button>

        <script language="javascript" type="text/javascript">

            var btnCloseWindow = document.getElementById("btn-close");

            btnCloseWindow.addEventListener("click", closeWindow, false);

            function closeWindow() {

                // e.preventDefault();
                window.open('', '_self','');
                window.close();
            }
        </script>
    </body>
</html>
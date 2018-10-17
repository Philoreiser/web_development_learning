<?php

class PDFModel {
    
    public function getData() {
        
        $data[] = array("serial"=>"Demo-NO-1", "link"=>"upload/sample1.pdf");
        $data[] = array("serial"=>"Demo-NO-2", "link"=>"upload/sample2.pdf");

        return $data;
    }

    public function getDataDict() {
        
        $data[] = array( "id"=>1, "serial"=>"Demo-NO-1", "link"=>"upload/sample1.pdf");
        $data[] = array( "id"=>2, "serial"=>"Demo-NO-2", "link"=>"upload/sample2.pdf");

        $dict = "";
        foreach($data as $content) {
            $key = "{$content['id']}";
            $dict[$key] = $content;
        }

        return $dict;
    }
}

?>
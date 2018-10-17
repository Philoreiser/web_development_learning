<?php

include_once "pdfModel.php";

class PDFControl {

    public $link;
    private $dict;

    function __construct() {
        $this->genLinks();
    }

    public function genLinks() {
        $model = new PDFModel();

        $this->link = $model->getData();
        // print_r($model->getData());

        $this->dict = $model->getDataDict();
    }

    public function listLinks() {
        // print_r($this->link);
        if ($this->link) {
            print_r($this->link);
        } else {
            echo "The list of links is empty for now." . '<br>';
        }
    }

    public function listDict() {
        // print_r($this->link);
        if ($this->dict) {
            print_r($this->dict);
        } else {
            echo "The dictionary of links is empty for now." . '<br>';
        }
    }

    public function getList() {
        $list = "";
        if ($dict) {
            foreach($dict as $key=>$value) {
                $list[] = $value;
            }
        }

        header("Content-Type: application/json; charset=utf-8");
        echo json_encode($list);
    }

    public function view() {
        require_once "pdfView.php";
    }
}


// $controller->listLinks();

// $controller->view();
// $controller->listDict();

if ($_POST) {
    // not yet implemented
    $controller = new PDFControl();
    $controller->genLinks();
    $controller->getList();
}

?>


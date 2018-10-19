<?php
  include_once 'libs/Smarty.class.php';
  class View
  {
    protected $smarty;

    function __construct()
    {
      $this->smarty = new smarty();
    }
  }
?>

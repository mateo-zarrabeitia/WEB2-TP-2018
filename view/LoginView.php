<?php
  class LoginView extends View
  {
    function mostrarLogin($titulo,$error='')
    {
      $this->smarty->assign('error', $error);
      $this->smarty->assign('titulo', $titulo);
      $this->smarty->display('templates/Login/login.tpl');
    }

    function mostrarRegistro($titulo,$error='')
    {
      $this->smarty->assign('error', $error);
      $this->smarty->assign('titulo', $titulo);
      $this->smarty->display('templates/Login/register.tpl');
    }




  }
?>

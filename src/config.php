<?php 
require("./../vendor/autoload.php");


require('./../src/Post.class.php');
$db = new mysqli('localhost', 'root', '','cms_js');

$loader = new Twig\Loader\FilesystemLoader('./../src/templates');
//inicjujemy twiga
$twig = new Twig\Environment($loader);

?>
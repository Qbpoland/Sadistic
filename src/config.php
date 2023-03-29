<?php

require("./../vendor/autoload.php");

$db = new mysqli("localhost", "root", "", "cms_js");


require("Post.class.php");
require("User.class.php");
require('./../src/Likes.class.php');


//loader to taki pomocnik do ładowania szablonów
$loader = new Twig\Loader\FilesystemLoader('./../src/templates');
//inicjujemy twiga
$twig = new Twig\Environment($loader);

?>
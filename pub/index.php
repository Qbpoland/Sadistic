<?php
require("./../vendor/autoload.php");


use Steampixel\Route;


Route::add('/', function() {
    echo "działa";
});


Route::run('/sadistic/pub');


?>
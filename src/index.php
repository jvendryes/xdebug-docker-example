<?php

// Just a basic app to test Xdebug with

function hello(){
    return "Hello!";
}

function saySomething(){
    $greeting = hello();
    $dateTime = new DateTime();
    $date = $dateTime->format('d/m/Y');

    return $greeting . " The current date is: " . $date;
}

echo saySomething();

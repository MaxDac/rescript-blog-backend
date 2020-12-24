// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var Mysql = require("mysql");
var Express = require("express");
var Caml_format = require("bs-platform/lib/js/caml_format.js");
var BodyParser = require("body-parser");

var dbConnection = Mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "my-secret-pw",
      insecureAuth: true,
      database: "db"
    });

dbConnection.connect(function (err) {
      console.log("There was an error while connecting to MySql Database: " + JSON.stringify(err));
      
    });

dbConnection.query("SELECT ID as id, Name as name, Surname as surname FROM Employees", (function (err, result) {
        console.log(err);
        console.log(result);
        $$Array.map((function (x) {
                console.log(x.name);
                
              }), result);
        
      }));

var match = process.argv;

var match$1;

if (match.length !== 4) {
  match$1 = [
    "localhost",
    3333
  ];
} else {
  var host = match[2];
  var port = match[3];
  match$1 = [
    host,
    Caml_format.caml_int_of_string(port)
  ];
}

var port$1 = match$1[1];

var app = Express();

var bodyParser = BodyParser;

function use(param) {
  app.use(param);
  
}

var param = bodyParser.urlencoded({
      extended: true
    });

app.use(param);

var param$1 = bodyParser.json();

app.use(param$1);

app.listen(port$1, (function (param) {
        console.log("host: localhost: port: " + String(port$1));
        
      }));

var host$1 = match$1[0];

exports.dbConnection = dbConnection;
exports.host = host$1;
exports.port = port$1;
exports.app = app;
exports.bodyParser = bodyParser;
exports.use = use;
/* dbConnection Not a pure module */
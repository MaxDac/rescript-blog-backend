// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var JsImports = require("./base/JsImports.bs.js");

function defineRoutes(app) {
  app.get("/", (function (param, res) {
          return JsImports.Http.send("something", res);
        }));
  app.post("/req", (function (req, res) {
          var usr = req.body;
          console.log(usr.name);
          res.json({
                name: "Johnny",
                surname: "Stecchino"
              });
          
        }));
  
}

var Routes = {
  defineRoutes: defineRoutes
};

exports.Routes = Routes;
/* No side effect */

open JsImports

@bs.val @bs.scope("process")
external arguments: array<string> = "argv"

let dbConnection = MySql.createConnection(MySql.mysql, {
    host: "localhost",
    user: "root",
    password: "my-secret-pw",
    insecureAuth: true,
    database: "db"
})

type employee = {
    id: int,
    name: string,
    surname: string
};

MySql.connect(dbConnection, err => Js.log(`There was an error while connecting to MySql Database: ${Json.encode(err)}`))

MySql.query(dbConnection, "SELECT ID as id, Name as name, Surname as surname FROM Employees", (err, result: MySql.queryResult<employee>) => {
    Js.log(err)
    Js.log(result);

    result
    |> Array.map(x => Js.log(x.name))
    |> ignore
});

let (host, port) = 
    switch arguments {
    | [_, _, host, port] => (host, port |> int_of_string)
    | _ => ("localhost", 3333)
    }

let app = Http.express()

let bodyParser = Http.bodyParser

let use = Http.use(app)

use(Http.urlencoded(bodyParser, { extended: true }))

use(bodyParser |> Http.requestJson)

Http.listen(app, port, () => Js.log(`host: localhost: port: ${port |> string_of_int}`))
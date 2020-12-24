module Http = {
    type http
    type bodyParser
    type middleware

    type request<'t> = {
        body: 't
    }

    type response

    @bs.module
    external express: unit => http = "express"

    @bs.module
    external bodyParser: bodyParser = "body-parser"

    type urlencodedSettings = {
        extended: bool
    }

    @bs.send
    external urlencoded: (bodyParser, urlencodedSettings) => middleware = "urlencoded"

    @bs.send
    external requestJson: (bodyParser) => middleware = "json"

    @bs.send
    external use: (http, middleware) => unit = "use"

    @bs.send
    external get: (http, string, (request<'t>, response) => unit) => unit = "get"

    @bs.send
    external post: (http, string, (request<'t>, response) => unit) => unit = "post"

    @bs.send
    external jsSend: (response, string) => unit = "send"

    let send = (s: string, r: response) => jsSend(r, s)

    @bs.send
    external sendJson: (response, 't) => unit = "json"

    @bs.send
    external listen: (http, int, unit => unit) => unit = "listen"
}

module Json = {
    @bs.scope("JSON")
    @bs.val
    external decode: string => 't = "parse"

    @bs.scope("JSON")
    @bs.val
    external encode: 't => string = "stringify"
}

module MySql = {
    type mysql
    type connection
    type connectionError

    type sql = string
    type sqlError
    type queryResult<'t> = array<'t>

    @bs.module
    external mysql: mysql = "mysql"

    type mysqlConfig = {
        host: string,
        user: string,
        password: string,
        insecureAuth: bool,
        database: string
    }

    @bs.send
    external createConnection: (mysql, mysqlConfig) => connection = "createConnection"

    @bs.send
    external connect: (connection, (connectionError) => unit) => unit = "connect"

    @bs.send
    external query: (connection, sql, (sqlError, queryResult<'t>) => unit) => unit = "query"
}
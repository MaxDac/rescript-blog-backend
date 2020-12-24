open JsImports

module Routes = {

    type user = {
        name: string,
        surname: option<string>
    }
    
    let defineRoutes = (app: Http.http) => {

        Http.get(app, "/", (_, res) => {
            res
            |> Http.send("something")
        })

        Http.post(app, "/req", (req, res) => {
            let usr: user = req.body
            Js.log(usr.name)
            
            {
                name: "Johnny",
                surname: Some("Stecchino")
            } |> Http.sendJson(res)
        })
    }

}
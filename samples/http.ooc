use endorse
import endorse, endorse/node

main: func {
    node := Node new()
    http := node http()

    doRequest(http)

    node run()
}

doRequest: func (http: Http) {

    options := map(
        "host" => "perdu.com"
    )

    req := http request(options, |res|
       "Got status %d"  printfln(res statusCode)
    )

    req end()

}


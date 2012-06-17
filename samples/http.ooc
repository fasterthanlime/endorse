use endorse
import endorse, endorse/node

main: func {
    node := Node new()
    http := node http()

    http request(map(
        "host" => "perdu.com"
    ), |req|
       "Created request o/"  println()
    )

    node run()
}

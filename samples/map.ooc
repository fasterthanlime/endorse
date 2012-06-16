use endorse
import endorse

main: func {
    map(
        "host" => "www.example.org",
        "port" => "80",
        "path" => "/"
    ) each(|k, v|
        "%s => %s" printfln(k, v)
    )
}

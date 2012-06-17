use uv, endorse
import uv, endorse, structs/[ArrayList, HashMap]

Hash: cover from HashMap<String, String>

Node: class {
    loop: Loop

    init: func {
        loop = Loop default()
    }

    run: func {
        loop run()
    }

    http: func -> Http {
        Http new(this)
    }
}

Http: class {
    node: Node
    init: func (=node)

    request: func (options: HashMap<String, String>, callback: Func(Request)) {
        callback(Request new(options))
    }
}

Request: class {
    options: HashMap<String, String>

    init: func (options: HashMap<String, String>) {
        // FIXME: defaults should be in a static field,
        // but a rock bug prevents that
        defaults := map(
            "hostname" => "localhost",
            "port" => "80",
            "method" => "GET",
            "path" => "/"
        )

        this options = defaults merge(options)
    }
}


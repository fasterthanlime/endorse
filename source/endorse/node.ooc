use uv, endorse

import uv, endorse
import structs/[List, ArrayList, HashMap, MultiMap]

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

    request: func (options: HashMap<String, String>, callback: Func(Response)) -> Request {
        Request new(options, callback)
    }
}

EventEmitter: class {
    callbacks := MultiMap<String, WrappedFunc> new()

    on: func (eventName: String, callback: Func) {
        callbacks put(eventName, wrap(callback as Func))
    }

    // private stuff

    _yield: func (eventName: String, f: Func(WrappedFunc)) {
        callbacks eachFor(eventName, |callback|
            f(callback)
        )
    }
}

Request: class extends EventEmitter {
    options: HashMap<String, String>

    init: func (options: HashMap<String, String>, callback: Func(Response)) {
        // FIXME: defaults should be in a static field,
        // but a rock bug prevents that
        defaults := map(
            "hostname" => "localhost",
            "port" => "80",
            "method" => "GET",
            "path" => "/"
        )

        this options = defaults merge(options)
        on("response", callback as Func)
    }

    end: func {
        // write end of HTTP request
    }
}

Response: class {
    statusCode := -1
    
}



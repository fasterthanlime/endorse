use endorse
import endorse

main: func {
    list(1, 2, 3, 4) each(|i|
        "%d" printfln(i)
    )
}


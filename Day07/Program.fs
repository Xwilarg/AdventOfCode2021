open System
open System.IO
open System.Linq

let calculateDistance f =
    let data =
        File.ReadAllText("input.txt").Split [|','|]
        |> Seq.map(fun x -> x |> int)
    let value =
        [0..(data.Max() + 1)]
        |> Seq.map (fun x -> data.Sum(fun d -> (int)(f(Math.Abs(d - x)))))
        |> Seq.min
    printf "%d\n" value

[<EntryPoint>]
let main _ =
    calculateDistance (fun x -> x)
    calculateDistance (fun x -> [1..x] |> Seq.sum)
    0
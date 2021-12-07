open System
open System.IO
open System.Linq

[<EntryPoint>]
let main _ =
    let data =
        File.ReadAllText("input.txt").Split [|','|]
        |> Seq.map(fun x -> x |> int)
    let value =
        [0..(data.Max() + 1)]
        |> Seq.map (fun x -> data.Sum(fun d -> Math.Abs(d - x)))
        |> Seq.min
    printf "%d" value
    0
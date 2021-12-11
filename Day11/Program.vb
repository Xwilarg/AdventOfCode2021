Imports System.IO

Module Program
    Sub Main()
        Dim map As List(Of List(Of Integer)) = New List(Of List(Of Integer))

        For Each line As String In File.ReadAllLines("input.txt")
            map.Add(From x In line
                    Select Integer.Parse(x))
        Next

        For i As Integer = 0 To 5
            For y As Integer = 0 To map.Count
                For x As Integer = 0 To map(y).Count
                    map(y)(x) += 1
                Next
            Next
            Dim increase As Integer = 0
            Do
                For y As Integer = 0 To map.Count
                    For x As Integer = 0 To map(y).Count
                        If map(y)(x) > 9 Then

                        End If
                    Next
                Next
            Loop Until increase > 0
        Next

        Console.WriteLine("Hello World!")
    End Sub
End Module

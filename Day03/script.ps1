$Content = Get-Item -Path .\input.txt | Get-Content
$Length = $Content[0].Length

function Part1 {
    $Gamma = 0
    $Epsilon = 0

    $Bit = 1

    ($Length - 1)..0 | ForEach-Object {
        $i = $_
        $Zero = 0
        $One = 0
        $Content | ForEach-Object {
            if ($_[$i] -eq '0') {
                $Zero++
            } else {
                $One++
            }
        }

        if ($Zero -gt $One) {
            $Gamma += $Bit
        } else {
            $Epsilon += $Bit
        }

        $Bit += $Bit
    }
    Write-Output ($Gamma * $Epsilon)
}

function Part2 {
    $Oxygen = New-Object System.Collections.Generic.List[System.String]
    $CO2 = New-Object System.Collections.Generic.List[System.String]

    $Content | ForEach-Object {
        $Oxygen.Add($_)
        $CO2.Add($_)
    }
    function Parse($List, $UseZero) {
        0..($Length - 1) | ForEach-Object {
            if ($List.Count -eq 1) {
                return
            }
            $i = $_
            $Zero = 0
            $One = 0
            $List | ForEach-Object {
                if ($_[$i] -eq '0') {
                    $Zero++
                } else {
                    $One++
                }
            }
            if ($UseZero) {
                $Target = ($Zero -gt $One) ? '0' : '1'
            } else {
                $Target = ($Zero -gt $One) ? '1' : '0'
            }
            ($List.Count - 1)..0 | ForEach-Object {
                if ($List[$_][$i] -ne $Target) {
                    $List.RemoveAt($_)
                }
            }
        }
        $Bit = 1
        $Value = 0
        $Nb = $List[0].ToCharArray()
        ($Nb.Length - 1)..0 | ForEach-Object {
            $Value += ($Bit * ($Nb[$_] - 48))
            $Bit += $Bit
        }
        return $Value
    }

    $V1 = Parse $Oxygen $True
    $V2 = Parse $CO2 $False
    Write-Output ($V1 * $V2)
}

Part1
Part2
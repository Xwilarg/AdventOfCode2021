$Content = Get-Item -Path .\input.txt | Get-Content
$Length = $Content[0].Length

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
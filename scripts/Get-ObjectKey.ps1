function Get-Value {
    param (
        $object1 = "{"a":{"b":"{"c":"d"}"}}",
        $key1 = 'a/b/c',
        $object2 = "{"x":{"y":"{"z":"a"}"}}",
        $key2 = 'x/y/z'
    )
    
    $json = $object | ConvertFrom-Json

    foreach ($value in $json) {
        if ($value -eq $key ) {
            Write-Output $value
        }
    }

}

Get-Value

class MyClass {
    [string]$Text
    [int]$Base
    [int]$Exponent
    
    [int]Pow( [int]$base, [int]$exponent ) {
        $this.Base = $base
        $this.Exponent = $exponent
        return [Math]::Pow($this.Base, $this.Exponent)
    }

    [string]SetString( [string]$text ) {
        $this.Text = $text
        return $text
    }

    [string]PrintString() {
        return $this.Text.ToUpper()
    }

    [string]Reverse() {
        return $this.Text[-1..-$this.Text.Length] -join ''
    }

    [string]Pascal() {
        return $this.Text.Replace('_', '')
    }

    [string]Camel() {
         [string]$camel = $this.Text.Replace('-', ' ')
         $words = $camel.split(" ")
         $camel = ""
         foreach ($word in $words) {
            $camel += $word.Substring(0,1).ToUpper() + $word.Substring(1)
         }
         $camel = $camel.Substring(0,1).ToLower() + $camel.Substring(1)
         return $camel
    }

     [string]Camel2() {
         [string]$camel = $this.Text.Replace('-', ' ')
         $camel = (Get-Culture).TextInfo.ToTitleCase($camel)
         $camel = ($camel.Substring(0,1).ToLower() + $camel.Substring(1)).Replace(' ', '')
         return $camel
    }
}
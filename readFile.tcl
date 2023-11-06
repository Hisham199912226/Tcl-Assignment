# Define procedures

# Checks if a line contains an integer
proc checkLineForInteger {line} {
    return [regexp {^-?\d+$} $line]
}

# Checks if a line contains a floating-point number
proc checkLineForFloat {line} {
    return [regexp {^-?\d+\.\d+$} $line]
}

# Checks if a line contains a string
proc checkLineForString {line} {
    return [regexp {^[^0-9]+$} $line]
}

# Process a line and update global variables
proc processLine {line} {
    global sumIntegers
    global stringCount
    
    if {[checkLineForInteger $line]} {
        set number [expr {$line % 2 == 0 ? $line * 2 : $line * 3}]
        puts $number
        incr sumIntegers $number
    } elseif {[checkLineForFloat $line]} {
        puts $line
    } elseif {[checkLineForString $line]} {
        puts $line
        incr stringCount
    } else {
        puts "INVALID"
    }
}


# Initialize variables
global sumIntegers
global stringCount
set sumIntegers 0
set stringCount 0


# Read the file line by line
set filename "inputFile.txt"  ;
set file [open $filename "r"]

while {[gets $file line] != -1} {
     processLine $line
}

close $file

# Output the results
puts "Sum of all integers: $sumIntegers"
puts "Count of all lines that present a string value: $stringCount"
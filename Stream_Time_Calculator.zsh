#! /bin/zsh

### OBJECTIVE
# Calculator to calculate time spent streaming


### VARIABLES ###
Total_Hours=0
Total_Minutes=0
Total_Seconds=0


### FUNCTION: Totals ###
### Objective: Calculates total times
### IFS=: <-- Use colons as delimter to identify hr mins secs
### while {do/done} < Time.txt <-- read line by line
### let <-- Math stuff 
function Totals(){
while IFS=: read  hr mins sec
do
let Total_Hours="$Total_Hours+$hr"
let Total_Minutes="$Total_Minutes+$mins"
let Total_Seconds="$Total_Seconds+$sec"
done < ~/[pathToTime]Time.txt
}

### FUNCTION: STC ###
### Objective: Calculate Total HH:MM:SS
### % <-- Remainder
### let <-- Math stuff

function STC(){
let Total_Hours="($Total_Minutes/60)+$Total_Hours"
let Total_Minutes="($Total_Minutes % 60)+($Total_Seconds/60)"
let Total_Seconds="($Total_Seconds % 60)"
}

Totals # Call function
STC # Call function
print $Total_Hours:$Total_Minutes:$Total_Seconds # Final output

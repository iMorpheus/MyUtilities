#!/bin/zsh

### BOOKMARKER: an iMorphTV Creation ##
# Collect & stores bookmarks locally 
# Bookmarker collects the following:
# - Page Title
# - Site Name
# - URL Scheme
# - URL Subdmain
# - URL Second Level Domain
# - URL Top Level Domain
# - Path to whatever
# - That day's date
#######################################


###     FUNCTIONS LIST & PURPOSE    ###
# - PrintHeader:
# 	* Clears Screen
#	* Prints Banner
# - GetTitle
#	* Captures Page Title
# - GetSiteName
#	* Captures Site Name
# - GetScheme
#	* Captures Scheme
# - GetSubdomain
#	* Captures Subdmain
# - GetSecondLevelDomain
#	* Captures Second Level Domain
# - GetTLD
#	* Captures Top Level Domain
# - GetPath
#	* Captures path to resource?
# - WriteOut
#	* Writes data to file
# - Review
#	* Shows updated file
#####################################


### FUNCTIONS ###

Function PrintHeader (){
clear
Cols=$(tput cols)
echo "Bookmarker ver. 0.1" | boxes -p a56 -s "$Cols"x1
}

Function GetTitle (){
read -r "Title?Page Title: "
PrintHeader
}

Function GetSiteName () {
read -r "SiteName?Site Name: "
PrintHeader
}

Function GetScheme () {
PS3="Select Scheme: "
select Scheme in http:// https:// ftp:// other none 
do case $Scheme in
other) read -r "Scheme?Enter Scheme: " ;;
none) Scheme="";;
esac
break
done

PrintHeader
}

Function GetSubdomain () {
PS3="Select Subdomain: "
select Subdomain in www. blog. wiki. en. jp. other none
do case $Subdomain in
other) read -r "Subdomain?Enter Subdomain: " ;;
none) Subdomain="";;
esac
break
done

PrintHeader
}

Function GetSecondLevelDomain () {
read -r "SLD?Second Level Domain: "
PrintHeader
}

Function GetTLD () {
PS3="Select TLD: "
select TLD in .com .org .edu .gov .net .xyz .cc .co.jp other none
do
case $TLD in
other) 
	read -r "TLD?Enter TLD: " 
	TLD=".$TLD";;
none) TLD="";;
*)
esac
break
done
PrintHeader
}

Function GetPath () {
read -r "Path?Path:/ "
PrintHeader
}

Function WriteOut(){
echo $Entry | pbcopy
pbpaste >> [Path to Bookmark.csv]
PrintHeader
}

Function Review(){
csvlook [Path to Bookmark.csv]
sleep 10
}

#### MAIN FUNCTION ###
Function GetBookMark(){
PrintHeader
GetTitle
GetSiteName
GetScheme
GetSubdomain
GetSecondLevelDomain
GetTLD
GetPath
}

### AVAILABLE FUNCTIONS ###
# - PrintHeader
# - GetTitle
# - GetSiteName
# - GetScheme
# - GetSubdomain
# - GetSecondLevelDomain
# - GetTLD
# - GetPath
# - WriteOut
# - Review
##########################


### INPUT ###
GetBookMark
DateSaved=$(date +'%Y-%m-%d')

### MANIPULATION ##
Entry=$(print "$Title - $SiteName,$Scheme$Subdomain$SLD$TLD/$Path,$DateSaved")


### OUTPUT ###
WriteOut

#### VIEW ####
Review

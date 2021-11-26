Function ascii {
<#
.DESCRIPTION
This functions takes your text input and generates ascii art using the api over at https://artii.herokuapp.com

PARAMETER
-Text: the text you would like to convert to ascii art
-Color: choose text color
-font: choose font-listfonts: lists all available fonts


.EXAMPLE
EXAMPLE1
ascii -text TesT -color green -font trek
  dBBBBBBP dBBBP.dBBBBP  dBBBBBBP
                BP               
   dBP   dBBP   `BBBBb    dBP    
  dBP   dBP        dBP   dBP     
 dBP   dBBBBP dBBBBP'   dBP      


#>

#Defining parameters
Param($text,$color,$font,[switch]$listfonts)
#check if listfonts parameter is set and if so retrieve the list of fonts
if($listfonts){
(invoke-webrequest -uri https://artii.herokuapp.com/fonts_list).content

}Else{
#creating ur
$uri = "https://artii.herokuapp.com/make?text="
$inputuri =  ($uri + $text)
#check if font parameter is used if so add font to end off url
if($font -ne $null){
$inputuri = $inputuri +"&font="+$font}

#retrieve art
$art = invoke-webrequest -uri $inputuri
#check if color parameter is used if so add color
If ($color -ne $null){

Write-Host -ForegroundColor $color $art.content
}else {
Write-Host  $art.content
}}}


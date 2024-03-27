$espn = Get-Content -Path ".\espn.txt"

foreach($line in $espn)
{
    $split = $line.Split()
    $name = ($split[2] + " " + $split[3].Substring(0,$split[3].Length-1) + " ")
    $rank = $split[0].Substring(0,$split[0].Length-1)
    Add-Rank -data $data -newname $name -newrank $rank
}

Add-Rank -data $data -newname "Kenneth Walker " -newrank "107"
Add-Rank -data $data -newname "Los Angeles Chargers " -newrank "189"
Add-Rank -data $data -newname "Miami Dolphins " -newrank "190"
Add-Rank -data $data -newname "Amon-Ra St. Brown " -newrank "49"
Add-Rank -data $data -newname "Justin Fields " -newrank "129"
Add-Rank -data $data -newname "Tyrion Davis-Price " -newrank "209"
Add-Rank -data $data -newname "Joshua Palmer " -newrank "133"
Add-Rank -data $data -newname "Buffalo Bills " -newrank "141"
Add-Rank -data $data -newname "New Orleans Saints " -newrank "142"
Add-Rank -data $data -newname "Green Bay Packers " -newrank "143"
Add-Rank -data $data -newname "Baltimore Ravens " -newrank "144"
Add-Rank -data $data -newname "Tampa Bay Buccaneers " -newrank "145"
Add-Rank -data $data -newname "San Francisco 49ers " -newrank "146"
Add-Rank -data $data -newname "Dallas Cowboys " -newrank "147"
Add-Rank -data $data -newname "Indianapolis Colts " -newrank "148"
Add-Rank -data $data -newname "Pittsburgh Steelers " -newrank "149"
Add-Rank -data $data -newname "Washington Commanders " -newrank "150"
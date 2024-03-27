function Calculate-Ranks
{
    param
    (
        $data
    )
    foreach($dat in $data)
    {
        $ranks = $dat.Ranks
        $total = 0
        foreach($rank in $ranks)
        {
            $total += [int]$rank
        }
        $dat.Rank = [math]::Round(($total / $ranks.Count), 2)
    }
}

function Add-Rank
{
    param
    (
        $data,
        $newName,
        $newRank
    )
    foreach($dat in $data)
    {
        if($dat.Name -eq $newName)
        {
            $dat.Ranks += $newRank
            return $null
        }
    }
    Write-Host $newName
}

function Add-RankI
{
    param
    (
        $data,
        $newName,
        $newRank
    )
    foreach($dat in $data)
    {
        if($dat.IName -eq $newName)
        {
            $dat.Ranks += $newRank
            return $null
        }
    }
    Write-Host $newName
}


$data = @()

$text = Get-Content -Path ".\data\fantasyPros.txt"
$trank = 1
foreach($line in $text)
{
    $split = $line.Split()
    $name = ""
    $iname = ""
    $team = ""
    $pos = ""
    $preteam = $true
    foreach($word in $split)
    {
        if($preteam)
        {
            if($word -match "\(")
            {
                $team = $word.Substring(1,$word.Length-2)
                $preteam = $false
            }
            else
            {
                $name += ($word + " ")
            }
        }
        else
        {
            if($word -match "[A-Z]")
            {
                $pos = $word -replace '[0-9]',''
            }
            else
            {
                $bye = $word
            }
        }
    }
    $nameSplit = $name.Split()
    $doThis = $true
    foreach($temp in $nameSplit)
    {
        if($doThis)
        {
            $iname += ($temp.Substring(0,1) + ". ")
            $doThis = $false
        }
        else
        {
            $iname += ($temp + " ")
            break
        }
    }
    $data += [PSCustomObject]@{"Name"= $name ; "IName"= $iname ; "Pos"= $pos ; "Team" = $team ; "Ranks" = @($trank) ; "Rank" = 0 ; "Drafted" = 0 ; "Bye" = 0 }
    $trank +=1
}


$text1 = Get-Content -Path ".\data\data1.txt"

foreach($line in $text1)
{
    $split = $line.Split()
    $name = ""
    $rank = 0
    $wcount = 0
    foreach($word in $split)
    {
        if($wcount -eq 0)
        {
            $rank = $word.Substring(0,$word.Length-1)
            $wcount += 1
            continue
        }
        if($word -match ",")
        {
            $name += ($word.Substring(0, $word.Length-1) + " ")
            break
        }
        else
        {
            $name += ($word + " ")
        }
    }
    Add-Rank -data $data -newname $name -newrank $rank
}


$text2 = Get-Content -Path ".\data\data2.txt"

foreach($line in $text2)
{
    $split = $line.Split()
    $name = ""
    $rank = 0
    $wcount = 0
    foreach($word in $split)
    {
        if($wcount -eq 0)
        {
            if($word -eq "")
            {
                continue
            }
            $rank = $word.Substring(0,$word.Length-1)
            $wcount += 1
            continue
        }
        if($word -match ",")
        {
            $name += ($word.Substring(0, $word.Length-1) + " ")
            break
        }
        else
        {
            $name += ($word + " ")
        }
    }
    Add-Rank -data $data -newname $name -newrank $rank
}


$text3 = Get-Content -Path ".\data\data3.txt"

foreach($line in $text3)
{
    $split = $line.Split()
    $name = ""
    $rank = 0
    $wcount = 0
    foreach($word in $split)
    {
        if($wcount -eq 0)
        {
            $rank = $word.Substring(0,$word.Length-1)
            $wcount += 1
            continue
        }
        if($word -match ",")
        {
            $name += ($word.Substring(0, $word.Length-1) + " ")
            break
        }
        else
        {
            $name += ($word + " ")
        }
    }
    Add-Rank -data $data -newname $name -newrank $rank
}


$text4 = Get-Content -Path ".\data\data4.txt"
$t4rank = 1
foreach($line in $text4)
{
    $split = $line.Split()
    $name = ""
    foreach($word in $split)
    {
        if($word -match ",")
        {
            $name += ($word.Substring(0, $word.Length-1) + " ")
            break
        }
        else
        {
            $name += ($word + " ")
        }
        $t4rank += 1
    }
    Add-Rank -data $data -newname $name -newrank $t4rank
}


$text5 = Get-Content -Path ".\data\data5.txt"

foreach($line in $text5)
{
    $split = $line.Split()
    $name = ""
    $rank = 0
    $wcount = 0
    foreach($word in $split)
    {
        if($wcount -eq 0)
        {
            $rank = $word
        }
        else
        {
            $name += ($word + " ")
        }
        $wcount += 1
        if($wcount -eq 3)
        {
            break
        }
    }
    Add-RankI -data $data -newname $name -newrank $rank
}


$text6 = Get-Content -Path ".\data\data6.txt"

foreach($line in $text6)
{
    $split = $line.Split()
    $name = ""
    $rank = 0
    $wcount = 0
    foreach($word in $split)
    {
        if($wcount -eq 0)
        {
            $rank = $word
        }
        else
        {
            $name += ($word + " ")
        }
        $wcount += 1
        if($wcount -eq 3)
        {
            break
        }
    }
    Add-RankI -data $data -newname $name -newrank $rank
}


$text7 = Get-Content -Path ".\data\data7.txt"

foreach($line in $text7)
{
    $split = $line.Split()
    $name = ""
    $rank = 0
    $wcount = 0
    foreach($word in $split)
    {
        if($wcount -eq 0)
        {
            $rank = $word
        }
        else
        {
            $name += ($word + " ")
        }
        $wcount += 1
        if($wcount -eq 3)
        {
            break
        }
    }
    Add-RankI -data $data -newname $name -newrank $rank
}

Calculate-Ranks -data $data

$data = $data | Sort-Object -Property Rank

$draft = Get-Content -Path ".\data\draft.txt"
$pick = 1
foreach($row in $draft)
{
    if($row -notmatch "\.")
    {
        continue
    }
    else
    {
        $split = $row.Split()
        $name = ""
        $wcount = 0
        foreach($word in $split)
        {
            if($wcount -eq 0)
            {
                $wcount += 1
                continue
            }
            if($word -match ",")
            {
                $name += ($word.Substring(0, $word.Length-1) + " ")
                break
            }
            else
            {
                $name += ($word + " ")
            }
        }
        foreach($dat in $data)
        {
            if($dat.Name -eq $name)
            {
                $dat.Drafted = [math]::ceiling($pick/12)
                $pick +=1
            }
        }
    }
}

$byeWeeks = @{ "ARI" = 13 ; "ATL" = 14 ; "BAL" = 10 ; "BUF" = 7 ; "CAR" = 13 ; "CHI" = 14 ; "CIN" = 10 ; "CLE" = 9 ; "DAL" = 9 ; "DEN" = 9 ; "DET" = 6 ; "FA" = 0 ; "GB" = 14 ; "HOU" = 6 ; "IND" = 14 ; "JAC" = 11 ; "KC" = 8 ; "LAC" = 8 ; "LAR" = 7 ; "LV" = 6 ; "MIA" = 11 ; "MIN" = 7 ; "NE" = 10 ; "NO" = 14 ; "NYG" = 9 ; "NYJ" = 10 ; "PHI" = 7 ; "PIT" = 9 ; "SEA" = 11 ; "SF" = 9 ; "TB" = 11 ; "TEN" = 6 ; "WAS" = 14 }
foreach($dat in $data)
{
    $dat.Bye = $byeWeeks.$($dat.Team)
}

.\buildHTML.ps1
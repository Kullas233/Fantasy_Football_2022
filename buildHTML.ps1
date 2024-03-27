Remove-Item -Path "./html.txt" -ErrorAction SilentlyContinue
"Manually fix Diontae and Dernest Johnson for D. Johnson rank" | Out-File -FilePath ".\html.txt" -Append
$count = 1
foreach($dat in $data)
{
    ('<tr class="clickable-row tablerow"id="player'+ $count +'"data-href="http://tutorialsplane.com"><td class="has-details">' +$dat.Rank+ '<span class="details">'+$dat.Ranks+'</span></td><td>' +$dat.Name+ '</td><td>' + $dat.Pos+ '</td><td>' +$dat.Team+'</td><td>'+$dat.Bye+'</td><td>'+$dat.Drafted+'</td></tr>') | Out-File -FilePath ".\html.txt" -Append
    $count +=1 
}

#foreach($dat in $data)
#{
#    if($dat.Name -eq "D'Ernest Johnson ")
#    {
        #for($x = 0; $x -lt $dat.Ranks.Count; $x+=1)
        #{
        #    if($dat.Ranks[$x] -eq 181)
        #    {
        #        $dat.Ranks[$x] = 45.5
        #    }
        #}
#        $dat.Ranks
#    }
#}
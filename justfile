players_max := "13"
gamemode := "darkrp"
map := "rp_slumtown"
collection := "3441766830"

# launch the source dedicated server, for live dev/testing
gmod_server:
    ~/server_gmod/srcds_run -port 30000 +maxplayers {{players_max}} -console +gamemode {{gamemode}} +map {{map}} +host_workshop_collection {{collection}}
	
# pack ~/dev/gmod/gmaddons/skeleton into .gma
content_pack:
    gmad create -folder ~/dev/gmod/gmaddons/skeleton/ -out ~/dev/gmod/gmaddons/skeleton_content.gma

# update content on steam workshop
content_update:
    gmpublish update -id 3276239310 -addon ~/dev/gmod/gmaddons/skeleton_content.gma


-- title of the book
set title to "test"

-- to save screencaptures
set savepath to "~/Documents/E-Books/" & title

-- number of pages in the book
set pages to 1

-- name of application
set target to "Kindle"

-- start page number
set spage to 1

-- derection to go  1=left 2=right 
set pagedir to 2

-- interval of screenshot
set pausetime to 0.5

-- Coordinate X
set cropx to 850

--  Coordinate Y
set cropy to 1400

-- resize
set resizew to 0

if pagedir = 1 then
	set keychar to (ASCII character 28)
else
	set keychar to (ASCII character 29)
end if

if target is not "" then
	tell application target
		activate
	end tell
end if

delay pausetime

repeat with i from spage to pages
	if i < 10 then
		set dp to "00" & i
	else if i < 100 then
		set dp to "0" & i
	else if i < 1000 then
		set dp to "" & i
	end if
	
	set spath to (savepath & "_p" & dp & ".jpg")
	
	-- -R <x,y,w,h> capture screen rect
	do shell script "screencapture -orx -t jpg -R 82,80,1008,1322 " & spath
	
	--	if cropx is not 0 and cropy is not 0 then
	--		if resizew is not 0 then
	--			do shell script "sips -c " & cropy & " " & cropx & " --resampleWidth " & resizew & " " & spath & " --out " & spath
	--		else
	--			do shell script "sips -c " & cropy & " " & cropx & " " & spath & " --out " & spath
	--		end if
	--	end if
	
	tell application "System Events"
		keystroke keychar
	end tell
	delay pausetime
end repeat
activate

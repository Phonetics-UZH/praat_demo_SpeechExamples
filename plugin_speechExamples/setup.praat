####################################################
#
# PLUGIN: plugin_speechExamples
# author: Volker Dellwo (volker.dellwo@uzh.ch)
#
# Plugin for the Praat software (www.praat.org)
#
# See help after installation for more details
#
####################################################

# Clean the scripts directory: 
list = Create Strings as file list... list content/scripts/*.praat
nFiles = Get number of strings
for iFile to nFiles
	file$ = Get string... iFile
	deleteFile: file$
endfor
Remove

# Fill scripts directory and create buttons:
list = Create Strings as file list... list content/examples/*.wav
nFiles = Get number of strings
for iFile to nFiles
	select list
	file$ = Get string... iFile
	name$ = file$-".wav"
	writeFileLine: "content/scripts/'name$'.praat", "Read from file... ../examples/'file$'"
	button$[iFile]=name$
endfor
Remove

Add menu command: "Objects", "Open", "--Speech examples--", "Read from file...", 0, ""
Add menu command: "Objects", "Open", "Open speech example...", "--Speech examples--", 0, ""
Add menu command: "Objects", "Open", "Help", "Open speech example...", 1, "execute.man"
Add menu command: "Objects", "Open", "--line--", "Help", 1, ""
for iFile to nFiles
	button$ = button$[iFile]
	Add menu command: "Objects", "Open", button$, "--line--", 1, "content/scripts/'button$'.praat"
endfor
Add menu command: "Objects", "Open", "--Edit examples--", "'button$'", 1, ""
Add menu command: "Objects", "Open", "Edit examples...", "--Edit examples--", 1, "content/scripts/editExamples.praat"

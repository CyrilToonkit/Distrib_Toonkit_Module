# Distrib_Toonkit_Module
Toonkit module distribution package

Batch-based mechanism to merge "Toonkit_Module_*" packages into different distributions for different versions
of Maya or including specific code for a project or a customer...

Basically "DISTRIB.bat" will take NAME VERSION MAYANAME and INCLUDES as argument to create distributions that will be output to "Distributions" subfolder.
"DISTRIB.bat" can be called directly and you will be prompt to input variables values, or it can be called with arguments (see "DISTRIB_Toonkit_Module_Lite_2016.bat" for an example)

NAME      = The specific Toonkit_Module name (except version, ex : Toonkit_Module_Lite_Maya2016)

VERSION   = Version info as it appears on the folder name (ex : 1_5_6)

MAYANAME  = The name of the maya folder, used to include multiple Maya versions in the same package (ex : Maya2016)

INCLUDES  = The list of Toonkit modules to include (comma or space separated, ex : Toonkit_Module_2016 Toonkit_Module_MyProject)

Setup.Package
{
    vendor = "liflg.org",
    id = "tuxracer",
    description = "Tux Racer",
    version = "1.1.1-multilingual",
    splash = "splash.png", 
    superuser = false, 
    write_manifest = true, 

    support_uninstall = true, 
    recommended_destinations =
    {
        "/usr/local/games",
	"/opt/",
	MojoSetup.info.homedir,
    }, 

    Setup.Eula
    {
	description = "Tux Racer EULA",
	source = "EULA",
    },

    Setup.Readme
    {
        description = "README",
        source = "README.liflg"
    },

    Setup.Media
    {
        id = "tuxracer-disc",
        description = "Tux Racer disc",
        uniquefile = "program files/Sunspire Studios/Tux Racer/bin/x86/glibc-2.1/tuxracer"
    },

    Setup.DesktopMenuItem
    {
        disabled = false,
        name = "Tux Racer",
        genericname = "Tux Racer",
        tooltip = "Play Tux Racer",
        builtin_icon = false,
        icon = "textures/menu_title.png",
        commandline = "%0/tuxracer.sh",
        category = "Game", 
    },

 
    Setup.Option
    {    
    	value = false,
	required = true,
    	disabled = false,
    	bytes = 89921039,
    	description = "Install gamedata",
    	tooltip = "Needs the CDROM",
   
    	Setup.File
    	{
	    	wildcards = { "tuxracer.sh", "README.liflg" },
    		filter = function(dest)
			if ( string.match ( dest, "tuxracer.sh") ) then
				return dest, "755"
			end
			return dest
		end
	},
   
	Setup.File
	{
		source = "media://tuxracer-disc/program files/Sunspire Studios/Tux Racer/",
		wildcards = { "textures/*", "characters/*", "courses/*", "fonts/*", "manual/*", "models/*", "music/*", "tcllib/*", "textures/*", "*.tcl", "EULA", "README" },
	},

	Setup.File
	{
		source = "media://tuxracer-disc/program files/Sunspire Studios/Tux Racer/bin/x86/glibc-2.1/",
		permissions = "0755",
	},

	Setup.File
	{
		source = "base:///libesd-alsa0_0.2.36-3_i386.tar.xz/",
	},

	Setup.File
	{
		source = "base:///libaudiofile0_0.2.6-7_i386.tar.xz/",
	},

	Setup.Option
	{    
		value = true,
		required = true,
		bytes = 926352,
		description = "Apply Patch 1.1.1",
		tooltip = "Latest update for Tux Racer",
		Setup.File
		{
			allowoverwrite = true,
			source = "base:///patch-1.1.1.tar.xz/",
			filter = function(dest)
				if ( string.match ( dest, "tuxracer") ) then
					return dest, "755"
				end
				return dest
			end
		},
	},

	Setup.OptionGroup
	{
		description = "Select language",

		Setup.Option
		{    
			value = true,
			bytes = 20,
			description = "English",
			tooltip = "Install the English language for Tux Racer",
			Setup.File
			{
				source = "base:///english.tar.xz/",
			},
		},

		Setup.Option
		{    
			value = false,
			bytes = 20,
			description = "French",
			tooltip = "Install the French language for Tux Racer",
			Setup.File
			{
				source = "base:///french.tar.xz/",
			},
		},

		Setup.Option
		{    
			value = false,
			bytes = 20,
			description = "German",
			tooltip = "Install the German language for Tux Racer",
			Setup.File
			{
				source = "base:///german.tar.xz/",
			},
		},

		Setup.Option
		{    
			value = false,
			bytes = 20,
			description = "Italian",
			tooltip = "Install the Italian language for Tux Racer",
			Setup.File
			{
				source = "base:///italian.tar.xz/",
			},
		},

		Setup.Option
		{    
			value = false,
			bytes = 20,
			description = "Spanish",
			tooltip = "Install the Spanish language for Tux Racer",
			Setup.File
			{
				source = "base:///spanish.tar.xz/",
			},
		},
	},
   },
}


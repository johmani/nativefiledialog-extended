project "NFDE"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"

	targetdir (libOutputDir)
    objdir (IntermediatesOutputDir)

	files
	{
		"src/include/nfd.hpp",
	}

	includedirs
	{
		"src/include",
	}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "off"
		files
		{
			"src/nfd_gtk.cpp",
		}

	filter "system:macosx"
		pic "On"

		files
		{
			"src/nfd_cocoa.m",
		}

	filter "system:windows"
		systemversion "latest"
		staticruntime "off"
		files
		{
			"src/nfd_win.cpp",
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

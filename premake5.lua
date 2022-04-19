project "yamllll-cpp"
	location "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp"
  
    "include/**.h"
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		systemversion "latest"
    cppdialect "C++17"
    staticruntime "On"

	filter "system:linux"
    pic "On"
		systemversion "latest"
    cppdialect "C++17"
    staticruntime "On"

	filter "configurations:Debug"
		defines "YI_DEBUG"
		runtime "Debug"
		symbols "on"
		--buildoptions "/MDd"

	filter "configurations:Release"
		defines "YI_RELEASE"
		runtime "Release"
		--buildoptions "/MD"
		optimize "on"

	filter "configurations:Dist"
		defines "YI_DIST"
		runtime "Release"
		--buildoptions "/MD"
		optimize "on"

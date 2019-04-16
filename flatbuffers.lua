-- scaffold geniefile for flatbuffers

flatbuffers_script = path.getabsolute(path.getdirectory(_SCRIPT))
flatbuffers_root = path.join(flatbuffers_script, "flatbuffers")

flatbuffers_includedirs = {
	path.join(flatbuffers_script, "config"),
	flatbuffers_root,
}

flatbuffers_libdirs = {}
flatbuffers_links = {}
flatbuffers_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { flatbuffers_includedirs }
	end,

	_add_defines = function()
		defines { flatbuffers_defines }
	end,

	_add_libdirs = function()
		libdirs { flatbuffers_libdirs }
	end,

	_add_external_links = function()
		links { flatbuffers_links }
	end,

	_add_self_links = function()
		links { "flatbuffers" }
	end,

	_create_projects = function()

project "flatbuffers"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		flatbuffers_includedirs,
	}

	defines {}

	files {
		path.join(flatbuffers_script, "config", "**.h"),
		path.join(flatbuffers_root, "**.h"),
		path.join(flatbuffers_root, "**.cpp"),
	}

end, -- _create_projects()
}

---

cmake_minimum_required( VERSION 3.12.0 )

set(VER_FILE "${PROJECT_SOURCE_DIR}/defines.h")
if(EXISTS "${VER_FILE}")
	message(STATUS "Found version in file: ${VER_FILE}")
	file(STRINGS "${VER_FILE}" VER_LINES)
    string(REGEX MATCHALL "#define APPVERISON \"([0-9])+\\.([0-9])+\\.?([0-9])*" FVER_LINE ${VER_LINES})
	if(${CMAKE_MATCH_COUNT} EQUAL 3 OR (${CMAKE_MATCH_COUNT} EQUAL 2))
		set(_VERSION_MAJOR ${CMAKE_MATCH_1})
		set(_VERSION_MINOR ${CMAKE_MATCH_2})
		if(CMAKE_MATCH_3)
			set(_VERSION_PATCH ${CMAKE_MATCH_3})
		else()
			set(_VERSION_PATCH 0)
		endif()
	endif()
endif()
set( _VERSION_STRING
	${_VERSION_MAJOR}.${_VERSION_MINOR}.${_VERSION_PATCH}
)
message(STATUS "Program version is: ${_VERSION_STRING}")

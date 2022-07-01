if(BUILD_JAVA_LIBS)
	SET(ASTYLE_BUILD_TYPE "Java Shared Library")
elseif(BUILD_SHARED_LIBS)
	SET(ASTYLE_BUILD_TYPE "Shared Library")
elseif(BUILD_STATIC_LIBS)
	SET(ASTYLE_BUILD_TYPE "Static Library")
else()
	SET(ASTYLE_BUILD_TYPE "Executable")
endif()

# Display build information
message( STATUS "---------- General Configuration ----------" )
message( STATUS )
message( STATUS "CMake Generator:       ${CMAKE_GENERATOR}" )
message( STATUS "CMake Compiler:        ${CMAKE_CXX_COMPILER_ID}" )
message( STATUS "AStyle Build:          ${ASTYLE_BUILD_TYPE}" )
message( STATUS "AStyle Configuration:  ${CMAKE_BUILD_TYPE}" )
if( BUILD_JAVA_LIBS )
    message( STATUS "Java Include Path:     ${JAVA_INCLUDE_PATH}" )
endif()
message( STATUS )
message( STATUS "-------------------------------------------" )

# TMX Plugin CMakeFile v. 2.2

CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)

PROJECT(HRIStatusPlugin CXX )

#SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY "OFF")
#SET(CPACK_PACKAGE_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
#SET(CMAKE_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}")

# Read the version info from the manifest file
FILE(STRINGS manifest.json MANIFEST_DATA REGEX "\"version\":")
STRING(REGEX MATCH "([0-9]+)\\.?([0-9]+)?\\.?([0-9]+)?" PROJECT_VERSION "${MANIFEST_DATA}")
IF(DEFINED CMAKE_MATCH_1)
    SET(CPACK_PACKAGE_VERSION_MAJOR ${CMAKE_MATCH_1})
ENDIF()
IF(DEFINED CMAKE_MATCH_2)
    SET(CPACK_PACKAGE_VERSION_MINOR ${CMAKE_MATCH_2})
ENDIF()
IF(DEFINED CMAKE_MATCH_3)
    SET(CPACK_PACKAGE_VERSION_PATCH ${CMAKE_MATCH_3})
ENDIF()

set(CMAKE_CXX_DIALECT "-std=c++0x")


set(CMAKE_CXX_FLAGS_DEBUG "-g3")
set(CMAKE_CXX_OPTLEVEL 0)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_DIALECT} -O${CMAKE_CXX_OPTLEVEL} -Wall -fmessage-length=0 ${CMAKE_CXX_FLAGS}")


# Plugins just ZIP the executable along with the manifest files
SET(CPACK_GENERATOR "ZIP")
SET(CPACK_PACKAGE_NAME ${PROJECT_NAME})
SET(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
SET(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")

INCLUDE(CPack)
    
FILE(GLOB_RECURSE SOURCES "src/*.c*")

SET(REQUIRE_XERCES_C OFF)
SET(REQUIRE_SNMP OFF)
SET(REQUIRE_CURL OFF)
SET(REQUIRE_GPS OFF)

IF (REQUIRE_XERCES_C)
    # Find include directory
    FIND_PATH(XercesC_INCLUDE_DIR
              NAMES "xercesc/util/PlatformUtils.hpp"
              DOC "Xerces-C++ include directory")
    MARK_AS_ADVANCED(XercesC_INCLUDE_DIR)
    
    # Find all XercesC libraries
    FIND_LIBRARY(XercesC_LIBRARY "xerces-c"
      DOC "Xerces-C++ libraries")
    MARK_AS_ADVANCED(XercesC_LIBRARY)
ENDIF ()

IF (REQUIRE_GPS)
    # Find include directory
    FIND_PATH(GPS_INCLUDE_DIR gps.h)

    # Find all XercesC libraries
    FIND_LIBRARY(GPS_LIBRARY gps)
    FIND_LIBRARY(GPS_LIBRARY NAMES gps PATHS ${LIB_HINTS} /usr/lib /usr/local/lib)
ENDIF ()

IF (REQUIRE_SNMP)
    FIND_PATH(NETSNMP_INCLUDE_DIR snmp.h
      /usr/include/net-snmp/library
    )
    
    SET(NETSNMP_NAMES netsnmp)
    FIND_LIBRARY(NETSNMP_LIBRARY
      NAMES ${NETSNMP_NAMES}
      PATHS ${LIB_HINTS} /usr/lib /usr/local/lib
    )
    
    SET(NETSNMPAGENT_NAMES netsnmpagent)
    FIND_LIBRARY(NETSNMPAGENT_LIBRARY
      NAMES ${NETSNMPAGENT_NAMES}
      PATHS ${LIB_HINTS} /usr/lib /usr/local/lib
    )
    
    SET(NETSNMPHELPERS_NAMES netsnmphelpers)
    FIND_LIBRARY(NETSNMPHELPERS_LIBRARY
      NAMES ${NETSNMPHELPERS_NAMES}
      PATHS ${LIB_HINTS} /usr/lib /usr/local/lib
    )
    
    SET(NETSNMPMIBS_NAMES netsnmpmibs)
    FIND_LIBRARY(NETSNMPMIBS_LIBRARY
      NAMES ${NETSNMPMIBS_NAMES}
      PATHS ${LIB_HINTS} /usr/lib /usr/local/lib
    )
    
    SET(NETSNMPTRAPD_NAMES netsnmptrapd)
    FIND_LIBRARY(NETSNMPTRAPD_LIBRARY
      NAMES ${NETSNMPTRAPD_NAMES}
      PATHS ${LIB_HINTS} /usr/lib /usr/local/lib
    )
    
    SET(NETSNMP_LIBRARIES
      ${NETSNMP_LIBRARY}
      ${NETSNMPAGENT_LIBRARY}
      ${NETSNMPHELPERS_LIBRARY}
      ${NETSNMPMIBS_LIBRARY}
    #  ${NETSNMPTRAPD_LIBRARY}
    )
ENDIF ()

IF (REQUIRE_CURL)
    FIND_PACKAGE(CURL REQUIRED)
ENDIF ()

FIND_LIBRARY(tmxapi_LIBRARY
      NAMES tmxapi
      PATHS /usr/local/lib
    )

# Boost 1.55 is a requirement
ADD_DEFINITIONS (-DMX_NO_BT -DBOOST_ALL_DYN_LINK)
SET (Boost_USE_STATIC_RUNTIME OFF)

FIND_PACKAGE(Boost 1.55 COMPONENTS system thread atomic chrono regex log log_setup filesystem program_options ${XTRA_BOOST_LIBRARIES} REQUIRED)
INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIRS})
LINK_DIRECTORIES(${Boost_LIBRARY_DIRS})

# MySQL client libraries are a requirement
IF (MYSQL_INCLUDE_DIR)
  # Already in cache, be silent
  SET(MYSQL_FIND_QUIETLY TRUE)
ENDIF (MYSQL_INCLUDE_DIR)

FIND_PATH(MYSQL_INCLUDE_DIR mysql.h
  /usr/local/include/mysql
  /usr/include/mysql
)

FIND_PATH(MYSQLCPPCONN_INCLUDE_DIR cppconn/driver.h 
  /usr/local/include
  /usr/include
)

SET(MYSQL_NAMES mysqlclient mysqlclient_r)
FIND_LIBRARY(MYSQL_LIBRARY
  NAMES ${MYSQL_NAMES}
  PATHS /usr/lib /usr/local/lib
  PATH_SUFFIXES mysql
)

IF (MYSQL_INCLUDE_DIR AND MYSQLCPPCONN_INCLUDE_DIR AND MYSQL_LIBRARY)
  SET(MYSQL_FOUND TRUE)
  SET( MYSQL_LIBRARIES ${MYSQL_LIBRARY} )
  INCLUDE_DIRECTORIES(${MYSQL_INCLUDE_DIR})
  INCLUDE_DIRECTORIES(${MYSQLCPPCONN_INCLUDE_DIR})
ELSE ()
  SET(MYSQL_FOUND FALSE)
  SET( MYSQL_LIBRARIES )
ENDIF ()

IF (MYSQL_FOUND)
  IF (NOT MYSQL_FIND_QUIETLY)
    MESSAGE(STATUS "Found MySQL: ${MYSQL_LIBRARY}")
  ENDIF (NOT MYSQL_FIND_QUIETLY)
ELSE (MYSQL_FOUND)
  IF (MYSQL_FIND_REQUIRED)
    MESSAGE(STATUS "Looked for MySQL libraries named ${MYSQL_NAMES}.")
    MESSAGE(FATAL_ERROR "Could NOT find MySQL library")
  ENDIF (MYSQL_FIND_REQUIRED)
ENDIF (MYSQL_FOUND)

GET_FILENAME_COMPONENT(MYSQL_LIBRARY_DIR ${MYSQL_LIBRARY} DIRECTORY)
FIND_LIBRARY( MYSQLCPPCONN_LIBRARY NAMES mysqlcppconn HINTS ${MYSQL_LIBRARY_DIR} )

FIND_PATH( JSONCPP_INCLUDE_DIR json/json.h HINTS /usr/include/jsoncpp /usr/local/include/jsoncpp )
FIND_LIBRARY( JSONCPP_LIBRARY NAMES jsoncpp PATHS /usr/lib /usr/local/lib)
INCLUDE_DIRECTORIES(${JSONCPP_INCLUDE_DIR})

find_path( USB_INCLUDE_DIR NAMES libusb.h PATH_SUFFIXES libusb-1.0)
find_path( MEX_INCLUDE_DIR NAMES mex.h PATH_SUFFIXES octave-3.8.1/octave )
find_library( AIOUSB_LIBRARY NAMES aiousb ${LIB_HINTS} ) 
find_library( USB_LIBRARY NAMES libusb-1.0.so.0 ${LIB_HINTS} )

MARK_AS_ADVANCED(
  MYSQL_LIBRARY
  MYSQL_INCLUDE_DIR
  MYSQLCPPCONN_INCLUDE_DIR
  JSONCPP_INCLUDE_DIR
  )


ADD_EXECUTABLE( ${PROJECT_NAME} ${SOURCES} )
ADD_DEPENDENCIES( ${PROJECT_NAME} tmxutils )

TARGET_INCLUDE_DIRECTORIES( ${PROJECT_NAME} PUBLIC /usr/local/include/TMX/TmxApi)
TARGET_INCLUDE_DIRECTORIES( ${PROJECT_NAME} PUBLIC /usr/local/include/TMX/Asn_J2735/include)
TARGET_INCLUDE_DIRECTORIES( ${PROJECT_NAME} PUBLIC /usr/local/include/TMX/TmxUtils/src)
TARGET_INCLUDE_DIRECTORIES( ${PROJECT_NAME} PUBLIC /usr/local/include/TMX/TmxMessages/include)
target_include_directories( ${PROJECT_NAME} PUBLIC ${TMX_LIBRARIES_DIR}/AIOUSB/include ${USB_INCLUDE_DIR} ${MEX_INCLUDE_DIR} )


TARGET_LINK_LIBRARIES( ${PROJECT_NAME} /usr/local/lib/libtmxutils.a)
TARGET_LINK_LIBRARIES( ${PROJECT_NAME} /usr/local/lib/libtmxapi.so)
TARGET_LINK_LIBRARIES( ${PROJECT_NAME} /usr/local/lib/libasn_j2735_r41.so)
target_link_libraries( ${PROJECT_NAME} rt ${AIOUSB_LIBRARY} ${USB_LIBRARY}) 
TARGET_LINK_LIBRARIES( ${PROJECT_NAME} ${Boost_LIBRARIES} uuid ${MYSQL_LIBRARIES} ${MYSQLCPPCONN_LIBRARY} pthread m rt)

IF (REQUIRE_XERCES_C)
    TARGET_LINK_LIBRARIES( ${PROJECT_NAME} ${XercesC_LIBRARY} )
ENDIF()
IF (REQUIRE_SNMP)
    TARGET_LINK_LIBRARIES( ${PROJECT_NAME} ${NETSNMP_LIBRARIES} )
ENDIF()
IF (REQUIRE_CULR)
    TARGET_LINK_LIBRARIES( ${PROJECT_NAME} ${CURL_LIBRARIES} )
ENDIF()
IF (REQUIRE_GPS)
    TARGET_LINK_LIBRARIES( ${PROJECT_NAME} ${GPS_LIBRARY} )
ENDIF()

IF (CMAKE_VERSION VERSION_GREATER 3.3 AND CMAKE_VERSION VERSION_LESS 3.4)
    MESSAGE(STATUS "WARNING: CMake Version ${CMAKE_VERSION} contains bug 0015696, which prohibits the plugin packaging")
    MESSAGE(STATUS "         from executing correctly in this build.  You need to upgrade to CMake 3.4 or else package manually")
    MESSAGE(STATUS "         See https://cmake.org/Bug/view.php?id=15696 for more details")
    MESSAGE(WARNING "Unable to package the plugins directly from this build")
ELSE ()
    ADD_CUSTOM_TARGET(bundle_${PROJECT_NAME}
        COMMAND "${CMAKE_CPACK_COMMAND}" 
        "-C" "$<CONFIGURATION>" "--config" "${CMAKE_BINARY_DIR}/CPackConfig.cmake")
    ADD_CUSTOM_TARGET(bundle_${PROJECT_NAME}_cleanup
        COMMAND rm -rf "${CPACK_PACKAGE_DIRECTORY}/_CPack_Packages")
    ADD_DEPENDENCIES(bundle_${PROJECT_NAME}_cleanup bundle_${PROJECT_NAME})
    ADD_CUSTOM_COMMAND(TARGET ${PROJECT_NAME} POST_BUILD
                   COMMAND ${CMAKE_MAKE_PROGRAM} bundle_${PROJECT_NAME}_cleanup
                   WORKING_DIRECTORY ${CMAKE_BINARY_DIR} )
ENDIF ()


INSTALL(TARGETS ${PROJECT_NAME} DESTINATION bin)
INSTALL(FILES manifest.json DESTINATION .)

# Copyright (C) 2018  Christian Berger
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

###########################################################################
# Find libaom.
FIND_PATH(AOM_INCLUDE_DIR
          NAMES aom/aom_encoder.h
          PATHS /usr/local/include/
                /usr/include/)
MARK_AS_ADVANCED(AOM_INCLUDE_DIR)
FIND_LIBRARY(AOM_LIBRARY
             NAMES aom
             PATHS ${LIBAOMDIR}/lib/
                    /usr/lib/arm-linux-gnueabihf/
                    /usr/lib/arm-linux-gnueabi/
                    /usr/lib/x86_64-linux-gnu/
                    /usr/local/lib64/
                    /usr/lib64/
                    /usr/lib/)
MARK_AS_ADVANCED(AOM_LIBRARY)

###########################################################################
IF (AOM_INCLUDE_DIR
    AND AOM_LIBRARY)
    SET(AOM_FOUND 1)
    SET(AOM_LIBRARIES ${AOM_LIBRARY})
    SET(AOM_INCLUDE_DIRS ${AOM_INCLUDE_DIR})
ENDIF()

MARK_AS_ADVANCED(AOM_LIBRARIES)
MARK_AS_ADVANCED(AOM_INCLUDE_DIRS)

IF (AOM_FOUND)
    MESSAGE(STATUS "Found libaom: ${AOM_INCLUDE_DIRS}, ${AOM_LIBRARIES}")
ELSE ()
    MESSAGE(STATUS "Could not find libaom")
ENDIF()

#! /usr/bin/python3
""" Use a diff viewer to show diffs in files from the astyle report.
"""

# to disable the print statement and use the print() function (version 3 format)
from __future__ import print_function

import os
# local libraries
import libastyle
import libtest

# -----------------------------------------------------------------------------

def main():
    """Main processing function.
    """
    libastyle.set_text_color("yellow")
    print(libastyle.get_python_version())
    os.chdir(libastyle.get_file_py_directory())
    testfile = "test.txt"
    formatted, unused, unused, unused = libtest.get_astyle_totals(testfile)
    files = libtest.get_formatted_files(testfile)
    verify_formatted_files(len(files), formatted)
    libtest.diff_formatted_files(files)

# -----------------------------------------------------------------------------

def verify_formatted_files(numformat, totformat):
    """Check that the formatted files list equals the astyle report total.
    """
    if totformat != numformat:
        message = "files != report ({0},{1})".format(numformat, totformat)
        libastyle.system_exit(message)

# -----------------------------------------------------------------------------

# make the module executable
if __name__ == "__main__":
    main()
    libastyle.system_exit()

# -----------------------------------------------------------------------------

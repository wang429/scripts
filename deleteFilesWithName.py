import os
import sys


def delete(filename, root_dir, recursive=False):
    dir_list = os.listdir(root_dir)
    for item in dir_list:
        pathname = os.path.join(root_dir, item)
        if os.path.isdir(pathname):
            if item == filename:
                os.removedirs(pathname)
            elif recursive:
                delete(filename, pathname, recursive)
        else:
            if item.__contains__(filename):
                os.unlink(pathname)


args = sys.argv[1:]
delete(args[0], args[1], args[2] == "True")

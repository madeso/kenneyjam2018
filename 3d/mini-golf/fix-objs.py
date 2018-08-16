#!/usr/bin/env python3

import glob
import subprocess
import os

# this script fixes kenneys crappy meshes
# for some reason his meshes have convex faces and
# some engines don't convert those to concave

# so lets use assimp cmdline to update them
# and also 'optimize' and remove redundant crap if they exist

# todo: change the path to assimp for your system
# in assimp dir i 'mkdir makefilebuild' and in that I 'cmake ..' and 'make' to get the assimp_cmd executable
# on windows there is a release build that might contain a prebuilt cmd, I don't know
assimp_path = os.path.expanduser('~/dev/assimp/makefilebuild/tools/assimp_cmd/assimp')

for obj in glob.glob('*.obj'):
    # triangulate
    # join identical vertices
    # remove redundant materials
    # improve cache locality
    # fix normals
    # optimize meshes
    full_path = os.path.join(os.getcwd(), obj)
    print('Updating ', full_path)
    subprocess.check_call([assimp_path, 'export', full_path, full_path, '-tri', '-jiv', '-rrm', '-icl', '-fixn', '-om'])

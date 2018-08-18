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
src_folder = os.path.expanduser('~/Downloads/kenney/3d-minigolf-pack/Models')

for obj in glob.glob('*.obj'):
    # triangulate
    # join identical vertices
    # remove redundant materials
    # improve cache locality
    # fix normals
    # optimize meshes
    from_path = os.path.join(src_folder, obj)
    to_path = os.path.join(os.getcwd(), obj)
    base = os.path.splitext(obj)[0]
    sett_file = os.path.join(os.getcwd(), base + '.align')
    print('Updating ', obj)
    align = '0xz-y'
    if os.path.isfile(sett_file):
      with open(sett_file) as s:
        align =s.read()
    subprocess.check_call([assimp_path, 'export', from_path, to_path, '-am=' + align, '-tri'])

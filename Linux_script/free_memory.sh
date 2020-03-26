sync
echo 2 > /proc/sys/vm/drop_caches


drop_caches

Writing to this will cause the kernel to drop clean caches, dentries and
inodes from memory, causing that memory to become free.

To free pagecache:
    echo 1 > /proc/sys/vm/drop_caches
To free dentries and inodes:
    echo 2 > /proc/sys/vm/drop_caches
To free pagecache, dentries and inodes:
    echo 3 > /proc/sys/vm/drop_caches

As this is a non-destructive operation and dirty objects are not freeable, the
user should run `sync' first.

1. An inode in your context is a data structure that represents a file. 
2. A dentries is a data structure that represents a directory. These structures could be used to build a memory cache that represents the file structure on a disk. To get a directly listing, the OS could go to the dentries--if the directory is there--list its contents (a series of inodes). If not there, go to the disk and read it into memory so that it can be used again.
3. The page cache could contain any memory mappings to blocks on disk. That could conceivably be buffered I/O, memory mapped files, paged areas of executables--anything that the OS could hold in memory from a file.



why:
There's used memory, which is where important data is stored, and if that reaches 100% you're dead
Then there's cache/buffer, which is used as long as there is space to do so. It's facultative memory to access disk files faster, mostly. If you run out of free memory, this will just free itself and let you access disk directly.

also can run by root:

 free && sync && echo 3 > /proc/sys/vm/drop_caches && free

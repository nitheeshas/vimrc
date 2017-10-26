def FlagsForFile( filename, **kwargs ):
    flags = [
        '-x',
        'c++',
        '-Wall',
        '-I/usr/include',
        '-I/usr/local/include'
    ]

    return {
        'flags': flags,
    }

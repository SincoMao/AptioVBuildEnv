/***
*dosmap.c - Maps OS errors to errno values
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       _dosmaperr: Maps OS errors to errno values
*
*******************************************************************************/

#include <cruntime.h>
#include <errno.h>
#include <oscalls.h>
#include <stdlib.h>
#include <internal.h>
#include <mtdll.h>

/* This is the error table that defines the mapping between OS error
   codes and errno values */

struct errentry {
        unsigned long oscode;           /* OS return value */
        int errnocode;  /* System V error code */
};

static struct errentry errtable[] = {
        {  ERROR_INVALID_FUNCTION,       EINVAL    },  /* 1 */
        {  ERROR_FILE_NOT_FOUND,         ENOENT    },  /* 2 */
        {  ERROR_PATH_NOT_FOUND,         ENOENT    },  /* 3 */
        {  ERROR_TOO_MANY_OPEN_FILES,    EMFILE    },  /* 4 */
        {  ERROR_ACCESS_DENIED,          EACCES    },  /* 5 */
        {  ERROR_INVALID_HANDLE,         EBADF     },  /* 6 */
        {  ERROR_ARENA_TRASHED,          ENOMEM    },  /* 7 */
        {  ERROR_NOT_ENOUGH_MEMORY,      ENOMEM    },  /* 8 */
        {  ERROR_INVALID_BLOCK,          ENOMEM    },  /* 9 */
        {  ERROR_BAD_ENVIRONMENT,        E2BIG     },  /* 10 */
        {  ERROR_BAD_FORMAT,             ENOEXEC   },  /* 11 */
        {  ERROR_INVALID_ACCESS,         EINVAL    },  /* 12 */
        {  ERROR_INVALID_DATA,           EINVAL    },  /* 13 */
        {  ERROR_INVALID_DRIVE,          ENOENT    },  /* 15 */
        {  ERROR_CURRENT_DIRECTORY,      EACCES    },  /* 16 */
        {  ERROR_NOT_SAME_DEVICE,        EXDEV     },  /* 17 */
        {  ERROR_NO_MORE_FILES,          ENOENT    },  /* 18 */
        {  ERROR_LOCK_VIOLATION,         EACCES    },  /* 33 */
        {  ERROR_BAD_NETPATH,            ENOENT    },  /* 53 */
        {  ERROR_NETWORK_ACCESS_DENIED,  EACCES    },  /* 65 */
        {  ERROR_BAD_NET_NAME,           ENOENT    },  /* 67 */
        {  ERROR_FILE_EXISTS,            EEXIST    },  /* 80 */
        {  ERROR_CANNOT_MAKE,            EACCES    },  /* 82 */
        {  ERROR_FAIL_I24,               EACCES    },  /* 83 */
        {  ERROR_INVALID_PARAMETER,      EINVAL    },  /* 87 */
        {  ERROR_NO_PROC_SLOTS,          EAGAIN    },  /* 89 */
        {  ERROR_DRIVE_LOCKED,           EACCES    },  /* 108 */
        {  ERROR_BROKEN_PIPE,            EPIPE     },  /* 109 */
        {  ERROR_DISK_FULL,              ENOSPC    },  /* 112 */
        {  ERROR_INVALID_TARGET_HANDLE,  EBADF     },  /* 114 */
        {  ERROR_INVALID_HANDLE,         EINVAL    },  /* 124 */
        {  ERROR_WAIT_NO_CHILDREN,       ECHILD    },  /* 128 */
        {  ERROR_CHILD_NOT_COMPLETE,     ECHILD    },  /* 129 */
        {  ERROR_DIRECT_ACCESS_HANDLE,   EBADF     },  /* 130 */
        {  ERROR_NEGATIVE_SEEK,          EINVAL    },  /* 131 */
        {  ERROR_SEEK_ON_DEVICE,         EACCES    },  /* 132 */
        {  ERROR_DIR_NOT_EMPTY,          ENOTEMPTY },  /* 145 */
        {  ERROR_NOT_LOCKED,             EACCES    },  /* 158 */
        {  ERROR_BAD_PATHNAME,           ENOENT    },  /* 161 */
        {  ERROR_MAX_THRDS_REACHED,      EAGAIN    },  /* 164 */
        {  ERROR_LOCK_FAILED,            EACCES    },  /* 167 */
        {  ERROR_ALREADY_EXISTS,         EEXIST    },  /* 183 */
        {  ERROR_FILENAME_EXCED_RANGE,   ENOENT    },  /* 206 */
        {  ERROR_NESTING_NOT_ALLOWED,    EAGAIN    },  /* 215 */
        {  ERROR_NOT_ENOUGH_QUOTA,       ENOMEM    }    /* 1816 */
};

/* size of the table */
#define ERRTABLESIZE (sizeof(errtable)/sizeof(errtable[0]))

/* The following two constants must be the minimum and maximum
   values in the (contiguous) range of Exec Failure errors. */
#define MIN_EXEC_ERROR ERROR_INVALID_STARTING_CODESEG
#define MAX_EXEC_ERROR ERROR_INFLOOP_IN_RELOC_CHAIN

/* These are the low and high value in the range of errors that are
   access violations */
#define MIN_EACCES_RANGE ERROR_WRITE_PROTECT
#define MAX_EACCES_RANGE ERROR_SHARING_BUFFER_EXCEEDED


/***
*void _dosmaperr(oserrno) - Map function number
*
*Purpose:
*       This function takes an OS error number, and maps it to the
*       corresponding errno value (based on UNIX System V values). The
*       OS error number is stored in _doserrno (and the mapped value is
*       stored in errno)
*
*Entry:
*       ULONG oserrno = OS error value
*
*Exit:
*       sets _doserrno and errno.
*
*Exceptions:
*
*******************************************************************************/

_CRTIMP void __cdecl _dosmaperr (
        unsigned long oserrno
        )
{
    _doserrno = oserrno;        /* set _doserrno */

    errno = _get_errno_from_oserr(oserrno);
}

int __cdecl _get_errno_from_oserr(
        unsigned long oserrno
        )
{
        int i;

        /* check the table for the OS error code */
        for (i = 0; i < ERRTABLESIZE; ++i) {
                if (oserrno == errtable[i].oscode) {
                        return  errtable[i].errnocode;
                }
        }

        /* The error code wasn't in the table.  We check for a range of */
        /* EACCES errors or exec failure errors (ENOEXEC).  Otherwise   */
        /* EINVAL is returned.                                          */

        if (oserrno >= MIN_EACCES_RANGE && oserrno <= MAX_EACCES_RANGE)
                return EACCES;
        else if (oserrno >= MIN_EXEC_ERROR && oserrno <= MAX_EXEC_ERROR)
                return ENOEXEC;
        else
                return EINVAL;
}

/***
*errno_t _set_errno() - set errno
*
*Purpose:
*       Set the value of errno
*
*Entry:
*       int value
*
*Exit:
*       The error code
*
*Exceptions:
*
*******************************************************************************/
errno_t _set_errno(int value)
{
    _ptiddata ptd = _getptd_noexit();
    if (!ptd)
    {
        return ENOMEM;
    }
    else
    {
        errno = value;
        return 0;
    }
}

/***
*errno_t _get_errno() - get errno
*
*Purpose:
*       Get the value of errno
*
*Entry:
*       int *pValue - pointer where to store the value
*
*Exit:
*       The error code
*
*Exceptions:
*       Input parameters are validated. Refer to the validation section of the function.
*
*******************************************************************************/
errno_t _get_errno(int *pValue)
{
    /* validation section */
    _VALIDATE_RETURN_NOERRNO(pValue != NULL, EINVAL);

    /* Unlike most of our globals, this one is guaranteed to give some answer */

    *pValue = errno;
    return 0;
}

/***
*errno_t _set_doserrno() - set _doserrno
*
*Purpose:
*       Set the value of _doserrno
*
*Entry:
*       unsigned long value
*
*Exit:
*       The error code
*
*Exceptions:
*
*******************************************************************************/
errno_t _set_doserrno(unsigned long value)
{
    _ptiddata ptd = _getptd_noexit();
    if (!ptd)
    {
        return ENOMEM;
    }
    else
    {
        _doserrno = value;
        return 0;
    }
}

/***
*errno_t _get_doserrno() - get _doserrno
*
*Purpose:
*       Get the value of _doserrno
*
*Entry:
*       unsigned long *pValue - pointer where to store the value
*
*Exit:
*       The error code
*
*Exceptions:
*       Input parameters are validated. Refer to the validation section of the function.
*
*******************************************************************************/
errno_t _get_doserrno(unsigned long *pValue)
{
    /* validation section */
    _VALIDATE_RETURN_NOERRNO(pValue != NULL, EINVAL);

    /* Unlike most of our globals, this one is guaranteed to give some answer */

    *pValue = _doserrno;
    return 0;
}

/***
*int * _errno()                 - return pointer to thread's errno
*unsigned long * __doserrno()   - return pointer to thread's _doserrno
*
*Purpose:
*       _errno() returns a pointer to the _terrno field in the current
*       thread's _tiddata structure.
*       __doserrno returns a pointer to the _tdoserrno field in the current
*       thread's _tiddata structure
*
*Entry:
*       None.
*
*Exit:
*       See above.
*
*Exceptions:
*
*******************************************************************************/

static int ErrnoNoMem = ENOMEM;
static unsigned long DoserrorNoMem = ERROR_NOT_ENOUGH_MEMORY;

int * __cdecl _errno(
        void
        )
{
    _ptiddata ptd = _getptd_noexit();
    if (!ptd) {
        return &ErrnoNoMem;
    } else {
        return ( &ptd->_terrno );
    }

}

unsigned long * __cdecl __doserrno(
        void
        )
{
    _ptiddata ptd = _getptd_noexit();
    if (!ptd) {
        return &DoserrorNoMem;
    } else {
        return ( &ptd->_tdoserrno );
    }
}

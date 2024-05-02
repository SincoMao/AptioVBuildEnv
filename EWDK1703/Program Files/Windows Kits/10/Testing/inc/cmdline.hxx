//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
//
// Use of this source code is subject to the terms of the Microsoft
// premium shared source license agreement under which you licensed
// this source code. If you did not accept the terms of the license
// agreement, you are not authorized to use this source code.
// For the terms of the license, please see the license agreement
// signed by you and Microsoft.
// THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
//
#include <windows.h>
#include <string>
#include <list>
#include "cmdline.h"

const INT MAX_ARGS = 64;

using namespace std;

class cmdline
{
private:
    INT m_iArgC;
    LPWSTR * m_lplpArgV;
public:
    cmdline( )
    {
        m_iArgC = 0;
        m_lplpArgV = NULL;
    }

    ~cmdline()
    {
        delete [] m_lplpArgV;
    }


    BOOL Initialize( _In_z_ LPWSTR lpszCommandLine )
    {
        //make sure to only allocate the ArgV array once
        if ( ! m_lplpArgV )
        {
            m_iArgC = MAX_ARGS;
            m_lplpArgV = new LPWSTR[MAX_ARGS];
        }

        if ( m_lplpArgV )
        {
            CommandLineToArgs(lpszCommandLine, &m_iArgC, m_lplpArgV);
            StrictOptionsOnly(TRUE);
            return TRUE;
        }

        return FALSE;
    }

    BOOL Initialize( int argc, _In_reads_(argc)  WCHAR* argv[] )
    {
        if ( ! m_lplpArgV ) 
        {
            //skip copying the exe name
            m_iArgC = argc - 1;
            m_lplpArgV = new LPWSTR[argc - 1];
            if ( m_lplpArgV )
            {
                for ( int i = 1; i < argc; i++ )
                {
                    m_lplpArgV[i - 1] = argv[i];
                }
                StrictOptionsOnly(TRUE);
                return TRUE;
            }
        }
        return FALSE;
    }

    INT GetOptionCount( )
    {
        return m_iArgC; 
    }

    INT WasOption( const wstring & strOption )
    {
        if ( m_lplpArgV )
        {
            return ::WasOption( m_iArgC, m_lplpArgV, ( WCHAR * )strOption.c_str() );
        }
        else 
        {
            return -1;
        }
    }

    INT GetOption( const wstring & strOption, wstring & strOptionValue ) const
    {
        if ( m_lplpArgV )
        {
            LPWSTR lpszOption;
            INT iResult = ::GetOption( m_iArgC, m_lplpArgV, ( WCHAR * )strOption.c_str(), &lpszOption );
            if ( iResult >= 0 )
            {
                strOptionValue = lpszOption;
            }
            return iResult;
        }
        else
        {
            return -1;
        }
    }

    INT GetOption( const wstring & strOption, INT * piArgument )
    {
        if ( m_lplpArgV )
        {
            return ::GetOptionAsInt( m_iArgC, m_lplpArgV, ( WCHAR * )strOption.c_str(), piArgument );
        }
        else
        {
            return -1;
        }
    }

    INT GetOption( const wstring & strOption, DWORD * pdwArgument ) const
    {
        if ( m_lplpArgV )
        {
            return ::GetOptionAsDWORD( m_iArgC, m_lplpArgV, ( WCHAR * )strOption.c_str(), pdwArgument );
        }
        else
        {
            return -1;
        }
    }

    INT GetOption( const wstring & strOption, list<wstring> &  lststrOptions)
    {
        if ( m_lplpArgV )
        {
            LPWSTR lpszOption;
            INT iArgC = -1;
            INT iResult = ::GetOption( m_iArgC, m_lplpArgV, ( WCHAR * )strOption.c_str(), &lpszOption );
            while ( iResult >= 0 )
            {
                lststrOptions.push_back(lpszOption);
                iArgC = iResult;
                iResult = ::GetOption( iArgC, m_lplpArgV, ( WCHAR * )strOption.c_str(), &lpszOption );
            }
            return iArgC;
        }
        else
        {
            return -1;
        }
    }
}; //cmdline class
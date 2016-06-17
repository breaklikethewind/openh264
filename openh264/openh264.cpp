// openh264.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#include "openh264.h"

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
        case DLL_PROCESS_ATTACH:
        case DLL_THREAD_ATTACH:
        case DLL_THREAD_DETACH:
        case DLL_PROCESS_DETACH:
            break;
    }
    return TRUE;
}


// This is an example of an exported variable
openh264_API int nopenh264=0;

// This is an example of an exported function.
openh264_API int fnopenh264(void)
{
    return 42;
}

// This is the constructor of a class that has been exported.
// see openh264.h for the class definition
Copenh264::Copenh264()
{ 
    return; 
}


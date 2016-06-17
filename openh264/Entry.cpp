
#include <windows.h>

extern BOOL WINAPI DllEntryPoint (HINSTANCE hInstance, DWORD dwReason, LPVOID lpReserved);


/////////////////////////////////////////////////////////////////////////////
// DLL Entry

BOOL WINAPI DllEntry (HINSTANCE hInstance, DWORD dwReason, LPVOID lpReserved) {
	return DllEntryPoint (hInstance, dwReason, lpReserved);
}

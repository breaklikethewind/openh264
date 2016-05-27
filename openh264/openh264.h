
// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the openh264_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// openh264_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#ifdef openh264_EXPORTS
#define openh264_API __declspec(dllexport)
#else
#define openh264_API __declspec(dllimport)
#endif

// This class is exported from the openh264.dll
class openh264_API Copenh264 {
public:
    Copenh264(void);
    // TODO: add your methods here.
};

extern openh264_API int nopenh264;

openh264_API int fnopenh264(void);



The original source code was pulled from:
https://github.com/cisco/openh264/

When building openh264 in the wince7 BSP:
openh264.lib can be found at C:\WINCE700\osdesigns\KX7\Wince700\MX35_ARMV6_Retail\cesysgen\platform\MX35\lib\ARMV6\retail
openh264.dll can be found at C:\WINCE700\osdesigns\KX7\Wince700\MX35_ARMV6_Retail\cesysgen\platform\MX35\target\ARMV6\retail

openh264 NEON support:
WinCE7 trys to assemble anything in a folder named "\asm". To stop this, the 
original source from https://github.com/cisco/openh264/ with any folders named
/asm have been renamed to /arm-nobuild.

The assembly from https://github.com/cisco/openh264/ is written for the GNU
assembler. This assembly (mostly macro definition/usage) is incompatable with
the Microsoft assembler. So assembly ported to the Microsoft assembler is 
located in folders named /msarmasm. The original assembly for those ports
are located in the respective /arm-nobuild folder, with the same file name.



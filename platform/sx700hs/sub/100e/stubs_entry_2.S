#include "stubs_asm.h"

// BEWARE: thumb functions NEED the thumb bit in the below list
// Found for sx700

#define NULL_SUB	0xfc02041d	// bx lr
#define RET1		0xfc02042b	// mov r0, #1 ; bx lr
#define RET0		0xfc02041f	// mov r0, #0 ; bx lr

// *** FOUND for sx700 ***
NHSTUB(Feof_Fut,								0xfc2d7d95) // sx700 from CreateJumptable, after Fgets and Fseek @ fc45bc5c

NHSTUB(Fflush_Fut,								0xfc2d7dbd) // sx700 Found directly after Feof_Fut in ROM

NHSTUB(SetFileTimeStamp,						0xfc3080fd) // sx700 from ref to 0x12cea600 @0xfc308110, similar to sx280hs search '^; stat '

NHSTUB(SetFileAttributes,						0xfc308145) // sx700 MakeDirectoryFUT function following SetFileTimeStamp in ROM

// sx700 Search for RedEyeController from the end, then search forward for DeleteFile_Fut
NHSTUB(RenameFile_Fut,							0xfc2d7b45) // Via fc3505e2 similar to g7x fc41fef8, just after ref to DeleteFile_Fut, LDR 

// sx700 Search for SCRIPT from the end, then search back for b.w
NHSTUB(MakeSDCardBootable,						0xfc307d93) // in function before ref to "SCRIPT" @0xfc316cf8


NHSTUB(GetFocusLensSubjectDistanceFromLens,		0xfc2dcf41) // call at 0xfc2bd058 via SetISFocusLensDistance_FW -> 0xfc2bd056 //sx700 found

// sx700 sx700hs based on ref to fc2e117c (ref "%s/%3d%s") -> sub_fc3e690e, which refs  "___%02d" and "_%02d%02d"
NHSTUB(GetImageFolder,							0xfc2e07d9) // sx700 found

NHSTUB(apex2us,									0xfc313637) // sx700 Shutter.c asserts @ fc1495ca -> fc149620 instructions similar to g7x fc3826c4

NHSTUB(GetDrive_TotalClusters,					0xfc307985) // sx700 found function immediately before GetDrive_FreeClusters in ROM

NHSTUB(LogCameraEvent,							0xfc306b6f) // sx700 found debugging, from func csv 

NHSTUB(CancelHPTimer,							0xfc1360f5) // sx700 At fc0e3f42, following LcdSequence, TakeSemaphoreStrictly calls similar to g7x fc0cd6b0 

NHSTUB(get_dial_hw_position,					0xfc364be9) // sx700 kbd_p1_f_cont->fc06e0ce->fc06be36, 4 for jogdial 


// required because DryOS >=54 functions assert on unitialized event flag, sem etc 
// see https://chdk.setepontos.com/index.php?topic=12516.0
NHSTUB(init_focus_eventflag,	0xfc45d487) // sx700 InitializeAdjustmentSystem->fc40e0e4->fc45d486 event flag matches MoveFocusLensToDistance 

NHSTUB(init_nd_eventflag,		0xfc45d591) // sx700 InitializeAdjustmentSystem->fc542300->fc45d590 event flag matches PutInNdFilter 

NHSTUB(CreateBinarySemaphoreStrictly,           0x010c5b6b) // from csv // sx700

// sx700 (via sx60hs) via func fc07b6ba hooked in preshoot case, similar to g7x
NHSTUB(captseq_raw_addr_init,					0xfc12fedf)


// *** Not Found 

//NHSTUB(PT_PlaySound,							0xfc3061c1) // via call from fc34f924 to fc3505e2, similar to g7x fc41fef8
//NHSTUB(PT_PlaySound, NULL_SUB)

// not implemented
NHSTUB(EnterToCompensationEVF,NULL_SUB)
NHSTUB(ExitFromCompensationEVF,NULL_SUB)
NHSTUB(ExpCtrlTool_StartContiAE,NULL_SUB)
NHSTUB(ExpCtrlTool_StopContiAE,NULL_SUB)
NHSTUB(RefreshPhysicalScreen,NULL_SUB)
NHSTUB(Restart,NULL_SUB)
NHSTUB(SetParameterData,NULL_SUB)
NHSTUB(WriteSDCard,NULL_SUB)
NHSTUB(reboot_fw_update,NULL_SUB)

// from sx280 These don't exist
NHSTUB(SetZoomActuatorSpeedPercent, NULL_SUB)
NHSTUB(UnsetZoomForMovie,           NULL_SUB)


#include "stubs_asm.h"
// BEWARE: thumb functions NEED the thumb bit in the below list

#define NULL_SUB	0xfc020485	// bx lr
#define RET1		0xfc020493	// mov r0, #1 ; bx lr
#define RET0		0xfc020487	// mov r0, #0 ; bx lr

NHSTUB(Feof_Fut,								0xfc2d7d95) // FTM from CreateJumptable, after Fgets and Fseek @ fc45bc5c
NHSTUB(Fflush_Fut,								0xfc2d7dbd) // FTM Found directly after Feof_Fut in ROM
NHSTUB(SetFileTimeStamp,						0xfc3080fd) // FTM from ref to 0x12cea600 @0xfc308110, similar to sx280hs search '^; stat '
NHSTUB(SetFileAttributes,						0xfc308145) // FTM MakeDirectoryFUT function following SetFileTimeStamp in ROM

// FTM Search for RedEyeController from the end, then search forward for DeleteFile_Fut
NHSTUB(RenameFile_Fut,							0xfc2d7b45) // Via fc3505e2 similar to g7x fc41fef8, just after ref to DeleteFile_Fut, LDR 

// FTM Search for SCRIPT from the end, then search back for b.w
NHSTUB(MakeSDCardBootable,						0xfc307d93) // in function before ref to "SCRIPT" @0xfc316cf8


//NHSTUB(GetFocusLensSubjectDistanceFromLens,		0xfc3281bb) // call at 0xfc2375c6 via SetISFocusLensDistance_FW -> 0xfc2375c4 //xfound
NHSTUB(GetFocusLensSubjectDistanceFromLens,		NULL_SUB) 

// based on ref to fc31152e (ref "%s/%3d%s") -> sub_fc16ca2a, which refs  "___%02d" and "_%02d%02d"
//NHSTUB(GetImageFolder,							0xfc310b09) // xfound
NHSTUB(GetImageFolder,NULL_SUB)

//NHSTUB(apex2us,									0xfc1c8c83) // instructions around fc1c8cc0 similar to g7x fc3826c4
NHSTUB(apex2us,NULL_SUB)

NHSTUB(GetDrive_TotalClusters,					0xfc307985) // FTM found function immediately before GetDrive_FreeClusters in ROM

//NHSTUB(LogCameraEvent,							0xfc2f2a0f) // debugging, from func csv //xfound
NHSTUB(LogCameraEvent,NULL_SUB)

//NHSTUB(CancelHPTimer,							0xfc126b7d) // At fc0f20c8, following LcdSequence, TakeSemaphoreStrictly calls similar to g7x fc0cd6b0 // xfound
NHSTUB(CancelHPTimer,NULL_SUB)

//NHSTUB(get_dial_hw_position,					0xfc110d61) // kbd_p1_f_cont->fc086ab4->fc08b5cc, 4 for jogdial // xfound
NHSTUB(get_dial_hw_position,NULL_SUB)

//NHSTUB(PT_PlaySound,							0xfc3061c1) // via call from fc34f924 to fc3505e2, similar to g7x fc41fef8

// required because DryOS >=54 functions assert on unitialized event flag, sem etc 
// see https://chdk.setepontos.com/index.php?topic=12516.0
//NHSTUB(init_focus_eventflag,	0xfc54dd2b) // InitializeAdjustmentSystem->fc542300->fc54dd2a event flag matches MoveFocusLensToDistance // xfound
NHSTUB(init_focus_eventflag, NULL_SUB)

//NHSTUB(init_nd_eventflag,		0xfc54de35) // InitializeAdjustmentSystem->fc542300->fc54de34 event flag matches PutInNdFilter // xfound
NHSTUB(init_nd_eventflag,NULL_SUB)

NHSTUB(CreateBinarySemaphoreStrictly,           0x010c5b6b) // from csv // FTM

// via func fc07b6ba hooked in preshoot case, similar to g7x
NHSTUB(captseq_raw_addr_init,					0xfc0821d3)


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


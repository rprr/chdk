#include "stubs_asm.h"
// Started with sx710hs

// **** Found ***

DEF(file_counter_var,              0x00013128) // found by ftm @fc1a82b8 by searching for "FileBackupProperty.c", similar to G7X 

DEF(av_override_semaphore         ,0x00022784) // found by ftm in MoveIrisWithAv, required for bracketing Created by Mecha.Create in fc40cb82

DEF(canon_menu_active             ,0x0000c7b0+0x4) // found by ftm  @fc3d64c0, via call to sub_fc3d64be, near ref to "MviCon_ClrEvt" @fc2f186e, just after PT_PlaySound call

// originally by searching https://chdk.setepontos.com/index.php?topic=12532.msg129914#msg129914
// fc19194a from "ImgDDev.c", similar to g7x
DEF(current_fb_d                  ,0x0000fb58+0x24) // found by ftm

DEF(simple_movie_status           ,0x13ac8) // found by ftm  0x00013a20 + 0x80 + 0x28 @fc1b1e62 sub_fc1b1e48 via task_MovieRecord 0xfc1b40e3

DEF(zoom_status                             ,0x0001ec38) // found by ftm 0x0001ec58 - 0x20  @fc343122 via "TerminateDeliverToZoomController", unclear which offset should be used

// fc2fc470 via "ShtCon_StopReview", similar to g7x https://chdk.setepontos.com/index.php?topic=12692.msg130261#msg130261
// ftm: @fc3037a6 used the sx280 method near ShootCon_NotifyStartReviewHold
DEF(recreview_hold                ,0x8ebc) // found by ftm 0x8df0 + 0x80 + 0x4c

// based on search for 4500 100
// 112 entries, 2 words each, first is fl
DEF(focus_len_table                ,0xfdf2ce94) //found by ftm thanks to reyalp

DEF(bitmap_buffer, 0xc754+0x34) // found by ftm struct starts @ 0xc754, from sub @0xfc30ccdc after "VTM SW", +0x34 @fc30cd74

// Camera has 2 RAW buffers @ ?? & ??
DEF(raw_buffers                             ,0xfc5d9098) // Found by FTM @fc160e42 

DEF(active_raw_buffer                       ,0x0000baf4) // Found  by FTM @0xfc12fe98, 0xffffffff when uninited (0xC offset added similar to sx280)

// *** Not Found *** 

// via fc0d1ce4 (similar g7x fc13b3da), searching mem near 0x86de for known vp buffer 0x42cafe00
// Contains viewport address that updates at ~30fps in rec mode, 0 or last rec value in pb
//DEF(current_viewport_buffer       ,0x00008794) // xfound
FAKEDEF(current_viewport_buffer       ,1)

// Below Could not find ftm
//DEF(viewport_buffers              ,0xfc5befd8) // xfound from search 0xfc500000-0xfc800000 for values seen in current_*
FAKEDEF(viewport_buffers              ,1)

FAKEDEF(video_compression_rate, 1)

FAKEDEF(canon_shoot_menu_active, 1)

DEF(dial_positions,0x0000fe84) // xfound from sub_fc08b6f6, Jogdial at 0x0000fe84 0x0000fe88
//FAKEDEF(dial_positions,1)

// to hook asserts for debugging
//DEF(assert_handler,0x00008418) // from DebugAssert, 0x010e100 in RAM code

// TODO sx280 C&P
//DEF(error_table                             ,0xfc512234) // Found @0xfc1abf24
//DEF(displaytype,                            0x8eb8) //0x8ea4 + 0x14, found  @ fc135f2a (GetDisplayType)

//DEF(raw_buffers_canon_raw                   ,0xfc631864) //xfound near DevelopAddress.c
//DEF(raw_buffers_jpeg                         ,0xfc631bf4) //xfound near DevelopPipeline.c 0xfc631c00
//DEF(displaytype,                              0x9284) // 0x923c + 0x48 xfound @0xfc304708 (42 refs)

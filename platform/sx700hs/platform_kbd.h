#ifndef PLATFORM_KBD_H
#define PLATFORM_KBD_H

// plaform specific keyboard defines, see core/kbd_common.c for documentation
#define KEYS_MASK0 (0x0001E30E)
#define KEYS_MASK1 (0x0000042C) // blindly copy from sx710hs
#define KEYS_MASK2 (0x0000001e)

// physw_event_table 0xfc5693dc Found @0xfc06e124
// Values below go in 'platform_kbd.h':
#define SD_READONLY_FLAG    0x20000000 // Found @0xfc569464, levent 0x20a
#define SD_READONLY_IDX     1
#define USB_MASK            0x10000000 // Found @0xfc5694e4, levent 0x202
#define USB_IDX             2
// standard fw doesn't care about bat door, doesn't seem to have switch
#define BATTCOVER_FLAG      0x04000000 // Found @0xfc5694dc, levent 0x205
#define BATTCOVER_IDX       2

#define HOTSHOE_FLAG        0x00000800 // Found @0xfc5cfbf4, levent 0x204
#define HOTSHOE_IDX         1

#endif

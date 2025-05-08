#ifndef __TEST_H__
#define __TEST_H__
#include "routing.h"

#ifdef UWB_RANGING_ROUTING_ENABLE

#define TEST_RX_PACKET_QUEUE_SIZE 5
#define TEST_RX_PACKET_ITEM_SIZE sizeof(UWB_Packet_t)

void testInit();

#endif //TEST_H
#endif

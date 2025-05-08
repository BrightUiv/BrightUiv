#include <math.h>
#include <string.h>
#include "FreeRTOS.h"
#include "queue.h"
#include "task.h"
#include "test.h"
#include "uwb_send_print.h"

#ifdef UWB_RANGING_ROUTING_ENABLE

static QueueHandle_t rxPacketQueue;
static TaskHandle_t testRxTaskHandle;
static TaskHandle_t testTxTaskHandle;
static UWB_Data_Packet_Listener_t listener;

/* Task */
static void testRxTask() {
	systemWaitStart();

	UWB_Data_Packet_t dataTxPacket;
	while(1) {
		if(uwbReceiveDataPacketBlock(UWB_DATA_MESSAGE_TEST, &dataTxPacket)) {
			int peer = dataTxPacket.header.srcAddress;
			UWB_DEBUG_PRINTF("testRxTask: peer is %u", peer);
		}
		vTaskDelay(M2T(1));
	}
}
static void testTxTask() {
	systemWaitStart();

	while(1) {
		UWB_Data_Packet_t dataTxPacket;
		dataTxPacket.header.srcAddress = uwbGetAddress();
		dataTxPacket.header.destAddress = 0;
		dataTxPacket.header.type = UWB_DATA_MESSAGE_TEST;
		dataTxPacket.header.ttl = 10;
		dataTxPacket.header.length = sizeof(UWB_Data_Packet_Header_t);
		uwbSendDataPacketBlock(&dataTxPacket);
		/* 等待10s */
		vTaskDelay(M2T(3000));
	}
}

/* Initialize */
void testInit() {
	/* 接收消息队列 */
	rxPacketQueue = xQueueCreate(TEST_RX_PACKET_QUEUE_SIZE, TEST_RX_PACKET_ITEM_SIZE);
	/* 监听器配置和注册 */
	listener.type = UWB_DATA_MESSAGE_TEST;
	listener.rxQueue = rxPacketQueue;
	listener.rxCb = NULL;
	listener.txCb = NULL;
	uwbRegisterDataPacketListener(&listener);
	/* 任务 */
	xTaskCreate(testRxTask, "uwbTestRxTask", UWB_TASK_STACK_SIZE, NULL, ADHOC_UWB_TASK_PRI, &testRxTaskHandle);
	xTaskCreate(testTxTask, "uwbTestTxTask", UWB_TASK_STACK_SIZE, NULL, ADHOC_UWB_TASK_PRI, &testTxTaskHandle);
}
#endif

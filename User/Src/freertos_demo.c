
#include <freertos_demo.h>
#include "FreeRTOS.h"
#include "task.h"
#include "../Core/Inc/gpio.h"
/*FreeRTOS配置*/
#include "dw3000_cbll.h"
#include "dwTypes.h"
#include "spi.h"

/* START_TASK 任务 配置
 * 包括: 任务句柄 任务优先级 堆栈大小 创建任务
 */
#define START_TASK_PRIO         1
#define START_TASK_STACK_SIZE   128
TaskHandle_t    start_task_handler;


/* TASK1 任务 配置
 * 包括: 任务句柄 任务优先级 堆栈大小 创建任务
 */
#define TASK1_PRIO         2
#define TASK1_STACK_SIZE   128
TaskHandle_t    task1_handler;

#define PRIO_UWB         osPriorityNormal
#define Task_UWB_STACK_SIZE  2 * UWB_FRAME_LEN_MAX * sizeof(StackType_t)//堆内存的大小
TaskHandle_t    handler_uwb;

#define PRIO_UWB_ISR         osPriorityNormal
#define Task_UWB_ISR_STACK_SIZE  2 * UWB_FRAME_LEN_MAX * sizeof(StackType_t)//堆内存的大小
TaskHandle_t    uwbISRTaskHandle;

SemaphoreHandle_t txComplete = NULL;
SemaphoreHandle_t rxComplete = NULL;
SemaphoreHandle_t spiMutex = NULL;
SemaphoreHandle_t spiDeckMutex = NULL;


SemaphoreHandle_t spiDeckRxComplete = NULL;
SemaphoreHandle_t spiDeckTxComplete = NULL;
SemaphoreHandle_t uwbIrqSemaphore = NULL;

SemaphoreHandle_t FRAMxferMutex = NULL;

static int initStatus;

extern dwOps_t dwt_ops ;

/**
 * 1.创建开始任务
 * 	   1.1开始任务会创建对应的任务
 * 2.开启任务调度
 */
void freertos_demo(void)
{
    xTaskCreate((TaskFunction_t         )   start_task,
                (char *                 )   "start_task",
                (configSTACK_DEPTH_TYPE )   START_TASK_STACK_SIZE,
                (void *                 )   NULL,
                (UBaseType_t            )   START_TASK_PRIO,
                (TaskHandle_t *         )   &start_task_handler );
    vTaskStartScheduler();
}

/**
 * 1.实现对应的任务功能
 */
void start_task( void * pvParameters )
{
    taskENTER_CRITICAL();               /* 进入临界区 */
    xTaskCreate((TaskFunction_t         )   uwb_launch_task,
                (char *                 )   "uwbTask",
                (configSTACK_DEPTH_TYPE )   Task_UWB_STACK_SIZE,
                (void *                 )   NULL,
                (UBaseType_t            )   PRIO_UWB,
                (TaskHandle_t *         )   &handler_uwb );
    vTaskDelete(NULL);
    taskEXIT_CRITICAL();                /* 退出临界区 */
}



/**
 * 实现uwb通信的任务
 */
//static void uwb_task(void *argument)
//{
//	txComplete = xSemaphoreCreateBinary();
//	rxComplete = xSemaphoreCreateBinary();
//	spiMutex = xSemaphoreCreateMutex();//与freertos.c中感觉冲突
//	spiDeckMutex = xSemaphoreCreateMutex();
//
//	//GPIOA15对应到EXTI中断线之上
//	LL_SYSCFG_SetEXTISource(LL_SYSCFG_EXTI_PORTA, LL_SYSCFG_EXTI_LINE15);
//
//	 // 配置EXTI中断参数
//	 LL_EXTI_InitTypeDef EXTI_InitStruct;
//	 EXTI_InitStruct.Line_0_31 = LL_EXTI_LINE_15;              // EXTI线15
//	 EXTI_InitStruct.LineCommand = ENABLE;                      // 使能EXTI线
//	 EXTI_InitStruct.Mode = LL_EXTI_MODE_IT;                    // 中断模式
//	 EXTI_InitStruct.Trigger = LL_EXTI_TRIGGER_RISING;          // 上升沿触发
//	 LL_EXTI_Init(&EXTI_InitStruct);
//
//	// 设置中断优先级并使能中断
//	NVIC_SetPriority(EXTI15_10_IRQn, NVIC_EncodePriority(NVIC_GetPriorityGrouping(), 6, 0));
//	NVIC_EnableIRQ(EXTI15_10_IRQn);
//
//
//	// reset dw3000 chip
//	dwt_ops.reset(); // this is not necessary
//
//	// prepare the interrupt service routines task
////	uwbISRTaskHandle = osThreadNew(uwbISRTask, NULL, &uwbISRTaskAttributes);
//	vTaskDelay(100); // wait for the uwbISRTask to start to handle ISR
//
//	// init the dw3000 chip, get ready to rx and rx，下面两次初始化是为了两个不同SPI配置的dw3000设备
//	int result = dw3000_init();
//	uint32_t dev_id = dwt_readdevid(); //0xDECA0302
//
//	while(1){
//		osDelay(500);
//	}
//}

int spi_deck_init(void)
{
  spiDeckTxComplete = xSemaphoreCreateBinary();
  spiDeckRxComplete = xSemaphoreCreateBinary();
  spiDeckMutex = xSemaphoreCreateMutex();
  uwbIrqSemaphore = xSemaphoreCreateMutex();

	if (spiDeckTxComplete == NULL || spiDeckRxComplete == NULL || spiDeckMutex == NULL || uwbIrqSemaphore == NULL)
	{
	    while (1);
	}

	return 0;
}

/**
 * 1.通过开启线程,监听中断
 * 2.
 */
static void initUWBConfig(){

	// reset dw3000 chip
	dwt_ops.reset(); // this is not necessary

	// prepare the interrupt service routines task
//	uwbISRTaskHandle = osThreadNew(uwbISRTask, NULL, &uwbISRTaskAttributes);//todo:改为xTaskCreate()函数
	xTaskCreate(uwbISRTask,"uwbISRTask",Task_UWB_ISR_STACK_SIZE,NULL,PRIO_UWB_ISR,&uwbISRTaskHandle);

	vTaskDelay(10); // wait for the uwbISRTask to start to handle ISR

	// init the dw3000 chip, get ready to rx and rx，下面两次初始化是为了两个不同SPI配置的dw3000设备
	int result = dw3000_init();
	uint32_t dev_id = dwt_readdevid();
	if (dev_id != 0x0 && dev_id != (0xDECA0302))
	{
	  MX_SPI2_Alt_Init();
	  dw3000_init();
	}

	// set the chip in listening mode, rxcallback should be invoked once a packet is received.
	// you should see the RX led flashes at the UWB Deck
	adhocuwb_hdw_force_rx();
//	initUWBDebugPrint();
}

/**
 * 1.初始化spi
 * 2.开启监听中断
 */
 void uwb_launch_task(){
	spi_deck_init();
	initUWBConfig();
	vTaskDelay(100);
	adhocuwbInit();
	initStatus = 1;
	while (1) {
		vTaskDelay(1000);
	}
}

 /**
  * 点亮led灯的任务
  */
 void led_task( void * pvParameters )
 {
 	  while(1)
 	  {
 		  LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_12);
 		  LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_11);
 		  LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_10);
 		  LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_7);
 		  LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_6);
 		  LL_GPIO_SetOutputPin(GPIOD, LL_GPIO_PIN_13);
 		  vTaskDelay(1000);
 		  LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_12);
 		  LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_11);
 		  LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_10);
 		  LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_7);
 		  LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_6);
 		  LL_GPIO_ResetOutputPin(GPIOD, LL_GPIO_PIN_13);
 		  vTaskDelay(1000);
 	  }
 }



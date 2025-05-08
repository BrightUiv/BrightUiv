#ifndef __FREERTOS_DEMO_H
#define __FREERTOS_DEMO_H

void freertos_demo(void);

void start_task( void * pvParameters );
void start_task( void * pvParameters );
static void uwb_task(void *argument);
void uwb_launch_task();
static void initUWBConfig();
int spi_deck_init(void);


#endif

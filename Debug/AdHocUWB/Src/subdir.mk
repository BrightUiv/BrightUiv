################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../AdHocUWB/Src/adhocuwb.c \
../AdHocUWB/Src/adhocuwb_freertos_athena3.2.c \
../AdHocUWB/Src/adhocuwb_freertos_crazyflie.c \
../AdHocUWB/Src/adhocuwb_impl.c \
../AdHocUWB/Src/adhocuwb_macos.c \
../AdHocUWB/Src/aodv.c \
../AdHocUWB/Src/olsr.c \
../AdHocUWB/Src/routing.c \
../AdHocUWB/Src/swarm_ranging.c \
../AdHocUWB/Src/swarm_routing.c \
../AdHocUWB/Src/test.c \
../AdHocUWB/Src/uwb_send_print.c 

OBJS += \
./AdHocUWB/Src/adhocuwb.o \
./AdHocUWB/Src/adhocuwb_freertos_athena3.2.o \
./AdHocUWB/Src/adhocuwb_freertos_crazyflie.o \
./AdHocUWB/Src/adhocuwb_impl.o \
./AdHocUWB/Src/adhocuwb_macos.o \
./AdHocUWB/Src/aodv.o \
./AdHocUWB/Src/olsr.o \
./AdHocUWB/Src/routing.o \
./AdHocUWB/Src/swarm_ranging.o \
./AdHocUWB/Src/swarm_routing.o \
./AdHocUWB/Src/test.o \
./AdHocUWB/Src/uwb_send_print.o 

C_DEPS += \
./AdHocUWB/Src/adhocuwb.d \
./AdHocUWB/Src/adhocuwb_freertos_athena3.2.d \
./AdHocUWB/Src/adhocuwb_freertos_crazyflie.d \
./AdHocUWB/Src/adhocuwb_impl.d \
./AdHocUWB/Src/adhocuwb_macos.d \
./AdHocUWB/Src/aodv.d \
./AdHocUWB/Src/olsr.d \
./AdHocUWB/Src/routing.d \
./AdHocUWB/Src/swarm_ranging.d \
./AdHocUWB/Src/swarm_routing.d \
./AdHocUWB/Src/test.d \
./AdHocUWB/Src/uwb_send_print.d 


# Each subdirectory must supply rules for building sources it contributes
AdHocUWB/Src/%.o AdHocUWB/Src/%.su AdHocUWB/Src/%.cyclo: ../AdHocUWB/Src/%.c AdHocUWB/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DSTM32H743xx -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I"C:/github/h7uwb_module/AdHocUWB/Inc" -I"C:/github/h7uwb_module/Athena-Driver/Athena_deck_HAL/inc" -I"C:/github/h7uwb_module/Athena-Driver/BSP/DW3000/include" -I"C:/github/h7uwb_module/Athena-Driver/SysDriver/inc" -I"C:/github/h7uwb_module/User/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-AdHocUWB-2f-Src

clean-AdHocUWB-2f-Src:
	-$(RM) ./AdHocUWB/Src/adhocuwb.cyclo ./AdHocUWB/Src/adhocuwb.d ./AdHocUWB/Src/adhocuwb.o ./AdHocUWB/Src/adhocuwb.su ./AdHocUWB/Src/adhocuwb_freertos_athena3.2.cyclo ./AdHocUWB/Src/adhocuwb_freertos_athena3.2.d ./AdHocUWB/Src/adhocuwb_freertos_athena3.2.o ./AdHocUWB/Src/adhocuwb_freertos_athena3.2.su ./AdHocUWB/Src/adhocuwb_freertos_crazyflie.cyclo ./AdHocUWB/Src/adhocuwb_freertos_crazyflie.d ./AdHocUWB/Src/adhocuwb_freertos_crazyflie.o ./AdHocUWB/Src/adhocuwb_freertos_crazyflie.su ./AdHocUWB/Src/adhocuwb_impl.cyclo ./AdHocUWB/Src/adhocuwb_impl.d ./AdHocUWB/Src/adhocuwb_impl.o ./AdHocUWB/Src/adhocuwb_impl.su ./AdHocUWB/Src/adhocuwb_macos.cyclo ./AdHocUWB/Src/adhocuwb_macos.d ./AdHocUWB/Src/adhocuwb_macos.o ./AdHocUWB/Src/adhocuwb_macos.su ./AdHocUWB/Src/aodv.cyclo ./AdHocUWB/Src/aodv.d ./AdHocUWB/Src/aodv.o ./AdHocUWB/Src/aodv.su ./AdHocUWB/Src/olsr.cyclo ./AdHocUWB/Src/olsr.d ./AdHocUWB/Src/olsr.o ./AdHocUWB/Src/olsr.su ./AdHocUWB/Src/routing.cyclo ./AdHocUWB/Src/routing.d ./AdHocUWB/Src/routing.o ./AdHocUWB/Src/routing.su ./AdHocUWB/Src/swarm_ranging.cyclo ./AdHocUWB/Src/swarm_ranging.d ./AdHocUWB/Src/swarm_ranging.o ./AdHocUWB/Src/swarm_ranging.su ./AdHocUWB/Src/swarm_routing.cyclo ./AdHocUWB/Src/swarm_routing.d ./AdHocUWB/Src/swarm_routing.o ./AdHocUWB/Src/swarm_routing.su ./AdHocUWB/Src/test.cyclo ./AdHocUWB/Src/test.d ./AdHocUWB/Src/test.o ./AdHocUWB/Src/test.su ./AdHocUWB/Src/uwb_send_print.cyclo ./AdHocUWB/Src/uwb_send_print.d ./AdHocUWB/Src/uwb_send_print.o ./AdHocUWB/Src/uwb_send_print.su

.PHONY: clean-AdHocUWB-2f-Src


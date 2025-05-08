################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/Src/freertos_demo.c 

OBJS += \
./User/Src/freertos_demo.o 

C_DEPS += \
./User/Src/freertos_demo.d 


# Each subdirectory must supply rules for building sources it contributes
User/Src/%.o User/Src/%.su User/Src/%.cyclo: ../User/Src/%.c User/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DSTM32H743xx -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I"C:/github/h7uwb_module/AdHocUWB/Inc" -I"C:/github/h7uwb_module/Athena-Driver/Athena_deck_HAL/inc" -I"C:/github/h7uwb_module/Athena-Driver/BSP/DW3000/include" -I"C:/github/h7uwb_module/Athena-Driver/SysDriver/inc" -I"C:/github/h7uwb_module/User/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-User-2f-Src

clean-User-2f-Src:
	-$(RM) ./User/Src/freertos_demo.cyclo ./User/Src/freertos_demo.d ./User/Src/freertos_demo.o ./User/Src/freertos_demo.su

.PHONY: clean-User-2f-Src


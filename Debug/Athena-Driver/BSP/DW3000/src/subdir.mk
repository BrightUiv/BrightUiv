################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Athena-Driver/BSP/DW3000/src/dw3000_cbll.c \
../Athena-Driver/BSP/DW3000/src/libdw3000.c \
../Athena-Driver/BSP/DW3000/src/libdw3000Spi.c \
../Athena-Driver/BSP/DW3000/src/mac_802_15_4.c 

OBJS += \
./Athena-Driver/BSP/DW3000/src/dw3000_cbll.o \
./Athena-Driver/BSP/DW3000/src/libdw3000.o \
./Athena-Driver/BSP/DW3000/src/libdw3000Spi.o \
./Athena-Driver/BSP/DW3000/src/mac_802_15_4.o 

C_DEPS += \
./Athena-Driver/BSP/DW3000/src/dw3000_cbll.d \
./Athena-Driver/BSP/DW3000/src/libdw3000.d \
./Athena-Driver/BSP/DW3000/src/libdw3000Spi.d \
./Athena-Driver/BSP/DW3000/src/mac_802_15_4.d 


# Each subdirectory must supply rules for building sources it contributes
Athena-Driver/BSP/DW3000/src/%.o Athena-Driver/BSP/DW3000/src/%.su Athena-Driver/BSP/DW3000/src/%.cyclo: ../Athena-Driver/BSP/DW3000/src/%.c Athena-Driver/BSP/DW3000/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_PWR_LDO_SUPPLY -DSTM32H743xx -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32H7xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I"C:/github/h7uwb_module/AdHocUWB/Inc" -I"C:/github/h7uwb_module/Athena-Driver/Athena_deck_HAL/inc" -I"C:/github/h7uwb_module/Athena-Driver/BSP/DW3000/include" -I"C:/github/h7uwb_module/Athena-Driver/SysDriver/inc" -I"C:/github/h7uwb_module/User/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Athena-2d-Driver-2f-BSP-2f-DW3000-2f-src

clean-Athena-2d-Driver-2f-BSP-2f-DW3000-2f-src:
	-$(RM) ./Athena-Driver/BSP/DW3000/src/dw3000_cbll.cyclo ./Athena-Driver/BSP/DW3000/src/dw3000_cbll.d ./Athena-Driver/BSP/DW3000/src/dw3000_cbll.o ./Athena-Driver/BSP/DW3000/src/dw3000_cbll.su ./Athena-Driver/BSP/DW3000/src/libdw3000.cyclo ./Athena-Driver/BSP/DW3000/src/libdw3000.d ./Athena-Driver/BSP/DW3000/src/libdw3000.o ./Athena-Driver/BSP/DW3000/src/libdw3000.su ./Athena-Driver/BSP/DW3000/src/libdw3000Spi.cyclo ./Athena-Driver/BSP/DW3000/src/libdw3000Spi.d ./Athena-Driver/BSP/DW3000/src/libdw3000Spi.o ./Athena-Driver/BSP/DW3000/src/libdw3000Spi.su ./Athena-Driver/BSP/DW3000/src/mac_802_15_4.cyclo ./Athena-Driver/BSP/DW3000/src/mac_802_15_4.d ./Athena-Driver/BSP/DW3000/src/mac_802_15_4.o ./Athena-Driver/BSP/DW3000/src/mac_802_15_4.su

.PHONY: clean-Athena-2d-Driver-2f-BSP-2f-DW3000-2f-src


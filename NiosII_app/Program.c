/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <system.h>
#include <io.h>
#include <stdlib.h>
#include <nios2.h>
#include <os/alt_syscall.h>
#include <altera_avalon_pio_regs.h>

int main() {
	int value = 0;
	int oldValue = 0;
	printf("Boot done\n");
	value = IORD_16DIRECT(INFRARED_COMPOMNENT_0_BASE,0);
	printf("Initial Value: %u\n", value);
	while (1) {
		value = IORD_16DIRECT(INFRARED_COMPOMNENT_0_BASE,0);

		if(value != oldValue){
			printf("Recived %u\n", value);
			oldValue = value;
			IOWR_ALTERA_AVALON_PIO_SET_BITS(PIO_OUTPUT_BASE, value);
			usleep(100);
		}

	}

	return 0;
}


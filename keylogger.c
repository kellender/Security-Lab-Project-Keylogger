#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <linux/input.h>


static const char *const evval[3] = {
    "RELEASED",
    "PRESSED ",
    "REPEATED"
};

int main(int argc, char** argv){
  int fd, bytes;
  struct input_event ev;

  const char *pDevice = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";

  // Open Keyboard
  fd = open(pDevice, O_RDONLY | O_NONBLOCK);
  if(fd == -1)  {
      printf("ERROR Opening %s\n", pDevice);
      return -1;
  }

  while(1)  {
      // Read Keyboard Data
      bytes = read(fd, &ev, sizeof(ev));
      if(bytes > 0){

		if (ev.type == EV_KEY && ev.value >= 0 && ev.value <= 2)
			printf("%s 0x%04x (%d)\n", evval[ev.value], (int)ev.code, (int)ev.code);

      }
      else      {
          // Nothing read
          sleep(1);
      }
  }

  return 0;
}
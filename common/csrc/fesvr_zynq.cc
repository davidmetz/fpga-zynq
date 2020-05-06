#include "zynq_driver.h"
#include "fesvr/tsi.h"
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <limits>

#define BLKDEV_NTAGS 2

int main(int argc, char** argv)
{
    tsi_t tsi(argc, argv);

    BlockDevice *blkdev = NULL;
    zynq_driver_t *driver;
    time_t end_time = std::numeric_limits<time_t>::max();
    int fan_speed = 50;//for some reason only 5% is enough for big fan

    for (int i = 1; i < argc; i++) {
        const char *name = NULL;
        const char *timeout = NULL;

        if (strncmp(argv[i], "+blkdev=", 8) == 0) {
            name = argv[i] + 8;
            blkdev = new BlockDevice(name, BLKDEV_NTAGS);
        }

        if (strncmp(argv[i], "+timeout=", 9) == 0) {
            timeout = argv[i] + 9;
            time_t offset = atol(timeout);
            end_time = time(NULL)+offset;
        }
        if (strncmp(argv[i], "+fanspeed=", 10) == 0) {
            const char * fan_speed_str = argv[i] + 10;
            fan_speed = atoi(fan_speed_str);
        }
    }

    driver = new zynq_driver_t(&tsi, blkdev, fan_speed);

    int old_rpm = 0;
    while(!tsi.done()){
        int rpm = driver->poll();
//        if(rpm!=old_rpm){
//            old_rpm = rpm;
//            printf("rpm: %d\n", rpm);
//        }
        if(time(NULL)>=end_time){
            printf("TIMEOUT! stopping fesvr\n");
            break;
        }
    }

    delete driver;
    if (blkdev != NULL)
        delete blkdev;

    return tsi.exit_code();
}

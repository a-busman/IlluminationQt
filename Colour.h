#ifndef COLOUR_H
#define COLOUR_H

#include <QObject>
#include <QProcess>
#include <iostream>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string>
#include "i2c-dev.h"

#define ON_DEV

using namespace std;

class Colour : public QObject
{
    Q_OBJECT
public:
    Colour() : name(""), value(0), file(0)
    {
#ifdef ON_DEV
        char filename[] = "/dev/i2c-2";
        int addr = 0x61;
        if ((file = open(filename,O_RDWR)) < 0)
        {
            cout << "Failed to open the bus." << endl;
            exit(1);
        }

        if (ioctl(file,I2C_SLAVE,addr) < 0)
        {
            cout << "Failed to acquire bus access and/or talk to slave." << endl;
            exit(1);
        }
        if( ioctl(file, I2C_PEC, 1) < 0)
        {
            printf("Failed to enable PEC\n");
            exit(1);
        }
#endif
    }
    Colour(string colourName, int newValue, int fileid) : name(colourName), value(newValue), file(fileid) {}
    ~Colour() {}
    void setName(string colourName){
        name = colourName;
    }
    Q_INVOKABLE void setValue(int newValue){

        value = newValue << 4;

#ifdef ON_DEV
        unsigned char buf[2];

        buf[0] = *(((char *) &value)+1);
        buf[1] = *((char *) &value);
        if (i2c_smbus_write_i2c_block_data(file, 0x40, 2, buf) < 0)
        {
          printf("Failed to write to the i2c bus: %04X\n", value);
        }
#else
        cout << newValue << endl;
#endif
    }

    string getName(){
        return name;
    }

    short getValue(){
        return value;
    }

private:
    string name;
    unsigned short value;
    int file;
};

#endif // COLOUR_H

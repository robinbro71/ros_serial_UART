#include <ros/ros.h>
#include <serial/serial.h>
#include <array>
#include "comm_pkg/Stm32Data.h"

serial::Serial ser;

int main(int argc, char ** argv) {
    ros::init(argc, argv, "serial_node");
    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<comm_pkg::Stm32Data>("stm32_data", 10);

    try{
        ser.setPort("/dev/ttyUSB0"); //change the serrial port addres by your spesific address
        ser.setBaudrate(115200);
        serial::Timeout to = serial::Timeout::simpleTimeout(10);
        ser.setTimeout(to);
        ser.open();
        ser.flushInput();
    }   catch(serial::IOException& e) {
        ROS_ERROR("Unable to open port");
        return -1;
    }

    if(ser.isOpen()) {
        ROS_INFO("Serial Port Initialized");
    } else {
        return -1;
    }

    ros::Rate loop_rate(333); //loop_rate of 3 milisec 1/0.003sec
    
    std::array<uint8_t, 8> buffer;

    while(ros::ok()) {
        ser.read(buffer.data(), buffer.size());

        for(int i=0; i<buffer.size()-4; i++) { //parsing data
            //header uart
            if(buffer[i] == 255 && buffer[i+1] == 254) {

                //data
                // uint8_t adc_uart = buffer[i+2];//(10000000)
                // uint8_t button_uart = buffer[i+3];//(4-bit_button)(4-bit_adc)
                uint16_t adc = (buffer[i+2] << 4) | (buffer[i+3] & 15); //0000(adc_uart)(4-bit_adc)
                uint16_t button = (buffer[i+3] << 4) & 3840;//0000(4-bit_button)00000000

                //publish data
                comm_pkg::Stm32Data msg;
                msg.adc = adc;
                msg.button = button;
                pub.publish(msg);

                ROS_INFO("Parsed adc %u, Button %u", adc, button);

            }
        }
        
        ros::spinOnce();
        loop_rate.sleep();
        ser.flushInput();
    }
    return 0;
}   

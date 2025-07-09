// Auto-generated. Do not edit!

// (in-package comm_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Stm32Data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.adc = null;
      this.button = null;
    }
    else {
      if (initObj.hasOwnProperty('adc')) {
        this.adc = initObj.adc
      }
      else {
        this.adc = 0;
      }
      if (initObj.hasOwnProperty('button')) {
        this.button = initObj.button
      }
      else {
        this.button = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Stm32Data
    // Serialize message field [adc]
    bufferOffset = _serializer.int32(obj.adc, buffer, bufferOffset);
    // Serialize message field [button]
    bufferOffset = _serializer.uint8(obj.button, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Stm32Data
    let len;
    let data = new Stm32Data(null);
    // Deserialize message field [adc]
    data.adc = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [button]
    data.button = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'comm_pkg/Stm32Data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5fac1e529e3bbd879b45ff052f485b18';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 adc
    uint8 button
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Stm32Data(null);
    if (msg.adc !== undefined) {
      resolved.adc = msg.adc;
    }
    else {
      resolved.adc = 0
    }

    if (msg.button !== undefined) {
      resolved.button = msg.button;
    }
    else {
      resolved.button = 0
    }

    return resolved;
    }
};

module.exports = Stm32Data;

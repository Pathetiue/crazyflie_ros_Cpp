# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from mav_msgs/Status.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class Status(genpy.Message):
  _md5sum = "e191265664a5f7c1871338dc13be0958"
  _type = "mav_msgs/Status"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header

# If values are not known / available, set to -1 or empty string.
string      vehicle_name
string      vehicle_type                  # E.g. firefly, pelican ...
float32     battery_voltage               # Battery voltage in V.
string      rc_command_mode               # Command mode set on the 3 position switch on the rc.
bool        command_interface_enabled     # Reports whether the serial command interface is enabled.
float32     flight_time                   # Flight time in s.
float32     system_uptime									# MAV uptime in s.
float32     cpu_load                      # MAV CPU load: 0.0 ... 1.0

string      motor_status                  # Current motor status: running, stopped, starting, stopping.
bool        in_air                        # True if vehicle is actually in air, false otherwise

string      gps_status                    # GPS status: lock, no_lock
int32       gps_num_satellites            # Number of visible satellites

string RC_COMMAND_ATTITUDE="attitude_thrust"
string RC_COMMAND_ATTITUDE_HEIGHT="attitude_height"
string RC_COMMAND_POSITION="position"

string MOTOR_STATUS_RUNNING="running"
string MOTOR_STATUS_STOPPED="stopped"
string MOTOR_STATUS_STARTING="starting"
string MOTOR_STATUS_STOPPING="stopping"

string GPS_STATUS_LOCK="lock"
string GPS_STATUS_NO_LOCK="no_lock"

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
"""
  # Pseudo-constants
  RC_COMMAND_ATTITUDE = r'"attitude_thrust"'
  RC_COMMAND_ATTITUDE_HEIGHT = r'"attitude_height"'
  RC_COMMAND_POSITION = r'"position"'
  MOTOR_STATUS_RUNNING = r'"running"'
  MOTOR_STATUS_STOPPED = r'"stopped"'
  MOTOR_STATUS_STARTING = r'"starting"'
  MOTOR_STATUS_STOPPING = r'"stopping"'
  GPS_STATUS_LOCK = r'"lock"'
  GPS_STATUS_NO_LOCK = r'"no_lock"'

  __slots__ = ['header','vehicle_name','vehicle_type','battery_voltage','rc_command_mode','command_interface_enabled','flight_time','system_uptime','cpu_load','motor_status','in_air','gps_status','gps_num_satellites']
  _slot_types = ['std_msgs/Header','string','string','float32','string','bool','float32','float32','float32','string','bool','string','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,vehicle_name,vehicle_type,battery_voltage,rc_command_mode,command_interface_enabled,flight_time,system_uptime,cpu_load,motor_status,in_air,gps_status,gps_num_satellites

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Status, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.vehicle_name is None:
        self.vehicle_name = ''
      if self.vehicle_type is None:
        self.vehicle_type = ''
      if self.battery_voltage is None:
        self.battery_voltage = 0.
      if self.rc_command_mode is None:
        self.rc_command_mode = ''
      if self.command_interface_enabled is None:
        self.command_interface_enabled = False
      if self.flight_time is None:
        self.flight_time = 0.
      if self.system_uptime is None:
        self.system_uptime = 0.
      if self.cpu_load is None:
        self.cpu_load = 0.
      if self.motor_status is None:
        self.motor_status = ''
      if self.in_air is None:
        self.in_air = False
      if self.gps_status is None:
        self.gps_status = ''
      if self.gps_num_satellites is None:
        self.gps_num_satellites = 0
    else:
      self.header = std_msgs.msg.Header()
      self.vehicle_name = ''
      self.vehicle_type = ''
      self.battery_voltage = 0.
      self.rc_command_mode = ''
      self.command_interface_enabled = False
      self.flight_time = 0.
      self.system_uptime = 0.
      self.cpu_load = 0.
      self.motor_status = ''
      self.in_air = False
      self.gps_status = ''
      self.gps_num_satellites = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.vehicle_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.vehicle_type
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_f().pack(self.battery_voltage))
      _x = self.rc_command_mode
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_B3f().pack(_x.command_interface_enabled, _x.flight_time, _x.system_uptime, _x.cpu_load))
      _x = self.motor_status
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_B().pack(self.in_air))
      _x = self.gps_status
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_i().pack(self.gps_num_satellites))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.vehicle_name = str[start:end].decode('utf-8')
      else:
        self.vehicle_name = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.vehicle_type = str[start:end].decode('utf-8')
      else:
        self.vehicle_type = str[start:end]
      start = end
      end += 4
      (self.battery_voltage,) = _get_struct_f().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.rc_command_mode = str[start:end].decode('utf-8')
      else:
        self.rc_command_mode = str[start:end]
      _x = self
      start = end
      end += 13
      (_x.command_interface_enabled, _x.flight_time, _x.system_uptime, _x.cpu_load,) = _get_struct_B3f().unpack(str[start:end])
      self.command_interface_enabled = bool(self.command_interface_enabled)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.motor_status = str[start:end].decode('utf-8')
      else:
        self.motor_status = str[start:end]
      start = end
      end += 1
      (self.in_air,) = _get_struct_B().unpack(str[start:end])
      self.in_air = bool(self.in_air)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.gps_status = str[start:end].decode('utf-8')
      else:
        self.gps_status = str[start:end]
      start = end
      end += 4
      (self.gps_num_satellites,) = _get_struct_i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.vehicle_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.vehicle_type
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_f().pack(self.battery_voltage))
      _x = self.rc_command_mode
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_B3f().pack(_x.command_interface_enabled, _x.flight_time, _x.system_uptime, _x.cpu_load))
      _x = self.motor_status
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_B().pack(self.in_air))
      _x = self.gps_status
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      buff.write(_get_struct_i().pack(self.gps_num_satellites))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.vehicle_name = str[start:end].decode('utf-8')
      else:
        self.vehicle_name = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.vehicle_type = str[start:end].decode('utf-8')
      else:
        self.vehicle_type = str[start:end]
      start = end
      end += 4
      (self.battery_voltage,) = _get_struct_f().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.rc_command_mode = str[start:end].decode('utf-8')
      else:
        self.rc_command_mode = str[start:end]
      _x = self
      start = end
      end += 13
      (_x.command_interface_enabled, _x.flight_time, _x.system_uptime, _x.cpu_load,) = _get_struct_B3f().unpack(str[start:end])
      self.command_interface_enabled = bool(self.command_interface_enabled)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.motor_status = str[start:end].decode('utf-8')
      else:
        self.motor_status = str[start:end]
      start = end
      end += 1
      (self.in_air,) = _get_struct_B().unpack(str[start:end])
      self.in_air = bool(self.in_air)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.gps_status = str[start:end].decode('utf-8')
      else:
        self.gps_status = str[start:end]
      start = end
      end += 4
      (self.gps_num_satellites,) = _get_struct_i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i
_struct_B3f = None
def _get_struct_B3f():
    global _struct_B3f
    if _struct_B3f is None:
        _struct_B3f = struct.Struct("<B3f")
    return _struct_B3f
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
_struct_f = None
def _get_struct_f():
    global _struct_f
    if _struct_f is None:
        _struct_f = struct.Struct("<f")
    return _struct_f

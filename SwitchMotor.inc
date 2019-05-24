;=============================================================================
I2C_INTERFACE_COUNT         con 2   ; number I2C channels that connect to switch motor banks
BANKS_PER_INTERFACE         con 8   ; number of switch motor banks per I2C channel
SWITCH_MOTORS_PER_BANK      con 5   ; number of switch motors per motor bank

SWITCH_MOTOR_COUNT          con 80  ;(I2C_INTERFACE_COUNT * BANKS_PER_INTERFACE * SWITCH_MOTORS_PER_BANK)
    ; number of possible switch motors attached to this processor

#ifdef DO_SWITCH_CONTROLLER
NUMBER_EXTENSION_PROCESSORS con 16
MAX_SWITCH_BANKS            con 256  ;(I2C_INTERFACE_COUNT * BANKS_PER_INTERFACE * NUMBER_EXTENSION_PROCESSORS)
#endif

NUM_LOCAL_SWITCH_BANKS  con 16  ; I2C_INTERFACE_COUNT * BANKS_PER_INTERFACE

;=============================================================================
#ifdef DO_SWITCH_EXTENSION
    last_motor_bank_state var byte[NUM_LOCAL_SWITCH_BANKS]
#endif

;=============================================================================
MAX_LOCONET_SWITCHES    con 999

;=============================================================================
my_address      var byte

switch_bank_value   var word

;=============================================================================
loconet_switch      var word
switch_motor        var word
switch_bank         var word
switch_address      var word
    CONTROLLER_RS485_ADDRESS   con $f

;=============================================================================
;=============================================================================
; LOCONET packet opcodes
OPC_SW_REQ  con $B0 ;LOCONET opcode for a switch request

OPC_ACK     con $81 ;RS485 opcode for acknowledgement
OPC_BANK    con $82 ;RS484 opcode for switch bank value

;=============================================================================
; receive packet state machine states...
RX_STATE_WAITING_FOR_OPCODE con 0
RX_STATE_WAITING_FOR_LENGTH con 1
RX_STATE_ACCUMULATING_DATA  con 2

;=============================================================================


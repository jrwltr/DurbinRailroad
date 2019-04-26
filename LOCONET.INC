;=============================================================================
; LOCONET packet opcodes
OPC_SW_REQ  con $B0 ;LOCONET opcode for a switch request

;=============================================================================
; receive packet state machine states...
RX_STATE_WAITING_FOR_OPCODE con 0
RX_STATE_WAITING_FOR_LENGTH con 1
RX_STATE_ACCUMULATING_DATA  con 2

;=============================================================================


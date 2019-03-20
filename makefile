
HEXTARGETS = TurntableMain.hex SwitchMain.hex

TURNTABLE_PIC = 16F18856
SWITCH_PIC = 16F18856

ASMFLAGS = q

all: $(HEXTARGETS)

COMMON_PREREQUISITES = ProcessorConfiguration.pbp \
				   	   Interrupt.pbp \
				       LED.pbp \
				   	   LCD4X20.pbp \
				       EEPROM.pbp \
				       OnboardSwitches.pbp \
				   	   LOCONET.pbp \
			   		   Mainloop.pbp

TurntableMain.hex: TurntableMain.pbp \
				   LongMath.pbp \
				   TurnTableEEPROM.pbp \
				   TurnTable.pbp \
				   $(COMMON_PREREQUISITES)
	pbpx -ampasmx -o$(ASMFLAGS) -p$(TURNTABLE_PIC) $<

SwitchMain.hex: SwitchMain.pbp \
			   	SwitchMotor.pbp \
				$(COMMON_PREREQUISITES)
	pbpx -ampasmx -o$(ASMFLAGS) -p$(SWITCH_PIC) $<


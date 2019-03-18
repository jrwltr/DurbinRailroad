
HEXTARGETS = TurntableMain.hex SwitchMain.hex

PIC = 16F18856

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

SwitchMain.hex: SwitchMain.pbp \
			   	SwitchMotor.pbp \
				$(COMMON_PREREQUISITES)

%.hex: %.pbp
	pbpx -ampasmx -oq -p$(PIC) $<



DEVELOPMENT_BOARD = 1

HEXTARGETS = TurntableMain.hex SwitchMain.hex
ifndef DEVELOPMENT_BOARD
	HEXTARGETS += SwitchExtensionMain.hex
endif

ifdef DEVELOPMENT_BOARD
	TURNTABLE_PIC			= 16F18856
	SWITCH_PIC				= 16F18856
else
	TURNTABLE_PIC			= 16F18856
	SWITCH_PIC				= 16F19156
	SWITCH_EXTENSION_PIC	= 18F13K22
endif

ASMFLAGS = q

all: $(HEXTARGETS)

COMMON_SOURCE		=		ProcessorConfiguration.pbp \
							Interrupt.pbp \
							LED.pbp \
							LCD4X20.pbp \
							EEPROM.pbp \
							OnboardSwitches.pbp \
							LOCONET.pbp \
							Mainloop.pbp

TURNTABLE_SOURCE		=	TurntableMain.pbp \
							LongMath.pbp \
							TurnTableEEPROM.pbp \
							TurnTable.pbp

SWITCH_SOURCE 			=	SwitchMain.pbp \
							SwitchMotor.pbp

SWITCH_EXTENSION_SOURCE =	SwitchExtensionMain.pbp \
							SwitchMotor.pbp

TurntableMain.hex:	$(TURNTABLE_SOURCE) $(COMMON_SOURCE)
	pbpx -ampasmx -o$(ASMFLAGS) -p$(TURNTABLE_PIC) $<

SwitchMain.hex:	$(SWITCH_SOURCE) $(COMMON_SOURCE)
	pbpx -ampasmx -o$(ASMFLAGS) -p$(SWITCH_PIC) $<

SwitchExtensionMain.hex: $(SWITCH_EXTENSION_SOURCE) $(COMMON_SOURCE)
	pbpx -ampasmx -o$(ASMFLAGS) -p$(SWITCH_EXTENSION_PIC) $<


##############################################################################
HEXTARGETS =	TurntableMain.hex \
				TurntableMainDev.hex \
				SwitchMain.hex \
				SwitchMainDev.hex \
			   	SwitchExtensionMain.hex

##############################################################################
ASMFLAGS = q

##############################################################################
all: $(HEXTARGETS)

##############################################################################
COMMON_SOURCE		=		ProcessorConfiguration.pbp \
							Interrupt.pbp \
							Mainloop.pbp

TURNTABLE_SOURCE		=	TurntableMain.pbp \
							LongMath.pbp \
							TurnTableEEPROM.pbp \
							TurnTable.pbp \
							LCD4X20.pbp \
							EEPROM.pbp \
							OnboardSwitches.pbp \
							LOCONET.pbp \

SWITCH_SOURCE 			=	SwitchMain.pbp \
							SwitchMotor.pbp \
							SwitchRoutes.pbp \
							LCD4X20.pbp \
							EEPROM.pbp \
							OnboardSwitches.pbp \
							LOCONET.pbp \

SWITCH_EXTENSION_SOURCE =	SwitchExtensionMain.pbp \
							SwitchMotor.pbp

##############################################################################
TurntableMain_PROCESSOR			= 16F18856 
TurntableMainDev_PROCESSOR		= 16F18856 
SwitchMain_PROCESSOR			= 16F19156
SwitchMainDev_PROCESSOR			= 16F18856 
SwitchExtensionMain_PROCESSOR	= 18F13K22

##############################################################################
TurntableMainDev.hex					: TurntableMainDev.pbp
TurntableMainDev.hex TurntableMain.hex	: $(TURNTABLE_SOURCE) $(COMMON_SOURCE)

SwitchMainDev.hex						: SwitchMainDev.pbp
SwitchMainDev.hex SwitchMain.hex		: $(SWITCH_SOURCE) $(COMMON_SOURCE)

SwitchExtensionMain.hex					: $(SWITCH_EXTENSION_SOURCE) $(COMMON_SOURCE)

TurntableMainDev.hex SwitchMainDev.hex SwitchExtensionMain.hex:	LED.pbp

$(HEXTARGETS):
	pbpx -ampasmx -o$(ASMFLAGS) -p$($(basename $<)_PROCESSOR) $< 

##############################################################################


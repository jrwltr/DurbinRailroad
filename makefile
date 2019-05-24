##############################################################################
HEXTARGETS  =	TurntableMain.hex
				TurntableMain_PROCESSOR			= 16F18856
HEXTARGETS +=	TurntableMainDev.hex
				TurntableMainDev_PROCESSOR		= 16F18856
HEXTARGETS +=	SwitchMain.hex
				SwitchMain_PROCESSOR			= 16F19156
HEXTARGETS +=	SwitchMainDev.hex
				SwitchMainDev_PROCESSOR			= 16F18856
HEXTARGETS +=	SwitchExtensionMain.hex
				SwitchExtensionMain_PROCESSOR	= 18F13K22

##############################################################################
all: $(HEXTARGETS)

##############################################################################
COMMON_SOURCE		=		ProcessorConfiguration.pbp \
							Interrupt.pbp \
							Mainloop.pbp \
							Loconet.inc

TURNTABLE_SOURCE		=	TurntableMain.pbp \
							LongMath.pbp \
							TurnTableEEPROM.pbp \
							TurnTable.pbp \
							LCD4X20.pbp \
							EEPROM.pbp \
							OnboardSwitches.pbp \
							LOCONET.pbp \

SWITCH_SOURCE 			=	SwitchMainCommon.pbp \
							SwitchMotor.inc \
							SwitchMotor.pbp \
							SwitchRoutes.pbp \
							SwitchMotorEEPROM.pbp \
							LCD4X20.pbp \
							EEPROM.pbp \
							OnboardSwitches.pbp \
							RS485.pbp \
							LOCONET.pbp


SWITCH_EXTENSION_SOURCE =	SwitchExtensionMain.pbp \
							SwitchMotor.inc \
							SwitchMotor.pbp \
							RS485.pbp

##############################################################################
TurntableMainDev.hex					: TurntableMainDev.pbp
TurntableMainDev.hex TurntableMain.hex	: $(TURNTABLE_SOURCE) $(COMMON_SOURCE)

SwitchMain.hex							: SwitchMain.pbp
SwitchMainDev.hex						: SwitchMainDev.pbp
SwitchMainDev.hex SwitchMain.hex		: $(SWITCH_SOURCE) $(COMMON_SOURCE)

SwitchExtensionMain.hex					: $(SWITCH_EXTENSION_SOURCE) $(COMMON_SOURCE)

TurntableMainDev.hex SwitchMainDev.hex SwitchExtensionMain.hex: LED.pbp

##############################################################################
$(HEXTARGETS):
	pbpx -ampasmx -oq -p$($(basename $<)_PROCESSOR) $<
	@del $(basename $<).asm
	@del $(basename $<).mac
	@del $(basename $<).o
	@del $(basename $<).err
	@del $(basename $<).lst

##############################################################################


##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=snake
ConfigurationName      :=Debug
WorkspacePath          :=Z:/EDA482_snake/labb5
ProjectPath            :=Z:/EDA482_snake/labb5/snake
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=lyckaro
Date                   :=27/05/2019
CodeLitePath           :=C:/cseapp/CodeLite
LinkerName             :=$(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
SharedObjectLinkerName :=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi-g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=$(PreprocessorSwitch)USBDM 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="snake.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostdlib
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch)/home/love/Documents/skola/EDA482/libs/include $(IncludeSwitch). $(IncludeSwitch)Z:\EDA482\libs\include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)GPIO $(LibrarySwitch)delay $(LibrarySwitch)gcc $(LibrarySwitch)c_nano $(LibrarySwitch)GPIO $(LibrarySwitch)delay 
ArLibs                 :=  "GPIO" "delay" "gcc" "c_nano" "GPIO" "delay" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)/home/love/Documents/skola/EDA482/libs/lib $(LibraryPathSwitch)Z:\EDA482\libs\lib 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-ar.exe rcu
CXX      := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
CC       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-gcc.exe
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -Wa,-adhln=test.s -g -O0 -msoft-float -Wall -mthumb -march=armv6-m $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\cseapp\CodeLite
ARM_V6LIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/PellesSuperRng.c$(ObjectSuffix) $(IntermediateDirectory)/keypad.c$(ObjectSuffix) $(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/Ascii.c$(ObjectSuffix) $(IntermediateDirectory)/Graphics.c$(ObjectSuffix) $(IntermediateDirectory)/circular_buffer.c$(ObjectSuffix) $(IntermediateDirectory)/nb_delay.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/snake.elf ./Debug/snake.s19
	arm-none-eabi-objdump -D -S ./Debug/snake.elf > ./Debug/snake.dass
	
	@echo Done

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/PellesSuperRng.c$(ObjectSuffix): PellesSuperRng.c $(IntermediateDirectory)/PellesSuperRng.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/EDA482_snake/labb5/snake/PellesSuperRng.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/PellesSuperRng.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/PellesSuperRng.c$(DependSuffix): PellesSuperRng.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/PellesSuperRng.c$(ObjectSuffix) -MF$(IntermediateDirectory)/PellesSuperRng.c$(DependSuffix) -MM PellesSuperRng.c

$(IntermediateDirectory)/PellesSuperRng.c$(PreprocessSuffix): PellesSuperRng.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/PellesSuperRng.c$(PreprocessSuffix) PellesSuperRng.c

$(IntermediateDirectory)/keypad.c$(ObjectSuffix): keypad.c $(IntermediateDirectory)/keypad.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/EDA482_snake/labb5/snake/keypad.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keypad.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keypad.c$(DependSuffix): keypad.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keypad.c$(ObjectSuffix) -MF$(IntermediateDirectory)/keypad.c$(DependSuffix) -MM keypad.c

$(IntermediateDirectory)/keypad.c$(PreprocessSuffix): keypad.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keypad.c$(PreprocessSuffix) keypad.c

$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/EDA482_snake/labb5/snake/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/Ascii.c$(ObjectSuffix): Ascii.c $(IntermediateDirectory)/Ascii.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/EDA482_snake/labb5/snake/Ascii.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Ascii.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Ascii.c$(DependSuffix): Ascii.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Ascii.c$(ObjectSuffix) -MF$(IntermediateDirectory)/Ascii.c$(DependSuffix) -MM Ascii.c

$(IntermediateDirectory)/Ascii.c$(PreprocessSuffix): Ascii.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Ascii.c$(PreprocessSuffix) Ascii.c

$(IntermediateDirectory)/Graphics.c$(ObjectSuffix): Graphics.c $(IntermediateDirectory)/Graphics.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/EDA482_snake/labb5/snake/Graphics.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Graphics.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Graphics.c$(DependSuffix): Graphics.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Graphics.c$(ObjectSuffix) -MF$(IntermediateDirectory)/Graphics.c$(DependSuffix) -MM Graphics.c

$(IntermediateDirectory)/Graphics.c$(PreprocessSuffix): Graphics.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Graphics.c$(PreprocessSuffix) Graphics.c

$(IntermediateDirectory)/circular_buffer.c$(ObjectSuffix): circular_buffer.c $(IntermediateDirectory)/circular_buffer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/EDA482_snake/labb5/snake/circular_buffer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/circular_buffer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/circular_buffer.c$(DependSuffix): circular_buffer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/circular_buffer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/circular_buffer.c$(DependSuffix) -MM circular_buffer.c

$(IntermediateDirectory)/circular_buffer.c$(PreprocessSuffix): circular_buffer.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/circular_buffer.c$(PreprocessSuffix) circular_buffer.c

$(IntermediateDirectory)/nb_delay.c$(ObjectSuffix): nb_delay.c $(IntermediateDirectory)/nb_delay.c$(DependSuffix)
	$(CC) $(SourceSwitch) "Z:/EDA482_snake/labb5/snake/nb_delay.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/nb_delay.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/nb_delay.c$(DependSuffix): nb_delay.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/nb_delay.c$(ObjectSuffix) -MF$(IntermediateDirectory)/nb_delay.c$(DependSuffix) -MM nb_delay.c

$(IntermediateDirectory)/nb_delay.c$(PreprocessSuffix): nb_delay.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/nb_delay.c$(PreprocessSuffix) nb_delay.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/



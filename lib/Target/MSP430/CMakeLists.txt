set(LLVM_TARGET_DEFINITIONS MSP430.td)

tablegen(MSP430GenRegisterInfo.inc -gen-register-info)
tablegen(MSP430GenInstrInfo.inc -gen-instr-info)
tablegen(MSP430GenAsmWriter.inc -gen-asm-writer)
tablegen(MSP430GenDAGISel.inc -gen-dag-isel)
tablegen(MSP430GenCallingConv.inc -gen-callingconv)
tablegen(MSP430GenSubtargetInfo.inc -gen-subtarget)

add_llvm_target(MSP430CodeGen
  MSP430BranchSelector.cpp
  MSP430ISelDAGToDAG.cpp
  MSP430ISelLowering.cpp
  MSP430InstrInfo.cpp
  MSP430FrameLowering.cpp
  MSP430RegisterInfo.cpp
  MSP430Subtarget.cpp
  MSP430TargetMachine.cpp
  MSP430SelectionDAGInfo.cpp
  MSP430AsmPrinter.cpp
  MSP430MCInstLower.cpp
  )

add_subdirectory(InstPrinter)
add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)

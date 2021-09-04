#############################################################################
##  v      #                   The Coq Proof Assistant                     ##
## <O___,, #                INRIA - CNRS - LIX - LRI - PPS                 ##
##   \VV/  #                                                               ##
##    //   #  Makefile automagically generated by coq_makefile V8.4pl6     ##
#############################################################################

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

#
# This Makefile was generated by the command line :
# coq_makefile -f _CoqProject -o Makefile 
#

.DEFAULT_GOAL := all

# 
# This Makefile may take arguments passed as environment variables:
# COQBIN to specify the directory where Coq binaries resides;
# ZDEBUG/COQDEBUG to specify debug flags for ocamlc&ocamlopt/coqc;
# DSTROOT to specify a prefix to install path.

# Here is a hack to make $(eval $(shell works:
define donewline


endef
includecmdwithout@ = $(eval $(subst @,$(donewline),$(shell { $(1) | tr -d '\r' | tr '\n' '@'; })))
$(call includecmdwithout@,$(COQBIN)coqtop -config)

##########################
#                        #
# Libraries definitions. #
#                        #
##########################

COQLIBS?= -R certikos/mcertikos mcertikos\
  -R certikos/liblayers liblayers\
  -R certikos/compcertx compcertx\
  -R certikos/compcert compcert\
  -R theorem4 theorem4\
  -R theorem2 theorem2\
  -R sekvm sekvm
COQDOCLIBS?=-R certikos/mcertikos mcertikos\
  -R certikos/liblayers liblayers\
  -R certikos/compcertx compcertx\
  -R certikos/compcert compcert\
  -R theorem4 theorem4\
  -R theorem2 theorem2\
  -R sekvm sekvm

##########################
#                        #
# Variables definitions. #
#                        #
##########################


OPT?=
COQDEP?="$(COQBIN)coqdep" -c
COQFLAGS?=-q $(OPT) $(COQLIBS) $(OTHERFLAGS) $(COQ_XML)
COQCHKFLAGS?=-silent -o
COQDOCFLAGS?=-interpolate -utf8
COQC?="$(COQBIN)coqc"
GALLINA?="$(COQBIN)gallina"
COQDOC?="$(COQBIN)coqdoc"
COQCHK?="$(COQBIN)coqchk"

##################
#                #
# Install Paths. #
#                #
##################

ifdef USERINSTALL
XDG_DATA_HOME?="$(HOME)/.local/share"
COQLIBINSTALL=$(XDG_DATA_HOME)/coq
COQDOCINSTALL=$(XDG_DATA_HOME)/doc/coq
else
COQLIBINSTALL="${COQLIB}user-contrib"
COQDOCINSTALL="${DOCDIR}user-contrib"
endif

######################
#                    #
# Files dispatching. #
#                    #
######################

VFILES:=theorem4/PageTable.v\
  theorem4/Proof.v\
  theorem4/SC.v\
  theorem4/DRF.v\
  theorem4/Promising.v\
  theorem4/Base.v\
  theorem2/Proof.v\
  theorem2/SC.v\
  theorem2/DRF.v\
  theorem2/Promising.v\
  theorem2/Base.v\
  sekvm/Security/Noninterference.v\
  sekvm/Security/SecurityDef.v\
  sekvm/Security/InvProofs.v\
  sekvm/Security/Invs.v\
  sekvm/wDRF/Transactional.v\
  sekvm/wDRF/WriteOnceKernelMapping.v\
  sekvm/wDRF/MemoryIsolation.v\
  sekvm/TrapHandler/ProofHigh.v\
  sekvm/TrapHandler/ProofLow.v\
  sekvm/TrapHandler/Code.v\
  sekvm/TrapHandler/Spec.v\
  sekvm/TrapHandler/Layer.v\
  sekvm/TrapHandlerRaw/ProofHigh.v\
  sekvm/TrapHandlerRaw/ProofLow.v\
  sekvm/TrapHandlerRaw/Code.v\
  sekvm/TrapHandlerRaw/Spec.v\
  sekvm/TrapHandlerRaw/Layer.v\
  sekvm/TrapDispatcher/ProofHigh.v\
  sekvm/TrapDispatcher/ProofLow.v\
  sekvm/TrapDispatcher/Code.v\
  sekvm/TrapDispatcher/Spec.v\
  sekvm/TrapDispatcher/Layer.v\
  sekvm/FaultHandler/ProofHigh.v\
  sekvm/FaultHandler/ProofLow.v\
  sekvm/FaultHandler/Code.v\
  sekvm/FaultHandler/Spec.v\
  sekvm/FaultHandler/Layer.v\
  sekvm/MemHandler/ProofHigh.v\
  sekvm/MemHandler/ProofLow.v\
  sekvm/MemHandler/Code.v\
  sekvm/MemHandler/Spec.v\
  sekvm/MemHandler/Layer.v\
  sekvm/CtxtSwitch/ProofHigh.v\
  sekvm/CtxtSwitch/ProofLow.v\
  sekvm/CtxtSwitch/Code.v\
  sekvm/CtxtSwitch/Spec.v\
  sekvm/CtxtSwitch/Layer.v\
  sekvm/VCPUOps/ProofHigh.v\
  sekvm/VCPUOps/ProofLow.v\
  sekvm/VCPUOps/Code.v\
  sekvm/VCPUOps/Spec.v\
  sekvm/VCPUOps/Layer.v\
  sekvm/VCPUOpsAux/ProofHigh.v\
  sekvm/VCPUOpsAux/ProofLow.v\
  sekvm/VCPUOpsAux/Code.v\
  sekvm/VCPUOpsAux/Spec.v\
  sekvm/VCPUOpsAux/Layer.v\
  sekvm/MmioOps/ProofHigh.v\
  sekvm/MmioOps/ProofLow.v\
  sekvm/MmioOps/Code.v\
  sekvm/MmioOps/Spec.v\
  sekvm/MmioOps/Layer.v\
  sekvm/MmioOpsAux/ProofHigh.v\
  sekvm/MmioOpsAux/ProofLow.v\
  sekvm/MmioOpsAux/Code.v\
  sekvm/MmioOpsAux/Spec.v\
  sekvm/MmioOpsAux/Layer.v\
  sekvm/MmioCore/ProofHigh.v\
  sekvm/MmioCore/ProofLow.v\
  sekvm/MmioCore/Code.v\
  sekvm/MmioCore/Spec.v\
  sekvm/MmioCore/Layer.v\
  sekvm/MmioCoreAux/ProofHigh.v\
  sekvm/MmioCoreAux/ProofLow.v\
  sekvm/MmioCoreAux/Code.v\
  sekvm/MmioCoreAux/Spec.v\
  sekvm/MmioCoreAux/Layer.v\
  sekvm/MmioRaw/ProofHigh.v\
  sekvm/MmioRaw/ProofLow.v\
  sekvm/MmioRaw/Code.v\
  sekvm/MmioRaw/Spec.v\
  sekvm/MmioRaw/Layer.v\
  sekvm/BootOps/ProofHigh.v\
  sekvm/BootOps/ProofLow.v\
  sekvm/BootOps/Code.v\
  sekvm/BootOps/Spec.v\
  sekvm/BootOps/Layer.v\
  sekvm/BootAux/ProofHigh.v\
  sekvm/BootAux/ProofLow.v\
  sekvm/BootAux/Code.v\
  sekvm/BootAux/Spec.v\
  sekvm/BootAux/Layer.v\
  sekvm/BootCore/ProofHigh.v\
  sekvm/BootCore/ProofLow.v\
  sekvm/BootCore/Code.v\
  sekvm/BootCore/Spec.v\
  sekvm/BootCore/Layer.v\
  sekvm/VMPower/ProofHigh.v\
  sekvm/VMPower/ProofLow.v\
  sekvm/VMPower/Code.v\
  sekvm/VMPower/Spec.v\
  sekvm/VMPower/Layer.v\
  sekvm/MemoryOps/ProofHigh.v\
  sekvm/MemoryOps/ProofLow.v\
  sekvm/MemoryOps/Code.v\
  sekvm/MemoryOps/Spec.v\
  sekvm/MemoryOps/Layer.v\
  sekvm/MemManager/ProofHigh.v\
  sekvm/MemManager/ProofLow.v\
  sekvm/MemManager/Code.v\
  sekvm/MemManager/Spec.v\
  sekvm/MemManager/Layer.v\
  sekvm/PageManager/ProofHigh.v\
  sekvm/PageManager/ProofLow.v\
  sekvm/PageManager/Code.v\
  sekvm/PageManager/Spec.v\
  sekvm/PageManager/Layer.v\
  sekvm/PageIndex/ProofHigh.v\
  sekvm/PageIndex/ProofLow.v\
  sekvm/PageIndex/Code.v\
  sekvm/PageIndex/Spec.v\
  sekvm/PageIndex/Layer.v\
  sekvm/MemRegion/ProofHigh.v\
  sekvm/MemRegion/ProofLow.v\
  sekvm/MemRegion/Code.v\
  sekvm/MemRegion/Spec.v\
  sekvm/MemRegion/Layer.v\
  sekvm/MmioSPTOps/ProofHigh.v\
  sekvm/MmioSPTOps/ProofLow.v\
  sekvm/MmioSPTOps/Code.v\
  sekvm/MmioSPTOps/Spec.v\
  sekvm/MmioSPTOps/Layer.v\
  sekvm/MmioSPTWalk/ProofHigh.v\
  sekvm/MmioSPTWalk/ProofLow.v\
  sekvm/MmioSPTWalk/Code.v\
  sekvm/MmioSPTWalk/Spec.v\
  sekvm/MmioSPTWalk/Layer.v\
  sekvm/MmioPTWalk/ProofHigh.v\
  sekvm/MmioPTWalk/ProofLow.v\
  sekvm/MmioPTWalk/Code.v\
  sekvm/MmioPTWalk/Spec.v\
  sekvm/MmioPTWalk/Layer.v\
  sekvm/MmioPTAlloc/ProofHigh.v\
  sekvm/MmioPTAlloc/ProofLow.v\
  sekvm/MmioPTAlloc/Code.v\
  sekvm/MmioPTAlloc/Spec.v\
  sekvm/MmioPTAlloc/Layer.v\
  sekvm/NPTOps/ProofHigh.v\
  sekvm/NPTOps/ProofLow.v\
  sekvm/NPTOps/Code.v\
  sekvm/NPTOps/Spec.v\
  sekvm/NPTOps/Layer.v\
  sekvm/NPTWalk/ProofHigh.v\
  sekvm/NPTWalk/ProofHighAux.v\
  sekvm/NPTWalk/ProofLow.v\
  sekvm/NPTWalk/Code.v\
  sekvm/NPTWalk/Spec.v\
  sekvm/NPTWalk/Layer.v\
  sekvm/PTWalk/ProofHigh.v\
  sekvm/PTWalk/ProofLow.v\
  sekvm/PTWalk/Code.v\
  sekvm/PTWalk/Spec.v\
  sekvm/PTWalk/Layer.v\
  sekvm/PTAlloc/ProofHigh.v\
  sekvm/PTAlloc/ProofLow.v\
  sekvm/PTAlloc/Code.v\
  sekvm/PTAlloc/Spec.v\
  sekvm/PTAlloc/Layer.v\
  sekvm/Locks/ProofHigh.v\
  sekvm/Locks/ProofLow.v\
  sekvm/Locks/Code.v\
  sekvm/Locks/Spec.v\
  sekvm/Locks/Layer.v\
  sekvm/LockOpsH/ProofHigh.v\
  sekvm/LockOpsH/ProofLow.v\
  sekvm/LockOpsH/Code.v\
  sekvm/LockOpsH/Spec.v\
  sekvm/LockOpsH/Layer.v\
  sekvm/LockOpsQ/ProofHigh.v\
  sekvm/LockOpsQ/ProofLow.v\
  sekvm/LockOpsQ/Code.v\
  sekvm/LockOpsQ/Spec.v\
  sekvm/LockOpsQ/Layer.v\
  sekvm/LockOps/ProofHigh.v\
  sekvm/LockOps/ProofLow.v\
  sekvm/LockOps/Code.v\
  sekvm/LockOps/Spec.v\
  sekvm/LockOps/Layer.v\
  sekvm/AbstractMachine/Spec.v\
  sekvm/AbstractMachine/Layer.v\
  sekvm/CalLock.v\
  sekvm/HypsecCommLib.v\
  sekvm/Ident.v\
  sekvm/RData.v\
  sekvm/Constants.v

-include $(addsuffix .d,$(VFILES))
.SECONDARY: $(addsuffix .d,$(VFILES))

VOFILES:=$(VFILES:.v=.vo)
VOFILES5=$(patsubst theorem4/%,%,$(filter theorem4/%,$(VOFILES)))
VOFILES6=$(patsubst theorem2/%,%,$(filter theorem2/%,$(VOFILES)))
VOFILES7=$(patsubst sekvm/%,%,$(filter sekvm/%,$(VOFILES)))
GLOBFILES:=$(VFILES:.v=.glob)
VIFILES:=$(VFILES:.v=.vi)
GFILES:=$(VFILES:.v=.g)
HTMLFILES:=$(VFILES:.v=.html)
GHTMLFILES:=$(VFILES:.v=.g.html)
ifeq '$(HASNATDYNLINK)' 'true'
HASNATDYNLINK_OR_EMPTY := yes
else
HASNATDYNLINK_OR_EMPTY :=
endif

#######################################
#                                     #
# Definition of the toplevel targets. #
#                                     #
#######################################

all: $(VOFILES) 

spec: $(VIFILES)

gallina: $(GFILES)

html: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc $(COQDOCFLAGS) -html $(COQDOCLIBS) -d html $(VFILES)

gallinahtml: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc $(COQDOCFLAGS) -html -g $(COQDOCLIBS) -d html $(VFILES)

all.ps: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -ps $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all-gal.ps: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -ps -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all.pdf: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -pdf $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all-gal.pdf: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -pdf -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

validate: $(VOFILES)
	$(COQCHK) $(COQCHKFLAGS) $(COQLIBS) $(notdir $(^:.vo=))

beautify: $(VFILES:=.beautified)
	for file in $^; do mv $${file%.beautified} $${file%beautified}old && mv $${file} $${file%.beautified}; done
	@echo 'Do not do "make clean" until you are sure that everything went well!'
	@echo 'If there were a problem, execute "for file in $$(find . -name \*.v.old -print); do mv $${file} $${file%.old}; done" in your shell/'

.PHONY: all opt byte archclean clean install userinstall depend html validate

####################
#                  #
# Special targets. #
#                  #
####################

byte:
	$(MAKE) all "OPT:=-byte"

opt:
	$(MAKE) all "OPT:=-opt"

userinstall:
	+$(MAKE) USERINSTALL=true install

install:
	cd "theorem4"; for i in $(VOFILES5); do \
	 install -d "`dirname "$(DSTROOT)"$(COQLIBINSTALL)/theorem4/$$i`"; \
	 install -m 0644 $$i "$(DSTROOT)"$(COQLIBINSTALL)/theorem4/$$i; \
	done
	cd "theorem2"; for i in $(VOFILES6); do \
	 install -d "`dirname "$(DSTROOT)"$(COQLIBINSTALL)/theorem2/$$i`"; \
	 install -m 0644 $$i "$(DSTROOT)"$(COQLIBINSTALL)/theorem2/$$i; \
	done
	cd "sekvm"; for i in $(VOFILES7); do \
	 install -d "`dirname "$(DSTROOT)"$(COQLIBINSTALL)/sekvm/$$i`"; \
	 install -m 0644 $$i "$(DSTROOT)"$(COQLIBINSTALL)/sekvm/$$i; \
	done

install-doc:
	install -d "$(DSTROOT)"$(COQDOCINSTALL)/$(INSTALLDEFAULTROOT)/html
	for i in html/*; do \
	 install -m 0644 $$i "$(DSTROOT)"$(COQDOCINSTALL)/$(INSTALLDEFAULTROOT)/$$i;\
	done

clean:
	rm -f $(VOFILES) $(VIFILES) $(GFILES) $(VFILES:.v=.v.d) $(VFILES:=.beautified) $(VFILES:=.old)
	rm -f all.ps all-gal.ps all.pdf all-gal.pdf all.glob $(VFILES:.v=.glob) $(VFILES:.v=.tex) $(VFILES:.v=.g.tex) all-mli.tex
	- rm -rf html mlihtml

archclean:
	rm -f *.cmx *.o

printenv:
	@"$(COQBIN)coqtop" -config
	@echo 'CAMLC =	$(CAMLC)'
	@echo 'CAMLOPTC =	$(CAMLOPTC)'
	@echo 'PP =	$(PP)'
	@echo 'COQFLAGS =	$(COQFLAGS)'
	@echo 'COQLIBINSTALL =	$(COQLIBINSTALL)'
	@echo 'COQDOCINSTALL =	$(COQDOCINSTALL)'

Makefile: _CoqProject
	mv -f $@ $@.bak
	"$(COQBIN)coq_makefile" -f $< -o $@


###################
#                 #
# Implicit rules. #
#                 #
###################

%.vo %.glob: %.v
	$(COQC) $(COQDEBUG) $(COQFLAGS) $*

%.vi: %.v
	$(COQC) -i $(COQDEBUG) $(COQFLAGS) $*

%.g: %.v
	$(GALLINA) $<

%.tex: %.v
	$(COQDOC) $(COQDOCFLAGS) -latex $< -o $@

%.html: %.v %.glob
	$(COQDOC) $(COQDOCFLAGS) -html $< -o $@

%.g.tex: %.v
	$(COQDOC) $(COQDOCFLAGS) -latex -g $< -o $@

%.g.html: %.v %.glob
	$(COQDOC) $(COQDOCFLAGS)  -html -g $< -o $@

%.v.d: %.v
	$(COQDEP) -slash $(COQLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

%.v.beautified:
	$(COQC) $(COQDEBUG) $(COQFLAGS) -beautify $*

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

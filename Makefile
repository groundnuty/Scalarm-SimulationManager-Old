# This Makefile is for the Scalarm::SimulationManager extension to perl.
#
# It was generated automatically by MakeMaker version
# 6.82 (Revision: 68200) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#

#   MakeMaker Parameters:

#     ABSTRACT_FROM => q[lib/Scalarm/SimulationManager.pm]
#     AUTHOR => [q[Michal Orzechowski <morzch@agh.edu.pl>]]
#     BUILD_REQUIRES => { Test::MockObject=>q[0], File::Copy=>q[0], Test::More=>q[0], File::Temp=>q[0], Log::Log4perl=>q[0] }
#     CONFIGURE_REQUIRES => { ExtUtils::MakeMaker=>q[0] }
#     LICENSE => q[Artistic_2_0]
#     MIN_PERL_VERSION => q[5.006]
#     NAME => q[Scalarm::SimulationManager]
#     PL_FILES => {  }
#     PREREQ_PM => { Test::More=>q[0], File::Copy=>q[0], Test::MockObject=>q[0], File::Temp=>q[0], Log::Log4perl=>q[0] }
#     TEST_REQUIRES => {  }
#     VERSION_FROM => q[lib/Scalarm/SimulationManager.pm]
#     clean => { FILES=>q[Scalarm-SimulationManager-*] }
#     dist => { COMPRESS=>q[gzip -9f], SUFFIX=>q[gz] }

# --- MakeMaker post_initialize section:


# --- MakeMaker const_config section:

# These definitions are from config.sh (via /System/Library/Perl/5.16/darwin-thread-multi-2level/Config.pm).
# They may have been overridden via Makefile.PL or on the command line.
AR = ar
CC = cc
CCCDLFLAGS =  
CCDLFLAGS =  
DLEXT = bundle
DLSRC = dl_dlopen.xs
EXE_EXT = 
FULL_AR = /usr/bin/ar
LD = cc -mmacosx-version-min=10.9
LDDLFLAGS = -arch x86_64 -arch i386 -bundle -undefined dynamic_lookup -L/usr/local/lib -fstack-protector
LDFLAGS = -arch x86_64 -arch i386 -fstack-protector -L/usr/local/lib
LIBC = 
LIB_EXT = .a
OBJ_EXT = .o
OSNAME = darwin
OSVERS = 13.0
RANLIB = /usr/bin/ar s
SITELIBEXP = /Library/Perl/5.16
SITEARCHEXP = /Library/Perl/5.16/darwin-thread-multi-2level
SO = dylib
VENDORARCHEXP = /Network/Library/Perl/5.16/darwin-thread-multi-2level
VENDORLIBEXP = /Network/Library/Perl/5.16


# --- MakeMaker constants section:
AR_STATIC_ARGS = cr
DIRFILESEP = /
DFSEP = $(DIRFILESEP)
NAME = Scalarm::SimulationManager
NAME_SYM = Scalarm_SimulationManager
VERSION = 0.01
VERSION_MACRO = VERSION
VERSION_SYM = 0_01
DEFINE_VERSION = -D$(VERSION_MACRO)=\"$(VERSION)\"
XS_VERSION = 0.01
XS_VERSION_MACRO = XS_VERSION
XS_DEFINE_VERSION = -D$(XS_VERSION_MACRO)=\"$(XS_VERSION)\"
INST_ARCHLIB = blib/arch
INST_SCRIPT = blib/script
INST_BIN = blib/bin
INST_LIB = blib/lib
INST_MAN1DIR = blib/man1
INST_MAN3DIR = blib/man3
MAN1EXT = 1
MAN3EXT = 3pm
INSTALLDIRS = site
INSTALL_BASE = /Users/orzech/perl5
DESTDIR = 
PREFIX = $(INSTALL_BASE)
INSTALLPRIVLIB = $(INSTALL_BASE)/lib/perl5
DESTINSTALLPRIVLIB = $(DESTDIR)$(INSTALLPRIVLIB)
INSTALLSITELIB = $(INSTALL_BASE)/lib/perl5
DESTINSTALLSITELIB = $(DESTDIR)$(INSTALLSITELIB)
INSTALLVENDORLIB = $(INSTALL_BASE)/lib/perl5
DESTINSTALLVENDORLIB = $(DESTDIR)$(INSTALLVENDORLIB)
INSTALLARCHLIB = $(INSTALL_BASE)/lib/perl5/darwin-thread-multi-2level
DESTINSTALLARCHLIB = $(DESTDIR)$(INSTALLARCHLIB)
INSTALLSITEARCH = $(INSTALL_BASE)/lib/perl5/darwin-thread-multi-2level
DESTINSTALLSITEARCH = $(DESTDIR)$(INSTALLSITEARCH)
INSTALLVENDORARCH = $(INSTALL_BASE)/lib/perl5/darwin-thread-multi-2level
DESTINSTALLVENDORARCH = $(DESTDIR)$(INSTALLVENDORARCH)
INSTALLBIN = $(INSTALL_BASE)/bin
DESTINSTALLBIN = $(DESTDIR)$(INSTALLBIN)
INSTALLSITEBIN = $(INSTALL_BASE)/bin
DESTINSTALLSITEBIN = $(DESTDIR)$(INSTALLSITEBIN)
INSTALLVENDORBIN = $(INSTALL_BASE)/bin
DESTINSTALLVENDORBIN = $(DESTDIR)$(INSTALLVENDORBIN)
INSTALLSCRIPT = $(INSTALL_BASE)/bin
DESTINSTALLSCRIPT = $(DESTDIR)$(INSTALLSCRIPT)
INSTALLSITESCRIPT = $(INSTALL_BASE)/bin
DESTINSTALLSITESCRIPT = $(DESTDIR)$(INSTALLSITESCRIPT)
INSTALLVENDORSCRIPT = $(INSTALL_BASE)/bin
DESTINSTALLVENDORSCRIPT = $(DESTDIR)$(INSTALLVENDORSCRIPT)
INSTALLMAN1DIR = $(INSTALL_BASE)/man/man1
DESTINSTALLMAN1DIR = $(DESTDIR)$(INSTALLMAN1DIR)
INSTALLSITEMAN1DIR = $(INSTALL_BASE)/man/man1
DESTINSTALLSITEMAN1DIR = $(DESTDIR)$(INSTALLSITEMAN1DIR)
INSTALLVENDORMAN1DIR = $(INSTALL_BASE)/man/man1
DESTINSTALLVENDORMAN1DIR = $(DESTDIR)$(INSTALLVENDORMAN1DIR)
INSTALLMAN3DIR = $(INSTALL_BASE)/man/man3
DESTINSTALLMAN3DIR = $(DESTDIR)$(INSTALLMAN3DIR)
INSTALLSITEMAN3DIR = $(INSTALL_BASE)/man/man3
DESTINSTALLSITEMAN3DIR = $(DESTDIR)$(INSTALLSITEMAN3DIR)
INSTALLVENDORMAN3DIR = $(INSTALL_BASE)/man/man3
DESTINSTALLVENDORMAN3DIR = $(DESTDIR)$(INSTALLVENDORMAN3DIR)
PERL_LIB = /System/Library/Perl/5.16
PERL_ARCHLIB = /System/Library/Perl/5.16/darwin-thread-multi-2level
LIBPERL_A = libperl.a
FIRST_MAKEFILE = Makefile
MAKEFILE_OLD = Makefile.old
MAKE_APERL_FILE = Makefile.aperl
PERLMAINCC = $(CC)
PERL_INC = /System/Library/Perl/5.16/darwin-thread-multi-2level/CORE
PERL = /usr/bin/perl
FULLPERL = /usr/bin/perl
ABSPERL = $(PERL)
PERLRUN = $(PERL)
FULLPERLRUN = $(FULLPERL)
ABSPERLRUN = $(ABSPERL)
PERLRUNINST = $(PERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
FULLPERLRUNINST = $(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
ABSPERLRUNINST = $(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
PERL_CORE = 0
PERM_DIR = 755
PERM_RW = 644
PERM_RWX = 755

MAKEMAKER   = /Users/orzech/perl5/lib/perl5/ExtUtils/MakeMaker.pm
MM_VERSION  = 6.82
MM_REVISION = 68200

# FULLEXT = Pathname for extension directory (eg Foo/Bar/Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT. (eg Oracle)
# PARENT_NAME = NAME without BASEEXT and no trailing :: (eg Foo::Bar)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
MAKE = make
FULLEXT = Scalarm/SimulationManager
BASEEXT = SimulationManager
PARENT_NAME = Scalarm
DLBASE = $(BASEEXT)
VERSION_FROM = lib/Scalarm/SimulationManager.pm
OBJECT = 
LDFROM = $(OBJECT)
LINKTYPE = dynamic
BOOTDEP = 

# Handy lists of source code files:
XS_FILES = 
C_FILES  = 
O_FILES  = 
H_FILES  = 
MAN1PODS = 
MAN3PODS = lib/Mojo.pm \
	lib/Mojo/Asset.pm \
	lib/Mojo/Asset/File.pm \
	lib/Mojo/Asset/Memory.pm \
	lib/Mojo/Base.pm \
	lib/Mojo/ByteStream.pm \
	lib/Mojo/Cache.pm \
	lib/Mojo/Collection.pm \
	lib/Mojo/Content.pm \
	lib/Mojo/Content/MultiPart.pm \
	lib/Mojo/Content/Single.pm \
	lib/Mojo/Cookie.pm \
	lib/Mojo/Cookie/Request.pm \
	lib/Mojo/Cookie/Response.pm \
	lib/Mojo/DOM.pm \
	lib/Mojo/DOM/CSS.pm \
	lib/Mojo/DOM/HTML.pm \
	lib/Mojo/Date.pm \
	lib/Mojo/EventEmitter.pm \
	lib/Mojo/Exception.pm \
	lib/Mojo/Headers.pm \
	lib/Mojo/HelloWorld.pm \
	lib/Mojo/Home.pm \
	lib/Mojo/IOLoop.pm \
	lib/Mojo/IOLoop/Client.pm \
	lib/Mojo/IOLoop/Delay.pm \
	lib/Mojo/IOLoop/Server.pm \
	lib/Mojo/IOLoop/Stream.pm \
	lib/Mojo/JSON.pm \
	lib/Mojo/JSON/Pointer.pm \
	lib/Mojo/Loader.pm \
	lib/Mojo/Log.pm \
	lib/Mojo/Message.pm \
	lib/Mojo/Message/Request.pm \
	lib/Mojo/Message/Response.pm \
	lib/Mojo/Parameters.pm \
	lib/Mojo/Path.pm \
	lib/Mojo/Reactor.pm \
	lib/Mojo/Reactor/EV.pm \
	lib/Mojo/Reactor/Poll.pm \
	lib/Mojo/Server.pm \
	lib/Mojo/Server/CGI.pm \
	lib/Mojo/Server/Daemon.pm \
	lib/Mojo/Server/Hypnotoad.pm \
	lib/Mojo/Server/Morbo.pm \
	lib/Mojo/Server/PSGI.pm \
	lib/Mojo/Server/Prefork.pm \
	lib/Mojo/Template.pm \
	lib/Mojo/Transaction.pm \
	lib/Mojo/Transaction/HTTP.pm \
	lib/Mojo/Transaction/WebSocket.pm \
	lib/Mojo/URL.pm \
	lib/Mojo/Upload.pm \
	lib/Mojo/UserAgent.pm \
	lib/Mojo/UserAgent/CookieJar.pm \
	lib/Mojo/UserAgent/Proxy.pm \
	lib/Mojo/UserAgent/Server.pm \
	lib/Mojo/UserAgent/Transactor.pm \
	lib/Mojo/Util.pm

# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIB)$(DFSEP)Config.pm $(PERL_INC)$(DFSEP)config.h

# Where to build things
INST_LIBDIR      = $(INST_LIB)/Scalarm
INST_ARCHLIBDIR  = $(INST_ARCHLIB)/Scalarm

INST_AUTODIR     = $(INST_LIB)/auto/$(FULLEXT)
INST_ARCHAUTODIR = $(INST_ARCHLIB)/auto/$(FULLEXT)

INST_STATIC      = 
INST_DYNAMIC     = 
INST_BOOT        = 

# Extra linker info
EXPORT_LIST        = 
PERL_ARCHIVE       = 
PERL_ARCHIVE_AFTER = 


TO_INST_PM = lib/Mojo.pm \
	lib/Mojo/Asset.pm \
	lib/Mojo/Asset/File.pm \
	lib/Mojo/Asset/Memory.pm \
	lib/Mojo/Base.pm \
	lib/Mojo/ByteStream.pm \
	lib/Mojo/Cache.pm \
	lib/Mojo/Collection.pm \
	lib/Mojo/Content.pm \
	lib/Mojo/Content/MultiPart.pm \
	lib/Mojo/Content/Single.pm \
	lib/Mojo/Cookie.pm \
	lib/Mojo/Cookie/Request.pm \
	lib/Mojo/Cookie/Response.pm \
	lib/Mojo/DOM.pm \
	lib/Mojo/DOM/CSS.pm \
	lib/Mojo/DOM/HTML.pm \
	lib/Mojo/Date.pm \
	lib/Mojo/EventEmitter.pm \
	lib/Mojo/Exception.pm \
	lib/Mojo/Headers.pm \
	lib/Mojo/HelloWorld.pm \
	lib/Mojo/Home.pm \
	lib/Mojo/IOLoop.pm \
	lib/Mojo/IOLoop/Client.pm \
	lib/Mojo/IOLoop/Delay.pm \
	lib/Mojo/IOLoop/Server.pm \
	lib/Mojo/IOLoop/Stream.pm \
	lib/Mojo/IOLoop/server.crt \
	lib/Mojo/IOLoop/server.key \
	lib/Mojo/JSON.pm \
	lib/Mojo/JSON/Pointer.pm \
	lib/Mojo/Loader.pm \
	lib/Mojo/Log.pm \
	lib/Mojo/Message.pm \
	lib/Mojo/Message/Request.pm \
	lib/Mojo/Message/Response.pm \
	lib/Mojo/Parameters.pm \
	lib/Mojo/Path.pm \
	lib/Mojo/Reactor.pm \
	lib/Mojo/Reactor/EV.pm \
	lib/Mojo/Reactor/Poll.pm \
	lib/Mojo/Server.pm \
	lib/Mojo/Server/CGI.pm \
	lib/Mojo/Server/Daemon.pm \
	lib/Mojo/Server/Hypnotoad.pm \
	lib/Mojo/Server/Morbo.pm \
	lib/Mojo/Server/PSGI.pm \
	lib/Mojo/Server/Prefork.pm \
	lib/Mojo/Template.pm \
	lib/Mojo/Transaction.pm \
	lib/Mojo/Transaction/HTTP.pm \
	lib/Mojo/Transaction/WebSocket.pm \
	lib/Mojo/URL.pm \
	lib/Mojo/Upload.pm \
	lib/Mojo/UserAgent.pm \
	lib/Mojo/UserAgent/CookieJar.pm \
	lib/Mojo/UserAgent/Proxy.pm \
	lib/Mojo/UserAgent/Server.pm \
	lib/Mojo/UserAgent/Transactor.pm \
	lib/Mojo/Util.pm \
	lib/Mojo/entities.txt \
	lib/Scalarm/ExperimentManager.pm \
	lib/Scalarm/InformationService.pm \
	lib/Scalarm/Simulation.pm \
	lib/Scalarm/SimulationManager.pm \
	lib/Scalarm/StorageManager.pm

PM_TO_BLIB = lib/Mojo.pm \
	blib/lib/Mojo.pm \
	lib/Mojo/Asset.pm \
	blib/lib/Mojo/Asset.pm \
	lib/Mojo/Asset/File.pm \
	blib/lib/Mojo/Asset/File.pm \
	lib/Mojo/Asset/Memory.pm \
	blib/lib/Mojo/Asset/Memory.pm \
	lib/Mojo/Base.pm \
	blib/lib/Mojo/Base.pm \
	lib/Mojo/ByteStream.pm \
	blib/lib/Mojo/ByteStream.pm \
	lib/Mojo/Cache.pm \
	blib/lib/Mojo/Cache.pm \
	lib/Mojo/Collection.pm \
	blib/lib/Mojo/Collection.pm \
	lib/Mojo/Content.pm \
	blib/lib/Mojo/Content.pm \
	lib/Mojo/Content/MultiPart.pm \
	blib/lib/Mojo/Content/MultiPart.pm \
	lib/Mojo/Content/Single.pm \
	blib/lib/Mojo/Content/Single.pm \
	lib/Mojo/Cookie.pm \
	blib/lib/Mojo/Cookie.pm \
	lib/Mojo/Cookie/Request.pm \
	blib/lib/Mojo/Cookie/Request.pm \
	lib/Mojo/Cookie/Response.pm \
	blib/lib/Mojo/Cookie/Response.pm \
	lib/Mojo/DOM.pm \
	blib/lib/Mojo/DOM.pm \
	lib/Mojo/DOM/CSS.pm \
	blib/lib/Mojo/DOM/CSS.pm \
	lib/Mojo/DOM/HTML.pm \
	blib/lib/Mojo/DOM/HTML.pm \
	lib/Mojo/Date.pm \
	blib/lib/Mojo/Date.pm \
	lib/Mojo/EventEmitter.pm \
	blib/lib/Mojo/EventEmitter.pm \
	lib/Mojo/Exception.pm \
	blib/lib/Mojo/Exception.pm \
	lib/Mojo/Headers.pm \
	blib/lib/Mojo/Headers.pm \
	lib/Mojo/HelloWorld.pm \
	blib/lib/Mojo/HelloWorld.pm \
	lib/Mojo/Home.pm \
	blib/lib/Mojo/Home.pm \
	lib/Mojo/IOLoop.pm \
	blib/lib/Mojo/IOLoop.pm \
	lib/Mojo/IOLoop/Client.pm \
	blib/lib/Mojo/IOLoop/Client.pm \
	lib/Mojo/IOLoop/Delay.pm \
	blib/lib/Mojo/IOLoop/Delay.pm \
	lib/Mojo/IOLoop/Server.pm \
	blib/lib/Mojo/IOLoop/Server.pm \
	lib/Mojo/IOLoop/Stream.pm \
	blib/lib/Mojo/IOLoop/Stream.pm \
	lib/Mojo/IOLoop/server.crt \
	blib/lib/Mojo/IOLoop/server.crt \
	lib/Mojo/IOLoop/server.key \
	blib/lib/Mojo/IOLoop/server.key \
	lib/Mojo/JSON.pm \
	blib/lib/Mojo/JSON.pm \
	lib/Mojo/JSON/Pointer.pm \
	blib/lib/Mojo/JSON/Pointer.pm \
	lib/Mojo/Loader.pm \
	blib/lib/Mojo/Loader.pm \
	lib/Mojo/Log.pm \
	blib/lib/Mojo/Log.pm \
	lib/Mojo/Message.pm \
	blib/lib/Mojo/Message.pm \
	lib/Mojo/Message/Request.pm \
	blib/lib/Mojo/Message/Request.pm \
	lib/Mojo/Message/Response.pm \
	blib/lib/Mojo/Message/Response.pm \
	lib/Mojo/Parameters.pm \
	blib/lib/Mojo/Parameters.pm \
	lib/Mojo/Path.pm \
	blib/lib/Mojo/Path.pm \
	lib/Mojo/Reactor.pm \
	blib/lib/Mojo/Reactor.pm \
	lib/Mojo/Reactor/EV.pm \
	blib/lib/Mojo/Reactor/EV.pm \
	lib/Mojo/Reactor/Poll.pm \
	blib/lib/Mojo/Reactor/Poll.pm \
	lib/Mojo/Server.pm \
	blib/lib/Mojo/Server.pm \
	lib/Mojo/Server/CGI.pm \
	blib/lib/Mojo/Server/CGI.pm \
	lib/Mojo/Server/Daemon.pm \
	blib/lib/Mojo/Server/Daemon.pm \
	lib/Mojo/Server/Hypnotoad.pm \
	blib/lib/Mojo/Server/Hypnotoad.pm \
	lib/Mojo/Server/Morbo.pm \
	blib/lib/Mojo/Server/Morbo.pm \
	lib/Mojo/Server/PSGI.pm \
	blib/lib/Mojo/Server/PSGI.pm \
	lib/Mojo/Server/Prefork.pm \
	blib/lib/Mojo/Server/Prefork.pm \
	lib/Mojo/Template.pm \
	blib/lib/Mojo/Template.pm \
	lib/Mojo/Transaction.pm \
	blib/lib/Mojo/Transaction.pm \
	lib/Mojo/Transaction/HTTP.pm \
	blib/lib/Mojo/Transaction/HTTP.pm \
	lib/Mojo/Transaction/WebSocket.pm \
	blib/lib/Mojo/Transaction/WebSocket.pm \
	lib/Mojo/URL.pm \
	blib/lib/Mojo/URL.pm \
	lib/Mojo/Upload.pm \
	blib/lib/Mojo/Upload.pm \
	lib/Mojo/UserAgent.pm \
	blib/lib/Mojo/UserAgent.pm \
	lib/Mojo/UserAgent/CookieJar.pm \
	blib/lib/Mojo/UserAgent/CookieJar.pm \
	lib/Mojo/UserAgent/Proxy.pm \
	blib/lib/Mojo/UserAgent/Proxy.pm \
	lib/Mojo/UserAgent/Server.pm \
	blib/lib/Mojo/UserAgent/Server.pm \
	lib/Mojo/UserAgent/Transactor.pm \
	blib/lib/Mojo/UserAgent/Transactor.pm \
	lib/Mojo/Util.pm \
	blib/lib/Mojo/Util.pm \
	lib/Mojo/entities.txt \
	blib/lib/Mojo/entities.txt \
	lib/Scalarm/ExperimentManager.pm \
	blib/lib/Scalarm/ExperimentManager.pm \
	lib/Scalarm/InformationService.pm \
	blib/lib/Scalarm/InformationService.pm \
	lib/Scalarm/Simulation.pm \
	blib/lib/Scalarm/Simulation.pm \
	lib/Scalarm/SimulationManager.pm \
	blib/lib/Scalarm/SimulationManager.pm \
	lib/Scalarm/StorageManager.pm \
	blib/lib/Scalarm/StorageManager.pm


# --- MakeMaker platform_constants section:
MM_Unix_VERSION = 6.82
PERL_MALLOC_DEF = -DPERL_EXTMALLOC_DEF -Dmalloc=Perl_malloc -Dfree=Perl_mfree -Drealloc=Perl_realloc -Dcalloc=Perl_calloc


# --- MakeMaker tool_autosplit section:
# Usage: $(AUTOSPLITFILE) FileToSplit AutoDirToSplitInto
AUTOSPLITFILE = $(ABSPERLRUN)  -e 'use AutoSplit;  autosplit($$$$ARGV[0], $$$$ARGV[1], 0, 1, 1)' --



# --- MakeMaker tool_xsubpp section:


# --- MakeMaker tools_other section:
SHELL = /bin/sh
CHMOD = chmod
CP = cp
MV = mv
NOOP = $(TRUE)
NOECHO = @
RM_F = rm -f
RM_RF = rm -rf
TEST_F = test -f
TOUCH = touch
UMASK_NULL = umask 0
DEV_NULL = > /dev/null 2>&1
MKPATH = $(ABSPERLRUN) -MExtUtils::Command -e 'mkpath' --
EQUALIZE_TIMESTAMP = $(ABSPERLRUN) -MExtUtils::Command -e 'eqtime' --
FALSE = false
TRUE = true
ECHO = echo
ECHO_N = echo -n
UNINST = 0
VERBINST = 0
MOD_INSTALL = $(ABSPERLRUN) -MExtUtils::Install -e 'install([ from_to => {@ARGV}, verbose => '\''$(VERBINST)'\'', uninstall_shadows => '\''$(UNINST)'\'', dir_mode => '\''$(PERM_DIR)'\'' ]);' --
DOC_INSTALL = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'perllocal_install' --
UNINSTALL = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'uninstall' --
WARN_IF_OLD_PACKLIST = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'warn_if_old_packlist' --
MACROSTART = 
MACROEND = 
USEMAKEFILE = -f
FIXIN = $(ABSPERLRUN) -MExtUtils::MY -e 'MY->fixin(shift)' --
CP_NONEMPTY = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'cp_nonempty' --


# --- MakeMaker makemakerdflt section:
makemakerdflt : all
	$(NOECHO) $(NOOP)


# --- MakeMaker dist section:
TAR = COPY_EXTENDED_ATTRIBUTES_DISABLE=1 COPYFILE_DISABLE=1 tar
TARFLAGS = cvf
ZIP = zip
ZIPFLAGS = -r
COMPRESS = gzip -9f
SUFFIX = .gz
SHAR = shar
PREOP = $(NOECHO) $(NOOP)
POSTOP = $(NOECHO) $(NOOP)
TO_UNIX = $(NOECHO) $(NOOP)
CI = ci -u
RCS_LABEL = rcs -Nv$(VERSION_SYM): -q
DIST_CP = best
DIST_DEFAULT = tardist
DISTNAME = Scalarm-SimulationManager
DISTVNAME = Scalarm-SimulationManager-0.01


# --- MakeMaker macro section:


# --- MakeMaker depend section:


# --- MakeMaker cflags section:


# --- MakeMaker const_loadlibs section:


# --- MakeMaker const_cccmd section:


# --- MakeMaker post_constants section:


# --- MakeMaker pasthru section:

PASTHRU = LIBPERL_A="$(LIBPERL_A)"\
	LINKTYPE="$(LINKTYPE)"\
	PREFIX="$(PREFIX)"\
	INSTALL_BASE="$(INSTALL_BASE)"


# --- MakeMaker special_targets section:
.SUFFIXES : .xs .c .C .cpp .i .s .cxx .cc $(OBJ_EXT)

.PHONY: all config static dynamic test linkext manifest blibdirs clean realclean disttest distdir



# --- MakeMaker c_o section:


# --- MakeMaker xs_c section:


# --- MakeMaker xs_o section:


# --- MakeMaker top_targets section:
all :: pure_all manifypods
	$(NOECHO) $(NOOP)


pure_all :: config pm_to_blib subdirs linkext
	$(NOECHO) $(NOOP)

subdirs :: $(MYEXTLIB)
	$(NOECHO) $(NOOP)

config :: $(FIRST_MAKEFILE) blibdirs
	$(NOECHO) $(NOOP)

help :
	perldoc ExtUtils::MakeMaker


# --- MakeMaker blibdirs section:
blibdirs : $(INST_LIBDIR)$(DFSEP).exists $(INST_ARCHLIB)$(DFSEP).exists $(INST_AUTODIR)$(DFSEP).exists $(INST_ARCHAUTODIR)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists $(INST_SCRIPT)$(DFSEP).exists $(INST_MAN1DIR)$(DFSEP).exists $(INST_MAN3DIR)$(DFSEP).exists
	$(NOECHO) $(NOOP)

# Backwards compat with 6.18 through 6.25
blibdirs.ts : blibdirs
	$(NOECHO) $(NOOP)

$(INST_LIBDIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_LIBDIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_LIBDIR)
	$(NOECHO) $(TOUCH) $(INST_LIBDIR)$(DFSEP).exists

$(INST_ARCHLIB)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHLIB)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_ARCHLIB)
	$(NOECHO) $(TOUCH) $(INST_ARCHLIB)$(DFSEP).exists

$(INST_AUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_AUTODIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_AUTODIR)
	$(NOECHO) $(TOUCH) $(INST_AUTODIR)$(DFSEP).exists

$(INST_ARCHAUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHAUTODIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_ARCHAUTODIR)
	$(NOECHO) $(TOUCH) $(INST_ARCHAUTODIR)$(DFSEP).exists

$(INST_BIN)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_BIN)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_BIN)
	$(NOECHO) $(TOUCH) $(INST_BIN)$(DFSEP).exists

$(INST_SCRIPT)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_SCRIPT)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_SCRIPT)
	$(NOECHO) $(TOUCH) $(INST_SCRIPT)$(DFSEP).exists

$(INST_MAN1DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN1DIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_MAN1DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN1DIR)$(DFSEP).exists

$(INST_MAN3DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN3DIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_MAN3DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN3DIR)$(DFSEP).exists



# --- MakeMaker linkext section:

linkext :: $(LINKTYPE)
	$(NOECHO) $(NOOP)


# --- MakeMaker dlsyms section:


# --- MakeMaker dynamic section:

dynamic :: $(FIRST_MAKEFILE) $(BOOTSTRAP) $(INST_DYNAMIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker dynamic_bs section:

BOOTSTRAP =


# --- MakeMaker dynamic_lib section:


# --- MakeMaker static section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make static"
static :: $(FIRST_MAKEFILE) $(INST_STATIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker static_lib section:


# --- MakeMaker manifypods section:

POD2MAN_EXE = $(PERLRUN) "-MExtUtils::Command::MM" -e pod2man "--"
POD2MAN = $(POD2MAN_EXE)


manifypods : pure_all  \
	lib/Mojo.pm \
	lib/Mojo/Asset.pm \
	lib/Mojo/Asset/File.pm \
	lib/Mojo/Asset/Memory.pm \
	lib/Mojo/Base.pm \
	lib/Mojo/ByteStream.pm \
	lib/Mojo/Cache.pm \
	lib/Mojo/Collection.pm \
	lib/Mojo/Content.pm \
	lib/Mojo/Content/MultiPart.pm \
	lib/Mojo/Content/Single.pm \
	lib/Mojo/Cookie.pm \
	lib/Mojo/Cookie/Request.pm \
	lib/Mojo/Cookie/Response.pm \
	lib/Mojo/DOM.pm \
	lib/Mojo/DOM/CSS.pm \
	lib/Mojo/DOM/HTML.pm \
	lib/Mojo/Date.pm \
	lib/Mojo/EventEmitter.pm \
	lib/Mojo/Exception.pm \
	lib/Mojo/Headers.pm \
	lib/Mojo/HelloWorld.pm \
	lib/Mojo/Home.pm \
	lib/Mojo/IOLoop.pm \
	lib/Mojo/IOLoop/Client.pm \
	lib/Mojo/IOLoop/Delay.pm \
	lib/Mojo/IOLoop/Server.pm \
	lib/Mojo/IOLoop/Stream.pm \
	lib/Mojo/JSON.pm \
	lib/Mojo/JSON/Pointer.pm \
	lib/Mojo/Loader.pm \
	lib/Mojo/Log.pm \
	lib/Mojo/Message.pm \
	lib/Mojo/Message/Request.pm \
	lib/Mojo/Message/Response.pm \
	lib/Mojo/Parameters.pm \
	lib/Mojo/Path.pm \
	lib/Mojo/Reactor.pm \
	lib/Mojo/Reactor/EV.pm \
	lib/Mojo/Reactor/Poll.pm \
	lib/Mojo/Server.pm \
	lib/Mojo/Server/CGI.pm \
	lib/Mojo/Server/Daemon.pm \
	lib/Mojo/Server/Hypnotoad.pm \
	lib/Mojo/Server/Morbo.pm \
	lib/Mojo/Server/PSGI.pm \
	lib/Mojo/Server/Prefork.pm \
	lib/Mojo/Template.pm \
	lib/Mojo/Transaction.pm \
	lib/Mojo/Transaction/HTTP.pm \
	lib/Mojo/Transaction/WebSocket.pm \
	lib/Mojo/URL.pm \
	lib/Mojo/Upload.pm \
	lib/Mojo/UserAgent.pm \
	lib/Mojo/UserAgent/CookieJar.pm \
	lib/Mojo/UserAgent/Proxy.pm \
	lib/Mojo/UserAgent/Server.pm \
	lib/Mojo/UserAgent/Transactor.pm \
	lib/Mojo/Util.pm
	$(NOECHO) $(POD2MAN) --section=3 --perm_rw=$(PERM_RW) \
	  lib/Mojo.pm $(INST_MAN3DIR)/Mojo.$(MAN3EXT) \
	  lib/Mojo/Asset.pm $(INST_MAN3DIR)/Mojo::Asset.$(MAN3EXT) \
	  lib/Mojo/Asset/File.pm $(INST_MAN3DIR)/Mojo::Asset::File.$(MAN3EXT) \
	  lib/Mojo/Asset/Memory.pm $(INST_MAN3DIR)/Mojo::Asset::Memory.$(MAN3EXT) \
	  lib/Mojo/Base.pm $(INST_MAN3DIR)/Mojo::Base.$(MAN3EXT) \
	  lib/Mojo/ByteStream.pm $(INST_MAN3DIR)/Mojo::ByteStream.$(MAN3EXT) \
	  lib/Mojo/Cache.pm $(INST_MAN3DIR)/Mojo::Cache.$(MAN3EXT) \
	  lib/Mojo/Collection.pm $(INST_MAN3DIR)/Mojo::Collection.$(MAN3EXT) \
	  lib/Mojo/Content.pm $(INST_MAN3DIR)/Mojo::Content.$(MAN3EXT) \
	  lib/Mojo/Content/MultiPart.pm $(INST_MAN3DIR)/Mojo::Content::MultiPart.$(MAN3EXT) \
	  lib/Mojo/Content/Single.pm $(INST_MAN3DIR)/Mojo::Content::Single.$(MAN3EXT) \
	  lib/Mojo/Cookie.pm $(INST_MAN3DIR)/Mojo::Cookie.$(MAN3EXT) \
	  lib/Mojo/Cookie/Request.pm $(INST_MAN3DIR)/Mojo::Cookie::Request.$(MAN3EXT) \
	  lib/Mojo/Cookie/Response.pm $(INST_MAN3DIR)/Mojo::Cookie::Response.$(MAN3EXT) \
	  lib/Mojo/DOM.pm $(INST_MAN3DIR)/Mojo::DOM.$(MAN3EXT) \
	  lib/Mojo/DOM/CSS.pm $(INST_MAN3DIR)/Mojo::DOM::CSS.$(MAN3EXT) \
	  lib/Mojo/DOM/HTML.pm $(INST_MAN3DIR)/Mojo::DOM::HTML.$(MAN3EXT) \
	  lib/Mojo/Date.pm $(INST_MAN3DIR)/Mojo::Date.$(MAN3EXT) \
	  lib/Mojo/EventEmitter.pm $(INST_MAN3DIR)/Mojo::EventEmitter.$(MAN3EXT) \
	  lib/Mojo/Exception.pm $(INST_MAN3DIR)/Mojo::Exception.$(MAN3EXT) \
	  lib/Mojo/Headers.pm $(INST_MAN3DIR)/Mojo::Headers.$(MAN3EXT) \
	  lib/Mojo/HelloWorld.pm $(INST_MAN3DIR)/Mojo::HelloWorld.$(MAN3EXT) \
	  lib/Mojo/Home.pm $(INST_MAN3DIR)/Mojo::Home.$(MAN3EXT) \
	  lib/Mojo/IOLoop.pm $(INST_MAN3DIR)/Mojo::IOLoop.$(MAN3EXT) \
	  lib/Mojo/IOLoop/Client.pm $(INST_MAN3DIR)/Mojo::IOLoop::Client.$(MAN3EXT) \
	  lib/Mojo/IOLoop/Delay.pm $(INST_MAN3DIR)/Mojo::IOLoop::Delay.$(MAN3EXT) \
	  lib/Mojo/IOLoop/Server.pm $(INST_MAN3DIR)/Mojo::IOLoop::Server.$(MAN3EXT) \
	  lib/Mojo/IOLoop/Stream.pm $(INST_MAN3DIR)/Mojo::IOLoop::Stream.$(MAN3EXT) \
	  lib/Mojo/JSON.pm $(INST_MAN3DIR)/Mojo::JSON.$(MAN3EXT) \
	  lib/Mojo/JSON/Pointer.pm $(INST_MAN3DIR)/Mojo::JSON::Pointer.$(MAN3EXT) \
	  lib/Mojo/Loader.pm $(INST_MAN3DIR)/Mojo::Loader.$(MAN3EXT) \
	  lib/Mojo/Log.pm $(INST_MAN3DIR)/Mojo::Log.$(MAN3EXT) \
	  lib/Mojo/Message.pm $(INST_MAN3DIR)/Mojo::Message.$(MAN3EXT) \
	  lib/Mojo/Message/Request.pm $(INST_MAN3DIR)/Mojo::Message::Request.$(MAN3EXT) \
	  lib/Mojo/Message/Response.pm $(INST_MAN3DIR)/Mojo::Message::Response.$(MAN3EXT) \
	  lib/Mojo/Parameters.pm $(INST_MAN3DIR)/Mojo::Parameters.$(MAN3EXT) \
	  lib/Mojo/Path.pm $(INST_MAN3DIR)/Mojo::Path.$(MAN3EXT) \
	  lib/Mojo/Reactor.pm $(INST_MAN3DIR)/Mojo::Reactor.$(MAN3EXT) \
	  lib/Mojo/Reactor/EV.pm $(INST_MAN3DIR)/Mojo::Reactor::EV.$(MAN3EXT) \
	  lib/Mojo/Reactor/Poll.pm $(INST_MAN3DIR)/Mojo::Reactor::Poll.$(MAN3EXT) \
	  lib/Mojo/Server.pm $(INST_MAN3DIR)/Mojo::Server.$(MAN3EXT) \
	  lib/Mojo/Server/CGI.pm $(INST_MAN3DIR)/Mojo::Server::CGI.$(MAN3EXT) \
	  lib/Mojo/Server/Daemon.pm $(INST_MAN3DIR)/Mojo::Server::Daemon.$(MAN3EXT) \
	  lib/Mojo/Server/Hypnotoad.pm $(INST_MAN3DIR)/Mojo::Server::Hypnotoad.$(MAN3EXT) \
	  lib/Mojo/Server/Morbo.pm $(INST_MAN3DIR)/Mojo::Server::Morbo.$(MAN3EXT) \
	  lib/Mojo/Server/PSGI.pm $(INST_MAN3DIR)/Mojo::Server::PSGI.$(MAN3EXT) \
	  lib/Mojo/Server/Prefork.pm $(INST_MAN3DIR)/Mojo::Server::Prefork.$(MAN3EXT) \
	  lib/Mojo/Template.pm $(INST_MAN3DIR)/Mojo::Template.$(MAN3EXT) \
	  lib/Mojo/Transaction.pm $(INST_MAN3DIR)/Mojo::Transaction.$(MAN3EXT) \
	  lib/Mojo/Transaction/HTTP.pm $(INST_MAN3DIR)/Mojo::Transaction::HTTP.$(MAN3EXT) \
	  lib/Mojo/Transaction/WebSocket.pm $(INST_MAN3DIR)/Mojo::Transaction::WebSocket.$(MAN3EXT) \
	  lib/Mojo/URL.pm $(INST_MAN3DIR)/Mojo::URL.$(MAN3EXT) \
	  lib/Mojo/Upload.pm $(INST_MAN3DIR)/Mojo::Upload.$(MAN3EXT) \
	  lib/Mojo/UserAgent.pm $(INST_MAN3DIR)/Mojo::UserAgent.$(MAN3EXT) \
	  lib/Mojo/UserAgent/CookieJar.pm $(INST_MAN3DIR)/Mojo::UserAgent::CookieJar.$(MAN3EXT) \
	  lib/Mojo/UserAgent/Proxy.pm $(INST_MAN3DIR)/Mojo::UserAgent::Proxy.$(MAN3EXT) \
	  lib/Mojo/UserAgent/Server.pm $(INST_MAN3DIR)/Mojo::UserAgent::Server.$(MAN3EXT) \
	  lib/Mojo/UserAgent/Transactor.pm $(INST_MAN3DIR)/Mojo::UserAgent::Transactor.$(MAN3EXT) \
	  lib/Mojo/Util.pm $(INST_MAN3DIR)/Mojo::Util.$(MAN3EXT) 




# --- MakeMaker processPL section:


# --- MakeMaker installbin section:


# --- MakeMaker subdirs section:

# none

# --- MakeMaker clean_subdirs section:
clean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean :: clean_subdirs
	- $(RM_F) \
	  $(BASEEXT).bso $(BASEEXT).def \
	  $(BASEEXT).exp $(BASEEXT).x \
	  $(BOOTSTRAP) $(INST_ARCHAUTODIR)/extralibs.all \
	  $(INST_ARCHAUTODIR)/extralibs.ld $(MAKE_APERL_FILE) \
	  *$(LIB_EXT) *$(OBJ_EXT) \
	  *perl.core MYMETA.json \
	  MYMETA.yml blibdirs.ts \
	  core core.*perl.*.? \
	  core.[0-9] core.[0-9][0-9] \
	  core.[0-9][0-9][0-9] core.[0-9][0-9][0-9][0-9] \
	  core.[0-9][0-9][0-9][0-9][0-9] lib$(BASEEXT).def \
	  mon.out perl \
	  perl$(EXE_EXT) perl.exe \
	  perlmain.c pm_to_blib \
	  pm_to_blib.ts so_locations \
	  tmon.out 
	- $(RM_RF) \
	  Scalarm-SimulationManager-* blib 
	  $(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	- $(MV) $(FIRST_MAKEFILE) $(MAKEFILE_OLD) $(DEV_NULL)


# --- MakeMaker realclean_subdirs section:
realclean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker realclean section:
# Delete temporary files (via clean) and also delete dist files
realclean purge ::  clean realclean_subdirs
	- $(RM_F) \
	  $(MAKEFILE_OLD) $(FIRST_MAKEFILE) 
	- $(RM_RF) \
	  $(DISTVNAME) 


# --- MakeMaker metafile section:
metafile : create_distdir
	$(NOECHO) $(ECHO) Generating META.yml
	$(NOECHO) $(ECHO) '---' > META_new.yml
	$(NOECHO) $(ECHO) 'abstract: unknown' >> META_new.yml
	$(NOECHO) $(ECHO) 'author:' >> META_new.yml
	$(NOECHO) $(ECHO) '  - '\''Michal Orzechowski <morzch@agh.edu.pl>'\''' >> META_new.yml
	$(NOECHO) $(ECHO) 'build_requires:' >> META_new.yml
	$(NOECHO) $(ECHO) '  File::Copy: 0' >> META_new.yml
	$(NOECHO) $(ECHO) '  File::Temp: 0' >> META_new.yml
	$(NOECHO) $(ECHO) '  Log::Log4perl: 0' >> META_new.yml
	$(NOECHO) $(ECHO) '  Test::MockObject: 0' >> META_new.yml
	$(NOECHO) $(ECHO) '  Test::More: 0' >> META_new.yml
	$(NOECHO) $(ECHO) 'configure_requires:' >> META_new.yml
	$(NOECHO) $(ECHO) '  ExtUtils::MakeMaker: 0' >> META_new.yml
	$(NOECHO) $(ECHO) 'dynamic_config: 1' >> META_new.yml
	$(NOECHO) $(ECHO) 'generated_by: '\''ExtUtils::MakeMaker version 6.82, CPAN::Meta::Converter version 2.132830'\''' >> META_new.yml
	$(NOECHO) $(ECHO) 'license: unknown' >> META_new.yml
	$(NOECHO) $(ECHO) 'meta-spec:' >> META_new.yml
	$(NOECHO) $(ECHO) '  url: http://module-build.sourceforge.net/META-spec-v1.4.html' >> META_new.yml
	$(NOECHO) $(ECHO) '  version: 1.4' >> META_new.yml
	$(NOECHO) $(ECHO) 'name: Scalarm-SimulationManager' >> META_new.yml
	$(NOECHO) $(ECHO) 'no_index:' >> META_new.yml
	$(NOECHO) $(ECHO) '  directory:' >> META_new.yml
	$(NOECHO) $(ECHO) '    - t' >> META_new.yml
	$(NOECHO) $(ECHO) '    - inc' >> META_new.yml
	$(NOECHO) $(ECHO) 'requires:' >> META_new.yml
	$(NOECHO) $(ECHO) '  perl: 5.006' >> META_new.yml
	$(NOECHO) $(ECHO) 'version: 0.01' >> META_new.yml
	-$(NOECHO) $(MV) META_new.yml $(DISTVNAME)/META.yml
	$(NOECHO) $(ECHO) Generating META.json
	$(NOECHO) $(ECHO) '{' > META_new.json
	$(NOECHO) $(ECHO) '   "abstract" : "unknown",' >> META_new.json
	$(NOECHO) $(ECHO) '   "author" : [' >> META_new.json
	$(NOECHO) $(ECHO) '      "Michal Orzechowski <morzch@agh.edu.pl>"' >> META_new.json
	$(NOECHO) $(ECHO) '   ],' >> META_new.json
	$(NOECHO) $(ECHO) '   "dynamic_config" : 1,' >> META_new.json
	$(NOECHO) $(ECHO) '   "generated_by" : "ExtUtils::MakeMaker version 6.82, CPAN::Meta::Converter version 2.132830",' >> META_new.json
	$(NOECHO) $(ECHO) '   "license" : [' >> META_new.json
	$(NOECHO) $(ECHO) '      "unknown"' >> META_new.json
	$(NOECHO) $(ECHO) '   ],' >> META_new.json
	$(NOECHO) $(ECHO) '   "meta-spec" : {' >> META_new.json
	$(NOECHO) $(ECHO) '      "url" : "http://search.cpan.org/perldoc?CPAN::Meta::Spec",' >> META_new.json
	$(NOECHO) $(ECHO) '      "version" : "2"' >> META_new.json
	$(NOECHO) $(ECHO) '   },' >> META_new.json
	$(NOECHO) $(ECHO) '   "name" : "Scalarm-SimulationManager",' >> META_new.json
	$(NOECHO) $(ECHO) '   "no_index" : {' >> META_new.json
	$(NOECHO) $(ECHO) '      "directory" : [' >> META_new.json
	$(NOECHO) $(ECHO) '         "t",' >> META_new.json
	$(NOECHO) $(ECHO) '         "inc"' >> META_new.json
	$(NOECHO) $(ECHO) '      ]' >> META_new.json
	$(NOECHO) $(ECHO) '   },' >> META_new.json
	$(NOECHO) $(ECHO) '   "prereqs" : {' >> META_new.json
	$(NOECHO) $(ECHO) '      "build" : {' >> META_new.json
	$(NOECHO) $(ECHO) '         "requires" : {' >> META_new.json
	$(NOECHO) $(ECHO) '            "File::Copy" : "0",' >> META_new.json
	$(NOECHO) $(ECHO) '            "File::Temp" : "0",' >> META_new.json
	$(NOECHO) $(ECHO) '            "Log::Log4perl" : "0",' >> META_new.json
	$(NOECHO) $(ECHO) '            "Test::MockObject" : "0",' >> META_new.json
	$(NOECHO) $(ECHO) '            "Test::More" : "0"' >> META_new.json
	$(NOECHO) $(ECHO) '         }' >> META_new.json
	$(NOECHO) $(ECHO) '      },' >> META_new.json
	$(NOECHO) $(ECHO) '      "configure" : {' >> META_new.json
	$(NOECHO) $(ECHO) '         "requires" : {' >> META_new.json
	$(NOECHO) $(ECHO) '            "ExtUtils::MakeMaker" : "0"' >> META_new.json
	$(NOECHO) $(ECHO) '         }' >> META_new.json
	$(NOECHO) $(ECHO) '      },' >> META_new.json
	$(NOECHO) $(ECHO) '      "runtime" : {' >> META_new.json
	$(NOECHO) $(ECHO) '         "requires" : {' >> META_new.json
	$(NOECHO) $(ECHO) '            "perl" : "5.006"' >> META_new.json
	$(NOECHO) $(ECHO) '         }' >> META_new.json
	$(NOECHO) $(ECHO) '      }' >> META_new.json
	$(NOECHO) $(ECHO) '   },' >> META_new.json
	$(NOECHO) $(ECHO) '   "release_status" : "stable",' >> META_new.json
	$(NOECHO) $(ECHO) '   "version" : "0.01"' >> META_new.json
	$(NOECHO) $(ECHO) '}' >> META_new.json
	-$(NOECHO) $(MV) META_new.json $(DISTVNAME)/META.json


# --- MakeMaker signature section:
signature :
	cpansign -s


# --- MakeMaker dist_basics section:
distclean :: realclean distcheck
	$(NOECHO) $(NOOP)

distcheck :
	$(PERLRUN) "-MExtUtils::Manifest=fullcheck" -e fullcheck

skipcheck :
	$(PERLRUN) "-MExtUtils::Manifest=skipcheck" -e skipcheck

manifest :
	$(PERLRUN) "-MExtUtils::Manifest=mkmanifest" -e mkmanifest

veryclean : realclean
	$(RM_F) *~ */*~ *.orig */*.orig *.bak */*.bak *.old */*.old



# --- MakeMaker dist_core section:

dist : $(DIST_DEFAULT) $(FIRST_MAKEFILE)
	$(NOECHO) $(ABSPERLRUN) -l -e 'print '\''Warning: Makefile possibly out of date with $(VERSION_FROM)'\''' \
	  -e '    if -e '\''$(VERSION_FROM)'\'' and -M '\''$(VERSION_FROM)'\'' < -M '\''$(FIRST_MAKEFILE)'\'';' --

tardist : $(DISTVNAME).tar$(SUFFIX)
	$(NOECHO) $(NOOP)

uutardist : $(DISTVNAME).tar$(SUFFIX)
	uuencode $(DISTVNAME).tar$(SUFFIX) $(DISTVNAME).tar$(SUFFIX) > $(DISTVNAME).tar$(SUFFIX)_uu
	$(NOECHO) $(ECHO) 'Created $(DISTVNAME).tar$(SUFFIX)_uu'

$(DISTVNAME).tar$(SUFFIX) : distdir
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(NOECHO) $(ECHO) 'Created $(DISTVNAME).tar$(SUFFIX)'
	$(POSTOP)

zipdist : $(DISTVNAME).zip
	$(NOECHO) $(NOOP)

$(DISTVNAME).zip : distdir
	$(PREOP)
	$(ZIP) $(ZIPFLAGS) $(DISTVNAME).zip $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(NOECHO) $(ECHO) 'Created $(DISTVNAME).zip'
	$(POSTOP)

shdist : distdir
	$(PREOP)
	$(SHAR) $(DISTVNAME) > $(DISTVNAME).shar
	$(RM_RF) $(DISTVNAME)
	$(NOECHO) $(ECHO) 'Created $(DISTVNAME).shar'
	$(POSTOP)


# --- MakeMaker distdir section:
create_distdir :
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
		-e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"

distdir : create_distdir distmeta 
	$(NOECHO) $(NOOP)



# --- MakeMaker dist_test section:
disttest : distdir
	cd $(DISTVNAME) && $(ABSPERLRUN) Makefile.PL 
	cd $(DISTVNAME) && $(MAKE) $(PASTHRU)
	cd $(DISTVNAME) && $(MAKE) test $(PASTHRU)



# --- MakeMaker dist_ci section:

ci :
	$(PERLRUN) "-MExtUtils::Manifest=maniread" \
	  -e "@all = keys %{ maniread() };" \
	  -e "print(qq{Executing $(CI) @all\n}); system(qq{$(CI) @all});" \
	  -e "print(qq{Executing $(RCS_LABEL) ...\n}); system(qq{$(RCS_LABEL) @all});"


# --- MakeMaker distmeta section:
distmeta : create_distdir metafile
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'exit unless -e q{META.yml};' \
	  -e 'eval { maniadd({q{META.yml} => q{Module YAML meta-data (added by MakeMaker)}}) }' \
	  -e '    or print "Could not add META.yml to MANIFEST: $$$${'\''@'\''}\n"' --
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'exit unless -f q{META.json};' \
	  -e 'eval { maniadd({q{META.json} => q{Module JSON meta-data (added by MakeMaker)}}) }' \
	  -e '    or print "Could not add META.json to MANIFEST: $$$${'\''@'\''}\n"' --



# --- MakeMaker distsignature section:
distsignature : create_distdir
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{SIGNATURE} => q{Public-key signature (added by MakeMaker)}}) }' \
	  -e '    or print "Could not add SIGNATURE to MANIFEST: $$$${'\''@'\''}\n"' --
	$(NOECHO) cd $(DISTVNAME) && $(TOUCH) SIGNATURE
	cd $(DISTVNAME) && cpansign -s



# --- MakeMaker install section:

install :: pure_install doc_install
	$(NOECHO) $(NOOP)

install_perl :: pure_perl_install doc_perl_install
	$(NOECHO) $(NOOP)

install_site :: pure_site_install doc_site_install
	$(NOECHO) $(NOOP)

install_vendor :: pure_vendor_install doc_vendor_install
	$(NOECHO) $(NOOP)

pure_install :: pure_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

doc_install :: doc_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

pure__install : pure_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

doc__install : doc_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

pure_perl_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read $(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLARCHLIB)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
		$(INST_BIN) $(DESTINSTALLBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(SITEARCHEXP)/auto/$(FULLEXT)


pure_site_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLSITEARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLSITELIB) \
		$(INST_ARCHLIB) $(DESTINSTALLSITEARCH) \
		$(INST_BIN) $(DESTINSTALLSITEBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSITESCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLSITEMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLSITEMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(PERL_ARCHLIB)/auto/$(FULLEXT)

pure_vendor_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read $(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLVENDORARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
		$(INST_SCRIPT) $(DESTINSTALLVENDORSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLVENDORMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)


doc_perl_install :: all
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLPRIVLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod

doc_site_install :: all
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLSITELIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod

doc_vendor_install :: all
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLVENDORLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod


uninstall :: uninstall_from_$(INSTALLDIRS)dirs
	$(NOECHO) $(NOOP)

uninstall_from_perldirs ::
	$(NOECHO) $(UNINSTALL) $(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist

uninstall_from_sitedirs ::
	$(NOECHO) $(UNINSTALL) $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist

uninstall_from_vendordirs ::
	$(NOECHO) $(UNINSTALL) $(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist


# --- MakeMaker force section:
# Phony target to force checking subdirectories.
FORCE :
	$(NOECHO) $(NOOP)


# --- MakeMaker perldepend section:


# --- MakeMaker makefile section:
# We take a very conservative approach here, but it's worth it.
# We move Makefile to Makefile.old here to avoid gnu make looping.
$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
	$(NOECHO) $(ECHO) "Cleaning current config before rebuilding Makefile..."
	-$(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	-$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
	- $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
	$(PERLRUN) Makefile.PL 
	$(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
	$(NOECHO) $(ECHO) "==> Please rerun the $(MAKE) command.  <=="
	$(FALSE)



# --- MakeMaker staticmake section:

# --- MakeMaker makeaperl section ---
MAP_TARGET    = perl
FULLPERL      = /usr/bin/perl

$(MAP_TARGET) :: static $(MAKE_APERL_FILE)
	$(MAKE) $(USEMAKEFILE) $(MAKE_APERL_FILE) $@

$(MAKE_APERL_FILE) : $(FIRST_MAKEFILE) pm_to_blib
	$(NOECHO) $(ECHO) Writing \"$(MAKE_APERL_FILE)\" for this $(MAP_TARGET)
	$(NOECHO) $(PERLRUNINST) \
		Makefile.PL DIR= \
		MAKEFILE=$(MAKE_APERL_FILE) LINKTYPE=static \
		MAKEAPERL=1 NORECURS=1 CCCDLFLAGS=


# --- MakeMaker test section:

TEST_VERBOSE=0
TEST_TYPE=test_$(LINKTYPE)
TEST_FILE = test.pl
TEST_FILES = t/*.t
TESTDB_SW = -d

testdb :: testdb_$(LINKTYPE)

test :: $(TEST_TYPE) subdirs-test

subdirs-test ::
	$(NOECHO) $(NOOP)


test_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) "-MExtUtils::Command::MM" "-MTest::Harness" "-e" "undef *Test::Harness::Switches; test_harness($(TEST_VERBOSE), '$(INST_LIB)', '$(INST_ARCHLIB)')" $(TEST_FILES)

testdb_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) $(TESTDB_SW) "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

test_ : test_dynamic

test_static :: test_dynamic
testdb_static :: testdb_dynamic


# --- MakeMaker ppd section:
# Creates a PPD (Perl Package Description) for a binary distribution.
ppd :
	$(NOECHO) $(ECHO) '<SOFTPKG NAME="$(DISTNAME)" VERSION="$(VERSION)">' > $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <ABSTRACT></ABSTRACT>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <AUTHOR>Michal Orzechowski &lt;morzch@agh.edu.pl&gt;</AUTHOR>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <PERLCORE VERSION="5,006,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <ARCHITECTURE NAME="darwin-thread-multi-2level-5.16" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <CODEBASE HREF="" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    </IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '</SOFTPKG>' >> $(DISTNAME).ppd


# --- MakeMaker pm_to_blib section:

pm_to_blib : $(FIRST_MAKEFILE) $(TO_INST_PM)
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/Mojo.pm blib/lib/Mojo.pm \
	  lib/Mojo/Asset.pm blib/lib/Mojo/Asset.pm \
	  lib/Mojo/Asset/File.pm blib/lib/Mojo/Asset/File.pm \
	  lib/Mojo/Asset/Memory.pm blib/lib/Mojo/Asset/Memory.pm \
	  lib/Mojo/Base.pm blib/lib/Mojo/Base.pm \
	  lib/Mojo/ByteStream.pm blib/lib/Mojo/ByteStream.pm \
	  lib/Mojo/Cache.pm blib/lib/Mojo/Cache.pm \
	  lib/Mojo/Collection.pm blib/lib/Mojo/Collection.pm \
	  lib/Mojo/Content.pm blib/lib/Mojo/Content.pm \
	  lib/Mojo/Content/MultiPart.pm blib/lib/Mojo/Content/MultiPart.pm \
	  lib/Mojo/Content/Single.pm blib/lib/Mojo/Content/Single.pm \
	  lib/Mojo/Cookie.pm blib/lib/Mojo/Cookie.pm \
	  lib/Mojo/Cookie/Request.pm blib/lib/Mojo/Cookie/Request.pm \
	  lib/Mojo/Cookie/Response.pm blib/lib/Mojo/Cookie/Response.pm \
	  lib/Mojo/DOM.pm blib/lib/Mojo/DOM.pm \
	  lib/Mojo/DOM/CSS.pm blib/lib/Mojo/DOM/CSS.pm \
	  lib/Mojo/DOM/HTML.pm blib/lib/Mojo/DOM/HTML.pm \
	  lib/Mojo/Date.pm blib/lib/Mojo/Date.pm \
	  lib/Mojo/EventEmitter.pm blib/lib/Mojo/EventEmitter.pm \
	  lib/Mojo/Exception.pm blib/lib/Mojo/Exception.pm \
	  lib/Mojo/Headers.pm blib/lib/Mojo/Headers.pm \
	  lib/Mojo/HelloWorld.pm blib/lib/Mojo/HelloWorld.pm \
	  lib/Mojo/Home.pm blib/lib/Mojo/Home.pm \
	  lib/Mojo/IOLoop.pm blib/lib/Mojo/IOLoop.pm \
	  lib/Mojo/IOLoop/Client.pm blib/lib/Mojo/IOLoop/Client.pm \
	  lib/Mojo/IOLoop/Delay.pm blib/lib/Mojo/IOLoop/Delay.pm \
	  lib/Mojo/IOLoop/Server.pm blib/lib/Mojo/IOLoop/Server.pm \
	  lib/Mojo/IOLoop/Stream.pm blib/lib/Mojo/IOLoop/Stream.pm \
	  lib/Mojo/IOLoop/server.crt blib/lib/Mojo/IOLoop/server.crt \
	  lib/Mojo/IOLoop/server.key blib/lib/Mojo/IOLoop/server.key \
	  lib/Mojo/JSON.pm blib/lib/Mojo/JSON.pm \
	  lib/Mojo/JSON/Pointer.pm blib/lib/Mojo/JSON/Pointer.pm \
	  lib/Mojo/Loader.pm blib/lib/Mojo/Loader.pm \
	  lib/Mojo/Log.pm blib/lib/Mojo/Log.pm \
	  lib/Mojo/Message.pm blib/lib/Mojo/Message.pm \
	  lib/Mojo/Message/Request.pm blib/lib/Mojo/Message/Request.pm \
	  lib/Mojo/Message/Response.pm blib/lib/Mojo/Message/Response.pm \
	  lib/Mojo/Parameters.pm blib/lib/Mojo/Parameters.pm \
	  lib/Mojo/Path.pm blib/lib/Mojo/Path.pm \
	  lib/Mojo/Reactor.pm blib/lib/Mojo/Reactor.pm \
	  lib/Mojo/Reactor/EV.pm blib/lib/Mojo/Reactor/EV.pm \
	  lib/Mojo/Reactor/Poll.pm blib/lib/Mojo/Reactor/Poll.pm \
	  lib/Mojo/Server.pm blib/lib/Mojo/Server.pm \
	  lib/Mojo/Server/CGI.pm blib/lib/Mojo/Server/CGI.pm \
	  lib/Mojo/Server/Daemon.pm blib/lib/Mojo/Server/Daemon.pm \
	  lib/Mojo/Server/Hypnotoad.pm blib/lib/Mojo/Server/Hypnotoad.pm \
	  lib/Mojo/Server/Morbo.pm blib/lib/Mojo/Server/Morbo.pm \
	  lib/Mojo/Server/PSGI.pm blib/lib/Mojo/Server/PSGI.pm \
	  lib/Mojo/Server/Prefork.pm blib/lib/Mojo/Server/Prefork.pm \
	  lib/Mojo/Template.pm blib/lib/Mojo/Template.pm \
	  lib/Mojo/Transaction.pm blib/lib/Mojo/Transaction.pm \
	  lib/Mojo/Transaction/HTTP.pm blib/lib/Mojo/Transaction/HTTP.pm \
	  lib/Mojo/Transaction/WebSocket.pm blib/lib/Mojo/Transaction/WebSocket.pm \
	  lib/Mojo/URL.pm blib/lib/Mojo/URL.pm \
	  lib/Mojo/Upload.pm blib/lib/Mojo/Upload.pm \
	  lib/Mojo/UserAgent.pm blib/lib/Mojo/UserAgent.pm \
	  lib/Mojo/UserAgent/CookieJar.pm blib/lib/Mojo/UserAgent/CookieJar.pm \
	  lib/Mojo/UserAgent/Proxy.pm blib/lib/Mojo/UserAgent/Proxy.pm \
	  lib/Mojo/UserAgent/Server.pm blib/lib/Mojo/UserAgent/Server.pm \
	  lib/Mojo/UserAgent/Transactor.pm blib/lib/Mojo/UserAgent/Transactor.pm \
	  lib/Mojo/Util.pm blib/lib/Mojo/Util.pm \
	  lib/Mojo/entities.txt blib/lib/Mojo/entities.txt \
	  lib/Scalarm/ExperimentManager.pm blib/lib/Scalarm/ExperimentManager.pm \
	  lib/Scalarm/InformationService.pm blib/lib/Scalarm/InformationService.pm \
	  lib/Scalarm/Simulation.pm blib/lib/Scalarm/Simulation.pm \
	  lib/Scalarm/SimulationManager.pm blib/lib/Scalarm/SimulationManager.pm \
	  lib/Scalarm/StorageManager.pm blib/lib/Scalarm/StorageManager.pm 
	$(NOECHO) $(TOUCH) pm_to_blib


# --- MakeMaker selfdocument section:


# --- MakeMaker postamble section:


# End.

# @(#)Cshrc 1.4 90/10/04 SMI

if ( $shell == "/bin/csh" ) then
   if ( -e /etc/csh.cshrc ) then
	source /etc/csh.cshrc
   endif
endif

#
#         
#################################################################
#
#         .cshrc file
#
#         initial setup file for both interactive and noninteractive
#         C-Shells
#
#################################################################


# add directories for local commands

set path = (. ~ $path /bin /usr/local/bin /usr/ucb /usr/bin /usr/etc /etc)
set path = ( $path /usr/openwin/bin/xview /usr/openwin/bin )
set path = ( $path /usr/local/java/bin)
set path = ( $path /usr/local/adm/bin)
set path = ( $path ~/command)

#         cd path

#set lcd = ( )  #  add parents of frequently used directories
#set cdpath = (.. ~ ~/bin ~/src $lcd)

#         set this for all shells

set noclobber
set ignoreeeof
set history = 30
set cdexpr = '.*/\(.*/.*\)$'

#         aliases for all shells

alias cd 'chdir \!*; set cdcwd=`expr "/$cwd" : "$cdexpr"`; set prompt="`hostname` [$cdcwd]% "'
cd 
alias lo            'exit'
alias cp            'cp -i'
alias mv            'mv -i'
alias rm            'rm -i'
alias pwd           'echo $cwd'
#alias del          'rm -i'
#umask 002

#         skip remaining setup if not an interactive shell

if ($?USER == 0 || $?prompt == 0) exit

#          settings  for interactive shells

set history=40
#set ignoreeof   disable ctrl-D exit function
set notify
set savehist=40
set time=100

#          commands for interactive shells

#date
#pwd

#         other aliases

#alias a            alias
#alias h            'history \!* | head -39 | more'
#alias u            unalias

#alias             clear
#alias list         cat
#alias lock          lockscreen
#alias m             more
#alias mroe          more
#alias type         more

#alias .             'echo $cwd'
#alias ..            'set dot=$cwd;cd ..'
#alias ,             'cd $dot '

alias dir          ls -lG
#alias b2u	   'piconv -f big5 -t utf-8'
#alias pdw           'echo $cwd'
#alias la            'ls -a'
#alias ll            'ls -la'
#alias ls           'ls -F'

#alias pd           dirs
#alias po           popd
#alias pp           pushd

#alias +w            'chmod go+w'
#alias -w            'chmod go-w'
#alias x             'chmod +x'

#alias j             'jobs -l'

#alias bye           logout
#alias ciao          logout
#alias adios         logout

#alias psg           'ps -ax | grep \!* | grep -v grep'
#alias punt          kill

#alias r            rlogin
#alias run          source

#alias nms 'tbl \!* | nroff -ms | more'                  # nroff -ms
#alias tms 'tbl \!* | troff -t -ms >! troff.output &'    # troff -ms
#alias tpr 'tbl \!* | troff -t -ms | lpr -t &'           # troff & print
#alias ppr 'lpr -t \!* &'                                # print troffed

#alias lp1           'lpr -P1'
#alias lq1           'lpq -P1'
#alias lr1           'lprm -P1'

#alias sd           'screendump | rastrepl | lpr -v &'

#alias edit         textedit

#alias help          man
#alias key           'man -k'
alias vi 	vim
#alias mkae          make
#
#-----------------------------------------------------------------------
# (C) COPYRIGHT International Business Machines Corp. 1993, 1996
# All Rights Reserved
# Licensed Materials - Property of IBM
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# NAME:     db2cshrc
#
# FUNCTION: This script sets up a default database environment for
#           C shell users.
#
# USAGE:    source db2cshrc
#           This script can either be invoked directly as above or
#           it can be added to the user's .cshrc file so that the
#           database environment is established during login.
#           A user may also copy this script into their directory
#           structure and customize it.
#-----------------------------------------------------------------------
# Default DB2 product directory
setenv DB2DIR /opt/IBMdb2/V2.1

#-----------------------------------------------------------------------
# DB2INSTANCE [Default null, values: Any valid instance name]
# Specifies the instance that is active by default.
#-----------------------------------------------------------------------
setenv DB2INSTANCE db2adm

setenv INSTHOME /home
#-----------------------------------------------------------------------
# Add the directories:
#   INSTHOME/sqllib/bin  - database executables
#   INSTHOME/sqllib/adm  - sysadm executables
#   INSTHOME/sqllib/misc - miscellaneous utilities
# to the user's PATH.
#-----------------------------------------------------------------------
if ("$path" !~ *${INSTHOME}/sqllib/bin*) set path=( $path ${INSTHOME}/sqllib/bin )
if ("$path" !~ *${INSTHOME}/sqllib/adm*) set path=( $path ${INSTHOME}/sqllib/adm )
if ("$path" !~ *${INSTHOME}/sqllib/misc*) set path=( $path ${INSTHOME}/sqllib/misc )

#-----------------------------------------------------------------------
# DB2DBDFT [Default= SAMPLE]
# is set to the database alias name of the database that will
# be implicitly connected to when applications are started.
#-----------------------------------------------------------------------
setenv DB2DBDFT SAMPLE

# Default locale name
setenv  DFLTLOCALE  en_US

#-----------------------------------------------------------------------
# BOOKSHELF [Default= ${DB2DIR}/doc/${DFLTLOCALE}]
# is set to the directory which contains the English DB2
# Information Presentation Facility (INF) formatted books.
#-----------------------------------------------------------------------
if ( $?BOOKSHELF ) then
  if ( "${BOOKSHELF}" !~ *${DB2DIR}/doc/${DFLTLOCALE}* ) then
     setenv BOOKSHELF "${BOOKSHELF}:${DB2DIR}/doc/${DFLTLOCALE}"
  endif
else
  setenv BOOKSHELF ${DB2DIR}/doc/${DFLTLOCALE}
endif

#-----------------------------------------------------------------------
# Set the DB2COMM environment variable.
# DB2COMM [Default= null, values: TCPIP APPC IPXSPX]
# Specifies which communication protocol(s) will be enabled
# at the server when the database manager is started.
# Any combination of TCPIP, APPC and IPXSPX separated by commas is valid.
# If this variable is undefined or is unset then no communication 
# protocols are started.
#-----------------------------------------------------------------------
# setenv DB2COMM ' '

#-----------------------------------------------------------------------
# DB2CHKPTR [Default= null (OFF), any value (ON)]
# Selectively turns pointer checking ON for debugging, 
# it should be left OFF for normal operation.
#-----------------------------------------------------------------------
# setenv DB2CHKPTR ' '

#-----------------------------------------------------------------------
# DB2LOADREC [Default= ]
# Specifies the "load copy location file"; it is used for load recovery.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# DB2ACCOUNT [Default= ]
# Distributed Database Connection Services (DDCS) accounting string.
#-----------------------------------------------------------------------
# setenv DB2ACCOUNT ' '


#-----------------------------------------------------------------------
# Command Line Processor Environment Variables.
# DB2BQTIME, DB2BQTRY, DB2RQTIME, DB2IQTIME are used to establish
# the relationship between the front end and back end processes of the
# Command Line Processor (CLP).
# It is recommended that you use the default values unless you
# experience problems in your specific environment; if you need to
# change these values, it is not advisable to set them to high.
#-----------------------------------------------------------------------
#-----------------------------------------------------------------------
# DB2BQTIME [Default= 1 second, Minimum value= 1 second]
# Specifies the amount of time the CLP frontend process will sleep 
# before checking if the backend process is active and establishing 
# a connection to it.
#-----------------------------------------------------------------------
# setenv DB2BQTIME 1

#-----------------------------------------------------------------------
# DB2BQTRY [Default= 60 retries, Minimum value= 0 retries]
# Specifies the number of times the CLP frontend process tries to
# determine whether the backend process is already active.
# It works in conjunction with DB2BQTIME.
#-----------------------------------------------------------------------
# setenv DB2BQTRY 60

#-----------------------------------------------------------------------
# DB2RQTIME [Default= 5 seconds, Minimum value= 1 second]
# Specifies the amount of time the CLP backend process waits for a 
# request from the frontend process.
#-----------------------------------------------------------------------
# setenv DB2RQTIME 5

#-----------------------------------------------------------------------
# DB2IQTIME [Default= 5 seconds, Minimum value= 1 second]
# Specifies the amount of time the CLP backend process waits on the
# input queue for the frontend process to pass commands.
#-----------------------------------------------------------------------
# setenv DB2IQTIME 5

#-----------------------------------------------------------------------
# DB2OPTIONS modifies default settings for the Command Line Processor.
# If DB2OPTIONS is not set or is set to NULL then the Command Line 
# Processor has the following default option settings:
#
# Option  Description                          Default Setting                  
# ------  -----------------------------------  ---------------                  
#   -a    Display SQLCA                        OFF                              
#   -c    Auto-commit                          ON                               
#   -e    Display SQLCODE/SQLSTATE             OFF                              
#   -f    Read from input file                 OFF                              
#   -l    Log commands in history file         OFF                              
#   -o    Display output                       ON                               
#   -p    Display db2 interactive prompt       ON                               
#   -r    Save output report to file           OFF                              
#   -s    Stop execution on command error      OFF                              
#   -t    Set statement termination character  OFF                              
#   -v    Echo current command                 OFF                              
#   -w    Display warning messages             OFF                              
#-----------------------------------------------------------------------
# setenv DB2OPTIONS '-a +c -l'  
 

#-----------------------------------------------------------------------
# DCE DIRECTORIES environment variables.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# DB2DIRPATHNAME [Default= ]
# Specifies a temporary override of the DIR_PATH_NAME parameter value 
# in the database manager configuration file.  If a directory server is 
# used and the target of a CONNECT statement or ATTACH command is not 
# explicitly cataloged, then the target is concatenated with 
# DB2DIRPATHNAME (if specified) to form the fully qualified DCE name.
# NOTE:  The DB2DIRPATHNAME value has no effect on the instance's global
# name which is always identified by the database manager configuration 
# parameters DIR_PATH_NAME and DIR_OBJ_NAME.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# DB2CLIENTCOMM [Default= ]
# Specifies a temporary override of the DFT_CLIENT_COMM parameter value
# in the database manager configuration file.  If both DFT_CLIENT_COMM
# and DB2CLIENTCOMM are not specified, then the first path found in the 
# object is used.  If either one or both of them are specified, then the 
# first and only path with a matching protocol will be used.  In either 
# case, no retry is attempted if the first connect fails.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# DB2ROUTE [Default= ]
# Specifies the name of the Routing Information Object the client uses
# when it connects to a database with a different database protocol.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# DB2INSTPATH [Default= ]
# Specifies the path of the home directory of the instance owner.
#-----------------------------------------------------------------------

 
#-----------------------------------------------------------------------
# ADSM Environment Variables.
# The three environment variables that are related to ADSM are:
# - DSMI_CONFIG
# - DSMI_DIR
# - DSMI_LOG
# See the IBM DATABASE2 Administration Guide for more information 
# about ADSM and these environment variables.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Setup Language Environment
#-----------------------------------------------------------------------
setenv LANG en_US.UTF-8
#setenv LC_CTYPE en_US
#setenv VISUAL /usr/bin/vi
setenv EDITOR /usr/bin/vi
#setenv CDIC_PATH /net/homeg/freedom/cdict
setenv CVSROOT /u/staff/ycchang/CVSHOME
setenv LC_CTYPE en_US.UTF-8 
set autologout
set dspmbyte=big5
unsetenv LD_LIBRARY_PATH

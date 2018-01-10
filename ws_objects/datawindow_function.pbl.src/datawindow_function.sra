$PBExportHeader$datawindow_function.sra
$PBExportComments$Generated Application Object
forward
global type datawindow_function from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
String gs_pb,gs_js
w_inh320w01_commandbutton gw_inh320w01_commandbutton

//BEGIN_GLOBALVAR
string  gs_COTEnvironment
integer gi_COTVersion = 0
boolean gb_COTAutoRun = false
boolean gb_COTDBConnected = true
boolean gb_COTSaveResult = false
boolean gb_COTUpdateExpValue = false
window  gw_COTCurrentWin
Transaction gtr_COTDB
string  gs_WinName[] = {"w_inh320w01_commandbutton"}
//END_GLOBALVAR

String gs_call

//window  gw_COTCurrentWin
//Transaction gtr_COTDB
//string  gs_WinName[] = {"w_inh501w01_callancestor"}
//END_GLOBALVAR
end variables
global type datawindow_function from application
string appname = "datawindow_function"
end type
global datawindow_function datawindow_function

type prototypes
FUNCTION ulong LoadImage(long hInst,string lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageB;Ansi"
end prototypes

on datawindow_function.create
appname="datawindow_function"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on datawindow_function.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile sqlserver77
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=LocalServer;UID=sa;PWD='"
//
//
// Profile sql
SQLCA.DBMS = "OLE DB"
SQLCA.LogPass = "admin"
SQLCA.LogId = "sa"
SQLCA.AutoCommit = False
SQLCA.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='192.0.1.102',PROVIDERSTRING='database=en_sql2000'"

//// Profile AppeonSample
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql'"

// Profile oracle
//SQLCA.DBMS = "JDBC"
//SQLCA.LogPass = "ora_test"
//SQLCA.LogId = "ora_test"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "Driver='oracle.jdbc.driver.OracleDriver',URL='jdbc:oracle:thin:@192.0.0.51:1521:testing'"
////
// Profile oracle9izl
//SQLCA.DBMS = "O90 Oracle9i (9.0.1)"
//SQLCA.LogPass = "ora_test"
//SQLCA.ServerName = "ora51.dev.appeon.net"
//SQLCA.LogId = "ora_test"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = ""

// Profile odbc_ora
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=ora51;UID=ora_test;PWD=ora_test'"

// Profile sqlserver_jdbc
// Profile sqlserverdirect
//SQLCA.DBMS = "MSS Microsoft SQL Server 6.x"
//SQLCA.Database = "en_sql2000"
//SQLCA.LogPass = "en_sql2000"
//SQLCA.ServerName = "192.0.0.40"
//SQLCA.LogId = "en_sql2000"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = ""

// Profile AppeonTestCase_ASE
//SQLCA.DBMS = "SYC Adaptive Server Enterprise"
//SQLCA.Database = "test"
//SQLCA.LogPass = "tester"
//SQLCA.ServerName = "AppeonTestCase_ASE"
//SQLCA.LogId = "tester"
//SQLCA.AutoCommit = True
//SQLCA.DBParm = "Release='12.5'"
// Profile 77appeontestcase
//SQLCA.DBMS = "JDBC"
//SQLCA.LogId = "sa"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "Driver='com.microsoft.jdbc.sqlserver.SQLServerDriver',URL='jdbc:microsoft:sqlserver://192.0.0.77:1433;DatabaseName=appeontestcase;SelectMethod=cursor',JavaVM='Sun1.3'"
// Profile ibmdb2
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=ibmdb2;UID=DB2ADMIN;PWD=admin',PBCatalogOwner='APPEON'"
//SQLCA.DBMS = "JDBC"
//SQLCA.LogPass = 'ADMIN'
//SQLCA.LogId = "db2admin"
//SQLCA.AutoCommit = True
//SQLCA.DBParm = "Driver='COM.ibm.db2.jdbc.net.DB2Driver',URL='jdbc:db2://172.17.1.17:6789/DWCTRLDB',JavaVM='Sun1.3',PBCatalogOwner='DB2ADMIN',CacheName='db2_117'"
// Profile 159EET
//SQLCA.DBMS = "O90 Oracle9i (9.0.1)"
//SQLCA.LogPass = 'yyq'
//SQLCA.ServerName = "eet159"
//SQLCA.LogId = "YYQETT"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "PBCatalogOwner='YYQETT'"

connect;
//open(w_querymode)
if sqlca.sqlcode<>0 then 
	messagebox("Error",'Database connect failed!')
end if

open(w_mdi)
OpenSheet(w_grid,w_mdi,1,Layered!)
//OpenSheet(w_syntaxfromsql,w_mdi,1,Layered!)

//opensheet(w_response,w_mdi)
end event

event close;disconnect;
end event


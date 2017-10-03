####################################################################
# Salesforce deployment commands
#################################################################### 

----------------------------------------------
Salesforce Version Deployment
----------------------------------------------
Important! Important! Important! Important!  
This current Deploy package is Build against:  
Salesforce Version 36  
  
If you decide to updgade the Version Please update: 
  
1.) Your Salesforce Eclipse Pluggin Instance with one of the following links  
http://media.developerforce.com/force-ide/eclipse42  
http://www.adnsandbox.com/tools/ide/install/  
http://www.adnsandbox.com/tools/ide/install/features/  
http://www.adnsandbox.com/tools/ide/install/plugins/  
    
2.) [Deployment Package]\build.properties  
    Update Version in the text file.  
	sf.version=36.0  
	
3.) [Deployment Package]\sflibrary\jars
    Update ant jar with download. 	

4.) [Deployment Package]\sflibrary\helperfiles\backuppackage.xml  
	Get new version of your total backup file from Eclipse and save it as a backup in this location.  

  
----------------------   
Possible Commands:
----------------------  
- listMetadata: Create report from instance of current Metadata.  
  [Parameters:sf.env,sf.username,sf.password,sf.retrieveMetadataType]  
    
- folderListMetadata: Create report from instance of current Metadata.  
  [Parameters:sf.env,sf.username,sf.password,sf.retrieveMetadataType,sf.listfolder]  
        
- describeMetadata: Create report from instance of current Metadata.  
  [Parameters:sf.env,sf.username,sf.password]  
  
- buildSDFCMeta: Create SDFCMetadata from environment describe call  
  [Parameters:sf.env,sf.username,sf.password]  
   
- buildPackageXML: Create packageXML from SDFC Metadata  
  [Parameters:sf.env,sf.username,sf.password]  
     
- retrieveCode: Create a copy of code from environment based on package.xml.    
  [Parameters:sf.env,sf.username,sf.password]  
  
- retrieveBackup: Backup the destination instance .  
  [Parameters:sf.env,sf.username,sf.password]  
  
- retrieveBulk: Create a copy of code from environment component request.  
  [Parameters:sf.env,sf.username,sf.password,sf.retrieveMetadataType]  
    
- retrievePkgs: Create a copy of code from environment package request.  
  [Parameters:sf.env,sf.username,sf.password]  
   
- deployCodeCheck: Deploy check will attempt to compile all the packaged  
  code in the destination instance but will not save any of the content. 
  [Parameters:sf.env,sf.username,sf.password,sf.deployName]  
   
- deployCodeTestCheck:  This deploy check will attempt to compile all the   
  packaged code in the destination instance and run all test.   
  [Parameters:sf.env,sf.username,sf.password,sf.deployName]  
    
- deployCodeTestPartialCheck: This deploy check will attempt to compile all   
  the packaged code in the destination instance and run specified test.   
  [Parameters:sf.env,sf.username,sf.password,sf.test,sf.deployName]  
    
- deployCode: This will deploy all the package code into the destination instance   
  and will override content as long as it compiles. If one component fails the   
  entire transaction will fail.  
  [Parameters:sf.env,sf.username,sf.password,sf.deployName]  
    
- compareZip: Compare two zip files and generate report. 
  [Parameters:sf.zip1,sf.zip2]  
    
- compareEnv: Compare two SF env and generate a report and difference package.  
  [Parameters:sf.envSRC,sf.usernameSRC,sf.passwordSRC,sf.envDST,sf.usernameDST,sf.passwordDST]  
  
- buildClean: Creates clean Build structure. cleans all directories. 
    
- help: Get Help content for SF deployment build.  
  
----------------------  
Syntax:  
----------------------  
ANT  -Dsf.env=<value> -Dsf.username=<value> -Dsf.password=<value>  <TARGET>  <OTHER OPTIONAL/REQUIRED VALUES>  

----------------------  
Example commands:  
----------------------  
  
ant -Dsf.env="PROD" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" -Dsf.retrieveMetadataType="Report" listMetadata  
 
ant -Dsf.env="SANDBOX" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" describeMetadata
 
ant -Dsf.env="PROD" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" buildPackageXML
  
ant -Dsf.env="PROD" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" retrieveCode
  
ant -Dsf.env="PROD" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" retrieveBackup
  
ant -Dsf.env="PROD" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" -Dsf.deployName="samplepkg" deployCode  
  
ant -Dsf.env="PROD" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" -Dsf.deployName="samplepkg.zip" deployCodeCheck  
  
ant -Dsf.env="PROD" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" -Dsf.deployName="samplepkg" deployCodeTestCheck
  
ant -Dsf.env="PROD" -Dsf.username="test@email.com" -Dsf.password="PASSWORDtoken" -Dsf.test="OpportunityWorkflowTestSuite" -Dsf.deployName="samplepkg"  deployCodeTestPartialCheck  
 
ant compareZip -Dsf.zip1="previous.zip" -Dsf.zip2="original.zip"
 
ant -Dsf.envSRC="SANDBOX" -Dsf.usernameSRC="test@email.com" -Dsf.passwordSRC="PASSWORDtoken" -Dsf.envDST="PROD" -Dsf.usernameDST="test@email.com" -Dsf.passwordDST="PASSWORDtoken" compareEnv
  

----------------------
Sample Build Structure
----------------------
  
[01]\sf_ant\  
[02].............\copdepkg\  
[03].............\compare  
[04].............\listRequest\  
[05].........................\buildpackageXML  
[06].........................\buildSDFCMeta\  
[05].........................\describeMetadata\  
[07].........................\listMetadata  
[08].............\retrieveBulkRequest\  
[09].............\retrieveUnpackagedBackupRequest\  
[10].............\retrieveUnpackagedRequest\  
[11].......................................\package.xml  
[12].............\build.properties  
[13].............\build.xml  
[14].............\sflibrary  
  

Details:  
[01] parent directory where all ant task should be run from  
[02] copdepkg. where deployment package.xml and folders(s) should be dropped for deployment  
[03] Compare working directory  
[04] Parent direct or list request results  
[09] Parent directory for backup request.   
[10] Parent Directory for code retrieve request. Place package.xml of all file you would like to receive.  
[12] properties required to built  
[13] developed ant target tasks.  
[14] Library of all Salesforce related ant JARs. DO NOT REMOVE THIS FOLDER  
 



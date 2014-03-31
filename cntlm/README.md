CNTLM
======

Download the latest version from http://sourceforge.net/projects/cntlm/files/ and unzip it.
Edit the file cntlm.ini and set the Username and Domain, comment out the password:
	
	Username t0123456
	Domain  THCALJ
	#Password password

Set the Proxy address:
	
	Proxy  host:port

Add all addresses from the domain to the NoProxy list:
	
	NoProxy  localhost, 127.0.0.*, 10.*, 192.168.*, *.corp

Save the cntml.ini file and execute the following command on the prompt which should ask for your password: 
	
	cntlm.exe -c cntlm.ini -H -M http://doesnotexists 

The output should be something like this, which you need to paste and copy in the file cntlm.ini (Auth and PassNTLMv2 lines only):
	
	Config profile  1/4... OK (HTTP code: 403)
	----------------------------[ Profile  0 ]------
	Auth            NTLMv2
	PassNTLMv2      C7018C99941AAAAAAAAAA0A5F9A3AFB5
	------------------------------------------------

Then start cntlm with the following command:
	
	cntlm -c cntlm.ini


Add the following ebvironment variables (some applications check for these values):
	
	HTTP_PROXY: http://localhost:3128
	HTTPS_PROXY: http://localhost:3128


pushd eclipse-4.3.1

set PROXY_LINE=-Dhttp.proxyHost=localhost -Dhttp.proxyPort=3128 -Dhttps.proxyHost=localhost -Dhttps.proxyPort=3128

md D:\dev\mirrors\%DATE%

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://dist.springsource.com/release/TOOLS/gradle -destination file:///D:/dev/mirrors/%DATE%/sts-gradle -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://dist.springsource.com/release/TOOLS/gradle -destination file:///D:/dev/mirrors/%DATE%/sts-gradle -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source https://raw.github.com/jeeeyul/eclipse-themes/master/net.jeeeyul.eclipse.themes.updatesite -destination file:///D:/dev/mirrors/%DATE%/jeeeyul -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source https://raw.github.com/jeeeyul/eclipse-themes/master/net.jeeeyul.eclipse.themes.updatesite -destination file:///D:/dev/mirrors/%DATE%/jeeeyul -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source https://dl-ssl.google.com/android/eclipse/ -destination file:///D:/dev/mirrors/%DATE%/adt -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source https://dl-ssl.google.com/android/eclipse/ -destination file:///D:/dev/mirrors/%DATE%/adt -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://subclipse.tigris.org/update_1.10.x -destination file:///D:/dev/mirrors/%DATE%/subclipse -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://subclipse.tigris.org/update_1.10.x -destination file:///D:/dev/mirrors/%DATE%/subclipse -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://beust.com/eclipse -destination file:///D:/dev/mirrors/%DATE%/testng -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://beust.com/eclipse -destination file:///D:/dev/mirrors/%DATE%/testng -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://chromedevtools.googlecode.com/svn/update/dev/ -destination file:///D:/dev/mirrors/%DATE%/chromedevtools -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://chromedevtools.googlecode.com/svn/update/dev/ -destination file:///D:/dev/mirrors/%DATE%/chromedevtools -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://dist.springsource.org/release/GRECLIPSE/e4.3/ -destination file:///D:/dev/mirrors/%DATE%/greclipse -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://dist.springsource.org/release/GRECLIPSE/e4.3/ -destination file:///D:/dev/mirrors/%DATE%/greclipse -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://download.eclipse.org/technology/m2e/releases -destination file:///D:/dev/mirrors/%DATE%/m2e -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://download.eclipse.org/technology/m2e/releases -destination file:///D:/dev/mirrors/%DATE%/m2e -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://andrei.gmxhome.de/eclipse/ -destination file:///D:/dev/mirrors/%DATE%/gmxhome -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://andrei.gmxhome.de/eclipse/ -destination file:///D:/dev/mirrors/%DATE%/gmxhome -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://basti1302.github.com/startexplorer/update/ -destination file:///D:/dev/mirrors/%DATE%/startex -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://basti1302.github.com/startexplorer/update/ -destination file:///D:/dev/mirrors/%DATE%/startex -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://eclipserunnerplugin.googlecode.com/svn/trunk/EclipseRunnerSite -destination file:///D:/dev/mirrors/%DATE%/eclipserunner -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://eclipserunnerplugin.googlecode.com/svn/trunk/EclipseRunnerSite -destination file:///D:/dev/mirrors/%DATE%/eclipserunner -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://eclipse-xpath-evaluation-plugin.googlecode.com/svn/trunk/eclipse-xpath-evaluation-plugin-update-site/ -destination file:///D:/dev/mirrors/%DATE%/xpath -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://eclipse-xpath-evaluation-plugin.googlecode.com/svn/trunk/eclipse-xpath-evaluation-plugin-update-site/ -destination file:///D:/dev/mirrors/%DATE%/xpath -references false

eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source http://www.normalesup.org/~simonet/soft/ow/update/ -destination file:///D:/dev/mirrors/%DATE%/less -references false
eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source http://www.normalesup.org/~simonet/soft/ow/update/ -destination file:///D:/dev/mirrors/%DATE%/less -references false

REM NOT WORKINBG eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication -source https://github.com/missedone/navigatorext/tree/master/site -destination file:///D:/dev/mirrors/%DATE%/navigator -references false
REM NOT WORKINBG eclipsec.exe %PROXY_LINE% -nosplash -verbose -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication -source https://github.com/missedone/navigatorext/tree/master/site -destination file:///D:/dev/mirrors/%DATE%/navigator -references false


popd

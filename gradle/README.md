Gradle
======

#### Loading common config from a repository: 

project build.gradle:
	buildscript { 
		// Define the repository where CommonConfig will be found
		repositories {
			mavenLocal()
		}

		def dep = project.dependencies.create('org.test:CommonConfig:1.0.0')
		def conf = buildscript.configurations.detachedConfiguration(dep)
		conf.setTransitive(false)
		
		conf.resolve().each {
			apply from: new URL("jar:${it.toURI()}!/repositories.gradle").toURI()
			apply from: new URL("jar:${it.toURI()}!/buildscriptDependencies.gradle").toURI()
		}
		
		dependencies {
			classpath(dep)
		}
	}

	apply from: project.buildscript.classLoader.getResource('sharedConfig.gradle').toURI()


repositories.gradle:
	project.buildscript.repositories.clear()

	project.buildscript {
		repositories {
			maven {
				name 'GlobalRepositoryReleases'
				url project.properties.repoPath + "/Releases"
			}
			maven {
				name 'GlobalRepository3rdParty'
				url project.properties.repoPath + "/3rdParty"
			}
			mavenCentral()
			mavenLocal()
		}
	}

buildscriptDependencies.gradle:
	project.buildscript {
		dependencies {
			classpath 'com.android.tools.build:gradle:0.11.1',
					'com.github.dcendents:android-maven-plugin:1.0'
		}
	}

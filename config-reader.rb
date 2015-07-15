require 'json'

class ConfigReader

@@configContent = ""

	def readConfig
		configFileContent = File.read(File.dirname(File.realpath(__FILE__)) + '/config.json')
		@@configContent = JSON.parse(configFileContent)
	end

	def getConfig
		return @@configContent
	end

end
class ConfigReader

@@configContent = ""

	def getItems
		@@configContent = File.read(File.dirname(File.realpath(__FILE__)) + '/main.config')
		puts @@configContent
	end

end
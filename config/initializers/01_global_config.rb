#Check we have generated a gonfig record
if GlobalConfig.all.count != 0
	GlobalConfig.first.update_global_config
else
	GlobalConfig.create
end
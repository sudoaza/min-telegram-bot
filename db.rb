
Dir["./models/*.rb"].each {|file| require file }

DataMapper.finalize
DataMapper.auto_upgrade!

# Helpers copied from Padrino

module Utils
  ##
  # Returns a Hash with keys turned into symbols.
  #
  def self.symbolize_keys(hash)
    result = hash.class.new
    hash.each_key do |key|
      result[(key.to_sym rescue key)] = hash[key]
    end
    result
  end
end

module SqlHelpers
  def self.create_db(adapter, user, password, host, database, charset, collation)
    case adapter
      when 'postgres'
        environment = {}
        environment['PGPASSWORD'] = password unless password.nil? || password.empty?

        arguments = []
        arguments << "--encoding=#{charset}" if charset
        arguments << "--host=#{host}" if host
        arguments << "--username=#{user}" if user
        arguments << database

        Process.wait Process.spawn(environment, 'createdb', *arguments)
      when 'sqlite', 'sqlite3'
        fail "Database #{database} already exists" if File.file?(database)
        FileUtils.mkdir_p(File.dirname(database))
        File.open(database, 'a') {}
      else
        raise "Adapter #{adapter} not supported for creating databases yet."
    end
  end

  def self.drop_db(adapter, user, password, host, database)
    case adapter
      when 'postgres'
        environment = {}
        environment['PGPASSWORD'] = password unless password.nil? || password.empty?

        arguments = []
        arguments << "--host=#{host}" if host
        arguments << "--username=#{user}" if user
        arguments << database

        Process.wait Process.spawn(environment, 'dropdb', *arguments)
      when 'sqlite', 'sqlite3'
        File.delete(database) if File.file?(database)
      else
        raise "Adapter #{adapter} not supported for dropping databases yet."
    end
  end
end

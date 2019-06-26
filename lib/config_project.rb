class ConfigProject
  def initialize(project_name)
    @config = YAML.load_file("./config/projects/#{project_name}.yml")
    define_attributes(@config.keys)
  end

  def migrations?
    !(@config['migrations'] == false)
  end

  def assets?
    !(@config['assets'] == false)
  end

  private

  def define_attributes(keys)
    keys.each do |key|
      self.class.send(:attr_reader, key)
      instance_variable_set("@#{key}", @config[key])
    end
  end
end

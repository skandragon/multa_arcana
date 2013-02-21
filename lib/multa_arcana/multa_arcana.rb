class MultaArcana
  DEFAULT_SECRET_FILE = 'secrets.yml'
  @@secrets = nil

  def self.secret_for(tag, fname = nil)
    load_file(fname)
    @@secrets[tag.to_s]
  end

  private

  def self.load_file(fname)
    @@secret_file ||= fname
    @@secret_file ||= DEFAULT_SECRET_FILE
    @@secrets ||= YAML::load(File.read(@@secret_file))
  end
end

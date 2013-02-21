class MultaArcana
  DEFAULT_SECRET_FILE = 'secrets.yml'
  @@secrets = nil
  @@secret_file = nil

  def self.secret_for(tag, fname = nil)
    load_file(fname)
    @@secrets[tag.to_s]
  end

  private

  def self.secret_file(fname = nil)
    return @@secret_file if @@secret_file

    @@secret_file ||= fname
    unless @@secret_file
      if defined?Rails
        Rails.root.join('config', fname || DEFAULT_SECRET_FILE)
      else
        @@secret_file ||= DEFAULT_SECRET_FILE
      end
    end
    @@secret_file
  end

  def self.load_file(fname = nil)
    @@secrets ||= YAML::load(File.read(secret_file(fname)))
  end
end

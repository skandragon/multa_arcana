class MultaArcana
  DEFAULT_SECRET_FILE = 'secrets.yml'
  @@secrets = nil
  @@secret_file = nil

  #
  # Load secrets from the default file (+secrets.yml+, or +config/secrets.yml+
  # for a Rails application) or from the file specified.  The file is sticky;
  # the first call to +secret_for+ sets the file in use, and afterwards all
  # following secret_for calls use the data from a cache.
  #
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
        @@secret_file = Rails.root.join('config', fname || DEFAULT_SECRET_FILE)
      else
        @@secret_file = DEFAULT_SECRET_FILE
      end
    end
    @@secret_file
  end

  def self.load_file(fname = nil)
    @@secrets ||= YAML::load(File.read(secret_file(fname)))
  end
end

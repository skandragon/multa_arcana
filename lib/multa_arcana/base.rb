class MultaArcana
  @@password_file = "secrets.yml"
  @@secrets = {}

  def self.secret_for(tag)
    load_file
    @@secrets[tag.to_s]
  end

  private

  def self.load_file
    @@secrets = { 'foo' => 'BarSecret' }
  end
end

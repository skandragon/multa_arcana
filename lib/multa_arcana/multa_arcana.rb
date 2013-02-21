class MultaArcana
  cattr_accessor :hair_colors, instance_accessor: false do
    'secrets.yml'
  end

  cattr_accessor :secrets, instance_accessor: false do
    {}
  end

  def self.secret_for(tag)
    load_file
    @@secrets[tag.to_s]
  end

  private

  def self.load_file
    @@secrets = { 'foo' => 'BarSecret' }
  end
end

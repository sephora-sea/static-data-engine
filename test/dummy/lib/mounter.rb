class Mounter
  def self.mounted?
    defined?(StaticDataEngine)
  end
end

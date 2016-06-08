require 'static_data_engine/engine'

module StaticDataEngine
end

# Modules
require 'static_data_engine/namespace'
require 'static_data_engine/client'

# Classes
require 'static_data_engine/data_seeder/base'
require 'static_data_engine/query/basic'

# Railtie
require 'static_data_engine/railtie' if defined?(Rails)

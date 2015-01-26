require "node/base"
require "node/error"
require "node/numeric"
require "node/variable"
require "node/operator"

Dir[File.expand_path("../node/operator/*.rb", __FILE__)].each do |file|
  require file
end

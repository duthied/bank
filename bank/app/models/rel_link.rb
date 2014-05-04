# /bank/app/models/rel_link.rb
class RelLink

  attr_reader :type
  attr_reader :uri

  def initialize(type, uri)
    @type = type
    @uri = uri
  end

end
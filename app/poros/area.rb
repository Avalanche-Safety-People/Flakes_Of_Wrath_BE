class Area
 attr_reader :name,
             :url,
             :state,
             :zone_id

 def initialize(data)
  @name = data[:name]
  @url = data[:url]
  @state = data[:state]
  @zone_id = data[:zone_id]
 end
end
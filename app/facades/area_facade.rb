class AreaFacade
 def self.area_details
  area_data = AreaService.areas
  area_data.map do |data|
   Area.new(data)
  end
 end
end
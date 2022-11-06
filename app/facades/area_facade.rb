class AreaFacade
  def self.area_details
    area_data = AreaService.areas
    area_data.map do |data|
      Area.new(data)
    end
  end

  def self.single_area(zone_id)
    all_area_data = AreaService.areas
    selected_area = all_area_data.select { |area| area[:id] == zone_id.to_i }
    Area.new(selected_area.first)
  end
end
class AreaFacade
  def self.area_details
    area_data = AreaService.areas
    area_data.map do |data|
      Area.new(data)
    end
  end

  def self.single_area(area_id)
    area_data = AreaService.areas
    area_data.select do |area|
      area[:id] == area_id
    end
  end
end

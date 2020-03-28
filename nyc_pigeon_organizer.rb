def nyc_pigeon_organizer(data)
  uniq_pigeons = {}
  #creates list of names with duplicates
  pigeon_names = data[:color].reduce([]) { |memo, (key, value)| memo << value ; memo }
  #flattens array, removes duplicates,
  ##adds names as keys to uniq_pigeons
  pigeon_names.flatten.uniq!.map { |name| uniq_pigeons[name] = {} }
  #uniq_pigeons now has :name => {} pairs

  #adds data categories to uniq_pigeons, makes new variable
  pigeons_and_data = uniq_pigeons.each_value do |value|
    data.each_key { |category| value[category] = [] }
  end

  #adds colors
  pigeons_and_data.each_key do |name|
        data[:color].each_pair do |type, pigeons|
            if pigeons.include?(name)
                pigeons_and_data[name][:color] << type.to_s
            end
        end
  end
  
  pigeons_and_data
end

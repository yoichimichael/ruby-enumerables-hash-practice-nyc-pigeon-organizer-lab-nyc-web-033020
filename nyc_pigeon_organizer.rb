def nyc_pigeon_organizer(data)
  uniq_pigeons = {}

  #creates AoA of names with duplicates
  pigeon_names = data[:color].reduce([]) { |memo, (key, value)| memo << value ; memo }

  #flattens array, removes duplicates,
  ##adds names as keys to uniq_pigeons
  pigeon_names.flatten.uniq!.map { |name| uniq_pigeons[name] = {} }
  #uniq_pigeons now has :name => {} pairs

  #adds data categories to uniq_pigeons
  uniq_pigeons.each_value do |value|
        data.each_key { |category| value[category] = [] }
  end

  #adds colors
  uniq_pigeons.each_key do |name|
        data[:color].each_pair do |type, pigeons|
            if pigeons.include?(name)
                uniq_pigeons[name][:color] << type.to_s
            end
        end
  end

  #adds gender
  uniq_pigeons.each_key do |name|
        data[:gender].each_pair do |type, pigeons|
            if pigeons.include?(name)
                uniq_pigeons[name][:gender] << type.to_s
            end
        end
  end

  #adds home
  uniq_pigeons.each_key do |name|
        data[:lives].each_pair do |type, pigeons|
            if pigeons.include?(name)
                uniq_pigeons[name][:lives] << type
            end
        end
  end

  uniq_pigeons
end

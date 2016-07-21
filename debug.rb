User.where("sector > 250").each do |sec|
  sec.sector = sec.get_sector_id
  sec.unique_key = (0...5).map { (65 + rand(26)).chr }.join + '-' +sec.sector.to_s
  sec.save!
end
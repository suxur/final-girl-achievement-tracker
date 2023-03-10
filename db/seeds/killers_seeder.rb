class KillersSeeder < Planter::Seeder
  seeding_method :data_array

  def seed
    data.each do |name, slug, series|
      Killer
        .create!(name: name, slug: slug, series: series)
        .tap do |killer|
          if file_exists?(logo_path(slug))
            killer.logo.attach(
              io: file_image(logo_path(slug)),
              filename: "#{slug}.png",
              content_type: "image/png",
              identify: false,
            )
          end
          if file_exists?(icon_path(slug))
            killer.icon.attach(
              io: file_image(icon_path(slug)),
              filename: "#{slug}_icon.png",
              content_type: "image/png",
              identify: false,
            )
          end
        end
    end
  end

  private

  def data
    [
      ["Hans", :hans, series_1],
      ["Poltergeist", :poltergeist, series_1],
      ["Inkanyamba", :inkanyamba, series_1],
      ["Geppetto", :geppetto, series_1],
      ["Dr. Fright", :dr_fright, series_1],
      ["Terror From Above", :terror_from_above, series_1],
      ["Evomorph", :evomorph, series_2],
      ["The Organism", :the_organism, series_2],
      ["The Intruders", :the_intruders, series_2],
      ["Big Bad Wolf", :big_bad_wolf, series_2],
      ["Ratchet Lady", :ratchet_lady, series_2],
      ["Terror From The Grave", :terror_from_the_grave, series_2],
    ]
  end

  def series_1
    @series_1 ||= Series.find(1)
  end

  def series_2
    @series_2 ||= Series.find(2)
  end

  def file_exists?(path)
    File.exist?(File.join(Rails.root, path))
  end

  def file_image(path)
    File.open(File.join(Rails.root, path))
  end

  def logo_path(slug)
    "db/seed_images/killers/#{slug}.png"
  end

  def icon_path(slug)
    "db/seed_images/killers/#{slug}_icon.png"
  end
end

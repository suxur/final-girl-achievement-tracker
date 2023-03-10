class LocationsSeeder < Planter::Seeder
  seeding_method :data_array

  def seed
    data.each do |name, slug, series|
      Location
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
      ["Camp Happy Trails", :camp_happy_trails, series_1],
      ["Creech Manor", :creech_manor, series_1],
      ["Sacred Groves", :sacred_groves, series_1],
      ["Carnival of Blood", :carnival_of_blood, series_1],
      ["Maple Lane", :maple_lane, series_1],
      ["The USS Konrad", :the_uss_konrad, series_2],
      ["Station 2891", :station_2891, series_2],
      ["Wingard Cottage", :wingard_cottage, series_2],
      ["Storybook Woods", :storybook_woods, series_2],
      ["Wolfe Asylum", :wolfe_asylum, series_2],
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
    "db/seed_images/locations/#{slug}.png"
  end

  def icon_path(slug)
    "db/seed_images/locations/#{slug}_icon.png"
  end
end

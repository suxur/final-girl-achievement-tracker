class UsersSeeder < Planter::Seeder
  # TODO: Choose a seeding_method. For example:
  # seeding_method :csv

  # For now, we overload the seed method so no exception will be raised.
  def seed
    User.first_or_create!(
      email: "suxur@me.com",
      password: "password",
      password_confirmation: "password",
    )
  end
end

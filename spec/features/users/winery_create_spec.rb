include Warden::Test::Helpers
Warden.test_mode!

# As a user
# I want create my winery
# So I can begin to track my data
feature 'Winery create' do

  after(:each) do
    Warden.test_reset!
  end

  # Given I am signed in
  # When I create a new winery
  # Then I should see it's new home page
  scenario 'user creates new winery' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit new_winery_path
    fill_in 'Name', with: 'Millefiori Winery'
    click_button 'Create Winery'
    expect(page).to have_content('Welcome, Millefiori Winery')
  end
end

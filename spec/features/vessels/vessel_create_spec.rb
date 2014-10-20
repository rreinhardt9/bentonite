include Warden::Test::Helpers
Warden.test_mode!

# As a user
# I want to add vessels to my winery
# so that I can track their contents
feature 'Vessel create' do

  after(:each) do
    Warden.test_reset!
  end

  # Given I am signed in
  # When I create a new vessel
  # Then I should see it on my winery's page
  scenario 'user creates new vessel' do
    winery = create(:winery)
    login_as(winery.user, scope: :user)
    visit winery_path(winery.id)
    fill_in 'Name', with: '1000-5'
    fill_in 'Capacity', with: 1000
    check 'Active'
    click_button 'Create Vessel'
    expect(page).to have_content('1000-5')
  end
end

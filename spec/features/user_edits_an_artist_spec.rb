require 'rails_helper'

RSpec.feature "User edits an existing artist" do
  scenario "they can see the updated artist" do
    image_url = 'zest.jpg'
    artist1 = Artist.create(name: "Bob Marley", image_path: image_url)

    visit '/artists'

    click_link('See artist', match: :first)

    click_on "Edit"
    fill_in('artist_name', :with => 'Meci')
    click_on "Update Artist"

    expect(page).to have_content 'Meci'
    expect(page).to have_content image_url
  end
end

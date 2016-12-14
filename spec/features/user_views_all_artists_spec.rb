require 'rails_helper'

RSpec.feature "User visits artists page" do
  scenario "they see all artists names" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist2 = Artist.create(name: "Zesty Pepper", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit '/artists'

    expect(page).to have_content artist1.name
    expect(page).to have_content artist2.name

    click_link('See artist', match: :first)

    expect(page).to have_content artist1.name
    # expect(page).to have_css artist1.image_path
  end
end

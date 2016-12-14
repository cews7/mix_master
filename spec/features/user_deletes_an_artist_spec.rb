require 'rails_helper'

RSpec.feature "User deletes artist" do
  scenario "they can delete an artist on show page" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist2 = Artist.create(name: "Zesty Pepper", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit '/artists'
    
    click_link('See artist', match: :first)

    click_on "Delete"

    expect(page).to have_content artist2.name
    expect(page).to_not have_content artist1.name
  end
end

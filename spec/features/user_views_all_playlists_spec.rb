require 'rails_helper'

RSpec.feature "User views playlists" do
  scenario "they can view all playlists" do
    playlist = create(:playlist)

    visit playlists_path

    expect(page).to have_link playlist.name,  href: playlist_path(playlist)
  end
end

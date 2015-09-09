require 'spec_helper'

describe "Navigate movies" do
  it "allows navigation from the detail page to listing page" do
    movie = Movie.create(movie_attributes(total_gross: 318412101.00))

    visit movie_url(movie)

    click_link "All Movies"

    expect(current_path).to eq(root_path)

  end

  it "allows navigation from the listing page to detail page" do
    movie = Movie.create(movie_attributes(total_gross: 318412101.00))

    visit movies_url

    click_link movie.title

    expect(current_path).to eq(movie_path(movie))

  end
end
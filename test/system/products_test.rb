require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Author", with: @product.author
    fill_in "Barcode", with: @product.barcode
    fill_in "Brand", with: @product.brand
    fill_in "Category", with: @product.category_id
    fill_in "Editorial", with: @product.editorial
    fill_in "Full Price", with: @product.full_price
    fill_in "Game Duration", with: @product.game_duration
    fill_in "Game Line", with: @product.game_line_id
    fill_in "Game Style", with: @product.game_style_id
    fill_in "Game Type", with: @product.game_type_id
    fill_in "Height", with: @product.height
    fill_in "Img Board Midgame", with: @product.img_board_midgame
    fill_in "Img Board Set", with: @product.img_board_set
    fill_in "Img Box", with: @product.img_box
    fill_in "Img Box Content", with: @product.img_box_content
    fill_in "Language", with: @product.language
    fill_in "Large Description", with: @product.large_description
    fill_in "Length", with: @product.length
    fill_in "Name", with: @product.name
    fill_in "Origin", with: @product.origin
    fill_in "Otto Price", with: @product.otto_price
    fill_in "Presale Price", with: @product.presale_price
    fill_in "Ranking Bgg", with: @product.ranking_bgg
    fill_in "Short Description", with: @product.short_description
    fill_in "Sku", with: @product.sku
    fill_in "Sub Category", with: @product.sub_category_id
    fill_in "Suggested Age", with: @product.suggested_age_id
    fill_in "Suggested Players", with: @product.suggested_players
    fill_in "Thematic", with: @product.thematic_id
    fill_in "Video Gameplay Url", with: @product.video_gameplay_url
    fill_in "Video How To Url", with: @product.video_how_to_url
    fill_in "Video Reel Url", with: @product.video_reel_url
    fill_in "Weight", with: @product.weight
    fill_in "Width", with: @product.width
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Author", with: @product.author
    fill_in "Barcode", with: @product.barcode
    fill_in "Brand", with: @product.brand
    fill_in "Category", with: @product.category_id
    fill_in "Editorial", with: @product.editorial
    fill_in "Full Price", with: @product.full_price
    fill_in "Game Duration", with: @product.game_duration
    fill_in "Game Line", with: @product.game_line_id
    fill_in "Game Style", with: @product.game_style_id
    fill_in "Game Type", with: @product.game_type_id
    fill_in "Height", with: @product.height
    fill_in "Img Board Midgame", with: @product.img_board_midgame
    fill_in "Img Board Set", with: @product.img_board_set
    fill_in "Img Box", with: @product.img_box
    fill_in "Img Box Content", with: @product.img_box_content
    fill_in "Language", with: @product.language
    fill_in "Large Description", with: @product.large_description
    fill_in "Length", with: @product.length
    fill_in "Name", with: @product.name
    fill_in "Origin", with: @product.origin
    fill_in "Otto Price", with: @product.otto_price
    fill_in "Presale Price", with: @product.presale_price
    fill_in "Ranking Bgg", with: @product.ranking_bgg
    fill_in "Short Description", with: @product.short_description
    fill_in "Sku", with: @product.sku
    fill_in "Sub Category", with: @product.sub_category_id
    fill_in "Suggested Age", with: @product.suggested_age_id
    fill_in "Suggested Players", with: @product.suggested_players
    fill_in "Thematic", with: @product.thematic_id
    fill_in "Video Gameplay Url", with: @product.video_gameplay_url
    fill_in "Video How To Url", with: @product.video_how_to_url
    fill_in "Video Reel Url", with: @product.video_reel_url
    fill_in "Weight", with: @product.weight
    fill_in "Width", with: @product.width
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end

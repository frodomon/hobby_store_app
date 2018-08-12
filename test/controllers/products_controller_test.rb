require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { author: @product.author, barcode: @product.barcode, brand: @product.brand, category_id: @product.category_id, editorial: @product.editorial, full_price: @product.full_price, game_duration: @product.game_duration, game_line_id: @product.game_line_id, game_style_id: @product.game_style_id, game_type_id: @product.game_type_id, height: @product.height, img_board_midgame: @product.img_board_midgame, img_board_set: @product.img_board_set, img_box: @product.img_box, img_box_content: @product.img_box_content, language: @product.language, large_description: @product.large_description, length: @product.length, name: @product.name, origin: @product.origin, otto_price: @product.otto_price, presale_price: @product.presale_price, ranking_bgg: @product.ranking_bgg, short_description: @product.short_description, sku: @product.sku, sub_category_id: @product.sub_category_id, suggested_age_id: @product.suggested_age_id, suggested_players: @product.suggested_players, thematic_id: @product.thematic_id, video_gameplay_url: @product.video_gameplay_url, video_how_to_url: @product.video_how_to_url, video_reel_url: @product.video_reel_url, weight: @product.weight, width: @product.width } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { author: @product.author, barcode: @product.barcode, brand: @product.brand, category_id: @product.category_id, editorial: @product.editorial, full_price: @product.full_price, game_duration: @product.game_duration, game_line_id: @product.game_line_id, game_style_id: @product.game_style_id, game_type_id: @product.game_type_id, height: @product.height, img_board_midgame: @product.img_board_midgame, img_board_set: @product.img_board_set, img_box: @product.img_box, img_box_content: @product.img_box_content, language: @product.language, large_description: @product.large_description, length: @product.length, name: @product.name, origin: @product.origin, otto_price: @product.otto_price, presale_price: @product.presale_price, ranking_bgg: @product.ranking_bgg, short_description: @product.short_description, sku: @product.sku, sub_category_id: @product.sub_category_id, suggested_age_id: @product.suggested_age_id, suggested_players: @product.suggested_players, thematic_id: @product.thematic_id, video_gameplay_url: @product.video_gameplay_url, video_how_to_url: @product.video_how_to_url, video_reel_url: @product.video_reel_url, weight: @product.weight, width: @product.width } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end

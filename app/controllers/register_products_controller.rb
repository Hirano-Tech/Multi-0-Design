class RegisterProductsController < ApplicationController
  require "chromedriver-helper"

  def new
    # ↓ UNIQLO（https://www.uniqlo.com）商品情報を取得する。 ↓
    driver = Selenium::WebDriver.for :chrome
    # wait = Selenium::WebDriver::Wait.new(:timeout => 60)

    driver.get 'https://www.uniqlo.com/jp/ja/products/E436112-000/00' # UNIQLO の商品ページ URL を記入する。
    product_id = product_name = driver.find_element(:css,'#root > div > div > div:nth-child(1) > div.uq-uikit-layout-wrapper > section > div.uq-uikit-template-pdp__main > div.uq-uikit-layout.uq-uikit-layout--gutter-sm.uq-uikit-layout--gutter-md.uq-uikit-layout--gutter-lg.uq-uikit-layout--gutter-xl.uq-uikit-layout--span-4-sm.uq-uikit-layout--span-12-md.uq-uikit-layout--span-7-lg.uq-uikit-layout--span-10-xl.uq-uikit-template-pdp__product-details.uq-uikit-visibility--show-sm.uq-uikit-visibility--show-md.uq-uikit-visibility--show-lg.uq-uikit-visibility--show-xl > div.uq-uikit-mb-spacing-07 > header > div > span > div').text.gsub(/[^\d]/, "").to_i

    product_name = driver.find_element(:css,'#root > div > div > div:nth-child(1) > div.uq-uikit-layout-wrapper > section > div.uq-uikit-template-pdp__main > div.uq-uikit-layout.uq-uikit-layout--gutter-sm.uq-uikit-layout--gutter-md.uq-uikit-layout--gutter-lg.uq-uikit-layout--gutter-xl.uq-uikit-layout--span-4-sm.uq-uikit-layout--span-12-md.uq-uikit-layout--span-5-lg.uq-uikit-layout--span-6-xl.uq-uikit-layout--inset-left-lg.uq-uikit-layout--inset-left-xl.uq-uikit-template-pdp__product-overview.uq-uikit-visibility--show-sm.uq-uikit-visibility--show-md.uq-uikit-visibility--show-lg.uq-uikit-visibility--show-xl > div > h1').text

    driver.find_element(:class, "classname")
    driver.find_element(:xpath, "XPATH").click

    driver.find_elements(:class, "uq-uikit-image__img") # 商品ページ内にある画像を取得する。
    driver.find_elements(:class, "uq-uikit-image__img").count # 商品ページ内にある画像の枚数を取得する。
    driver.find_elements(:css, "#product-color-picker > div.uq-uikit-chip-group__chips > div:nth-child(X) > input").click
      # カラーを選択する。"div:nth-child(X)" に左から何番目のカラーかを入力する。
    driver.find_elements(:class, "uq-uikit-image__img")[X].attribute("src")
      # 商品画像の URL を取得する。[X] に何枚目の商品画像かを選択する。

    product_image = URI.parse(driver.find_element(:class, "uq-uikit-image__img").attribute("src"))
    product_image.fragment = product_image.query = nil
    product_image.to_s

    product_distributor = URI.parse(driver.current_url)
    product_distributor.fragment = product_distributor.query = nil
    product_distributor.to_s

    youtube_video = YoutubeVideo.find(1)
    youtube_video.products.create(id: product_id, name: product_name, brand: 'UNIQLO', image: product_image.to_s, distributor: product_distributor.to_s, influencer_id: 1)

    redirect_to root_path
  end
end

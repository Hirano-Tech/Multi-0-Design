class RegisterProductsController < ApplicationController
  require "chromedriver-helper"

  def index
    @influencers = Influencer.all
  end

  def new
  end

  def create
    if params[:product_image].present?
      product = Hash.new

      product[:product_id] = params[:product_id]
      product[:product_name] = params[:product_name]
      product[:product_distributor] = params[:product_distributor]
      product[:product_image] = params[:product_image]

      @influencers = Influencer.includes(:youtube_channel)
      render action: :index, locals: { product: product }
    else
      product = Hash.new
      product_images = []

      driver = Selenium::WebDriver.for :chrome
      driver.get "https://www.uniqlo.com/jp/ja/products/E#{params[:product_id]}-000/00"

      product_id = product_name = driver.find_element(:css,'#root > div > div > div:nth-child(1) > div.uq-uikit-layout-wrapper > section > div.uq-uikit-template-pdp__main > div.uq-uikit-layout.uq-uikit-layout--gutter-sm.uq-uikit-layout--gutter-md.uq-uikit-layout--gutter-lg.uq-uikit-layout--gutter-xl.uq-uikit-layout--span-4-sm.uq-uikit-layout--span-12-md.uq-uikit-layout--span-7-lg.uq-uikit-layout--span-10-xl.uq-uikit-template-pdp__product-details.uq-uikit-visibility--show-sm.uq-uikit-visibility--show-md.uq-uikit-visibility--show-lg.uq-uikit-visibility--show-xl > div.uq-uikit-mb-spacing-07 > header > div > span > div').text.gsub(/[^\d]/, "").to_i
      product[:product_id] = product_id.to_i

      product_name = driver.find_element(:css,'#root > div > div > div:nth-child(1) > div.uq-uikit-layout-wrapper > section > div.uq-uikit-template-pdp__main > div.uq-uikit-layout.uq-uikit-layout--gutter-sm.uq-uikit-layout--gutter-md.uq-uikit-layout--gutter-lg.uq-uikit-layout--gutter-xl.uq-uikit-layout--span-4-sm.uq-uikit-layout--span-12-md.uq-uikit-layout--span-5-lg.uq-uikit-layout--span-6-xl.uq-uikit-layout--inset-left-lg.uq-uikit-layout--inset-left-xl.uq-uikit-template-pdp__product-overview.uq-uikit-visibility--show-sm.uq-uikit-visibility--show-md.uq-uikit-visibility--show-lg.uq-uikit-visibility--show-xl > div > h1').text
      product[:product_name] = product_name

      product_distributor = URI.parse(driver.current_url)
      product_distributor.fragment = product_distributor.query = nil
      product[:product_distributor] = product_distributor.to_s

      driver.find_elements(:class, "uq-uikit-image__img").each do |image|
        product_images << image.attribute("src")
      end

      render action: :new, locals: { product: product, product_images: product_images }
    end
  end
end

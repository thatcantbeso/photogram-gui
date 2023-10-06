class PhotosController < ApplicationController

  def index
    render ({ template: "photos_templates/index"})
  end

  def show
    render ({ template: "photos_templates/show"})
  end
end

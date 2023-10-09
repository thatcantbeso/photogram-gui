class PhotosController < ApplicationController

  def index
      matching_photos = Photo.all

      @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ template: "photos_templates/index"})
  end

  def show
      # Parameters: {"path_id"=>"777"}
      url_id = params.fetch("path_id")

      matching_photos = Photo.where({ :id => url_id })

      @the_photo = matching_photos.at(0)

    render({ template: "photos_templates/show"})
  end

  def baii
    #Parameters: {"toast_id"=>"695"}
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ template: "photos_templates/baii"})

    redirect_to("/photos")
  end
end

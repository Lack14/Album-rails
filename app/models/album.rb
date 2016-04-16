class Album < ActiveRecord::Base
    has_many :photos
    validates :name,presence: true
   after_create :create_images
   after_update :create_images
   before_create :set_color
    def photos=(value)
        @images = value
    end
    
    private
    def create_images
        if @images
        @images.each do |photo|
                Photo.create(image: photo, album_id: self.id)
          end
    end
    end
    def set_color
        colors = [' blue darken-4', ' light-blue', 'yellow darken-4', 'grey darken-4', 'black', 'red darken-4', 'pink darken-4']
        color_random = rand(colors.length)
        self.color = colors[color_random] if self.color.empty?
    end
end
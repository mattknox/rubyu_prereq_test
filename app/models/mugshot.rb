class Mugshot < ActiveRecord::Base
  require 'rmagick'
  acts_as_cached
  has_attachment :content_type => :image, 
  :storage => :file_system, 
  :max_size => 50000.kilobytes,
  :resize_to => '320x200>',
  :thumbnails => { :thumb => '100x100>' }

  def self.cached_count
    get_cache(:count) do
      count
    end
  end
  validates_as_attachment
end

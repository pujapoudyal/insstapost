class Post < ActiveRecord::Base
    belongs_to :user
    attr_accessor :content, :name, :title
        validates :name,  :presence => true
        validates :title, :presence => true,
                    :length => { :minimum => 5 }
    has_many :comments, dependent: :destroy
    
    mount_uploader :photo, PhotoUploader
    
    validates :photo, :description, :user_id, presence: true
end

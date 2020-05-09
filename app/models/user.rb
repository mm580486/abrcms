class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :login, :allow_blank => true, :case_sensitive => false
    validates_uniqueness_of :email, :allow_blank => true, :case_sensitive => false
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , :allow_blank => true
    has_many :metum, class_name: "Usermetum", foreign_key: "user_id",dependent: :delete_all
    accepts_nested_attributes_for :metum
    has_many :posts, class_name: "Post", foreign_key: "user_id",dependent: :delete_all

    def getValue(identify)
        case identify.to_s
        when 'login','email','name','nicname','display_name','activation_key','id','posts','posts_count'
           return self.send(identify)
        else
            tmp_mtm=metum.find_or_create_by(key: identify) do |conf|
                conf.value = default_value(identify)
            end
            return tmp_mtm.value
        end
  
      end



    def posts_count
        return self.posts.size.to_i
    end

      

      def default_value(name)
        # return default value
        case name
        when "Role"
        #   Roles: super_admin administrator editor author contributor subscriber
           return Setting.getValue('default_role')
        when "Primary Color"
          Rails.configuration.primary_color_default
        when "Registration Method"
          Rails.configuration.registration_method_default
        when "Room Authentication"
          false
        when "Room Limit"
          Rails.configuration.number_of_rooms_default
        when "Shared Access"
          Rails.configuration.shared_access_default
        end
      end

      

end

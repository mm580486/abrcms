class Post < ApplicationRecord
  belongs_to :user
  # enum comment_status: {public: 0,closed: 1,private: 2}
end

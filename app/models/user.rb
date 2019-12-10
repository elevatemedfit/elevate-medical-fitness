class User < ApplicationRecord
    has_many :patients
    has_secure_password
end

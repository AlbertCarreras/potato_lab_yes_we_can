class Potato < ApplicationRecord

validates :name, presence: {message: "Name can't be blank"}
validates :eyes, presence: {message: "Eyes must be a number"}
validates :eyes, numericality: {even: true,  message: "Eyes must be even"}

end

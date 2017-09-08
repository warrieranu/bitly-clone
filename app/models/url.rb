class Url < ActiveRecord::Base
    
    validates :long_url, presence: true,
                       format: { with: /[https?]?.*/,
                                 message: "Not a valid URL"}
    validates :short_url, uniqueness: true

    after_initialize :set_click_count
    
    def set_click_count
        self.click_count ||= 0
    end
    
    # after_initialize :add_to_table
    
    def shorten
        return "woof-" + SecureRandom.urlsafe_base64(5)
    end
 
    def increment_click_count
        self.click_count += 1
    end
    
end

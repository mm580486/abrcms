class Setting < ApplicationRecord

    def self.getValue(name,value='')
        tmp_setting=self.find_or_create_by(key: name) do |conf|
            case name
            when 'default_role'
                conf.value = 'subscriber'
            when 'default_language'
                conf.value = 'fa'
            else
                return ''
            end
        end

        return tmp_setting.value
    end


end

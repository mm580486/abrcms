require 'abr_core'
class AbrUser < AbrCore
    @DefaultRoles = [{
        key: 'subscriber',
        permissions: []
    },{
        key: 'author',
        permissions: [{
            controller: 'posts',
            actions: ['new','create','edit','update']
        }]
    },

]
    @NewUserFields = [
        {
            id: 'login',
            input_type: 'text',
            type: 'input',
            placeholder: '',
            class: 'ltr',
            name: 'login',
            label: I18n.t('form.username'),
            required: true,
            customeAttrbutes: {},
            position: 0
        },
        {
            id: 'email',
            input_type: 'email',
            placeholder: 'example: info@example.com',
            type: 'input',
            class: 'ltr',
            name: 'email',
            label: I18n.t('form.email'),
            required: true,
            customeAttrbutes: {},
            position: 1
        },
        {
            id: 'nicname',
            input_type: 'text',
            placeholder: '',
            type: 'input',
            class: '',
            name: 'nicname',
            label: I18n.t('form.name'),
            required: false,
            customeAttrbutes: {dir: 'auto'},
            position: 2
        },
        {
            id: 'url',
            input_type: 'url',
            placeholder: 'https://blog.com',
            type: 'input',
            class: '',
            name: 'url',
            label: I18n.t('form.website'),
            required: false,
            customeAttrbutes: {dir: 'ltr'},
            position: 4
        },{
            id: 'Role',
            input_type: 'role',
            placeholder: I18n.t('form.select_role'),
            type: 'select',
            values: @DefaultRoles,
            class: '',
            name: 'Role',
            label: I18n.t('form.role'),
            required: false,
            customeAttrbutes: {dir: 'rtl'},
            position: 4
        },
        {
            id: 'password',
            input_type: 'password',
            placeholder: '',
            type: 'input',
            class: 'ltr',
            name: 'password',
            label: I18n.t('form.password'),
            required: true,
            customeAttrbutes: {dir: 'ltr'},
            position: 4
        }

    ]


  

    @UsersColumns = [
        {
            id: 'checkbox',
            name: "<input type='checkbox' id='checkall' class=''><label class='' for='checkall'></label>",
            position: 0
        },
        {
            id: 'id',
            name: I18n.t('form.id'),
            position: 1
        },
        {
            id: 'nicname',
            name: I18n.t('form.name'),
            position: 2
        },
        {
            id: 'login',
            name: I18n.t('form.login'),
            position: 3
        },
        {
            id: 'email',
            name: I18n.t('form.email'),
            position: 4
        },
        {
            id: 'Role',
            name: I18n.t('form.role'),
            position: 5
        },
        {
            id: 'posts_count',
            name: I18n.t('menu.posts.posts'),
            position: 6
        }
    ]

    def self.newUserForm(form_auth_token,user_default)
         HELPERS.content_tag(:form,{method: :post,action: ROUTER.admin_users_create_path}) {

            html = '<table class="form-table">'
            @NewUserFields.map { |field|
                html += '<tr>'
                if field[:type] == 'input'
                    html += "<th><label for='#{field[:id]}'>" + field[:label] + (I18n.t('form.required') if field[:required]).to_s + '</label></th>'
                    html += "<td><input value='#{user_default.send(field[:name])}' name='#{user_default.class.to_s.downcase}[#{field[:name]}]' placeholder='#{field[:placeholder]}' id='#{field[:id]}' #{ field[:customeAttrbutes].map {|k| "#{k[0]}='#{k[1]}'" }.join(' ')} class='form-control #{field[:class]}' type='" + field[:input_type] + "'></td>"
               
                elsif field[:type] == 'select'
                    html += "<th><label for='#{field[:id]}'>" + field[:label] + (I18n.t('form.required') if field[:required]).to_s + '</label></th>'
                    html += "<td><select class='form-control' name='user[metum[]#{field[:id]}' id='#{field[:id]}'>#{ field[:values].map {|k| "<option value='#{k[:key]}'>#{k[:key]}</option>" }.join(' ')}</select></td>"
                    
                elsif field[:type] == 'html'

                end
                html += '</tr>'
            }
            html += HELPERS.content_tag(:tr,HELPERS.content_tag(:th,HELPERS.content_tag(:button, I18n.t('form.create'), { type: 'submit', class: 'btn btn-primary', id: 'user_submit' })))
            html += '</table>'
            html += HELPERS.content_tag(:input, '', { type: 'hidden',value: form_auth_token,name: 'authenticity_token' })
            HELPERS.raw(html)
     
        }
    end


    def self.users(users)
        html = '<table class="wp-list-table widefat fixed striped users"><thead><tr>'
        @UsersColumns.map {|column| html += "<th><a id='#{column[:id]}'>#{column[:name]}</a></th>"}
        html += '</tr></thead>'

        html +='<tbody>'

        users.each do |user|
            html +='<tr>'
            @UsersColumns.map {|column| 
                if column[:id] == 'checkbox'
                  html += "<td><input type='checkbox' name='users[]' id='user_#{user.getValue('id')}' class='' value='#{user.getValue('id')}'><label class='' for='user_#{user.getValue('id')}'></label></td>"
                else
                  html += "<td><a class='#{column[:id]}'>#{user.getValue(column[:id])}</a>" + (("<br><div class='tr-actions'><a href='#{ROUTER.admin_users_edit_path(id: user.id)}'>#{I18n.t('edit')}</a> <a href='#{ROUTER.admin_users_destroy_user_path(id: user.id)}' style='color:red;margin-right:5px;'>#{I18n.t('delete')}</a>" if column[:id] == 'id') || '') + "</div></td>"
                end
            
            }
            html +='</tr>'

        end


        html += '</tbody></table>'

        return HELPERS.raw(html)
    end
    
    def self.avatar_url(email, size)
        gravatar_id = Digest::MD5.hexdigest(email.downcase)
        return "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end


end
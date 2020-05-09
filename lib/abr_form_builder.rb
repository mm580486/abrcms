class AbrFormBuilder
   include ActionView::Helpers
   include Rails.application.routes.url_helpers
   @router = Rails.application.routes.url_helpers
   @helpers = ::ApplicationController.helpers
   def self.login_form(form_auth_token)
      @helpers.content_tag(:form,nil,{method: :post,url: @router.login_path}) do
         @helpers.content_tag(:input, '', { type: 'hidden',value: form_auth_token,name: 'authenticity_token' })+
         @helpers.content_tag(:label, I18n.t('form.username'), { class: 'form-label', for: 'user_login' }) +
         @helpers.content_tag(:input,nil, { type: 'text', class: 'form-control', id: 'user_login',name: 'username' }) +
         @helpers.content_tag(:label, I18n.t('form.password'), { class: 'form-label', for: 'user_password' }) +
         @helpers.content_tag(:input, nil, { type: 'password',name: 'password', class: 'form-control', id: 'user_password' }) +
         @helpers.content_tag(:input, nil, { type: 'checkbox', class: '', id: 'remember_me' }) +
         @helpers.content_tag(:label, I18n.t('form.remember_me'), { class: '', for: 'remember_me' }) +
         @helpers.content_tag(:button, I18n.t('form.login'), { type: 'submit', class: 'btn btn-primary', id: 'user_submit' })
      end +
         @helpers.content_tag('hr', '', { class: 'row-divider' })
   end

   def self.logo_path
      return '/cms-logo.png'
   end

   def self.logo_image
      @helpers.content_tag(:img, '', { src: self.logo_path, class: 'logo-image', id: 'logo-image' })
   end

   def self.default_url_options
      ActionMailer::Base.default_url_options
   end

      
end
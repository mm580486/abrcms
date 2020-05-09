class AbrCore
    include ActionView::Helpers
    include Rails.application.routes.url_helpers
    ROUTER = Rails.application.routes.url_helpers
    HELPERS = ::ApplicationController.helpers
end
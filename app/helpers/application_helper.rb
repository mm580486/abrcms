module ApplicationHelper
    def current_class?(test_path)
        return true if request.path == test_path
      end
end

class AbrAdminMenu
    include ActionView::Helpers
    include Rails.application.routes.url_helpers
    @router = Rails.application.routes.url_helpers
    @helpers = ::ApplicationController.helpers
    @MENUES = [
        {
            name: I18n.t('menu.dashboard'),
            icon: 'dashicons-before dashicons-dashboard',
            path: @router.admin_dashboard_interview_path,
            position: 0,
            sub: [
                {
                    name: I18n.t('menu.home'),
                    path: @router.admin_dashboard_interview_path,
                }
            ]
        },
        {
            name: I18n.t('menu.posts.posts'),
            icon: 'dashicons-before dashicons-admin-post',
            path: @router.admin_posts_posts_path,
            position: 1,
            sub: [
                {
                    name: I18n.t('menu.posts.posts'),
                    path: @router.admin_posts_posts_path,
                },
                {
                    name: I18n.t('menu.posts.add'),
                    path: @router.admin_posts_new_path,
                },
                {
                    name: I18n.t('menu.posts.categories'),
                    path: @router.admin_posts_posts_path,
                },
                {
                    name: I18n.t('menu.posts.tags'),
                    path: @router.admin_posts_posts_path,
                }
            ]
        },
        {
            name: I18n.t('menu.users.users'),
            icon: 'wp-menu-image dashicons-before dashicons-admin-users',
            path: @router.admin_users_users_path,
            position: 2,
            sub: [
                {
                    name: I18n.t('menu.users.users'),
                    path: @router.admin_users_users_path
                },
                {
                    name: I18n.t('menu.users.new'),
                    path: @router.admin_users_new_user_path
                },
                {
                    name: I18n.t('menu.users.your_profile'),
                    path: @router.admin_users_new_user_path
                }
            ]
        }
    ]

    def self.getMenus
        return @MENUES
    end

    def self.addMenu(name,icon,position,path,sub = nil)
        @MENUES << {
            name: name,
            icon: icon,
            position: position,
            path: path,
            sub: sub
        }
        reorder_menu
    end

    def self.reorder_menu 
        @MENUES.sort_by! { |k,v| k[:position] }
    end

end
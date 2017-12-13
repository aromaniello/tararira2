ActiveAdmin.register_page "Dashboard" do

    menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    content title: proc{ I18n.t("active_admin.dashboard") } do

        #div class: "blank_slate_container", id: "dashboard_default_message" do
        #    span class: "blank_slate" do
        #        span I18n.t("active_admin.dashboard_welcome.welcome")
        #        small I18n.t("active_admin.dashboard_welcome.call_to_action")
        #    end
        #end

        columns do
            column do
                panel "Users Pending Authorization" do
                    ul do
                        User.where(pending_authorization: true, authorized: false).order(created_at: :desc).map do |user| # 'recent'?
                            li link_to(user.email, admin_user_path(user))
                        end
                    end
                end
            end

            #column do
            #    panel "Info" do
            #        para "Welcome to ActiveAdmin."
            #    end
            #end
        end

        columns do
            column do
                panel "Transactions Pending Approval" do
                    ul do
                        Transaction.where(approved: false).order(created_at: :desc).map do |transaction|
                            li link_to("Transaction #{transaction.id}", admin_transaction_path(transaction))
                        end
                    end
                end
            end
        end

        columns do
            column do
                panel "Unread Messages" do
                    ul do
                        Message.where(read: false).order(created_at: :desc).map do |message|
                            li link_to("Message #{message.id}", admin_message_path(message))
                        end
                    end
                end
            end
        end

    end # content
end

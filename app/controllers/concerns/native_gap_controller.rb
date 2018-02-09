module NativeGapController

    extend ActiveSupport::Concern

    included do
        before_action :set_nativegap
    end

    def set_nativegap_user
        current_user if current_user
    end

    private

    def set_nativegap
        platform = params[:nativegap]
        if platform && NativeGap.configuration.send(platform)
            id = cookies[:nativegapAppId]
            url = request.original_url.split('?').first
            @app = NativeGap::App.find_by(id: id, platform: platform, url: url) if id && NativeGap::App.where(id: id, platform: platform, url: url).any?

            if @app.nil?
                @app = NativeGap::App.new
                @app.platform = platform
                @app.url = url
            end
            @app.owner = set_nativegap_user
            @app.last_used = Time.now
            @app.save!

            cookies[:nativegapAppId] = @app.id
            cookies[:nativegapApp] = url
        end
    end

end

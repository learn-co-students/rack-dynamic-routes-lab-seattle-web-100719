require 'pry'

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            found_item = @@items.detect {|item| item.name = item_name}
            if found_item
                resp.status = 200
                resp.finish
                found_item.price
            else
                resp.write "Item not found"
                resp.status = 400
                resp.finish
            end
            binding.pry
        else
            resp.write "Route not found"
            resp.status = 404
            resp.finish
        end

    end


end
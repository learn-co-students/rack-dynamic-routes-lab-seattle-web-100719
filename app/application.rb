require "pry"
class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match("/items/")
            searched = req.path.split("/items/").last
            item = @@items.find {|i| i.name == searched}
            # binding.pry
            if item != nil
                resp.write "hello"
                resp.write "#{item.price}"
                # binding.pry
            else
                resp.write "Item not found\n"
                resp.status = 400
            end
        else 
            resp.write "Route not found\n"
            resp.status = 404
        end
        resp.finish
      end

end
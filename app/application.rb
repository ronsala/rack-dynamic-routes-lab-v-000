class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # if req.path.match(/items/<ITEM NAME>)
    # if req.path == '/items/<ITEM NAME>'
    # if req.path == '/items/'
    # if req.path.include?("items")
    # if req.path=="/items"
    if req.path.match(/items/)
      # item = req.params["item"]
      item = req.path.split("/items/").last
      # if @@items.include?(item)
      if @@items.find{|i| i.name == item}
        req_item = @@items.find{|i| i.name == item}


        resp.write "#{item.price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end

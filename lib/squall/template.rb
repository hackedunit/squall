module Squall
  # OnApp Template
  class Template < Base
    # Return a list of available Templates
    def list
      response = request(:get, '/templates.json')
      response.collect { |temp| temp['image_template'] }
    end
    
    # Return a Hash for the given Template
    def show(id)
      response = request(:get, "/templates/#{id}.json")
      response.first[1]
    end

    # Make a Template public so that it can be downloaded
    # via a HTTP url
    def make_public(id)
      response = request(:post, "/templates/#{id}/make_public.json")
      response.first[1]
    end
    
    # Delete a template
    def delete(id)
      response = request(:delete, "/templates/#{id}.json")
      response.first[1]
    end
  end
end

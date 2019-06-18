module Types
  class QueryType < BaseObject
    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`
    field :all_links, [LinkType], null: false
    field :by_id, LinkType, null: true do
      description "Find a link by id"
      argument :id, Integer, required: true
    end

    # this method is invoked, when `all_link` fields is being resolved
    def all_links
      Link.all
    end

    def by_id(id:)
      begin
        link = Link.find(id)
      rescue => e
        GraphQL::ExecutionError.new("Invalid input: #{e}")
      end
    end
  end
end

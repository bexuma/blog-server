module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :post, PostType, null: true do
      description "Find a post by ID"
      argument :id, ID, required: true
    end

    field :posts, [PostType], null: false do
      description "List all posts"
    end

    def post(id:)
      Post.find_by_id(id)
    end

    def posts
      Post.all
    end
  end
end

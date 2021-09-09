module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :get_post, PostType, null: true do
      description "Find a post by ID"
      argument :id, ID, required: true
    end

    field :get_posts, [PostType], null: false do
      description "List all posts"
    end

    def get_post(id:)
      Post.find_by_id(id)
    end

    def get_posts
      Post.all
    end
  end
end

module Mutations
  class UpdatePost < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :text, String, required: true

    type Types::PostType

    def resolve(id: nil, title: nil, text: nil)
      post = Post.find(id)
      post.title = title
      post.text = text
      post.save!
      post
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
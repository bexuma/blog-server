module Mutations
  class DeletePost < BaseMutation
    argument :id, ID, required: true

    type Types::PostType

    def resolve(id: nil)
      post = Post.find(id)
      post.destroy
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
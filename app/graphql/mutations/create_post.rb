module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :text, String, required: true

    type Types::PostType

    def resolve(title: nil, text: nil)
      Post.create!(
        title: title,
        text: text,
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
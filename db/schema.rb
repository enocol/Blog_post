ActiveRecord::Schema[7.1].define(version: 20_240_110_083_418) do
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.string 'text'
    t.bigint 'UserId'
    t.bigint 'PostId'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['PostId'], name: 'index_comments_on_PostId'
    t.index ['UserId'], name: 'index_comments_on_UserId'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'UserId'
    t.bigint 'PostId'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['PostId'], name: 'index_likes_on_PostId'
    t.index ['UserId'], name: 'index_likes_on_UserId'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.string 'text'
    t.string 'CommentsCounter'
    t.string 'LikesCounter'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_posts_on_author_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'photo'
    t.string 'bio'
    t.integer 'postscounter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'comments', 'posts', column: 'PostId', on_delete: :cascade
  add_foreign_key 'comments', 'users', column: 'UserId', on_delete: :cascade
  add_foreign_key 'likes', 'posts', column: 'PostId', on_delete: :cascade
  add_foreign_key 'likes', 'users', column: 'UserId', on_delete: :cascade
  add_foreign_key 'posts', 'users', column: 'author_id', on_delete: :cascade
end

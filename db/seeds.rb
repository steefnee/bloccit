include RandomData

 # Create Posts
 5.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 # #3
 10.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"


 20.times do
   Advertisement.create!(
     title:  RandomData.random_sentence,
     copy:   RandomData.random_paragraph,
     price:  RandomData.random_number
   )
 end
 advertisements = Advertisement.all
 puts "Seed finished"
 puts "#{Advertisement.count} ad created"

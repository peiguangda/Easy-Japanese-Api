User.create({email: "example@marketplace.com",
             account: "peiguangda",
             password: "12345678",
             password_confirmation: "12345678"})

user = User.first

5.times do
  user.courses.create!({
    code: "abc",
    short_description: "abc",
    name: "Course 1",
    owner_name: "Owner 1",
    avatar: "url",
    description: "abc",
    password: "123456",
    android_url: "abc",
    end_date: 1000,
    status: 1,
    index: 1,
    member_num: 1,
    time_expire: 1,
    day_to_open_lesson: 1,
    })
end

course = Course.first

10.times do
  course.topics.create!({
    user_id: user.id,
    parent_id: 1,
    level: 1,
    status: 1,
    childrent_type: 1,
    start_time: 1000,
    end_time: 1500,
    tag: "abc",
    sort_id: 1,
    order_index: 1,
    user_name: "QuangDai",
    name: "Topic 1",
    description: "abc",
    short_description: "abc",
    avatar:"url",
    total_card_num: 1,
    question_number: 3,
    password: "123456",
    duration: 1,
    pass: 2,
    time_practice: 10,
    score_scale: 20,
    })
end

topic = Topic.first

40.times do
  topic.cards.create!({
    user_id: user.id,
    course_id: course.id,
    order_index: 1,
    difficulty_level: 1,
    parent_id: 1,
    has_child: 1,
    status: 1,
    code: "abc",
    shuffle_anser: 2,
    front_text: "text",
    front_image: "image",
    front_sound: "sound",
    front_hint: "hint",
    back_text: "text",
    back_image: "image",
    back_sound: "sound",
    back_hint: "hint",
    })
end

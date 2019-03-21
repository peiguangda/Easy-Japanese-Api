User.create({email: "example@marketplace.com",
             account: "peiguangda",
             password: "12345678",
             password_confirmation: "12345678"})

user = User.first

5.times do
  user.courses.create!({
    code: "N1_01",
    short_description: "Học tiếng nhật",
    name: "Course 1",
    owner_name: "Bùi Quang Đại ",
    avatar: "https://l.facebook.com/l.php?u=https%3A%2F%2Fis1-ssl.mzstatic.com%2Fimage%2Fthumb%2FPurple118%2Fv4%2F88%2F59%2F99%2F885999fa-8119-d24b-fbd7-4692b619f5d8%2FAppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png%2F246x0w.jpg%3Ffbclid%3DIwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ&h=AT22Z7oSSx7P3fzNzFZyCASIpHTs_3rA9wVsXQqhpKXcEfK0tuxq9rfo2AD7zFzUQN8EmreRcwJxp4tFhivGegETMt5ffbBjRSgtNxnb2pf-OdH3acEep4v0kRQeNA",
    description: "Học tiếng nhật",
    password: "123456",
    android_url: "url.com",
    end_date: 1000,
    status: 1,
    index: 1,
    member_num: 2,
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
    tag: "Tiếng Nhật ",
    sort_id: 1,
    order_index: 1,
    user_name: "Bùi Quang Đại",
    name: "Ngữ pháp",
    description: "Học ngữ pháp",
    short_description: "Học ngữ pháp",
    avatar:"https://l.facebook.com/l.php?u=https%3A%2F%2Fis1-ssl.mzstatic.com%2Fimage%2Fthumb%2FPurple118%2Fv4%2F88%2F59%2F99%2F885999fa-8119-d24b-fbd7-4692b619f5d8%2FAppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png%2F246x0w.jpg%3Ffbclid%3DIwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ&h=AT22Z7oSSx7P3fzNzFZyCASIpHTs_3rA9wVsXQqhpKXcEfK0tuxq9rfo2AD7zFzUQN8EmreRcwJxp4tFhivGegETMt5ffbBjRSgtNxnb2pf-OdH3acEep4v0kRQeNA",
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
    code: "N2_01",
    shuffle_anser: 2,
    front_text:"天気はどうですか。 ",
    front_image: "https://l.facebook.com/l.php?u=https%3A%2F%2Fis1-ssl.mzstatic.com%2Fimage%2Fthumb%2FPurple118%2Fv4%2F88%2F59%2F99%2F885999fa-8119-d24b-fbd7-4692b619f5d8%2FAppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png%2F246x0w.jpg%3Ffbclid%3DIwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ&h=AT22Z7oSSx7P3fzNzFZyCASIpHTs_3rA9wVsXQqhpKXcEfK0tuxq9rfo2AD7zFzUQN8EmreRcwJxp4tFhivGegETMt5ffbBjRSgtNxnb2pf-OdH3acEep4v0kRQeNA",
    front_sound: "http://www.bsoftnamkam.xyz/japaneselisten/N3Listen/Audio/N3_KIKU_B_11.mp3",
    front_hint: "いい天気だな！",
    back_text: "天気はどうですか。",
    back_image: "https://l.facebook.com/l.php?u=https%3A%2F%2Fis1-ssl.mzstatic.com%2Fimage%2Fthumb%2FPurple118%2Fv4%2F88%2F59%2F99%2F885999fa-8119-d24b-fbd7-4692b619f5d8%2FAppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png%2F246x0w.jpg%3Ffbclid%3DIwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ&h=AT22Z7oSSx7P3fzNzFZyCASIpHTs_3rA9wVsXQqhpKXcEfK0tuxq9rfo2AD7zFzUQN8EmreRcwJxp4tFhivGegETMt5ffbBjRSgtNxnb2pf-OdH3acEep4v0kRQeNA",
    back_sound: "http://www.bsoftnamkam.xyz/japaneselisten/N3Listen/Audio/N3_KIKU_B_11.mp3",
    back_hint: "いい天気だな！",
    })
end

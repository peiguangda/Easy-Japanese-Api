User.create({email: "example@marketplace.com",
             account: "peiguangda",
             password: "12345678",
             password_confirmation: "12345678"})

user = User.first

5.times do
  user.courses.create!({
    code: "N1_01",
    short_description: "Học tiếng nhật N1",
    name: "Course 1",
    owner_name: "Bùi Quang Đại ",
    avatar: "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/88/59/99/885999fa-8119-d24b-fbd7-4692b619f5d8/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png/246x0w.jpg?fbclid=IwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ",
    description: "Chào mừng các bạn kênh học tiếng Nhật online miễn phí. Như các bạn đã biết việc học tiếng Nhật, ngoài khó khăn như nhiều bộ chữ, số lượng từ lớn, cấu trúc ngữ pháp hơi ngược thì người Việt Nam có lợi thế học tiếng Nhật bởi cách phát âm đơn giản, bộ chữ Kanji có nguồn gốc từ chữ Hán, tương tự rất nhiều chữ tiếng Việt.Các bạn hãy vào website để học tiếng nhật thường xuyên nhé. tin các bạn sẽ tiến bộ nhanh chóng!",
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
    description: "Giáo trình ngữ pháp N1 có mẫu câu, ví dụ, các bài tập cuối chương,...Có file âm thanh.",
    short_description: "Học ngữ pháp N1",
    avatar:"https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/88/59/99/885999fa-8119-d24b-fbd7-4692b619f5d8/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png/246x0w.jpg?fbclid=IwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ",
    total_card_num: 1,
    question_number: 3,
    password: "123456",
    duration: 1,
    pass: 2,
    time_practice: 10,
    score_scale: 20,
    viewer: 5,
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
    front_image: "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/88/59/99/885999fa-8119-d24b-fbd7-4692b619f5d8/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png/246x0w.jpg?fbclid=IwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ",
    front_sound: "http://www.bsoftnamkam.xyz/japaneselisten/N3Listen/Audio/N3_KIKU_B_11.mp3",
    front_hint: "いい天気だな！",
    back_text: "天気はどうですか。",
    back_image: "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/88/59/99/885999fa-8119-d24b-fbd7-4692b619f5d8/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png/246x0w.jpg?fbclid=IwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ",
    back_sound: "http://www.bsoftnamkam.xyz/japaneselisten/N3Listen/Audio/N3_KIKU_B_11.mp3",
    back_hint: "いい天気だな！",
    })
end

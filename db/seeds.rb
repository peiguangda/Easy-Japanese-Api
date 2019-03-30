User.create({email: "example@marketplace.com",
             account: "peiguangda",
             password: "12345678",
             password_confirmation: "12345678"})

user = User.first

5.times do |i|
  user.courses.create!({
    code: "N1_01",
    short_description: "Easy Japanese học tiếng nhật N"+ (i+1).to_s,
    name: "Khóa học tiếng nhật ôn thi JLPT N"+ (i+1).to_s,
    owner_name: "Bùi Quang Đại",
    avatar: "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/88/59/99/885999fa-8119-d24b-fbd7-4692b619f5d8/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png/246x0w.jpg?fbclid=IwAR0YYL3PnBuXA4s3svzjK5yACIlGOIKyMiCjySi68KbOafgllDEHHPhs5LQ",
    description: "Học tiếng nhật online, ngân hàng tổng hợp đề luyện thi thử năng lực tiếng nhật jlpt n5 n4 n3 n2 n1 có đáp án và dịch nghĩa vô cùng đa dạng,..Khóa luyện thi tiếng nhật trực tuyến, uy tín, chất lượng, tất cả khóa học từ vựng, ngữ pháp, đọc hiểu, nghe được được song ngữ việt-nhật giúp cho học sinh yên tâm cho những kỳ thi tiếng nhật hàng năm. Đặc 
    biệt kho đề thi được biên soạn cập nhật đề mới thường xuyên nên đáp ứng đầy đủ kỹ năng cần thiết cho các bạn học sinh.",
    password: "123456",
    android_url: "url.com",
    end_date: 1000,
    status: 1,
    index: 1,
    member_num: 20,
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

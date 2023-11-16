
INSERT INTO `user` (`user_id`, `email`, `username`, `password`, `date_of_birth`, `gender`, `country`, `cp`)
VALUES
  (1, 'user1@example.com', 'user1', 'password1', '1990-01-01', 'female', 'Country1', 12345),
  (2, 'user2@example.com', 'user2', 'password2', '1995-05-15', 'male', 'Country2', 67890);


INSERT INTO `video` (`video_id`, `title`, `description`, `size`, `video_file_name`, `video_duration`, `thumbnail`, `views`, `likes`, `dislikes`, `status`, `publication_date`, `user`)
VALUES
  (1, 'Video Title 1', 'Description 1', 1024.5, 'video1.mp4', 120.0, NULL, 1000, 50, 5, 'public', '2023-01-15 12:00:00', 1),
  (2, 'Video Title 2', 'Description 2', 768.2, 'video2.mp4', 90.5, NULL, 800, 30, 3, 'private', '2023-02-20 15:30:00', 2);

INSERT INTO `tag` (`tag_id`, `name`, `video`)
VALUES
  (1, 'Tag1', 1),
  (2, 'Tag2', 2);

INSERT INTO `channel` (`channel_id`, `name`, `description`, `creation_date`, `user`)
VALUES
  (1, 'Channel1', 'Channel Description 1', '2022-05-10', 1),
  (2, 'Channel2', 'Channel Description 2', '2022-08-22', 2);

INSERT INTO `subscription` (`subscription_id`, `subscription_date`, `user`, `chanel`)
VALUES
  (1, '2022-05-12', 1, 2),
  (2, '2022-09-01', 2, 1);

INSERT INTO `like_dislike_video` (`like_dislike_video_id`, `type`, `like_dislike_date`, `user`, `video`)
VALUES
  (1, 'like', '2022-06-05', 1, 2),
  (2, 'dislike', '2022-07-20', 2, 1);

INSERT INTO `playlist` (`playlist_id`, `name`, `creation_date`, `status`, `user`)
VALUES
  (1, 'Playlist1', '2022-06-15 14:00:00', 'public', 1),
  (2, 'Playlist2', '2022-09-05 10:45:00', 'private', 2);

INSERT INTO `video_playlist` (`video_playlist_id`, `video`, `playlist`)
VALUES
  (1, 1, 1),
  (2, 2, 2);

INSERT INTO `comment` (`comment_id`, `text`, `comment_date`, `user`, `video`)
VALUES
  (1, 'Great video!', '2022-06-20 16:30:00', 1, 2),
  (2, 'Nice work!', '2022-08-02 09:45:00', 2, 1);


INSERT INTO `like_dislike_comment` (`like_dislike_comment_id`, `type`, `like_dislike_date`, `user`, `comment`)
VALUES
  (1, 'like', '2022-06-25 18:15:00', 2, 1),
  (2, 'dislike', '2022-08-10 12:00:00', 1, 2);



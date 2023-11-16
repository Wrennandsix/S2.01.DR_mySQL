CREATE DATABASE youtube CHARACTER SET utf8mb4;
USE youtube;

CREATE TABLE `user` (
  `user_id` int PRIMARY KEY,
  `email` varchar(255),
  `username` varchar(255),
  `password` varchar(255),
  `date_of_birth` timestamp,
  `gender` ENUM('female','male','other'),
  `country` varchar(255),
  `cp` int
);

CREATE TABLE `video` (
  `video_id` int PRIMARY KEY,
  `title` varchar(255),
  `description` varchar(255),
  `size` float,
  `video_file_name` varchar(255),
  `video_duration` float,
  `thumbnail` binary,
  `views` int,
  `likes` int,
  `dislikes` int,
  `status` ENUM('private','public'),
  `publication_date` timestamp,
  `user` int
);

CREATE TABLE `tag` (
  `tag_id` int PRIMARY KEY,
  `name` varchar(255),
  `video` int
);

CREATE TABLE `channel` (
  `channel_id` int PRIMARY KEY,
  `name` varchar(255),
  `description` varchar(255),
  `creation_date` date,
  `user` int
);

CREATE TABLE `subscription` (
  `subscription_id` int PRIMARY KEY,
  `subscription_date` date,
  `user` int,
  `chanel` int
);

CREATE TABLE `like_dislike_video` (
  `like_dislike_video_id` int PRIMARY KEY,
  `type` ENUM('like','dislike'),
  `like_dislike_date` date,
  `user` int,
  `video` int
);

CREATE TABLE `playlist` (
  `playlist_id` int PRIMARY KEY,
  `name` varchar(255),
  `creation_date` timestamp,
  `status` ENUM('private','public'),
  `user` int
);

CREATE TABLE `video_playlist` (
  `video_playlist_id` int PRIMARY KEY,
  `video` int,
  `playlist` int
);

CREATE TABLE `comment` (
  `comment_id` int PRIMARY KEY,
  `text` varchar(255),
  `comment_date` timestamp,
  `user` int,
  `video` int
);

CREATE TABLE `like_dislike_comment` (
  `like_dislike_comment_id` int PRIMARY KEY,
  `type` ENUM('like','dislike'),
  `like_dislike_date` timestamp,
  `user` int,
  `comment` int
);

ALTER TABLE `video` ADD FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

ALTER TABLE `tag` ADD FOREIGN KEY (`video`) REFERENCES `video` (`video_id`);

ALTER TABLE `channel` ADD FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

ALTER TABLE `subscription` ADD FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

ALTER TABLE `subscription` ADD FOREIGN KEY (`chanel`) REFERENCES `channel` (`channel_id`);

ALTER TABLE `like_dislike_video` ADD FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

ALTER TABLE `like_dislike_video` ADD FOREIGN KEY (`video`) REFERENCES `video` (`video_id`);

ALTER TABLE `playlist` ADD FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

ALTER TABLE `video_playlist` ADD FOREIGN KEY (`video`) REFERENCES `video` (`video_id`);

ALTER TABLE `video_playlist` ADD FOREIGN KEY (`playlist`) REFERENCES `playlist` (`playlist_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

ALTER TABLE `comment` ADD FOREIGN KEY (`video`) REFERENCES `video` (`video_id`);

ALTER TABLE `like_dislike_comment` ADD FOREIGN KEY (`user`) REFERENCES `user` (`user_id`);

ALTER TABLE `like_dislike_comment` ADD FOREIGN KEY (`comment`) REFERENCES `comment` (`comment_id`);

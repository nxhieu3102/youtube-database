CREATE DATABASE youtube_database_v1;

USE youtube_database_v1;

CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  create_at DATETIME NOT NULL,
  description VARCHAR(255) DEFAULT NULL,
  avatar_link VARCHAR(255) DEFAULT NULL
);

CREATE TABLE chanel (
  user_id INT NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE video_category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE play_list (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE video (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  descriptions VARCHAR(255) DEFAULT NULL,
  total_like INT DEFAULT 0,
  dislike INT DEFAULT 0,
  subtitle VARCHAR(255) DEFAULT NULL,
  create_at DATETIME NOT NULL,
  duration INT DEFAULT NULL,
  thumbnail_url VARCHAR(255) DEFAULT NULL,
  video_category_id INT DEFAULT NULL,
  play_list_id INT DEFAULT NULL,
  tag VARCHAR(255) DEFAULT NULL,
  
  FOREIGN KEY(user_id) REFERENCES user(id),
  FOREIGN KEY(video_category_id) REFERENCES video_category(id),
  FOREIGN KEY(play_list_id) REFERENCES play_list(id)
);

CREATE TABLE recommendations (
  user_id INT NOT NULL,
  video_id INT NOT NULL,
  PRIMARY KEY (user_id, video_id),
  FOREIGN KEY(user_id) REFERENCES user(id),
  FOREIGN KEY(video_id) REFERENCES video(id)
);

CREATE TABLE comment (
  video_id INT NOT NULL,
  user_id INT NOT NULL,
  comment VARCHAR(255) NOT NULL,
  PRIMARY KEY (video_id, user_id),
  FOREIGN KEY(user_id) REFERENCES user(id),
  FOREIGN KEY(video_id) REFERENCES video(id)
);

CREATE TABLE subtitle (
  video_id INT NOT NULL,
  language VARCHAR(255) NOT NULL,
  sub VARCHAR(255) NOT NULL,
  PRIMARY KEY (video_id, language),
  FOREIGN KEY(video_id) REFERENCES video(id)
);


CREATE TABLE watch_history (
  user_id INT NOT NULL,
  video_id INT NOT NULL,
  view_at DATETIME NOT NULL,
  PRIMARY KEY (user_id, video_id),
  FOREIGN KEY(video_id) REFERENCES video(id),
  FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE search_history (
  user_id INT NOT NULL,
  text_search VARCHAR(255) NOT NULL,
  PRIMARY KEY (user_id, text_search),
  FOREIGN KEY(user_id) REFERENCES user(id)
);
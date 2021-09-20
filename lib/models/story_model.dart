import 'package:super_todo/models/user_model.dart';

enum MediaType{
  image,
  video
}
class Story{
final String storyUrl;
final User userName;
final String avatarUrl;

 

const Story({
  required this.storyUrl,
  required this.userName,
  required this.avatarUrl,
});
}
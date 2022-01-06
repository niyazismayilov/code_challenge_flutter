import 'package:birbir/data/endpoint/base/endpoint.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadEndpoint extends Endpoint {
  final FileUploadInput input;

  FileUploadEndpoint(this.input);

  @override
  HttpMethod get httpMethod => HttpMethod.POST;
}

class FileUploadInput {
  final XFile? file;

  FileUploadInput(this.file);
}

import 'dart:html';
import 'dart:typed_data';

class FileUtils {
  static void saveFile({
    required Uint8List data,
    required String filename,
  }) {
    ///convertendo o Uint8List em Blob para criação da url de download
    final blob = Blob([Uint8List.fromList(data)], 'video/mp4');
    ///criação da url do objeto a partir do blob convertido
    final url = Url.createObjectUrlFromBlob(blob);
    /// ancoragem da url para realizar download no navegador
    AnchorElement(href: url)
      ..target = 'web-save-file'
      ..download = filename
      ..click();
    Url.revokeObjectUrl(url);
  }
}
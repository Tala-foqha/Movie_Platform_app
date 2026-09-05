// core/networking/failure.dart
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    final res = e.response; // قد تكون null
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badResponse:
        // نتعامل مع الحالة من خلال response (قد تكون HTML / JSON / نص)
        return ServerFailure.fromResponse(res);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.unknown:
        // ممكن تكون DNS/ssl/format… الخ
        return ServerFailure('Unexpected Error, Please try again!');
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  factory ServerFailure.fromResponse(Response<dynamic>? response) {
    final code = response?.statusCode ?? 0;
    final msg = _extractMessage(response?.data);

    if (code == 404) {
      return ServerFailure(
        msg ?? 'Your request was not found, please try later',
      );
    } else if (code == 500) {
      return ServerFailure(
        msg ?? 'There is a problem with server, please try later',
      );
    } else if (code == 400 || code == 401 || code == 403) {
      return ServerFailure(msg ?? 'Invalid request, please check your input');
    } else {
      return ServerFailure(msg ?? 'There was an error, please try again');
    }
  }

  /// يحاول استخراج رسالة من أي شكل للـ body:
  /// - Map JSON: message / error.message / errors[0].message / error كنص
  /// - نص عادي
  /// - HTML: يأخذ <title> أو ينظّف الوسوم ويعيد مقتطف
  static String? _extractMessage(dynamic data) {
    if (data == null) return null;

    if (data is String) {
      final txt = data.trim();
      if (txt.isEmpty) return null;

      // HTML؟
      if (txt.startsWith('<')) {
        final title = RegExp(
          r'<title[^>]*>([^<]+)</title>',
          caseSensitive: false,
        ).firstMatch(txt)?.group(1)?.trim();
        if (title != null && title.isNotEmpty) return title;
        final noTags = txt
            .replaceAll(RegExp(r'<[^>]*>'), ' ')
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim();
        if (noTags.isNotEmpty) {
          return noTags.length > 120 ? '${noTags.substring(0, 120)}…' : noTags;
        }
        return null;
      }

      return txt; // نص عادي
    }

    if (data is Map) {
      final m1 = data['message'];
      if (m1 is String && m1.trim().isNotEmpty) return m1.trim();

      final err = data['error'];
      if (err is Map) {
        final m2 = err['message'];
        if (m2 is String && m2.trim().isNotEmpty) return m2.trim();
      }
      if (err is String && err.trim().isNotEmpty) return err.trim();

      final errors = data['errors'];
      if (errors is List && errors.isNotEmpty) {
        final first = errors.first;
        if (first is Map) {
          final m3 = first['message'];
          if (m3 is String && m3.trim().isNotEmpty) return m3.trim();
        }
        if (first is String && first.trim().isNotEmpty) return first.trim();
      }
    }

    return null;
  }
}

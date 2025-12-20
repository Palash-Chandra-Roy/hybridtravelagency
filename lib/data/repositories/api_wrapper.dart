// coverage:ignore-file

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio_package;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hybridtravelagency/data/data_constant.dart';
import 'package:hybridtravelagency/data/entities/enums.dart';
import 'package:hybridtravelagency/utils/utils.dart';

import '../models/response_model.dart';

/// API WRAPPER to call all the APIs and handle the error status codes
class ApiWrapper {
  final String _baseUrl = DataConstants.baseUrl;

  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeRequest(String url, Request request, dynamic data,
      bool isLoading, Map<String, String> headers) async {
    /// To see whether the network is available or not
    if (await isNetworkAvailable()) {
      switch (request) {
        /// Method to make the Get type request
        case Request.get:
          {
            var uri = _baseUrl + url;

            if (isLoading) showLoader();

            try {
              final response = await http.get(Uri.parse(uri), headers: headers,).timeout(const Duration(seconds: 120));
              if (isLoading) closeDialog();
              printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            } catch (ex){
              closeDialog();
              return ResponseModel(
                  data: '{"message":"${ex.toString()}"}', hasError: true);
            }
          }
        case Request.post:

          /// Method to make the Post type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) showLoader();
              final response = await http
                  .post(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) closeDialog();

              printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            } catch (ex){
              closeDialog();
              return ResponseModel(
                  data: '{"message":"${ex.toString()}"}', hasError: true);
            }
          }
        case Request.put:

          /// Method to make the Put type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) showLoader();
              final response = await http
                  .put(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) closeDialog();

              printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            } catch (ex){
              closeDialog();
              return ResponseModel(
                  data: '{"message":"${ex.toString()}"}', hasError: true);
            }
          }

        case Request.patch:

          /// Method to make the Patch type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) showLoader();
              final response = await http
                  .patch(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) closeDialog();

              printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}',
                  hasError: true,
                  errorCode: 1000);
            } catch (ex){
              closeDialog();
              return ResponseModel(
                  data: '{"message":"${ex.toString()}"}', hasError: true);
            }
          }
        case Request.delete:

          /// Method to make the Delete type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) showLoader();

              final response = await http
                  .delete(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) closeDialog();

              printILog(uri);
              // printLog(response.body);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            } catch (ex){
              closeDialog();
              return ResponseModel(
                  data: '{"message":"${ex.toString()}"}', hasError: true);
            }
          }
        case Request.awsUpload:

          /// Method to make the Put type request
          {
            var uri = url;

            try {
              if (isLoading) showLoader();
              final response = await http
                  .put(
                    Uri.parse(uri),
                    body: data,
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) closeDialog();

              printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            } catch (ex){
              closeDialog();
              return ResponseModel(
                  data: '{"message":"${ex.toString()}"}', hasError: true);
            }
          }
      }
    }

    /// If there is no network available then instead of print can show the no internet widget too
    else {
      if (Get.isDialogOpen!) {
        Get.back<void>();
      }
      return ResponseModel(
        data:
            '{"message":"No internet, please enable mobile data or wi-fi in your phone settings and try again"}',
        hasError: true,
        errorCode: 1000,
      );
    }
  }

  Future<ResponseModel> makeMultipartRequest(
      String url,
      Request request,
      dynamic data,
      bool isLoading,
      Map<String, String> headers,
      File? attachment) async {
    var uri = DataConstants.baseUrl + url;

    try {
      if (isLoading) showLoader();
      // String fileName = "";
      // if (attachment != null) {
      //   fileName = attachment.path.split('/').last;
      // }



      final response = await dio_package.Dio().post(
          uri,
        data: data,
        options: dio_package.Options(
          headers: headers
        )
      );
      if (isLoading) closeDialog();
      return returnResponse2(response);

    }  on TimeoutException
    catch (_) {
      if (isLoading) closeDialog();
      return ResponseModel(
          data: '{"message":"Request timed out"}', hasError: true);
    } catch (ex){
      if (isLoading) closeDialog();
      return ResponseModel(
          data: '{"message":"${ex.toString()}"}', hasError: true);
    }
  }

  // Future<ResponseModel> makeMultipartRequest(
  //     String url,
  //     Request request,
  //     dynamic data,
  //     bool isLoading,
  //     Map<String, String> headers,
  //     File? attachment) async {
  //   var uri = DataConstants.appBaseUrl + url;
  //
  //   try {
  //     if (isLoading) showLoader();
  //     String fileName = "";
  //     if (attachment != null) {
  //       fileName = attachment.path.split('/').last;
  //     }
  //
  //
  //
  //     http.MultipartRequest mRequest;
  //       mRequest = http.MultipartRequest(
  //         'POST',
  //         Uri.parse(uri),
  //       );
  //       if (attachment != null) {
  //         http.MultipartFile multipartFile =
  //         await http.MultipartFile.fromPath('file', attachment.path);
  //         mRequest.files.add(multipartFile);
  //         mRequest.headers.addAll(headers);
  //         mRequest.fields.addAll(data);
  //         var streamedResponse = await mRequest.send();
  //         if (isLoading) closeDialog();
  //
  //         printILog(uri);
  //         final response = await http.Response.fromStream(streamedResponse);
  //         return returnResponse(response);
  //       } else {
  //         return ResponseModel(
  //             data: '{"message":"Attachment not found"}', hasError: true);
  //       }
  //
  //   }  on TimeoutException
  //   catch (_) {
  //     if (isLoading) closeDialog();
  //     return ResponseModel(
  //         data: '{"message":"Request timed out"}', hasError: true);
  //   }
  // }
  /// Method to return the API response based upon the status code of the server
  ResponseModel returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 203:
      case 205:
      case 208:
        return ResponseModel(
            data: response.body,
            hasError: false,
            errorCode: response.statusCode);
      case 400:
      case 401:

        /// unauthorized
        if (response.statusCode == 401) {}
        return ResponseModel(
          data: response.body,
          hasError: true,
          errorCode: response.statusCode,
        );
      case 406:

        /// To hit refresh token
        return ResponseModel(
          data: response.body,
          hasError: true,
          errorCode: response.statusCode,
        );
      case 409:
      case 500:
      case 522:
      case 204:
        return ResponseModel(
            data: response.body,
            hasError: true,
            errorCode: response.statusCode);
      default:
        return ResponseModel(
            data: response.body,
            hasError: true,
            errorCode: response.statusCode);
    }
  }

  ResponseModel returnResponse2(dio_package.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 203:
      case 205:
      case 208:
        return ResponseModel(
            data: response.toString(),
            hasError: false,
            errorCode: response.statusCode);
      case 400:
      case 401:

      /// unauthorized
        if (response.statusCode == 401) {}
        return ResponseModel(
          data: response.toString(),
          hasError: true,
          errorCode: response.statusCode,
        );
      case 406:

      /// To hit refresh token
        return ResponseModel(
          data: response.toString(),
          hasError: true,
          errorCode: response.statusCode,
        );
      case 409:
      case 500:
      case 522:
      case 204:
        return ResponseModel(
            data: response.toString(),
            hasError: true,
            errorCode: response.statusCode);
      default:
        return ResponseModel(
            data: response.toString(),
            hasError: true,
            errorCode: response.statusCode);
    }
  }
}

// ignore_for_file: constant_identifier_names

enum Tag {
  ERROR,
  SUCCESS,
  LOADING,
  CALLBACK,
  DIO_REQUEST,
  SERVICE_ACTION,
  BLOC_EVENT,
}

enum ButtonType { LONG_BTN, SHORT_BTN }

enum ResponseType {
  Success,
  Error,
  NotFound,
  TIME_OUT,
  SESSION_ENDED,
  CSFR_ERROR,
  CLIENT_ERROR,
  UNKNOWN_ERROR
}

enum HttpMethod { get, post, put, patch, delete }

enum CheckBoxTextPosition {
  left,
  right,
  both,
}

enum BtnContentType { IMG, TEXT }

enum TextFieldType {PHONE,TEXT,PASSWORD,OTP,DROPDOWN}

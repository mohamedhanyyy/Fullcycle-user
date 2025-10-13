class EndPoints {
  static String baseUrl = 'https://api.mshware.com/api/';

  static const String sendOTP = 'user';
  static const String getSurvey = 'Orphan/getSurvey';
  static const String updateSurvey = 'Orphan/updateSurvey';
  static const String login = 'User/login';
  static const String refreshToken = 'User/RefreshToken';
  static const String candidateGetMobile = 'Candidate/GetMobile';
  static const String candidateQRCode = 'CandidateAttendance/GenerateQr';
  static const String candidateAddExperience = 'Experince/AddExperience';
  static const String candidateDeleteExperience = 'Experince/DeleteExperience';
  static const String candidateUpdateExperience = 'Candidate/UpdateExperience';
  static const String candidateGetDoc = 'Candidate/GetDoc';
  static const String candidateValidateIban = 'Candidate/ValidateIBan';
  static const String candidateUpdateIban = 'Candidate/UpdateIBan';
  static const String candidateGetBanks = 'Candidate/getbanks';
  static const String candidateGetImage = 'Candidate/GetFile';
  static const String candidateGetExperience = 'Experince/getExperience';
  static const String getCandidate = 'Candidate/GetCandidate';
  static const String getAllActiveEvents = 'Event/GetAllActiveEvents';
  static const String getZonesOfEvent = 'Event/GetZonesOfEvent';
  static const String getSubZonesOfEvent = 'Event/GetSubZonesOfEvent';
  static const String candidateGetQrString = 'Candidate/GetQrString';
  static const String updateCandidate = 'Candidate/UpdateCandidate';
  static const String addCandidate = 'Candidate/AddCandidate';
  static const String attendCandidate = 'CandidateAttendance/AttendCandidate';
}

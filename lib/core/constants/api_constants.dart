// ignore_for_file: constant_identifier_names, unused_field
class BaseUrls {
  BaseUrls._();

  static const _LOCAL_BASE_URL = 'http://10.0.2.2:8000/api/';
  static const _DEV_BASE_URL = 'http://3.1.218.249/api/';

  static const _UAT_BASE_URL = 'http://...UAT.../';
  static const _PROD_BASE_URL = 'http://172.62.72.7:8069/api/';

  static const String baseUrl = _PROD_BASE_URL;
}

// #### PATH ###

class ApiEndpoints {
  ApiEndpoints._();

  /// Home Endpoints
  static const question = '/v1/question';
  static const getMySubject = '/v1/subject/user';
  static const getQuestionBySubject = '/v1/question/subject';
  static const likeQuestion = '/v1/action';
  static const unLikeQuestion = '/v1/action';
  static const postDeviceToken = '/v1/firebasetoken';

  /// Category Endpoints
  static const GetCategoryEvent = '/v1/category';
  static const createCategory = '/v1/category';
  static const mergeCategroy = '/v1/category/merge';
  static const deleteCategory = '/v1/category/delete/';
  static const editCategory = '/v1/category/update/';
  static const getQuesitonInCategory = '/v1/category/save/';
  static const saveQuestiontoCateogry = '/v1/save';
  static const deleteSaveQuestion = '/v1/save/delete';

  // Post Question Endpoints
  static const createQuestion = '/v1/question';
  static const getTags = '/v1/tags/search';
  static const createTag = '/v1/tags';

  // OwnProfile Endpoints
  static const getProfile = '/v1/user/profile';
  static const getQuestionByUser = '/v1/question/user';
  static const getAnswerByUser = '/v1/answer/user';
  static const getTopTag = '/v1/tags/my-top-tag';

  // Search Endpoints
  static const getpopularSearch = '/v1/popular-search';
  static const getSearchQuestion = '/v1/question/search/';
  static const getSearchUser = '/v1/user/search/';
  static const getSearchtAnswer = '/v1/answer/search/';

  // QuestionDetail Endpoints
  static const getAnswerInQuestion = 'v1/answer';
  static const getCommnetInQuestion = '/v1/comment';
  static const getCommentInAnswer = '/v1/comment';
  static const updateQuestion = '/v1/question/';

  static const answer = '/v1/answer';
  static const createComment = '/v1/comment';
  static const deleteComment = "/v1/comment";
  static const updateComment = "/v1/comment";

  static const likeComment = '/v1/action';
  static const likeAnswer = '/v1/action';
  static const correctAnswer = '/v1/answer/edit_correct';

  // splash page Endpoints
  static const getSlogan = '/v1/slogan';

  // setting Endpints
  static const getSetting = '/v1/setting';
  static const updateSetting = '/v1/setting/update';

  // create account Endpoints
  static const register = '/register';
  static const getAllSubject = '/v1/subject';
  static const updateUserSubject = '/v1/user/update-user-subject';

  // feedback
  static const submitFeedback = '/v1/feedback';

  //report Endpoints
  static const createReport = '/v1/report';
  static const getReportType = '/v1/report-type';
  static const getReportTypeDetail = '/v1/report-type-detail';

  // personal info Endpoints
  static const updatePersonalInfo = '/v1/user/update';
  static const checkEmail = '/v1/user/check-email';
  static const checkUserName = '/v1/user/check-userName';
  static const sendOtp = '/sendOtp';
  static const verifyOtp = '/verifyOtp';

  // Other Profile
  static const getOtherProfile = '/v1/user/profile';
  static const getOtherQuestionByUser = '/v1/question/user';
  static const getOtherAnswerByUser = '/v1/answer/other/user';
  static const getOtherTopTag = '/v1/tags/top-tag';

  // Auth Password
  static const createNewPassword = '/forgetPassword';

  // Security Login
  static const block = '/v1/block';
  static const unBlock = '/v1/block';
  static const createBlock = '/v1/block';
  static const unHide = '/v1/hide';
  static const hide = '/v1/hide';
  static const createhide = '/v1/hide';
  static const changePassword = "/v1/user/changePassword";
  // select avatar
  static const getAvatar = '/v1/avatar';

  // data tag
  static const getOtherAnswerByTag = "/v1/answer/other/tag";
  static const getOtherQuestionByTag = "/v1/question/other/tag";
  static const getOwnAnswerByTag = "/v1/answer/tag";
  static const getOwnQuestionByTag = "/v1/question/tag";

  // notification
  static const notification = "/v1/notification";
}

class Constant {
  static const API_KEY = '71d9a51f0aa34899ac9e89466d54eaa2';

  static const BASE_LINK = 'http://newsapi.org/v2/';
  static const Map<String, String> Countries = {
    'USA' : 'us',
    'India' : 'in',
    "Korea" : 'kr',
    'China': 'cn'
  };

  static topHeadlineByCountry([country = 'us']) =>
      BASE_LINK + 'top-headlines?country=$country&category=business&apiKey=$API_KEY';


}

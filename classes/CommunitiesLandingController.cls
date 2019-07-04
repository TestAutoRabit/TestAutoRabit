public with sharing class CommunitiesLandingController {
        // Code we will invoke on page load.
    public PageReference forwardToStartPage() {
        String communityUrl = 'https://siiam-developer-edition.ap7.force.com';
        String customHomePage = '/apex/hello';
        if (UserInfo.getUserType().equals('Guest')) {
            return new PageReference(communityUrl + '/login?startURL=' + EncodingUtil.urlEncode(customHomePage, 'UTF-8'));
        }else {
            return Network.communitiesLanding();
        }
      }
        public CommunitiesLandingController() {}
    }
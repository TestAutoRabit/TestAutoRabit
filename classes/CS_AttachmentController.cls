public Class CS_AttachmentController{


Public Integer count{get;set;}
public List<Attachment> attach{get;set;}
public List<User> usRec{get;set;}

public CS_attachmentController()
{
attachList();
}
public void attachList()
{
attach = [SELECT CreatedDate, Id, Name, ownerid FROM Attachment where createddate = LAST_N_DAYS:1];

count = attach.size();
List<User> usRec= new List<User>();
}

}
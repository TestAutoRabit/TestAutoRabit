({
	playMusic : function(component, event, helper) {
        var selm=component.get("v.sd");
        var snd="";
        switch(selm){
            case "Sad":
                snd=$A.get("$Resource.PanicSound1");
                break;
            case "Explosion":
                snd=$A.get("$Resource.PanicSound2");
                break;
            default:
                alert("Please choose valid MP3");
                break;
                    }
		
        //debugger;
        //console.log("PanicSound captured from static resource.");
        var ad=component.find("atag").getElement();
       // for(var i = 5;i>0;i--)
       // {
       //     console.log("Timer is :"+i);
            //debugger;
       // }
        ad.src=snd;
	},
    showmsg : function(component, event, helper){
        var dtag=component.find("dmsg");
        helper.show(dtag);
    },
    hidemsg :function(component, event, helper){
        var dtag=component.find("dmsg");
        helper.hide(dtag);
    },
    selectsound :function(component, event, helper){
        var s=component.find("pdata").get("v.value");
        component.set("v.sd",s);
        },
    load: function(component, event, handler)
    {
        var act=component.get("c.displaySounds");
        act.setCallback(this,function(response){
            if(response.getState()=="SUCCESS")
            {
                component.set("v.slist",response.getReturnValue());
            }
        });
        $A.enqueueAction(act);
    }
})
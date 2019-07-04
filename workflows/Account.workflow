<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Acc_inactive</fullName>
        <description>Acc inactive</description>
        <protected>false</protected>
        <recipients>
            <recipient>pulkitsoni@salesforce.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Custome_Email_Templates/CustomTemplate</template>
    </alerts>
    <rules>
        <fullName>acc rule</fullName>
        <actions>
            <name>Acc_inactive</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Active__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>

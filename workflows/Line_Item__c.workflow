<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>LINE_Item</fullName>
        <ccEmails>pulkit_soni@infosys.com</ccEmails>
        <description>LINE Item</description>
        <protected>true</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Custome_Email_Templates/SalesNewCustomerEmail</template>
    </alerts>
    <alerts>
        <fullName>Line_item_created</fullName>
        <ccEmails>pulkit_soni@infosys.com</ccEmails>
        <description>Line item created</description>
        <protected>false</protected>
        <recipients>
            <recipient>pulkitsoni@salesforce.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Custome_Email_Templates/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>Copy_Unit_Price</fullName>
        <field>Unit_Price__c</field>
        <formula>Merchandise__r.Price__c</formula>
        <name>Copy Unit Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Price_of_One_item</fullName>
        <field>Unit_Price_ex__c</field>
        <formula>Merchandise__r.Price__c</formula>
        <name>Price of One item</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Line item added</fullName>
        <actions>
            <name>Line_item_created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Line_Item__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Unit Price Calculation</fullName>
        <actions>
            <name>Price_of_One_item</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Line_Item__c.Quantity__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

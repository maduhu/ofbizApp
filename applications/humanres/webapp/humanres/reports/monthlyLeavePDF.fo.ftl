<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#escape x as x?xml>
    <#if activities?has_content>

    <#-- REPORT TITLE -->
    <fo:block font-size="18pt" font-weight="bold" text-align="center">
        CHAI SACCO
    </fo:block>
    <fo:block font-size="12pt" text-align="center"  font-weight="bold" >
       Staff On Leave/Off Duty  [${fromToDate}] ---> [${thruToDate}] 
       <fo:block> <hr/> </fo:block>
    </fo:block>
    <fo:block><fo:leader/></fo:block>
   
<#if activities?has_content>
    <#-- REPORT BODY -->
    <fo:block space-after.optimum="10pt" font-size="10pt">
        <fo:table table-layout="fixed" width="100%">
            <fo:table-column column-width="20pt"/>
            <fo:table-column column-width="50pt"/>
            <fo:table-column column-width="80pt"/>
            <fo:table-column column-width="70pt"/>
            <fo:table-column column-width="100pt"/>
            <fo:table-column column-width="70pt"/>
            <fo:table-column column-width="50pt"/>
            <fo:table-column column-width="50pt"/>
            <fo:table-column column-width="50pt"/>

            
            
            <fo:table-header>
                <fo:table-row font-weight="bold">
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">S/No.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">Payroll No.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">Name</fo:block>
                    </fo:table-cell>
                    
                       <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">Branch</fo:block>
                    </fo:table-cell>
                     <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">Department</fo:block>
                    </fo:table-cell>
  
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">Type</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">No. of days Taken</fo:block>
                    </fo:table-cell>
                    
                     <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">Start Date</fo:block>
                    </fo:table-cell>
                    
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block text-align="left">End Date</fo:block>
                    </fo:table-cell>
                    
                    
                    
                  
                    
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                     
                     <#assign count=0>
                  <#list activities as activity>
                    <#if activity.partyId?has_content>
                        <#assign staff = delegator.findOne("Person", {"partyId" : activity.partyId}, false)/>   
                        <#assign staffBranch = staff.branchId/>
                        <#assign staffDept=staff.departmentId/>
                        <#assign staffposition= staff.emplPositionTypeId/>
                    </#if>
                    
                    
                     <#if activity.partyId?has_content>
                        <#assign branch = delegator.findOne("PartyGroup", {"partyId" : staffBranch}, false)/>
                    </#if>
                     <#if activity.partyId?has_content>
                        <#assign deptStaff = delegator.findOne("department", {"departmentId" : staffDept}, false)/>
                    </#if>
                     <#if activity.partyId?has_content>
                        <#assign postStaff = delegator.findOne("EmplPositionType", {"emplPositionTypeId" : staffposition}, false)/>
                    </#if>
                    
                    
                    
                     <#if activity.leaveTypeId?has_content>
                        <#assign leaveType = delegator.findOne("EmplLeaveType", {"leaveTypeId" : activity.leaveTypeId}, false)/>
                    </#if>
                     <fo:table-row>
                     <#assign count = count + 1>
                      <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${count}</fo:block>
                        </fo:table-cell>
                      <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <#if staff?has_content>
                                <fo:block>${staff.employeeNumber?if_exists}</fo:block>
                            <#else>
                                <fo:block>Not Defined</fo:block>
                            </#if>
                        </fo:table-cell>
                         <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <#if staff?has_content>
                                <fo:block>${staff.firstName?if_exists} ${staff.lastName?if_exists}</fo:block>
                            <#else>
                                <fo:block>Not Defined</fo:block>
                            </#if>
                        </fo:table-cell>
                        
                        <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${branch.groupName?if_exists}</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${deptStaff.departmentName?if_exists}</fo:block>
                        </fo:table-cell>
                        
                         <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <#if leaveType?has_content>
                                <fo:block>${leaveType.description?if_exists}</fo:block>
                            <#else>
                                <fo:block>Not Defined</fo:block>
                            </#if>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${activity.leaveDuration?if_exists}</fo:block>
                        </fo:table-cell>
                        
                          <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${activity.fromDate?if_exists}</fo:block>
                        </fo:table-cell>
                        
                          <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${activity.thruDate?if_exists}</fo:block>
                        </fo:table-cell>

                       
                     </fo:table-row>
                  </#list>

            </fo:table-body>
        </fo:table>
    </fo:block>
    <#else>
     <fo:block space-after.optimum="10pt" >
        <fo:block text-align="center" font-size="14pt">Nothing To Show</fo:block>
    </fo:block>
  </#if>
    <#else>
        <fo:block text-align="center">No Employees Found With that ID</fo:block>
    </#if>
</#escape>


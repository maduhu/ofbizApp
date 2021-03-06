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
    <#if employee?has_content>

    <#-- REPORT TITLE -->
    <fo:block font-size="18pt" font-weight="bold" text-align="center">
        CHAI SACCO
    </fo:block>
    <fo:block font-size="12pt" text-align="center"  font-weight="bold" >
        STAFF WITH 
         <#assign partyskill = delegator.findOne("SkillType", {"skillTypeId" : skillTypeId}, false)/>   
          ${partyskill.description}
         
    </fo:block>
    <fo:block><fo:leader/></fo:block> 
<#if employee?has_content>
    <#-- REPORT BODY -->
    <fo:block space-after.optimum="10pt" font-size="10pt">
        <fo:table table-layout="fixed" width="100%">
            <fo:table-column column-width="20pt"/>
            <fo:table-column column-width="140pt"/>
            <fo:table-column column-width="80pt"/>
            <fo:table-column column-width="110pt"/>
            <fo:table-column column-width="70pt"/>
            <fo:table-column column-width="70pt"/>
            <fo:table-header>
                <fo:table-row font-weight="bold">
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block>S/No</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block>Staff Names</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block>Payroll</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block>Skill Name</fo:block>
                    </fo:table-cell>

                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block>Years in Experience</fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                        <fo:block>Skill Level</fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
             <#assign count=0>
                  <#list employee as dep>
                    <#if dep.partyId?has_content>
                        <#assign staff = delegator.findOne("Person", {"partyId" : dep.partyId}, false)/>
                    </#if>
                     <fo:table-row>
                        <#assign count = count + 1>
                        
                        <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block font-size="8pt">${count}</fo:block>
                         </fo:table-cell>
                         
                        <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${staff.firstName?if_exists} ${staff.lastName?if_exists}</fo:block>
                        </fo:table-cell>
                        
                         <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${staff.employeeNumber?if_exists}</fo:block>
                        </fo:table-cell>
                        
                         <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${partyskill.description?if_exists} </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${dep.yearsExperience?if_exists}</fo:block>
                        </fo:table-cell>
                         <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                            <fo:block>${dep.skillLevel?if_exists}</fo:block>
                        </fo:table-cell>
                         
                     </fo:table-row>
                  </#list>
            </fo:table-body>
        </fo:table>
    </fo:block>
     <#else>
     <fo:block space-after.optimum="10pt" >
        <fo:block text-align="center" font-size="14pt">No Employee Found </fo:block>
    </fo:block>
  </#if>
    <#else>
        <fo:block text-align="center">No Employees Found With that ID</fo:block>
    </#if>
</#escape>


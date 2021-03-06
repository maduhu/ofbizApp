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
    <#if myGuarantorList?has_content>
        <#-- REPORT TITLE -->
        <#-- fo:block font-size="18pt" font-weight="bold" text-align="center">
            CHAI SACCO
        </fo:block -->
        <fo:block font-size="12pt" text-align="center"  font-weight="bold" >
           Guarantor Listing
        </fo:block>
        <fo:block><fo:leader/></fo:block>
        <fo:block margin-left="0.4in" text-decoration="underline" font-size="10pt" text-align="left"  font-weight="bold" >
        <#--   ${stationName} :  Expected Vs Received Totals for ${month} -->
        </fo:block>


        <#-- fo:list-block provisional-distance-between-starts="2in" font-size="10pt" margin-left="0.2in">
            <fo:list-item>
                <fo:list-item-label>
                    <fo:block font-weight="bold">Member:</fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="body-start()">
                    <fo:block>${member.firstName} ${member.middleName} ${member.lastName}</fo:block>
                </fo:list-item-body>
            </fo:list-item>
            <fo:list-item>
                <fo:list-item-label>
                    <fo:block font-weight="bold">ID Number:</fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="body-start()">
                    <fo:block>${member.idNumber?if_exists}</fo:block>
                </fo:list-item-body>
            </fo:list-item>
            <fo:list-item>
                <fo:list-item-label>
                    <fo:block font-weight="bold">Payroll Number:</fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="body-start()">
                    <fo:block>${member.payrollNumber?if_exists}</fo:block>
                </fo:list-item-body>
            </fo:list-item>
            
        </fo:list-block -->
        <fo:block><fo:leader/></fo:block>
        <#-- Loan Details -->
        <fo:block space-after.optimum="10pt" font-size="9pt">
            <fo:table table-layout="fixed" width="100%">
            	<fo:table-column column-width="20pt"/>
                <fo:table-column column-width="40pt"/>
                <fo:table-column column-width="40pt"/>
                <fo:table-column column-width="70pt"/>
                <fo:table-column column-width="55pt"/>
                <fo:table-column column-width="55pt"/>
                <fo:table-column column-width="65pt"/>
                
                <fo:table-column column-width="60pt"/>
                <fo:table-column column-width="30pt"/>
                <fo:table-column column-width="60pt"/>
                <fo:table-column column-width="100pt"/>
                <#-- fo:table-column column-width="50pt"/>
                <fo:table-column column-width="60pt"/>
                <fo:table-column column-width="60pt"/>
                <fo:table-column column-width="60pt"/ -->
                <#--fo:table-column column-width="60pt"/>
                <fo:table-column column-width="60pt"/ -->
                <fo:table-header>
                    <fo:table-row font-weight="bold">
                    	<fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block></fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Loan No</fo:block>
                        </fo:table-cell>

                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Member No</fo:block>
                        </fo:table-cell>


                        
                         <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Station</fo:block>
                        </fo:table-cell>


                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Loan Amount</fo:block>
                        </fo:table-cell>
                        
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Loan Balance</fo:block>
                        </fo:table-cell>
                        
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Disbursement Date</fo:block>
                        </fo:table-cell>
                        
                         <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Loan Status</fo:block>
                        </fo:table-cell>
                        
                         <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Guarantor Member No</fo:block>
                        </fo:table-cell>
                        
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Guarantor Status</fo:block>
                        </fo:table-cell>
                        
                        <fo:table-cell padding="0pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Guarantor</fo:block>
                        </fo:table-cell>
                        <#-- fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Terms of Service</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Expected</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Received</fo:block>
                        </fo:table-cell>
                         <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Variance</fo:block >
                        </fo:table-cell -->
                        <#-- fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Insurance Due</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Insurance Paid</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Principal Due</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="2pt" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:block>Principal Paid</fo:block>
                        </fo:table-cell -->
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                	<#assign count=0>
                	<#-- <#assign totalExpected=0>
                	<#assign totalReceived=0>
                	<#assign totalVariance=0>
                	assign totalDisbursed=0 -->
                	
                    <#list myGuarantorList as myGuarantorItem>
                        <fo:table-row>
                        	<#assign count = count + 1>
                        	<fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block>${count}</fo:block>
                            </fo:table-cell>
                            <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block>${myGuarantorItem.loanNo?if_exists}</fo:block>
                            </fo:table-cell>
                            
                            <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block>
                                  ${myGuarantorItem.memberNumber?if_exists}
                                </fo:block>
                            </fo:table-cell>
                            
                            <#-- fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block>${myGuarantorItem.name?if_exists}</fo:block>
                            </fo:table-cell -->

                            
                            <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block text-align="left">
								
								<#assign stationId = myGuarantorItem.stationId />
                              <#assign stationIdString = stationId.toString() />
                              <#assign station = delegator.findOne("Station", Static["org.ofbiz.base.util.UtilMisc"].toMap("stationId", stationIdString), true)/>
                                <#-- if (expectation.totalAmount??)>
								    Kshs.  ${expectation.totalAmount?string(",##0.0000")} 
								    ${station.stationNumber} 
								</#if -->
								${station.name}
								
                               </fo:block>
                            </fo:table-cell>
                            
                            <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block text-align="right">
								${myGuarantorItem.loanAmt?string(",##0.00")}
                               </fo:block>
                            </fo:table-cell>
                            
                            <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
								                           
                                <fo:block text-align="right"> 
                                <#assign loanBalance = myGuarantorItem.loanAmt - Static["org.ofbiz.loans.LoanServices"].getLoansRepaidByLoanApplicationId(myGuarantorItem.loanApplicationId)>
                                <#-- assign totalLoans = totalLoans+loanBalance -->
                                <#-- ${expectation.remitanceDescription?if_exists} --> 
                                ${loanBalance?string(",##0.0000")}
                                </fo:block>
                            </fo:table-cell>
                            
                                   <#-- assign totalExpected = totalExpected+expectedReceived.expected>
                            <#assign totalReceived = totalReceived+expectedReceived.received>
                            <#assign totalVariance = totalVariance+expectedReceived.variance -->
                           <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block text-align="left">
                                <#if myGuarantorItem.disbursementDate?exists>
								${myGuarantorItem.disbursementDate?date}
								</#if>
                               </fo:block>
                            </fo:table-cell>
                            
                            
                            <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block text-align="left">
                              <#assign loanStatus = delegator.findOne("LoanStatus", Static["org.ofbiz.base.util.UtilMisc"].toMap("loanStatusId", myGuarantorItem.loanStatusId), true)/>
                                <#-- if (expectation.totalAmount??)>
								    Kshs.  ${expectation.totalAmount?string(",##0.0000")} 
								    ${station.stationNumber} 
								</#if -->
								
								<#if loanStatus.name == "FORWARDEDLOANS">
									LOANS
								</#if>
								
								<#if loanStatus.name != "FORWARDEDLOANS">
									${loanStatus.name}
								</#if>
								
								
                               </fo:block>
                            </fo:table-cell>
                            
                            <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block text-align="right">
								${myGuarantorItem.guarantorMemberNumber?if_exists}
                               </fo:block>
                            </fo:table-cell>
                            
                              <fo:table-cell padding="2pt" border="1pt solid" border-width=".1mm">
                                <fo:block text-align="left">
                              <#assign guarantorStatus = delegator.findOne("MemberStatus", Static["org.ofbiz.base.util.UtilMisc"].toMap("memberStatusId", myGuarantorItem.guarantorStatusId), true)/>
                                <#-- if (expectation.totalAmount??)>
								    Kshs.  ${expectation.totalAmount?string(",##0.0000")} 
								    ${station.stationNumber} 
								</#if -->
								${guarantorStatus.name}
								
                               </fo:block>
                            </fo:table-cell>
                            
                             <fo:table-cell padding="0pt" border="1pt solid" border-width=".1mm">
                                <fo:block text-align="left">
                              <#assign guarantor = delegator.findOne("Member", Static["org.ofbiz.base.util.UtilMisc"].toMap("partyId", myGuarantorItem.guarantorId), true)/>
                                
								${guarantor.firstName?if_exists} ${guarantor.lastName?if_exists} 
								
                               </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        
                    </#list>
                    
                </fo:table-body>
            </fo:table>
        </fo:block>

    <#else>
        <fo:block text-align="center">NO DATA FOUND</fo:block>
    </#if>
</#escape>
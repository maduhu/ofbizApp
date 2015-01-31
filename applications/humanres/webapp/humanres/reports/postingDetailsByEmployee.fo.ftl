<#escape x as x?xml>
    <#if postings?has_content>
        <#-- REPORT TITLE -->
        <fo:block font-size="18pt" font-weight="bold" text-align="center">
            CHAI SACCO
        </fo:block>
        <fo:block font-size="12pt" text-align="center"  font-weight="bold" >
            STAFF POSTINGS REPORT
        </fo:block>
        <fo:block><fo:leader/></fo:block>
        <#-- Employee Details -->
        
            <fo:block space-after.optimum="10pt" font-size="8pt">
            <fo:table>
                <fo:table-column column-width="70pt"/>
                <fo:table-column column-width="70pt"/>
                <fo:table-column column-width="70pt"/>
                <fo:table-column column-width="70pt"/>
                <fo:table-column column-width="70pt"/>
                <fo:table-column column-width="70pt"/>
                <fo:table-column column-width="70pt"/>
                <fo:table-header>

                    <fo:table-row font-weight="bold" background-color="#D4D0C8" border="1pt solid" border-width=".1mm">
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>Employee No</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>First Name</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>Last Name</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>Branch</fo:block></fo:table-cell>                            
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>Department</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>From</fo:block></fo:table-cell>                            
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>To</fo:block></fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <#assign rowColor = "white">
                    <#list postings as postings>
                    	<#assign branch = delegator.findOne("PartyGroup", {"partyId" : postings.branchId}, false)/>
                    	<#assign dept = delegator.findOne("department", {"departmentId" : postings.departmentId}, false)/>
                        <fo:table-row>
                        
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${employee.employeeNumber?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${employee.firstName?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${employee.lastName?if_exists}</fo:block>
                                </fo:table-cell>
                                 <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${branch.groupName?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${dept.departmentName?if_exists}</fo:block>
                                </fo:table-cell>
                                 <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${postings.fromDate?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${postings.thruDate?if_exists}</fo:block>
                                </fo:table-cell>
                         </fo:table-row>
                        <#-- toggle the row color -->
                        <#if rowColor == "white">
                            <#assign rowColor = "#D4D0C8">
                        <#else>
                            <#assign rowColor = "white">
                        </#if>
                    </#list>
                </fo:table-body>
            </fo:table>
            </fo:block>
        <#else>
        <fo:block text-align="center">NO DATA FOUND</fo:block>
    </#if>
</#escape>
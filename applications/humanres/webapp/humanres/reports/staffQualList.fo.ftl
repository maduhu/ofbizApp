<#escape x as x?xml>
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

<#-- do not display columns associated with values specified in the request, ie constraint values -->
<#assign showSupplier = !parameters.supplierId?has_content>

<fo:layout-master-set>
    <fo:simple-page-master master-name="main" page-height="8.5in" page-width="11in"
            margin-top="0.5in" margin-bottom="1in" margin-left="1in" margin-right="1in">
        <fo:region-body margin-top="1in"/>
        <fo:region-before extent="1in"/>
        <fo:region-after extent="1in"/>
    </fo:simple-page-master>
</fo:layout-master-set>
<#if security.hasEntityPermission("ORDERMGR", "_SALES_ENTRY", session)>

<#if qualList?has_content>
        <fo:page-sequence master-reference="main">
        <fo:flow flow-name="xsl-region-body" font-family="Helvetica">
            <fo:block font-size="14pt">STAFF QUALIFICATIONS REPORT</fo:block>
            <#if !showSupplier>
                <#-- <fo:block font-size="10pt">Payslip For: ${parameters.partyId} - ${payslipViewList.get(0).name?if_exists}</fo:block> -->
            </#if>
            <fo:block space-after.optimum="10pt" font-size="8pt">
            <fo:table>
                <fo:table-column column-width="70pt"/>
                <fo:table-column column-width="70pt"/>
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
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>Qual Type</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>Title</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>Specialization</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>Institute</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>From</fo:block></fo:table-cell>
                            <fo:table-cell border-bottom="thin solid grey"><fo:block>To</fo:block></fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <#assign rowColor = "white">
                    <#list qualList as qualList>
                        <fo:table-row>
                        
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.employeeNumber?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.firstName?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.lastName?if_exists}</fo:block>
                                </fo:table-cell>
                                 <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.partyQualType?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.qualTitle?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.specialization?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.qualInstitute?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.qualfromDate?if_exists}</fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="2pt" background-color="${rowColor}">
                                    <fo:block>${qualList.qualthruDate?if_exists}</fo:block>
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
        </fo:flow>
        </fo:page-sequence>
<#else>
    <fo:page-sequence master-reference="main">
    <fo:flow flow-name="xsl-region-body" font-family="Helvetica">
        <fo:block font-size="14pt">
            No Staff Qualification List
        </fo:block>
    </fo:flow>
    </fo:page-sequence>
</#if>

<#else>
    <fo:block font-size="14pt">
        ${uiLabelMap.OrderViewPermissionError}
    </fo:block>
</#if>

</fo:root>

</#escape>

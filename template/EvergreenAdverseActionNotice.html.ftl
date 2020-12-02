<#assign seq = ['Insufficient income for amount of credit requested', 'Length of employment', 'Temporary or irregular employment', 'Insufficient number of credit references provided', 'Property taxes not paid as agreed', 'Poor credit performance with us', 'Temporary residence', 'Length of residence', 'Residence not within our current lending territory', 'Unable to verify all income', 'Unable to verify employment', 'Unable to verify property is primary residence of all applicants', 'Unable to verify all applicants have an ownership interest in property to be improved', 'All applicants not in title to property or lack ownership interest', 'Reverse mortgage lien exists on property', '3 rd mortgage position not acceptable','Value or type of collateral insufficient','Property type to be improved is ineligible','Terms requested not offered','Amount requested ineligible for unsecured credit','Ineligible for additional credit with lender','Mortgage or credit insurance denied','Incomplete application/requested information not provided', 'Other']>
<#assign showBasedDecision = false>
<#assign noCreditFile = false>

<#if applicantCreditScore??>
    <#assign creditScoreNum = applicantCreditScore?replace(",", "")?number>
     <#if applicantCreditScore == 0>
        <#assign noCreditFile = true>
    </#if>
    <#if creditScoreNum gt 8999>
        <#assign applicantCreditScore = 'N/A'>
    </#if>
</#if>

<div>
    <style>
        .contentBody {
            margin: auto;
            width: 600px;
            padding: 24px;
            font-size: 16px;
            line-height: 24px;
        }
        .headerImage {
            max-width: 300px;
            max-height: 75px;
            width: auto;
            height: auto;
        }
        .orderData {
            display: flex;
            justify-content: space-between;
        }
        
        .box {
            border: 1px solid black;
        }

        .big-blue {
            font-size: 1.5em;
            color: #0070c0;
        }

        .parts-field {
            margin: 25px 0;
        }

        .borderBottom {
            width: 280px;
            border-bottom: 1px solid black;
        }

        .center {
            text-align: center;
        }

        .fields {
            text-decoration: underline;
        }

        p {
            margin: 0;
        }

        ol {
            counter-reset: list;
        }

        ol>li {
            list-style: none;
        }

        ol>li:before {
            content: counter(list) ") ";
            counter-increment: list;
        }

        ul {
            margin: 3px;
        }

        .tg {
            margin: 20px 0;
        }

        .tg-oky {
            padding-left: 43px;
        }
        .tg-pky {
            padding-left: 58px;
        }
        .tg-mky {
            padding-left: 30px;
        }
        .tg-bky {
            padding-left: 30px;
        }
         @media only screen and (max-width: 1024px) {
            .contentBody {
                width: 85%;
            }
        }
    </style>
 
 <div class="contentBody">  
    <div>
    <#if bankLogo??>
        <img src="${bankLogo}" alt="Bank Logo" class="headerImage" />
    </#if>
    </div>
    <div class="orderData">
        <div>
            <p><b>Contractor: ${storeMerchantName!"-"}</b></p>
        </div>
        <div>
            <p>Date Denied: ${adverseActionDate}</p>
            <p>Application #: ${orderId!"-"}</p>
        </div>
    </div>
    <br/>
    <div>
        <p><b>Applicants: </b></p>
        <div>
            ${(customerFullName)!"-"} <br />
            ${(customerAddress1)!"-"} ${(customerAddress2)!" "} <br />
            ${(customerCity)!"-"} ${(customerState)!"-"} ${(customerPostalCode)!"-"}
        </div>
    </div>
        <br />

        <p class="center" style="margin: 20px 0;">Notice of Action Taken and Statement of Reasons</p>
        <div class="box" style="padding: 15px 7px;">
            <p>Description of Transaction or Requested Credit: <b>Home Improvement Loan
                    Application</b></p>
            <p style="margin: 5px 0 0 50px;">Description of Action Taken: <b
                    class="big-blue"><u>Credit Denial</b></u></p>
            <br>
            <p>Thank you for recently submitting a loan application, which we carefully considered.
                We regret that we are unable to approve the application for the principal reasons
                listed below.</p>
        </div>
        <p class="parts-field"><b>Part I - Principal Reason(s) for Credit Denial, Termination, or
                Other Action Taken Concerning Credit</b></p>
        <#list adverseActionReasons>
            <ol>
                <#items as adverseActionReason>
                    <#if adverseActionReason != "Other">
                        <li>${adverseActionReason}</li>
                    </#if>
                    <#if seq?seq_contains(adverseActionReason)>
                        <#assign showBasedDecision = true>
                    </#if>
                    <#if adverseActionReason == "No credit file">
                        <#assign noCreditFile = true>
                    </#if>
                </#items>
            </ol>
        </#list>
        <p class="parts-field"><b>Part II - Disclosure of Use of Information Obtained From an
                Outside Source</b></p>
        <p> <#if applicantCreditScore??><b>X</b><#else>__</#if> Our credit decision
            was based in whole or in part on information obtained in a report from the consumer
            reporting agency listed below. You have a right under the Fair Credit Reporting Act to
            know the information contained in your credit file at the consumer reporting agency. The
            reporting agency played no part in our decision and is unable to supply specific reasons
            why we have denied credit to you. You also have a right to a free copy of your report
            from the reporting agency, if you request it no later than 60 days after you receive
            this notice. In addition, if you find that any information contained in the report you
            receive is inaccurate or incomplete, you have the right to dispute the matter with the
            reporting agency.</p>

        
            <div class="tg">
                <div>
                    <div class="tg-bky">Name:<span class="tg-pky">Experian</span></div>
                </div>
                <div>
                    <div class="tg-bky">Address:<span class="tg-oky">702 Experian Parkway, PO Box 2002, Allen, TX 75013</span></div>
                </div>
                <div>
                    <div class="tg-bky">Telephone:<span class="tg-mky">(888) 397-3742</span></div>
                </div>
            </div>

        <p>We also obtained your credit score from this consumer reporting agency and used it in
            making our credit decision. Your credit score is a number that reflects the information
            in your consumer report. Your credit score can change, depending on how the information
            in your consumer report changes.</p>
        <br>
        <div style="margin-left: 30px;">
            <p><b>Your credit score: 
                <#if noCreditFile>
                    no score available
                    <#else>
                    ${applicantCreditScore!"no score available"}
                </#if> 
            </b></p>
            <p>Date of credit score: ${dateCreditPulled!"-"}</p>
            <p>Scores range from a low of 300 to a high of 850</p>
            <p style="page-break-before: always">
            <p>Key factors that adversely affected your credit score:</p>
            <#if noScoreReason??>
                <ul>
                    <li>
                        <u>Not Scored: ${noScoreReason}</u>
                    </li>
                </ul>
            </#if>
            <#if noCreditFile || !applicantCreditScore??>
                <ul>
                    <li>No record found.</li>
                </ul>
            </#if>
            <#list creditScoreFactors>
                <ul>
                    <#items as creditScoreFactor>
                        <li>${creditScoreFactor}</li>
                    </#items>
                </ul>
            </#list>
        </div>
        <br>
        
        <p><#if showBasedDecision><b>X</b><#else>__</#if> Our credit decision
            was based in whole or in part on information obtained from an affiliate or from an
            outside source other than a consumer reporting agency. Under the Fair Credit Reporting
            Act, you have the right to make a written request, no later than 60 days after you
            receive this notice, for disclosure of the nature of this information.</p>
        <br>
        
        <p><i>If you have any questions regarding this notice, you should contact:</i></p>
        <p>Creditor's name: Evergreen Bank Group</p>
        <p>Creditor's address: 1515 W. 22ND Street, Suite 100W, Oak Brook, IL 60523</p>
        <p>Creditor's telephone number: (888) 505-2265</p>
        <br>
        <p><b>Notice:</b> The federal Equal Credit Opportunity Act prohibits creditors from
            discriminating against credit applicants on the basis of race, color, religion, national
            origin, sex, marital status, age (provided the applicant has the capacity to enter into
            a binding contract); because all or part of the applicant's income derives from any
            public assistance program; or because the applicant has in good faith exercised any
            right under the Consumer Credit Protection Act. The federal agency that administers
            compliance with this law concerning this creditor is: FDIC Consumer Response Center,
            1100 Walnut St, Box #11, Kansas City, MO 64106</p>
        <br>
        <p>This notification is provided by Evergreen Bank Group and sent to each applicant on
            ${fourteenthBusinessDay?date?string["MM/dd/yyyy"]!"-"}<#-- This date is equal to 14 calendar days from the adverseActionDate, but if the calculated date lands on a weekend or a federal holiday, then days are added untli the next business day is reached -->
        </p>
    </div>
</div>

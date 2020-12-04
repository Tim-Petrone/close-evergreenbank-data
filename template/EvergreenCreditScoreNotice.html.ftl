<#if customerAddress??>
    <#if customerAddress.address1?? && customerAddress.address1 != ''>
        <#assign addressLine1 = '${(customerAddress.address1)!""} ${(customerAddress.address2)!""}'>
    </#if>
    <#if customerAddress.city?? && customerAddress.city != ''>
        <#assign addressLine2 = '${(customerAddress.city + ",")!""} ${(customerAddress.stateAbbr)!""} ${(customerAddress.postalCode)!""}'>
    </#if>
    <#assign customerAddress = '${(addressLine1 + "<br/>")!""} ${(addressLine2)!""}'>
</#if>

<#if dateCreditPulled?? && creditProfileStatus != 'FileStatusFrozen' && creditProfileStatus != 'FileStatusNotFound'>
    <#assign showCreditPulled = true>
</#if>

<#if applicantCreditScore??>
    <#assign creditScoreNum = applicantCreditScore?replace(",", "")?number>
    <#if creditScoreNum gt 8999>
      <#assign applicantCreditScore = 'N/A'>
    </#if>
</#if>

<#--  Find a better way to distinguish secured vs unsecured  -->
<#assign isSecured = false>

<div>
  <style>
      .header {
        font-weight: bold;
        text-align: center;
        margin-bottom: 1em;
      }
      .spaceBetween {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        margin-bottom: 1em;
      }
      .table, .border{
        width: 100%;
      }
      .table, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
      }
      .table td:first-child {
        background-color: #e7e3e7;
        width: 120px;
        vertical-align: baseline;
      }
      .noBorder td {
        border: none;
        padding: 0px;
        vertical-align: baseline;
      }
      .noBorder td:first-child {
        background-color: transparent;
      }
      .noBorder span{
        margin-left: 100px;
      }
      .tableHeader{
       color: white;
       padding-left: 10px;
       border: 1px solid black;
       background-color: black;
      }
      .border{
        border: 1px solid black;
      }
  </style>

  <div>
      <div class="header">
        EVERGREEN BANK GROUP<br/>
        Credit Scores and the Price You Pay for Credit
      </div>

      <div class="spaceBetween">
        <div>
          ${customer.partyName!""} <br/>
          ${customerAddress!"-"}
        </div>
      </div>

      <#if showCreditPulled??>
        <p style="page-break-before: always">
          <table class="table">
            <tbody>
              <div class="tableHeader">Your Credit Score</div>
              <tr>
                <td>Your Credit Score</td>
                <td>
                  <table class="noBorder">
                    <tr>
                      <td><b>${applicantCreditScore!"-"}</b></td>
                      <td style="padding-right: 20px;">Source: <b>Experian</b></td>
                      <td>Date: <b>${dateCreditPulled!"-"}</b></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
          <br/>
          <table class="table">
            <tbody>
              <div class="tableHeader">Understanding Your Credit Score</div>
              <tr>
                <td>What you should know about credit scores</td>
                <td>
                  Your credit score is a number that reflects the information in your credit report. Your credit report is a record of your credit history. It includes information about whether you pay your bills on time and how much you owe to creditors. Your credit score can change, depending on how your credit history changes.
                </td>
              </tr>
              <tr>
                <td>How we use your credit score</td>
                <td>Your credit score can affect whether you can get a loan and how much you will have to pay for that loan.</td>
              </tr>
              <tr>
                <td>The range of scores</td>
                <td>Scores range from a low of <b>300</b> to a high of <b>850</b>. Generally, the higher your score, the more
                    likely you are to be offered better credit terms.</td>
              </tr>
              <tr>
                <td>How your score compares to the scores of other consumers</td>
                <td>Your credit score ranks higher than <b>${scorePercentile!"-"}</b> percent of U.S. Consumers.</td>
              </tr>
            </tbody>
          </table>
          <br/>
          <#if isSecured>
            <table class="table">
              <tbody>
                <div class="tableHeader">Key Factor</div>
                <tr>
                  <td>Key <u>factors</u> that adversely affected your credit score</td>
                  <td>
                    <#list creditScoreFactors>
                      <ul>
                          <#items as creditScoreFactor>
                          <li><b>${creditScoreFactor}</b></li>
                          </#items>
                      </ul>
                      </#list>
                  </td>
                </tr>
              </tbody>
            </table>
          </#if>
      <#else>
        <table class="table">
          <tbody>
            <div class="tableHeader">Your Credit Score</div>
            <tr>
              <td>Your Credit Score</td>
              <td><b>Your credit score is not available from Experian</b>, which is a consumer reporting agency, because they may not have enough information about your credit history to calculate a score.</td>
            </tr>
            <tr>
              <td>What you should know about credit scores</td>
              <td>A credit score is a number that reflects the information in a credit report. <br/>
                  A credit report is a record of your credit history. It includes information about whether you pay your bills on time and how much you owe to creditors. <br/>
                  A credit score can change, depending on how a consumer’s credit history changes.
              </td>
            </tr>
            <tr>
              <td>Why credit scores are important</td>
              <td>Credit scores are important because consumers who have higher credit scores generally will get more
                  favorable credit terms. <br/>
                  Not having a credit score can affect whether you can get a loan and how much you will have to pay
                  for that loan.
              </td>
            </tr>
            <tr>
          </tbody>
        </table>
      </#if>
      <br/>
      <table class="table">
        <tbody>
            <div class="tableHeader">Checking Your Credit Report</div>
            <td>What if there are mistakes in your credit report?</td>
            <td>
              You have a right to dispute any inaccurate information in your credit report. If you find mistakes on your credit report, contact the consumer reporting agency. <br/>
              It is a good idea to check your credit report to make sure the information it contains is accurate.
          </td>
          </tr>
          <tr>
            <td>How can you obtain a copy of your credit report?</td>
            <td>Under federal law, you have the right to obtain a free copy of your credit report from each
                of the nationwide consumer reporting agencies once a year.<br/>
              <table class="noBorder">
                <br/>
                <tr>To order your free annual credit report-</tr>
                <tr>
                  <td><i>By telephone:</i></td>
                  <td>Call toll-free: (800) 831-5614</td>
                </tr>
                <tr>
                  <td><i>On the web:</i></td>
                  <td>Visit <u>www.annualcreditreport.com</u></td>
                </tr>
                <tr>
                  <td><i>By mail:</i></td>
                  <td>Mail your completed Annual Credit Report Request Form (which you can obtain from the Federal Trade Commission’s website at <u>http://www.ftc.gov/bcp/conline/include/requestformfinal.pdf)</u> to:<br/><span>Annual Credit Report Request Service</span><br/><span>P.O. Box 105281</span><br><span>Atlanta, GA 30348-5281</span></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>How can you get more information?</td>
            <td>For more information about credit reports and your rights under Federal law, visit the
              Consumer Financial Protection Bureau’s website at <u>www.consumerfinance.gov/learnmore</u>.</td>
          </tr>
        </tbody>
      </table>
      <#if isSecured>
        <p style="page-break-before: always">
        <div class="header">
        Notice To The Home Loan Applicant
        </div>
        <p>
          In connection with your application for a home loan, the lender must disclose to you the score that a
          consumer reporting agency distributed to users and the lender used in connection with your home loan,
          and the key factors affecting your credit scores.
        </p>
        <p>
          The credit score is a computer-generated summary calculated at the time of the request and based on
          information that a consumer reporting agency or lender has on file. The scores are based on data about
          your credit history and payment patterns. Credit scores are important because they are used to assist
          the lender in determining whether you will obtain a loan. They may also be used to determine what
          interest rate you may be offered on the mortgage. Credit scores can change over time, depending on
          your conduct, how your credit history and payment patterns change, and how credit scoring
          technologies change.
        </p>
        <p>
          Because the score is based on information in your credit history, it is very important that you review
          the credit-related information that is being furnished to make sure it is accurate. Credit records may
          vary from one company to another.
        </p>
        <p>
          If you have questions about your credit score or the credit information that is furnished to you, contact
          the consumer reporting agency at the address and telephone number provided with this notice, or
          contact the lender, if the lender developed or generated the credit score. The consumer-reporting
          agency plays no part in the decision to take any action on the loan application and is unable to provide
          you with specific reasons for the decision on a loan application.
        </p>
        <p>
          If you have questions concerning the terms of the loan, contact the lender.
        </p>
       
        <table class="table">
            <tr>
            <td style="background-color: white;">The consumer credit reporting agency who provided the credit score or other credit information used in
              connection with your loan is:<br/>
              <table style="margin-left: 50px;" class="noBorder">
                <br/>
                </tr>
                  <tr>
                  <td>Name:</td>
                  <td>Experian</td>
                </tr>
                <tr>
                  <td>Address:</td>
                  <td>702 Experian Parkway, PO Box 2002</td>
                </tr>
                <tr>
                  <td>City, ST, Zip:</td>
                  <td>Allen, TX 75013</td>
                </tr>
                <tr>
                  <td>Telephone:</td>
                  <td>(888) 397-3742</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </#if>
  </div>
</div>

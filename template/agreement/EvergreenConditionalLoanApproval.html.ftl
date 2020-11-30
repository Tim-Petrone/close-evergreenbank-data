<#assign primaryPerson = primaryApplicant.person!"-">
<#assign propertyPostalAddress = primaryApplicant.personAddresses[0]!"-">
<#if coApplicant??>
  <#assign coAppPerson = coApplicant.person!"-">
</#if>
<#assign securedAgreements = ['Electronic Signature Agreement', 'Credit Application for Home Improvement', 'Notice of Intent to Proceed', 'Stage Funding Form', 'Authorization and Certification', 'Note for Secured', 'Mortgage form', 'KY Homeownership', 'Signature Affidavit/Name Affidavit', 'Completion Certificate', '0% Form']>
<#assign unsecuredAgreements = ['Electronic Signature Agreement', 'Credit Application for Home Improvement', 'Stage Funding Form', 'Authorization and Certification', 'Note for Unsecured', 'Completion Certificate', '0% Form']>
<#assign nowTimestamp = .now>

<#assign nineDaysInMilliSec = (1000 * 60 * 60 * 24 * 9) >
<#assign nineDaysCalc = nowTimestamp?long + nineDaysInMilliSec?long>
<#assign nineDaysFromNow = nineDaysCalc?long?number_to_date>

<#assign currencyFormat = ",##0.00">
<#list loanFeatures as loanFeature>
  <#if loanFeature.productFeatureId == "InterestRate">
    <#assign interestRate = loanFeature.amount!"-">
  </#if>
  <#if loanFeature.productFeatureId == "PaymentFactor">
    <#assign paymentFactor = loanFeature.amount!"-">
  </#if>
  <#if loanFeature.productFeatureId == "InstallmentTerm">
    <#assign numOfPayments = loanFeature.amount!"-">
  </#if>
</#list>
<#assign totalPaymentAmount = ((loanPayment.monthlyPayment)*numOfPayments)!0> 
<#assign thirtyDays = 30?long>

<#assign productSplit = loanProduct.productName?split(" ")>
<#assign amountAndFee = loanFee?number + orderItem.unitAmount?replace(",", "")?number>

<div>
  <style>
    .contentBody {
      margin: auto;
      padding: 24px;
      font-size: 16px;
      line-height: 24px;
    }
    .wrapper {
      display: grid;
      grid-template-columns: repeat(2, minmax(50%, 100%));
      border-top: 3px solid black;
      border-left: 3px solid black;
    }

    .wrapper > div {
      border-bottom: 3px solid black;
      border-right: 3px solid black;
    }
    .wrapper > div > div {
      padding: 6px;
    }
    .payment-amount {
      margin-bottom: 0;
    }
    .contract-wrapper {
      display: flex;
      justify-content: space-between;
    }
    .customer-box {
      display: inline-block;
      text-align: left;
    }
    .rate-term > p {
      font-size: 0.9rem;
      margin-bottom: 0;
    }
    .offer-note {
      border-top: 3px solid black;
      font-size: 0.9rem;
      margin-top: 1em;
    }
    .floor-walls {
      border-left: 3px solid black;
      border-bottom: 3px solid black;
      border-right: 3px solid black;
    }
    .heading {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .outter-box {
      border: 3px black solid;
      padding: 1em;
    }
    .lender-box {
      border-bottom: 1px black solid;
      margin-bottom: 2px;
    }
    .contractor-box {
      border-top: 1px black solid;
      border-bottom: 1px black solid;
    }
    .borrower-box {
      border-top: 1px black solid;
      margin-top: 2px;
    }
    .white-black {
      background: black;
      color: white;
      padding: 0.3em;
      font-size: 1.1em;
    }
    .styled-p {
      margin: 0;
      padding: 0.5em;
    }
    @media only screen and (max-width: 1024px) {
      .contentBody {
          width: 85%;
      }
    }
  </style>

  <div class="contentBody">
    <div class="heading">
      <h2 style="margin: 0.3em 0">Conditional Loan Approval</h2>
      <b>Application # ${orderId!"-"}</b>
    </div>
    <div class="wrapper">
      <div>
        <div class="lender-box">
          From/Lender:
          <div style="text-align: center">
            <div style="display: inline-block; text-align: left">
              <#if storeLogo??>
                <img src="${storeLogo}" alt="Bank Logo" class="headerImage" />
              </#if>
              1515 West 22nd Street, Suite 100W<br />
              Oak Brook, IL 60523<br />
              Ph: (630) 413-9580 FAX: (630) 686-1190
            </div>
          </div>
        </div>
        <div class="contractor-box">
          Contractor: ${referrer.storeName!"-"}
                <div style="display: flex; justify-content: space-around;">
                  <span>Ph:  (${dealerContactInfo.telecomNumber.areaCode!"-"})${dealerContactInfo.telecomNumber.contactNumber!"-"}</span>
                  <span>
                    FAX:
                  </span>
                </div>
        </div>
        <div class="borrower-box">
          Borrowers:
          <div style="text-align: center;">
          <br />
          <div class="customer-box">
              ${primaryPerson.firstName!"-"} ${primaryPerson.lastName!"-"}<br />
              <#if coApplicant??>
                ${coAppPerson.firstName} ${coAppPerson.lastName}<br />
              </#if>
              ${propertyPostalAddress.address1!"-"} ${propertyPostalAddress.address2!""}<br />
              ${propertyPostalAddress.city!"-"}, ${propertyPostalAddress.state!"-"}
              ${propertyPostalAddress.postalCode!"-"}
            </div>
          </div>
        </div>
      </div>
      <div>
        <div class="contract-wrapper">
          <div class="payment-amount">
            <table style="padding-top: 1em">
              <th id="header"></th>
              <tbody>
                <tr>
                  <td><b>MONTHLY PAYMENT:</b></td>
                  <td style="padding-left: 1em">
                    ${(loanPayment.monthlyPayment?string.currency)!"-"}
                  </td>
                </tr>
                <tr></tr>
                <tr>
                  <td><b>LOAN AMOUNT:</b></td>
                  <td style="padding-left: 1em">
                    ${amountAndFee?string.currency!"-"}
                  </td>
                </tr>
              </tbody>
            </table>
            <span style="font-size: 0.7rem">(includes fees, if any)</span>
          </div>
          <div class="rate-term">
            <p>RATE: ${paymentFactor*100!"-"}%</p>
            <p><b>APR: ${interestRate*100!"-"}%</b></p>
            <p>Term: ${numOfPayments!"-"} mo</p>
          </div>
        </div>
        <div style="font-size: 0.9rem">
          <p style="margin-top: 0">
          <#--  The 30 days may change to a dynamic number at a later time as this could be implemented 30 days plus 90 for certain orders   -->
            <b>1st PAYMENT DUE DATE:</b> ${thirtyDays} days after loan disbursement. (Please
            note: The exact 1st payment date will depend on when all
            requirements are satisfied so that loan may disburse.)
          </p>
          <p style="margin-bottom: 0">
            Loan purpose: for home improvements at Borrower's primary residence.
          </p>
        </div>
        <div class="offer-note">
          WE OFFER: no prepayment penalty, affordable fixed monthly payments, no
          appraisal fee, convenient in-home financing, contractors may submit
          on-line credit applications 24/7 and track statuses using any
          Internet-connected device. Unsecured and secured loans available. The
          interest on secured home improvement loans is sometimes tax deductible
          so Borrowers may wish to consult a tax preparer.
        </div>
      </div>
    </div>
    <div class="floor-walls">
      <p class="styled-p">
        This is a Conditional Loan Approval that is subject to requirements
        Lender must receive to its satisfaction, in order to fund. Contractor is
        to assist Borrowers in submitting the requirements and several loan
        forms to make the loan process easy and convenient for Borrowers
      </p>
    </div>
    <#if loanProduct.productName?starts_with("Secured")>
      <div class="floor-walls">
        <p class="styled-p">
          <b style="font-size: 1.3rem"
            >LOAN DOCUMENTS MAY <u>NOT</u> BE SIGNED & DATED UNTIL ${nineDaysFromNow} OR AFTER.</b
          ><br />Why? Federal regulations require borrowers to wait a minimum
          number of days after receiving disclosures before they may sign and date
          loan closing forms for certain types of secured loans.
        </p>
      </div>
    </#if> 
    <div class="white-black">
      Requirements & verifications to be satisfied PRIOR to starting project
    </div>
    <div class="floor-walls">
       <ol style="margin: 0; padding-top: 1em; padding-bottom: 1em">
          <li>Paycheck stub from each current employer (dated within last 30 days)</li>
          <li>W-2 for last year for ${primaryPerson.firstName!"-"} ${primaryPerson.lastName!"-"}</li>
          <li>W-2s for last TWO years for ${primaryPerson.firstName!"-"} ${primaryPerson.lastName!"-"}</li>
          <#if coApplicant??>
            <li>W-2 for last year for ${coAppPerson.firstName} ${coAppPerson.lastName}</li>
            <li>W-2s for last TWO years for ${coAppPerson.firstName} ${coAppPerson.lastName}</li> 
          </#if>
          <li>Verify social security/disability income</li>
          <li>Verify pension income</li>
          <li>Personal tax return for last year (all pages)</li>
          <li>YTD Profit & Loss schedule for self-employment business</li>
          <li>Unexpired rental leases & tax return (including rent Schedule E) for last year</li>
          <li>IRA or 401K statement to confirm retirement income and balance</li>
          <li>Verify child support income & termination date (must show being received for at least 3 more years)</li>
          <li>1st mortgage statement copy (needed to confirm monthly payment, balance, and up-to-date)</li>
          <li>Verify adverse credit paid with: ______________________</li>
          <li>Verify accounts current with: ____________________</li>
          <li>Verify account(s) paid-in-full with: ____________________</li>
          <#if loanProduct.productName?starts_with("Secured")>
            <li>Copy of trust agreement (all pages)</li>
            <li>Homeowners Insurance declaration page</li>
            <li>Mortgage and Right to Cancel form to also be signed by: ____________________________</li>
          </#if>
          <li>Other: _________________________________</li>
          <li>Signed letter of explanation regarding: __________________________________________</li>
      </ol>
    </div>
    <div class="white-black">
      Forms required to be signed & completed for funding
    </div>
    <div class="floor-walls">
      <ol style="margin: 0; padding-top: 1em; padding-bottom: 1em">
        <li>Copy of signed work order</li>
        <li>Note</li>
        <li>Customer Acknowledgement Form (states 1st payment due date may be delayed and is based on actual date loan disburses)</li>
        <li>Loan application (with updated figures)</li>
        <li>Authorization to Release Information</li>
        <#if loanProduct.productName?starts_with("Secured")>
          <#list securedAgreements as agreement>
            <li>${agreement}</li>
          </#list>
        </#if>
        <#if loanProduct.productName?starts_with("Unsecured")>
          <#list unsecuredAgreements as agreement>
            <li>${agreement}</li>
          </#list>
        </#if>
      </ol>
    </div>
    <div class="floor-walls">
      <p class="styled-p">
        <u><b style="font-size: 1.2rem">Approval expires within 90 days</b> of the Approval Date shown below.</u>
        This means that should the loan not disburse before expiration and no
        extension is requested & obtained from lender, this credit request will
        be given no further consideration and will be closed. Also, bank may
        confirm completion with borrower before funding if loan is not
        staged-funded and scheduled to disburse once project is finished. <br />
        <b>Thank you for your business!</b> <br />
        <#--  TODO Once nmls is implemented for users this needs to be updated with the current user's NMLS number  -->
        <b>Evergreen Bank Group</b> (NMLS 456809) Loan underwriter: ${currentUserInfo.userFullName} (NMLS [NMLS#]) Approval Date: ${nowTimestamp?date?string["MM/dd/yyyy"]!"-"}
      </p>
    </div>
  </div>
</div>

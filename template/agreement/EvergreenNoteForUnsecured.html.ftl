<#assign primaryPerson = primaryApplicant.person!"-">
<#assign coAppPerson = (coApplicant.person)!>

<#--  Currency format and calculations  -->
<#assign currencyFormat = ",##0.00">
<#list loanFeatures as loanFeature>
  <#if loanFeature.productFeatureId == "InterestRate">
    <#assign interestRate = loanFeature.amount!"-">
  </#if>
  <#if loanFeature.productFeatureId == "InstallmentTerm">
    <#assign numOfPayments = loanFeature.amount!"-">
  </#if>
</#list>
<#assign totalPaymentAmount = ((loanPayment.monthlyPayment)*numOfPayments)!0>

<#--  Date calculations  -->
<#assign thirtyDays = 30?long>
<#assign thirtyDaysInMilliSec = (1000 * 60 * 60 * 24 * thirtyDays) >
<#assign thirtyDaysMinusDueDate = paymentDueDate?long - thirtyDaysInMilliSec?long>
<#assign thirtyDaysBeforeFirstDueDate = thirtyDaysMinusDueDate?long?number_to_date>

<#assign numberOfDaysFromYears = (365.4 * numOfPayments?number / 12)>
<#assign timeInMillisecondWithYears = (1000 * 60 * 60 * 24 * numberOfDaysFromYears) >
<#assign thisDate = paymentDueDate?long + timeInMillisecondWithYears?long>
<#assign SumOf = thisDate?long>
<#assign finalPaymentDate = SumOf?number_to_date>

<div>
  <style>
    .content {
      font-family: sans-serif;
      font-size: 12px;
      width: 100%;
    }

    @page {
      margin: 0.5in;
    }

    .name-address {
      display: flex;
      justify-content: space-evenly;
      margin: 25px 0;
    }

    .cell-title {
      font-weight: bold;
      text-transform: uppercase;
      text-align: center;
      margin: 5px;
    }

    .table {
      border-collapse: collapse;
    }

    .table,
    .table th,
    .table td {
      border: 1px solid black;
      padding: 5px 15px;
      font-size: 12px;
    }

    .white-border {
      border: 1px solid white;
    }

    table.white-border td {
      border: 1px solid white;
    }

    table.white-border td.border-bottom {
      border-bottom: 1px solid black;
    }

    .spaced {
      display: flex;
      justify-content: space-between;
      margin: 8px 0;
    }

    /* truth in lending disclosures table */
    table.truth-table {
      width: 100%;
      border-right: 5px solid black;
      border-left: 5px solid black;
      text-align: center;
    }

    table.truth-table tr.truth-header td {
      text-transform: uppercase;
      font-weight: bold;
    }

    table.truth-table td {
      border-bottom: 1px solid white;
      padding: 10px;
      max-width: 90px;
    }

    table.truth-table td.thick-border-cover {
      border-right: 5px solid black;
      border-left: 5px solid black;
      border-top: 5px solid black;
    }

    table.truth-table td.thick-border-under {
      border-right: 5px solid black;
      border-left: 5px solid black;
      border-bottom: 5px solid black;
    }

    table.truth-table td.thick-border-top {
      border-top: 5px solid black;
    }

    table.truth-table b {
      font-size: 1.1em;
    }

    /* itemization table */
    table.itemization-table {
      width: 50%;
      margin: auto;
    }

    table.itemization-table td.number {
      width: 15px;
    }

    table.itemization-table td.currency {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
    }

    .table-title {
      font-weight: bold;
      text-transform: uppercase;
      text-align: center;
      margin: 1px;
    }

    /* notice box */
    .notice-box {
      -webkit-text-size-adjust: none;
      text-align: justify;
      font-weight: bold;
      margin: 1px;
      padding: 12px 0;
    }

    /* signature table */
    table.signature-table {
      width: 100%;
    }

    table.signature-table td {
      padding: 5px 0 30px 0;
    }

    table.signature-table div.underline {
      border-top: 2px solid black;
      margin: 0 10% 0 11px;
    }

    table.signature-table td.sign-label {
      font-size: 16px;
      width: 50%;
    }

    table.signature-table td.sign-input {
      width: 50%;
    }

    .signature-box {
      display: flex;
    }

    .sign-date {
      margin: 0 19% 30px 0;
      max-height: 20px;
      display: flex;
    }

    .signature-fields {
      display: inline-block;
      width: 53%;
      border-top: 3px solid black;
      position: relative;
      margin: 0 13px;
      padding-top: 3px;
      flex: 3;
    }

    .date-fields {
      display: inline-block;
      width: 20%;
      border-top: 3px solid black;
      margin: 0 13px;
      padding: 3px 0 0 9px;
      flex: 1;
    }

    .footer {
      display: none;
    }

    @media print {

      .footer,
      .footer-space {
        display: block;
        height: 20px;
      }

      .footers {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        margin: 5px 0 3px 0;
        color: grey;
        font-family: 'Times New Roman', Times, serif;
        font-size: x-small;
      }

      .footer {
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
      }
    }
  </style>

  <div>
    <table class="content">
      <h2 class="cell-title">PROMISSORY NOTE AND DISCLOSURE</h2>
      <div class="name-address">
        <div>
          Borrower:
        </div>
        <div style="margin-right: 3%;">
          ${primaryPerson.firstName!"-"} ${primaryPerson.lastName!"-"}<br>
          <#if coApplicant??>
            ${coAppPerson.firstName} ${coAppPerson.lastName}<br>
          </#if>
          ${(propertyPostalAddress.address1)!"-"} ${(propertyPostalAddress.address2)!""}<br>
          ${(propertyPostalAddress.city)!"-"}, ${(propertyPostalAddress.stateProvinceGeo.geoName)!"-"}
          ${(propertyPostalAddress.postalCode)!"-"}
        </div>
        <div style="margin-left: 3%;">
          Lender:
        </div>
        <div>
          Evergreen Bank Group<br>
          Oak Brook Office<br>
          1515 West 22nd Street, Suite 100W<br>
          Oak Brook, IL 60523
        </div>
      </div>
      <tr>
        <td colspan="2">
          <table class="table truth-table">
            <tr style="text-align: left;">
              <td class="thick-border-cover"><b>ANNUAL PERCENTAGE RATE</b><br>The cost of your
                credit
                as a yearly rate.</td>
              <td class="thick-border-cover"><b>FINANCE CHARGE</b><br>The dollar amount the credit
                will cost you.</td>
              <td class="thick-border-top"><b>Amount Financed</b><br>The amount of credit provided
                to
                you or on your behalf. </td>
              <td class="thick-border-top"><b>Total of Payments</b><br>The amount you will have paid
                after you have made all payments as scheduled.</td>
            </tr>
            <tr class="truth-interest">
              <td class="thick-border-under">${interestRate*100!"-"}%</td>
              <td class="thick-border-under">${(loanPayment.financeCharge?string.currency)!"-"}</td>
              <td>${orderItem.unitAmount?string.currency!"-"}</td>
              <td>${totalPaymentAmount?string.currency!"-"}</td>
            </tr>
          </table>
          <table class="table truth-table">
            <tr style="text-align: left;">
              <td class="thick-border-under">
                <p><b>PAYMENT SCHEDULE.</b> My payment schedule will be ${numOfPayments!"-"} monthly
                  payments of ${(loanPayment.monthlyPayment?string.currency)!"-"} each, beginning
                  ${paymentDueDate?string["MMMM dd, yyyy"]!"-"}.</p>
                <p><b>SECURITY.</b> This loan is unsecured.</p>
                <p><b>LATE CHARGE.</b> If a payment is 10 days or more late, I will be charged
                  5.000%
                  of the unpaid portion of the regularly scheduled payment.</p>
                <p><b>PREPAYMENT.</b> If I pay off early, I will not have to pay a penalty,</p>
                <p>I will look at my contract documents for any additional information about
                  nonpayment, default, any required repayment ln full before the scheduled
                  date, and prepayment refunds.</p>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td style="padding: 22px 0;">
          <h4 class="table-title">Amount Financed Itemization</h4>
          <table class="table itemization-table white-border">
            <tr>
              <td>
                <b>Amount paid to others on my behalf:</b>
                <br>
                ${orderItem.unitAmount?string.currency!"-"} to
                <#if dealerContactInfo?? && dealerContactInfo.postalAddress??>
                  ${dealerContactInfo.postalAddress.toName!"-"}
                  <#else>
                  -
                </#if>
              </td>
              <td class="currency"><b>${orderItem.unitAmount?string.currency!"-"}</b></td>
            </tr>
            <tr>
              <td><b>Note Principal:</b></td>
              <td class="currency">
                <b>${(orderItem.unitAmount+(downPayment.downPaymentAmount)!0)?string.currency!"-"}</b>
              </td>
            </tr>
            <tr>
              <td><b>Prepaid Finance Charges:</b></td>
              <td class="currency"><b><#if loanFee??>${loanFee?number?string.currency!"-"}<#else>-</#if></b></td>
            </tr>
            <tr>
              <td><b>Amount Financed:</b></td>
              <td class="currency"><b>${orderItem.unitAmount?string.currency!"-"}</b></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <hr>
    <div class="spaced">
      <b>Principal Amount: ${orderItem.unitAmount?string.currency!"-"}</b>
      <b>Interest Rate: ${interestRate*100!"-"}%</b>
      <b>Date of Note: ${.now?string["MMMM dd, yyyy"]!"-"}</b>
    </div>

    <div style="text-align:justify;">
      <b>PROMISE TO PAY. I ("Borrower") jointly and severally promise to pay to Evergreen
        Bank
        Group ("Lender"), or order, in lawful money of the United States of America, the
        principal amount of $${orderItem.unitAmount?string(currencyFormat)!"-"}<#-- Amount suppose
          to be spelled out but no current way of doing this
          ($${orderItem.unitAmount?string(currencyFormat)!"-"}) -->, together with interest on the
          unpaid principal balance
          from ${thirtyDaysBeforeFirstDueDate?string["MMMM dd, yyyy"]!"-"}, calculated as described
          in
          the "INTEREST CALCULATION METHOD" paragraph using an interest rate of
          ${interestRate*100!"-"}%, until paid in full. The interest rate may change under the terms
          and
          conditions of the "INTEREST AFTER DEFAULT" section.</b>
      <br><br><b>PAYMENT. I will pay this loan in ${numOfPayments!"-"} payments of
        ${(loanPayment.monthlyPayment?string.currency)!"-"} each payment. My first payment is due
        ${paymentDueDate?string["MMMM dd, yyyy"]!"-"}, and all subsequent paymentsare due on the
        same
        day of each month after that. My final payment will be due on
        ${finalPaymentDate?string["MMMM
        dd, yyyy"]!"-"}, and will be for all principal and all accrued interest not yet paid.
        Payments
        include principal and interest. Unless otherwise agreed or required by applicable law,
        payments
        will be applied first to any accrued unpaid interest; then to principal; and then to any
        late
        charges. I will pay Lender at Lender's address shown above or at such other place as
        Lender
        may designate in writing.</b>
      <br><br><b>INTEREST CALCULATION METHOD. Interest on this Note is computed on a 365/365 simple
        interest basis; that is, by applying the ratio of the interest
        rate over the number of days in a year (365 for all years, including leap years), multiplied
        by
        the outstanding principal balance, multiplied by the actual
        number of days the principal balance is outstanding. All interest payable under this Note is
        computed using this method.</b>
      <br><br><b>Prepayment:</b> l may pay without penalty all or a portion of the amount owed
      earlier
      than it is due. Early payments will not, unless agreed to by Lender in writing, relieve me of
      my
      obligation to continue to make payments under the payment schedule. Rather, early payments
      will
      reduce the principal balance due and
      may result in my making fewer payments. I agree not to send Lender payments marked "paid
      in
      full", "without recourse", or similar language. If I send such apayment, Lender
      may
      accept it without losing any of Lender's rights under this Note, and 1 will remain
      obligated
      to pay any further amount owed to Lender. All written communications concerning disputed
      amounts,
      including any check or other payment instrument that indicates that the payment constitutes
      "payment infull " of the amount owed or that is tendered which other conditions or
      limitations or as full satisfaction of a disputed amount must be mailed or delivered to:
      Evergreen
      Bank Group, Oak Brook Office, 1515 West 22nd Street, Suite 100W, Oak Brook, IL 60523.
      <br><br><b>LATE CHARGE.</b> If a payment is 10 days or more late, I will be charged 5.000% of
      the
      unpaid portion of the regularly scheduled payment.
      <br><br><b>RETURN ITEM FEE.</b> If any payment under this Note is made with a check, ACH
      transfer
      or other instrument that is dishonored for any reason, Borrower agrees to pay Lender a return
      item
      fee of Twenty-Five & 00/100 Dollars ($25.00) in addition to any other amount or charges
      Borrower may owe Lender.
      <br><br><b>INTEREST AFTER DEFAULT.</b> Upon maturity, whether scheduled or accelerated by
      Lender
      because of my default, the interest rate on this Note shall be
      increased by 5.000 percentage points. However, in no event will the interest rate exceed the
      maximum interest rate limitations under applicable law.
      <br><br><b>DEFAULT.</b> I will be in default under this Note if any of the following happen:
      <b>Payment</b>
      <ul style="list-style-type:none">
        <li><b>Default. </b>I fail to make any payment when due under this Note.</li> <br>
        <li><b>Break Other Promises. </b>I break any promise made to Lender or fail to perform
          promptly
          at the time and strictly in the manner provided in this Note or in
          any agreement related to this Note, or in any other agreement or loan I have with Lender.
        </li>
        <br>
        <li><b>False Statements. </b>Any representation or statement made or furnished to Lender by
          me
          or on my behalf under this Note or the related documents is false or
          misleading in any material respect, either now or at the time made or furnished.</li> <br>
        <li><b>Death or Insolvency. </b>Any Borrower dies or becomes insolvent; a receiver is
          appointed
          for any part of my property; I make an assignment for the benefit
          of creditors; or any proceeding is commenced either by me or against me under any
          bankruptcy
          or Insolvency laws.</li>
      </ul>
      <b>LENDER'S RIGHTS.</b> Upon default, Lender may declare the entire unpaid principal
      balance
      under this Note and all accrued unpaid interest immediately due, and then I will pay that
      amount.
      <br><br><b>ATTORNEYS' FEES; EXPENSES.</b> Lender may hire or pay someone else to help
      collect
      this Note if I do not pay. I will pay Lender that amount. This includes, subject to any limits
      under applicable law, Lender's attorneys' fees and Lender's legal expenses,
      whether
      or
      not there is a lawsuit, including attorneys' fees, expenses for bankruptcy proceedings
      (including efforts to modify or vacate any automatic stay or injunction), and appeals. If not
      prohibited by applicable law, I also will pay any court costs, in addition to all other sums
      provided by law.
      <br><br><b>JURY WAIVER.</b> Lender and I hereby waive the right to any jury trial in any
      action,
      proceeding, or counterclaim brought by either Lender or me against the other.
      <br><br><b>GOVERNING LAW.</b> This Note will be governed by federal law applicable to Lender
      and,
      to the extent not preempted by federal law, the laws of the State of
      Illinois without regard to its conflicts of law provisions. This Note has been accepted by
      Lender
      in the State of Illinois.
      <br><br><b>CHOICE OF VENUE.</b> If there is a lawsuit, I agree upon Lender's request to
      submit
      to the jurisdiction of the courts of DuPage County, State of Illinois.
      <br><br><b>COLLATERAL.</b>This loan is unsecured.
      <br><br><b>ARBITRATION. I and Lender agree that all disputes, claims and controversies between
        us
        whether individual, joint, or class in nature, arising from
        this Note or otherwise, including without limitation contract and tort disputes, shall be
        arbitrated pursuant to the financial services rules of J.A.M.S. or
        its successor in effect at the time the claim is filed, upon request of either party. No act
        to
        take or dispose of any property securing this Note shall
        constitute a waiver of this arbitration agreement or be prohibited by this arbitration
        agreement. This includes, without limitation, obtaining injunctive
        relief or a temporary restraining order; invoking a power of sale under any deed of trust or
        mortgage; obtaining a writ of attachment or imposition of a
        receiver; or exercising any rights relating to personal property, including taking or
        disposing
        of such property with or without judicial process
        pursuant Article 9 of the Uniform Commercial Code. Any disputes, claims, or controversies
        concerning the lawfulness or reasonableness of any
        act, or exercise of any right, concerning any property securing this Note, including any
        claim
        to rescind, reform, or otherwise modify any agreement
        relating to the property securing this Note, shall also be arbitrated, provided however that
        no
        arbitrator shall have the right or the power to enjoin or
        restrain any act of any party. Judgment upon any award rendered by any arbitrator may be
        entered
        in any court having jurisdiction. Nothing in this
        Note shall preclude any party from seeking equitable relief from a court of competent
        jurisdiction. The statute of limitations, estoppel, waiver, laches,
        and similar doctrines which would otherwise be applicable in an action brought by a party
        shall
        be applicable in any arbitration proceeding, and the
        commencement of an arbitration proceeding shall be deemed the commencement of an action for
        these purposes. The Federal Arbitration Act shall
        apply to the construction, interpretation, and enforcement of this arbitration
        provision.</b>
      <br><br><b>USA PATRIOT ACT NOTICE- IMPORTANT INFORMATION ABOUT OPENING AN ACCOUNT, OFAC, AND
        BANK
        SECRECY ACT.</b> Lender hereby
      notifies Borrower that pursuant to the requirements of the USA Patriot Act (Title Ill of Pub.
      L.
      107-56) (the "Act"), and Lender's policies and practices, Lender is required to
      obtain, verify, and record information that identifies Borrower. Such information includes the
      name, address, date of birth, social security number and identification documents for
      Borrower.
      Borrower agrees to provide Lender, promptly upon Lender's request, such information as
      Lender
      shall require for purposes of complying with the requirements of the Act and the regulations
      thereunder and any customer identification program established by Lender in accordance
      therewith.
      <br><br><b>NOTICE TO BORROWER. In this Notice the term "you" means the Borrower
        named
        above.</b>
      <br><br><b>DO NOT SIGN THIS NOTE IF IT CONTAINS ANY BLANK SPACES.YOU ARE ENTITLED TO AN EXACT
        COPY
        OF ANY AGREEMENT YOU SIGN.YOU
        HAVE THE RIGHT AT ANY TIME TO PAY IN ADVANCE THE UNPAID BALANCE DUE UNDER THIS NOTE, AND YOU
        MAY
        BE ENTITLED TO A
        PARTIAL REFUND OF THE FINANCE CHARGE.</b>
      <br><br><b>SUCCESSOR INTERESTS.</b> The terms of this Note shall be binding upon me, and upon
      my
      heirs, personal representatives, successors, and assigns, and shall
      inure to the benefit of Lender and its successors and assigns.
      <br><br><b>NOTIFY US OF INACCURATE INFORMATION WE REPORT TO CONSUMER REPORTING AGENCIES.</b> I
      may
      notify Lender if Lender reports any inaccurate
      information about my account(s) to a consumer reporting agency. My written notice describing
      the
      specific inaccuracy(ies) should be sent to Lender at the
      following address: Evergreen Bank Group Oak Brook Office 1515 West 22nd Street, Suite 100W Oak
      Brook, IL 60523.
      <br><br><b>NOTICE: ACTIVE DUTY MILITARY.</b> As an active-duty military member or their
      dependent
      we are required to provide you with the following information prior to you becoming obligated
      on
      a
      transaction to establish credit. Please review the following statement.<br>
      A clear description of your payment obligation and the above disclosure will be available at
      our
      Toll-free telephone number at 1-888-505-2265.
      Statement of Military Annual Percentage Rate (MAPR)<br>
      "Federal law provides important protections to members of the Armed Forces and their
      dependents relating to extensions of consumer credit. In general, the cost
      of consumer credit to a member of the Armed Forces and his or her dependent may not exceed an
      annual percentage rate of 36 percent, This rate must
      include, as applicable to the credit transaction or account: The costs associated with credit
      insurance premiums; fees for ancillary products sold in connection
      with the credit transaction; any application fee charged (other than certain application fees
      for
      specified credit transactions or accounts); and any participation fee charged (other than
      certain
      participation fees for a credit card account)." <br>
      Your loan is a closed-end credit transaction. The payment amount described in your written
      payment
      schedule is due monthly.

      <br><br><b>GENERAL PROVISIONS.</b> If any part of this Note cannot be enforced, this fact will
      not
      affect the rest of the Note. Lender may delay or forgo enforcing any of its rights or remedies
      under this Note without losing them, I and any other person who signs, guarantees or endorses
      this
      Note, to the extent allowed by law,
      waive presentment, demand for payment, and notice of dishonor. Upon any change in the terms of
      this Note, and unless otherwise expressly stated in writing,
      no party who signs this Note, whether as maker, guarantor, accommodation maker or endorser,
      shall
      be released from liability. All such parties agree that Lender
      may renew or extend (repeatedly and for any length of time) this loan or release any party or
      guarantor or collateral; or impair, fail to realize upon or perfect
      lender's security interest in the collateral, All such parties also agree that Lender may
      modify this loan without the consent of or notice to anyone other than the party with whom the
      modification is made, The obligations under this Note are joint and several. This means that
      the
      words "I", "me", and "my" mean each and all of the persons signing below.
      <br><br><b>PRIOR TO SIGNING THIS NOTE, I, AND EACH OF US, READ AND UNDERSTOOD ALL THE
        PROVISIONS
        OF THIS NOTE. I, AND EACH OF US,
        AGREE TO THE TERMS OF THE NOTE.</b>
      <br><br><b>I ACKNOWLEDGE RECEIPT OF A COMPLETED COPY OF THIS PROMISSORY NOTE AND
        DISCLOSURE.</b>
      <br>
      <hr style="height: 4px; background: black;">
    </div>
    <div class="notice-box">NOTICE: ANY HOLDER OF THIS CONSUMER CREDIT CONTRACT IS SUBJECT TO ALL
      CLAIMS
      AND DEFENSES WHICH THE DEBTOR COULD ASSERT AGAINST THE SELLER OF GOODS OR SERVICES OBTAINED
      PURSUANT HERETO OR WITH THE PROCEEDS HEREOF. DEBTOR's RECOVERY UNDER THIS AGREEMENT MAY NOT
      EXCEED THE AMOUNTS PAID BY THE DEBTOR HEREUNDER.</div>
    <br>
    BORROWER:<br><br>
    <table class="signature-table white-border">
      <tr>
        <td class="sign-label" colspan="6">
          <b>X</b>
          <br>
          <div class="sign-input underline">
            Borrower 1 - ${(primaryPerson.firstName)!"-"} ${(primaryPerson.lastName)!"-"}
          </div>
          <i data-sign-role="PrimaryApplicant" data-sign-field="fullName"></i>
        </td>
        <#if coApplicant??>
          <td class="sign-label" colspan="6">
            <b>X</b>
            <br>
            <div class="sign-input underline">
              Borrower 2 (if any) - ${(coAppPerson.firstName)!"-"} ${(coAppPerson.lastName)!"-"}
            </div>
            <i data-sign-role="PrimaryApplicant" data-sign-field="fullName"></i>
          </td>
          <#else>
            <td class="sign-label" colspan="6">
            </td>
        </#if>
      </tr>
    </table>

    <div>
      <h2 class="cell-title"><u>CUSTOMER ACKNOWLEDGEMENT</u></h2>
      <p><b><u>FIRST PAYMENT DUE DATE MAY BE DELAYED</u>:</b> The Note that I/we have signed
        discloses
        that the first scheduled
        payment is due on a specified date though the loan disbursement may be delayed until all
        loan
        conditions are met.
        Notwithstanding the terms of the Note, the disbursement of the loan proceeds may not occur
        until
        after the date of the Note,
        resulting in a delay of when the first payment will be due.</p>
      <p>I/We authorize the Noteholder to make any necessary changes to the first payment due date
        and
        the corresponding maturity
        date in the Note to reflect the number of days such disbursement of loan proceeds has been
        delayed. I/We will be notified of
        the delayed and changed due date of the first payment in the billing statement sent to
        me/us.
      </p>
      <p>Each borrower acknowledges they have read and received a completed copy of this disclosure
        statement and agree to these
        terms.</p>
    </div>
    <div>
      <b>X</b><span data-sign-role="PrimaryApplicant"><i data-sign-role="PrimaryApplicant"
          data-sign-field="fullName"></i></span><br>
      <div class="sign-date">
        <span class="signature-fields">
          Borrower 1 - ${(primaryPerson.firstName)!"-"} ${(primaryPerson.lastName)!"-"}
        </span>
        <span class="date-fields" data-sign-field="dateSigned">Date Signed</span>
      </div>
      <#if coApplicant??>
        <b>X</b><span data-sign-role="CoApplicant"><i data-sign-role="CoApplicant"
            data-sign-field="fullName"></i></span><br>
        <div class="sign-date">
          <span class="signature-fields">
            Borrower 2 (if any) - ${(coAppPerson.firstName)!"-"} ${(coAppPerson.lastName)!"-"}
          </span>
          <span class="date-fields">Date Signed</span>
        </div>
      </#if>
    </div>

    <div class="footer">
      <div class="footers">
        <div>Form: Note-unsecured 072220</div>
      </div>
    </div>
  </div>
</div>

<#assign primaryPerson = primaryApplicant.person!"-">
<#assign primaryAddress = primaryApplicant.personAddresses[0]!"-">
<#assign coAppPerson = (coApplicant.person)!>
<#if orderAssignee??>
    <#assign assignee = orderAssignee[0]>
</#if>
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
        margin: auto;
        width: 980px;
        padding: 24px;
        font-size: 16px;
        line-height: 24px;
        }
        @page {
        margin: 0.5in;
        }
        .name-address {
        display: flex;
        justify-content: space-evenly;
        margin: 25px 0 0;
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
        border: 1px solid transparent;
        }
        table.white-border td {
        border: 1px solid transparent;
        }
        table.white-border td.border-bottom {
        border-bottom: 1px solid black;
        }
        .spaced {
        display: flex;
        justify-content: space-between;
        margin: 8px 0;
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
        margin: 0 10% 0 20px;
        }
        table.signature-table td.sign-label {
        font-size: 16px;
        width: 50%;
        }
        table.signature-table td.sign-input {
        width: 50%;
        }
        .row {
        display: flex;
        flex-direction: row;
        }
        .signature-fieldset {
        width: 53%;
        margin-right: 23px;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        }
        .date-fieldset {
        width: 20%;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        }
        .border-bottom {
        border-bottom: 3px solid black;
        }
        .version-note {
        display: flex; 
        justify-content: center; 
        font-size: 10px; 
        line-height: 11px;
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
            font-family: "Times New Roman", Times, serif;
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
    <div class="content">
        <table>
            <h2 class="cell-title">PROMISSORY NOTE</h2>
            <div class="name-address">
                <div>Borrower:</div>
                <div style="margin-right: 3%">
                    ${primaryPerson.firstName!"-"} ${primaryPerson.lastName!"-"}<br />
                    <#if coApplicant??>
                        ${coAppPerson.firstName} ${coAppPerson.lastName}<br />
                    </#if>
                    ${primaryAddress.address1!"-"}
                    ${primaryAddress.address2!""}<br />
                    ${primaryAddress.city!"-"},
                    ${primaryAddress.state!"-"}
                    ${primaryAddress.postalCode!"-"}
                </div>
                <div style="margin-left: 3%">Lender:</div>
                <div>
                    Evergreen Bank Group<br />
                    Oak Brook Office<br />
                    1515 West 22nd Street, Suite 100W<br />
                    Oak Brook, IL 60523
                </div>
            </div>
        </table>
        <hr />
        <div class="spaced">
            <b>Principal Amount: ${orderItem.unitAmount?string.currency!"-"}</b>
            <b>Interest Rate: ${interestRate*100!"-"}%</b>
            <b>Date of Note: ${.now?string["MMMM dd, yyyy"]!"-"}</b>
        </div>
        <div style="text-align: justify">
            <b>PROMISE TO PAY. I ("Borrower") jointly and severally promise to pay to 
            Evergreen Bank Group ("Lender"), or order, in lawful money of the
            United States of America, the principal amount of
            $${orderItem.unitAmount?string(currencyFormat)!"-"}<#-- Amount suppose
            to be spelled out but no current way of doing this
            ($${orderItem.unitAmount?string(currencyFormat)!"-"}) -->, together with
            interest on the unpaid principal balance from
            ${thirtyDaysBeforeFirstDueDate?string["MMMM dd, yyyy"]!"-"}, calculated
            as described in the "INTEREST CALCULATION METHOD" paragraph using an
            interest rate of ${interestRate*100!"-"}%, until paid in full. The
            interest rate may change under the terms and conditions of the "INTEREST
            AFTER DEFAULT" section.</b>
            <p><b
                >PAYMENT. I will pay this loan in ${numOfPayments!"-"} payments of
                ${(loanPayment.monthlyPayment?string.currency)!"-"} each payment. My
                first payment is due ${paymentDueDate?string["MMMM dd, yyyy"]!"-"}, and
                all subsequent payments are due on the same day of each month after that.
                My final payment will be due on ${finalPaymentDate?string["MMMM dd, yyyy"]!"-"}, 
                and will be for all principal and all accrued interest not
                yet paid. Payments include principal and interest. Unless otherwise agreed or required by applicable law, payments will
                be applied first to any accrued unpaid interest; then to principal; and then to any late charges. I will pay Lender at Lender's address shown
                above or at such other place as Lender may designate in writing.</b>
            </p>
            <p><b
                >INTEREST CALCULATION METHOD. Interest on this Note is computed on a 365/365 simple interest basis; that is, by applying the ratio of the
                interest rate over the number of days in a year (365 for all years, including leap years), multiplied by the outstanding principal balance,
                multiplied by the actual number of days the principal balance is outstanding. All interest payable under this Note is computed using this
                method.</b>
            </p>
            <p><b>Prepayment:</b> I may pay without penalty all or a portion of the amount owed earlier than it is due. Early payments will not, unless agreed to by Lender
                in writing, relieve me of my obligation to continue to make payments under the payment schedule. Rather, early payments will reduce the principal
                balance due and may result in my making fewer payments. I agree not to send Lender payments marked "paid in full", "without recourse", or similar
                language. If I send such a payment, Lender may accept it without losing any of Lender's rights under this Note, and I will remain obligated to pay any
                further amount owed to Lender.<b> All written communications concerning disputed amounts, including any check or other payment instrument
                that indicates that the payment constitutes "payment in full" of the amount owed or that is tendered with other conditions or limitations or as
                full satisfaction of a disputed amount must be mailed or delivered to: Evergreen Bank Group, Oak Brook Office, 1515 West 22nd Street, Suite
                100W, Oak Brook, IL 60523.</b>
            </p>
            <p><b>LATE CHARGE.</b>
                If my payment is more than 10 days late, I will be charged <b>5.000% of the unpaid portion of the regularly scheduled payment or
                $10.00, whichever is less.</b> However, in no event will the late charge exceed the maximum amount under applicable law.
            </p>
            <p><b>RETURN ITEM FEE.</b>
                If any payment under this Note is made with a check, ACH transfer or other instrument that is dishonored for any reason, Borrower
                agrees to pay Lender a return item fee of Twenty-Five & 00/100 Dollars ($25.00) in addition to any other amount or charges Borrower may owe Lender.
            </p>
            <p><b>INTEREST AFTER DEFAULT.</b> Upon maturity, whether scheduled or accelerated by Lender because of my default, the interest rate on this Note shall
                be increased by 5.000 percentage points. However, in no event will the interest rate exceed the maximum interest rate limitations under applicable law. 
            </p>
            <p><b>DEFAULT.</b> I will be in default under this Note if any of the following happen:
            <ul style="list-style-type: none">
                <li>
                    <b>Payment Default. </b>I fail to make any payment when due under this Note.
                </li>
                <br />
                <li>
                    <b>Break Other Promises. </b>I break any promise made to Lender or fail to perform promptly at the time and strictly in the manner provided in this Note
                    or in any agreement related to this Note, or in any other agreement or loan I have with Lender.
                </li>
                <br />
                <li>
                    <b>False Statements. </b>Any representation or statement made or furnished to Lender by me or on my behalf under this Note or the related documents
                    is false or misleading in any material respect, either now or at the time made or furnished.
                </li>
                <br />
                <li>
                    <b>Death or Insolvency. </b>Any Borrower dies or becomes insolvent; a receiver is appointed for any part of my property; I make an assignment for the
                    benefit of creditors; or any proceeding is commenced either by me or against me under any bankruptcy or insolvency laws.
                </li>
                <br />
                <li>
                    <b>Taking of the Property. </b>Any creditor or governmental agency tries to take any of the property or any other of my property in which Lender has a
                    lien. This includes taking of, garnishing of or levying on my accounts, including deposit accounts, with Lender. However, if I dispute in good faith
                    whether the claim on which the taking of the property is based is valid or reasonable, and if I give Lender written notice of the claim and furnish
                    Lender with monies or a surety bond satisfactory to Lender to satisfy the claim, then this default provision will not apply.
                </li>
                <br />
                <li>
                    <b>Defective Collateralization. </b>This Note or any of the related documents ceases to be in full force and effect (including failure of any collateral
                    document to create a valid and perfected security interest or lien) at any time and for any reason.
                </li>
                <br />
                <li>
                    <b>Collateral Damage or Loss. </b>Any collateral securing this Note is lost, stolen, substantially damaged or destroyed and the loss, theft, substantial
                    damage or destruction is not covered by insurance.
                </li>
            </ul>
            <b>LENDER'S RIGHTS.</b> Upon default, Lender may declare the entire unpaid principal balance under this Note and all accrued unpaid interest immediately
            due, and then I will pay that amount.
            </p>
            <p><b>ATTORNEYS' FEES; EXPENSES.</b>
                Lender may hire or pay someone else to help collect this Note if I do not pay. I will pay Lender that amount. This
                includes, subject to any limits under applicable law, Lender's attorneys' fees and Lender's legal expenses, whether or not there is a lawsuit, including
                attorneys' fees, expenses for bankruptcy proceedings (including efforts to modify or vacate any automatic stay or injunction), and appeals. If not
                prohibited by applicable law, I also will pay any court costs, in addition to all other sums provided by law.
            </p>
            <p><b>JURY WAIVER.</b> Lender and I hereby waive the right to any jury trial in any action, proceeding, or counterclaim brought by either Lender or me against the other.
            </p>
            <p><b>GOVERNING LAW.</b> This Note will be governed by federal law applicable to Lender and, to the extent not preempted by federal law, the laws of
                the State of Illinois without regard to its conflicts of law provisions. This Note has been accepted by Lender in the State of Illinois.
            </p>
            <p><b>CHOICE OF VENUE.</b> If there is a lawsuit, I agree upon Lender's request to submit to the jurisdiction of the courts of DuPage County, State of Illinois.
            </p>
            <p><b>COLLATERAL.</b> I acknowledge this Note is secured by REAL PROPERTY COMMONLY KNOWN AS ${propertyPostalAddress.address1!"-"} ${propertyPostalAddress.address2!""} ${propertyPostalAddress.city!"-"}, ${propertyPostalAddress.stateGeoName!"-"} ${propertyPostalAddress.postalCode!"-"}.
            </p>
            <p><b>ERRORS AND OMISSIONS.</b> Borrower agrees, if requested by Lender, to fully cooperate in the correction if necessary, in the reasonable discretion of
                Lender of any and all Loan documents or Loan modification documents so that all documents accurately describe the Loan. If Lender determines further
                documentation is necessary or appropriate to confirm Lender's rights under the Loan documents or to correct patent mistakes in the Loan documents,
                Borrower agrees to provide such documentation within fifteen (15) days.
            </p>
            <p><b>USA PATRIOT ACT NOTICE – IMPORTANT INFORMATION ABOUT OPENING AN ACCOUNT, OFAC, AND BANK SECRECY ACT.</b>
                Lender hereby notifies Borrower that pursuant to the requirements of the USA Patriot Act (Title III of Pub. L. 107-56) (the “Act”), and Lender’s policies and practices,
                Lender is required to obtain, verify, and record information that identifies Borrower. Such information includes the name, address, date of birth, social
                security number and identification documents for Borrower. Borrower agrees to provide Lender, promptly upon Lender’s request, such information as
                Lender shall require for purposes of complying with the requirements of the Act and the regulations thereunder and any customer identification program
                established by Lender in accordance therewith.
            </p>
            <p><b>SUCCESSOR INTERESTS.</b>The terms of this Note shall be binding upon me, and upon my heirs, personal representatives, successors, and assigns,
                and shall inure to the benefit of Lender and its successors and assigns.
            </p>
            <p><b>NOTIFY US OF INACCURATE INFORMATION WE REPORT TO CONSUMER REPORTING AGENCIES.</b>
                I may notify Lender if Lender reports any
                inaccurate information about my account(s) to a consumer reporting agency. My written notice describing the specific inaccuracy(ies) should be sent to
                Lender at the following address: Evergreen Bank Group Oak Brook Office 1515 West 22nd Street, Suite 100W Oak Brook, IL 60523. 
            </p>
            <p><b>GENERAL PROVISIONS.</b>
                If any part of this Note cannot be enforced, this fact will not affect the rest of the Note. Lender may delay or forgo enforcing
                any of its rights or remedies under this Note without losing them. I and any other person who signs, guarantees or endorses this Note, to the extent
                allowed by law, waive presentment, demand for payment, and notice of dishonor. Upon any change in the terms of this Note, and unless otherwise
                expressly stated in writing, no party who signs this Note, whether as maker, guarantor, accommodation maker or endorser, shall be released from
                liability. All such parties agree that Lender may renew or extend (repeatedly and for any length of time) this loan or release any party or guarantor or
                collateral; or impair, fail to realize upon or perfect Lender's security interest in the collateral. All such parties also agree that Lender may modify this loan
                without the consent of or notice to anyone other than the party with whom the modification is made. The obligations under this Note are joint and
                several. This means that the words "I", "me", and "my" mean each and all of the persons signing below.
            </p>
            <p><b>ILLINOIS INSURANCE NOTICE. Unless I provide Lender with evidence of the insurance coverage required by my agreement with Lender,
                Lender may purchase insurance at my expense to protect Lender's interests in the collateral. This insurance may, but need not, protect my
                interests. The coverage that Lender purchases may not pay any claim that I make or any claim that is made against me in connection with the
                collateral. I may later cancel any insurance purchased by Lender, but only after providing Lender with evidence that I have obtained
                insurance as required by our agreement. If Lender purchases insurance for the collateral, I will be responsible for the costs of that insurance,
                including interest and any other charges Lender may impose in connection with the placement of the insurance, until the effective date of the
                cancellation or expiration of the insurance. The costs of the insurance may be added to my total outstanding balance or obligation. The
                costs of the insurance may be more than the cost of insurance I may be able to obtain on my own.</b> 
            </p>
            <p><b>WISCONSIN RESIDENT ONLY - MARITAL PURPOSE STATEMENT EXHIBIT. IF YOU ARE A WISCONSIN RESIDENT AND MARRIED, YOU MUST
                COMPLETE AND SIGN THE MARITAL PURPOSE STATEMENT, ATTACHED AS AN EXHIBIT TO THIS PROMISSORY NOTE.</b>
            </p>
            <p><b>NOTICE TO BORROWER. In this Notice the term "you" means the Borrower named above.
                DO NOT SIGN THIS NOTE IF IT CONTAINS ANY BLANK SPACES. YOU ARE ENTITLED TO AN EXACT COPY OF ANY AGREEMENT YOU SIGN.
                YOU HAVE THE RIGHT AT ANY TIME TO PAY IN ADVANCE THE UNPAID BALANCE DUE UNDER THIS NOTE, AND YOU MAY BE ENTITLED
                TO A PARTIAL REFUND OF THE FINANCE CHARGE.</b>
            </p>
            <p><b>PRIOR TO SIGNING THIS NOTE, I, AND EACH OF US, READ AND UNDERSTOOD ALL THE PROVISIONS OF THIS NOTE. I, AND EACH OF US,
                AGREE TO THE TERMS OF THE NOTE.</b>
            </p>
            <p><b>I ACKNOWLEDGE RECEIPT OF A COMPLETED COPY OF THIS PROMISSORY NOTE.</b></p>
        </div>
        <div class="notice-box">
            NOTICE: ANY HOLDER OF THIS CONSUMER CREDIT CONTRACT IS SUBJECT TO ALL CLAIMS AND DEFENSES
            WHICH THE DEBTOR COULD ASSERT AGAINST THE SELLER OF GOODS OR SERVICES OBTAINED PURSUANT
            HERETO OR WITH THE PROCEEDS HEREOF. RECOVERY HEREUNDER BY THE DEBTOR SHALL NOT EXCEED
            AMOUNTS PAID BY THE DEBTOR HEREUNDER.
        </div>
        <br />
        BORROWER:
        <br />
        <table class="signature-table white-border">
            <tr>
                <td class="sign-label" colspan="6">
                    <b style="font-size: 30px;">X</b>
                    <i data-sign-role="PrimaryApplicant" data-sign-field="fullName"></i>
                    <br />
                    <div class="sign-input underline">
                        Borrower 1 - ${(primaryPerson.firstName)!"-"}
                        ${(primaryPerson.lastName)!"-"}
                    </div>
                </td>
                <#if coApplicant??>
                <td class="sign-label" colspan="6">
                    <b style="font-size: 30px;">X</b>
                    <i data-sign-role="CoApplicant" data-sign-field="fullName"></i>
                    <br />
                    <div class="sign-input underline">
                        Borrower 2 (if any) - ${(coAppPerson.firstName)!"-"}
                        ${(coAppPerson.lastName)!"-"}
                    </div>
                </td>
                <#else>
                <td class="sign-label" colspan="6"></td>
                </#if>
            </tr>
        </table>
        <table style="font-size: 12px;">
                <tr>
                    <td colspan="2">Originator Names and Nationwide Mortgage Licensing System and Registry IDs:</td>
                </tr>
                <tr>
                    <td>Organization: Evergreen Bank Group</td>
                    <td>NMLSR ID: ${vendorNmlsId!"-"}</td>
                </tr>
                <tr>
                    <td>Individual: ${assignee!"-"}</td>
                    <td>NMLSR ID: ${partyNmlsId!"-"}</td>
                </tr>
            </table>
             <hr style="margin: 1px 0;"/>
            <div class="version-note">
                <div style="padding-right: 22px;">Laser Pro Ver. 19.2.0.042</div>
                <div style="padding-right: 22px;">Copr. Finanstra USA Corporation 1997, 2020.</div>
                <div>All Rights Reserved.</div>
            </div>
        <br />
        <p style="page-break-before: always">
        <div>
            <h2 class="cell-title"><u>CUSTOMER ACKNOWLEDGEMENT</u></h2>
            <p>
                <b><u>FIRST PAYMENT DUE DATE MAY BE DELAYED</u>:</b> The Note that I/we have signed discloses that the first scheduled
                payment is due on a specified date though the loan disbursement may be delayed until all loan conditions are met.
                Notwithstanding the terms of the Note, the disbursement of the loan proceeds may not occur until after the date of the Note,
                resulting in a delay of when the first payment will be due.
            </p>
            <p>
                I/We authorize the Noteholder to make any necessary changes to the first payment due date and the corresponding maturity
                date in the Note to reflect the number of days such disbursement of loan proceeds has been delayed. I/We will be notified of
                the delayed and changed due date of the first payment in the billing statement sent to me/us.
            </p>
            <p>
                Each borrower acknowledges they have read and received a completed copy of this disclosure statement and agree to these
                terms.
            </p>
        </div>
        <br />
        <div>
            <div class="row">
                <#-- Signature field set -->
                <div class="signature-fieldset">
                    <div class="border-bottom">
                        <b style="font-size: 30px;">X</b>
                        <i data-sign-role="PrimaryApplicant" data-sign-field="fullName"></i>
                    </div>
                    <div>
                        Borrower 1 - ${(primaryPerson.firstName)!"-"}
                        ${(primaryPerson.lastName)!"-"}
                    </div>
                </div>
                <#-- Date field set -->
                <div class="date-fieldset">
                    <div class="border-bottom">
                        <span
                            data-sign-role="PrimaryApplicant"
                            data-sign-field="dateSigned"
                            ></span>
                    </div>
                    <div>Date Signed</div>
                </div>
            </div>
            <#if coApplicant??>
            <div class="row" style="padding: 20px 0">
                <#-- Signature field set -->
                <div class="signature-fieldset">
                    <div class="border-bottom">
                        <b style="font-size: 30px;">X</b>
                        <i data-sign-role="CoApplicant" data-sign-field="fullName"></i>
                    </div>
                    <div>
                        Borrower 2 (if any) - ${(coAppPerson.firstName)!"-"}
                        ${(coAppPerson.lastName)!"-"}
                    </div>
                </div>
                <#-- Date field set -->
                <div class="date-fieldset">
                    <div class="border-bottom">
                        <span
                            data-sign-role="CoApplicant"
                            data-sign-field="dateSigned"
                            ></span>
                    </div>
                    <div>Date Signed</div>
                </div>
            </div>
            </#if>
        </div>
        <br />
        <br />
        <div class="footer">
            <div class="footers">
                <div style="font-size: 10px;">Form: Note-secured 072220</div>
            </div>
        </div>
    </div>
</div>
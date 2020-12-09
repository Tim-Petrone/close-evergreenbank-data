<#assign primaryPerson = primaryApplicant.person!"-">
<#assign primaryAddress = primaryApplicant.personAddresses[0]!"-">
<#assign coAppPerson = (coApplicant.person)!>
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
    margin: 25px 0;
    border: 1px solid black;
    }
    .lender-section {
    padding: 10px 0 0 10px; 
    border-right: 1px solid black; 
    display: flex;
    width: 50%;
    }
    .order-content {
    display: flex;
    flex-direction: row-reverse;
    font-size: 0.7em;
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
    text-align: center;
    }
    .border-bottom {
    border-bottom: 1px solid black;
    }
    .end-content {
    display: flex;
    justify-content: space-evenly;
    margin-left: 40%;
    }
    .contact-section {
    font-size: 0.8em;
    line-height: 1.7em;
    display: inline-block;
    text-align: left;
    }
    hr {
    height: 7px; 
    border: none; 
    color: #333; 
    background-color: #333;
    position: relative; 
    width: 105%;
    right: 2.5%;
    }
    .row {
    display: flex;
    flex-direction: row;
    }
    .signature-fieldset {
    width: 33%;
    margin-right: 23px;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    }
    .signature-fieldset b {
    font-size: 20px;
    }
    .date-fieldset {
    width: 12%;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    }
    .border-top {
    border-top: 1px solid black;
    margin-left: 14px;
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
<div class="content">
    <div>
        <h2 style="text-align: center">NOTICE OF RIGHT TO CANCEL</h2>
    </div>
    <div class="name-address">
        <div class="lender-section">
            <div>
                Lender:
            </div>
            <div style="padding: 0 70px;">
                Evergreen Bank Group<br>
                Oak Brook Office<br>
                1515 West 22nd Street, Suite 100W<br>
                Oak Brook, IL 60523
            </div>
        </div>
        <div style="padding: 10px 0 0 10px;">
            <div>
                Subject Property Address:
            </div>
            <br />
            <div style="padding: 0 70px;">
                ${primaryAddress.address1!"-"}
                ${primaryAddress.address2!""}<br />
                ${primaryAddress.city!"-"},
                ${primaryAddress.state!"-"}
                ${primaryAddress.postalCode!"-"}
            </div>
        </div>
    </div>
    <div>
        <p><b>Your Right to Cancel</b><br/>
            You are entering into a transaction that will result in a mortgage/lien/security interest on your home. You have a legal right under federal
            law to cancel this transaction, without cost, within THREE BUSINESS DAYS from whichever of the following events occurs last:
        </p>
        <ol>
            <li>The date of the transaction, which is ${order.entryDate?string["MMMM dd, yyyy"]!"-"}; or</li>
            <br/>
            <li>The date you received your Truth-in-Lending disclosures; or</li>
            <br/>
            <li>The date you received this notice of your right to cancel.</li>
        </ol>
        <p><span style="padding-left: 15px;">If</span> you cancel the transaction, the mortgage/lien/security interest is also cancelled. Within 20 CALENDAR DAYS after we receive your
            notice, we must take the steps necessary to reflect the fact that the mortgage/lien/security interest on your home has been cancelled,
            and we must return to you any money or property you have given us or to anyone else in connection with this transaction.<br/>
            <span style="padding-left: 15px;">You</span> may keep any money or property we have given you until we have done the things mentioned above, but you must then offer to
            return the money or property. If it is impractical or unfair for you to return the property, you must offer its reasonable value. You may
            offer to return the property at your home or at the location of the property. Money must be returned to the address above. If we do not
            take possession of the money or property within 20 CALENDAR DAYS of your offer, you may keep it without further obligation.
        </p>
        <div style="border: 1px solid black; padding: 6px 11px;">
            <b>HOW TO CANCEL:</b><br />
            If you decide to cancel this transaction, you may do so by notifying us in writing at Evergreen Bank Group,1515 W. 22 ND Street,
            Suite 100W, Oak Brook, IL 60523. You may use any written statement that is signed and dated by you, and that states your
            intention to cancel and/or you may use this notice by dating and signing below. Keep one copy of this notice because it contains
            important information about your rights.<br />
            If you cancel by mail or telegram, you must send the notice no later than MIDNIGHT of ${cancellationDate?date.iso?string["MM/dd/yyyy"]!"-"} (or MIDNIGHT of the
            THIRD BUSINESS DAY following the latest of the three events listed above.) If you send or deliver your written notice to cancel
            some other way, it must be delivered to the above address no later than that time.<br />
            <br />
            <table style="display: flex; justify-content: flex-end;">
                <tr>
                    <td><b>I WISH TO CANCEL,</b></td>
                    <td style="display: flex; justify-content: flex-end;"><span style="padding-right: 30px;">/</span><span style="padding-right: 30px;">/</span></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="border-top: 1px solid black; padding: 5px 70px 0 20px; font-size: 12px;">(To cancel your loan request, sign &amp; date)</td>
                </tr>
            </table>
        </div>
        <p>Joint owners may have the right to rescind and a rescission by one is effective for all.</p>
        <hr/>
        <p><b>Each of the undersigned acknowledges receipt of two (2) completed copies of this Notice of Right to Cancel and one (1) copy
            of the Truth- in-Lending Disclosures.</b>
        </p>
        <div>
            <div class="row">
                <#-- Signature field set -->
                <div class="signature-fieldset">
                    <b>X</b>
                    <div class="border-top">
                        <i data-sign-role="PrimaryApplicant" data-sign-field="fullName"></i>
                        <div style="margin: 10px;">
                            ${(primaryPerson.firstName)!"-"}
                            ${(primaryPerson.lastName)!"-"}
                        </div>
                    </div>
                </div>
                <#-- Date field set -->
                <div class="date-fieldset">
                    <div class="border-top">
                        <span data-sign-role="PrimaryApplicant"
                            data-sign-field="dateSigned"></span>
                        <div style="margin: 10px;">Date</div>
                    </div>
                </div>
            </div>
            <#if coApplicant??>
            <div class="row" style="padding: 20px 0;">
                <#-- Signature field set -->
                <div class="signature-fieldset">
                    <b>X</b>
                    <div class="border-top">
                        <i data-sign-role="CoApplicant" data-sign-field="fullName"></i>
                        <div style="margin: 10px;">
                            ${(coAppPerson.firstName)!"-"}
                            ${(coAppPerson.lastName)!"-"}
                        </div>
                    </div>
                </div>
                <#-- Date field set -->
                <div class="date-fieldset">
                    <div class="border-top">
                        <span data-sign-role="CoApplicant"
                            data-sign-field="dateSigned"></span>
                        <div style="margin: 10px;">Date</div>
                    </div>
                </div>
            </div>
            </#if>
        </div>
        <p><b>INSTRUCTIONS:</b> Return 1 copy to lender with original signatures and leave 2 completed copies with EACH signer above.</p>
    </div>
    <div class="footer">
      <div class="footers">
        <div style="font-size: 10px;">Form: Note-unsecured 072220</div>
      </div>
    </div>
</div>
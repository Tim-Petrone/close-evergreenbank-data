<#assign primaryPerson = primaryApplicant.person!"-">
<#assign coAppPerson = (coApplicant.person)!>
<div>
  <style>
    .content {
      font-family: sans-serif;
      margin: auto;
      width: 720px;
      padding: 24px;
      font-size: 16px;
      line-height: 24px;
    }

    @page {
      margin: 0.5in;
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
  </style>
  <div class="content">
    <div class="order-content">
      <p>Application #: ${orderId!"-"}</p>
    </div>
    <div>
      <h2 style="text-align: center"><u>Acknowledgement Form</u></h2>
    </div>
    <br />
    <div>
      <p>Each loan applicant acknowledges:</p>
      <ul>
        <li>
          Receipt of several loan disclosures including a Loan Estimate, credit
          score notice, list of housing counselors, and our privacy notice.
        </li>
        <br />
        <li>
          I wish to have Evergreen Bank Group finish processing my loan
          application to determine if I qualify, and I have expressed my intent
          to proceed.
        </li>
      </ul>
    </div>
    <div class="row">
      <#-- Signature field set -->
      <div class="signature-fieldset">
        <span><b>X</b></span>
        <div style="margin: 0 1em">
          <div class="border-bottom">
            <i data-sign-role="PrimaryApplicant" data-sign-field="fullName"></i>
          </div>
          <div>
            Borrower 1 - ${(primaryPerson.firstName)!"-"}
            ${(primaryPerson.lastName)!"-"}
          </div>
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
        <div>Date</div>
      </div>
    </div>

    <#if coApplicant??>
    <div class="row" style="padding: 20px 0">
      <#-- Signature field set -->
      <div class="signature-fieldset">
        <b>X</b>
        <div style="margin: 0 1em">
          <div class="border-bottom">
            <i data-sign-role="CoApplicant" data-sign-field="fullName"></i>
          </div>
          <div>
            Borrower 2 (if any) - ${(coAppPerson.firstName)!"-"}
            ${(coAppPerson.lastName)!"-"}
          </div>
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
        <div>Date</div>
      </div>
    </div>
    </#if>
    <br />
    <br />
    <div style="font-size: 0.7em; line-height: 1.5em">
      Signing this form does not obligate you to accept the loan terms that you
      may be approved for. Receiving the enclosed disclosures is not a loan
      approval and you will be notified of our credit decision soon.
    </div>
    <br />
    <br />
    <br />
    <br />
    <div style="text-align: center">
      <h1><b>***Please sign, date & return this page ***</b></h1>
      <p>by FAX, email, mail, or e-sign</p>
      <div class="end-content">
        <div class="contact-section">
          <p>FAX: 1-630-686-1190</p>
          <p>EMAIL: hi@evergreenbankgroup.com</p>
          <p>
            <u>MAILING ADDRESS:</u><br />
            Evergreen Bank Group<br />
            Home Improvement Loan Dept.<br />
            1515 West 22nd Street, Suite 100W<br />
            Oak Brook, IL 60523<br />
            Phone (888) 505-2265<br />
          </p>
        </div>
        <div style="margin: auto">
          <img
            width="60px"
            height="60px"
            src="https://assets.ccos.mkdecision.com/icons/equal-housing-lender-grey.svg"
            alt="equal-housing-lender"
          />
        </div>
      </div>
    </div>
  </div>
</div>

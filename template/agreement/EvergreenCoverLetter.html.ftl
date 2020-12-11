<html>

<head>
    <style>
        .contentBody {
            margin: auto;
            width: 600px;
            padding: 24px;
            font-size: 16px;
            line-height: 24px;
        }

        .header {
            padding: 24px 0 8px 0;
            border-bottom: 1px solid #d3d4d8;
        }

        .headerImage {
            max-width: 300px;
            max-height: 75px;
            width: auto;
            height: auto;
        }

        .background {
            margin: auto;
            background-color: white;
            font-family: Trebuchet MS;
        }

        .salutation {
            font-size: 0.825rem;
        }

        .applicantName {
            font-weight: bold;
            font-size: 24px;
            color: #21314d;
        }

        .button {
            background-color: #21314d;
            border-radius: 10px;
            padding: 8px 16px;
            font-size: 20px;
            color: white !important;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        .footer {
            border-top: 1px solid #d3d4d8;
        }

        .alignRight {
            float: right;
        }

        .applicantInfo {
            clear: both;
        }

        .fontInfo {
            font-size: 0.8rem;
        }

        .fontDocId {
            font-size: 0.725rem;
        }

        .indent {
            text-indent: 1.5em;
        }

        @media only screen and (max-width: 1024px) {
            .contentBody {
                width: 85%;
            }
        }
    </style>
</head>

<body>
    <header><img src="${storeLogo}" alt="Bank Logo" /></header>

    <div class="alignRight">
        <p>
            Date: ${.now?date?string.long} <br />
            Application #: ${orderId!"-"} <br />
            Contractor/Merchant: ${dealerName!"-"}
        </p>
    </div>

    <p class="applicantInfo">
        ${primaryApplicant.partyName!"-"} </br>
    <div>
        <#if customerAddress??>
            <#if customerAddress.address1?? && customerAddress.address1 !=''>
                <#assign addressLine1='${(customerAddress.address1)!""} ${(customerAddress.address2)!""}'>
            </#if>
            <#if customerAddress.city?? && customerAddress.city !=''>
                <#assign
                    addressLine2='${(customerAddress.city + ",")!""} ${(customerAddress.stateAbbr)!""} ${(customerAddress.postalCode)!""}'>
            </#if>
            <#assign customerAddress='${(addressLine1 + "<br/>")!""} ${(addressLine2)!""}'>
        </#if>
    </div>
    ${customerAddress!"-"}
    </p>

    <p>Dear Applicant(s),</p>

    <p>We are processing your <u>home improvement loan application</u> which was submitted by you or your contractor.
        You will be
        notified within a few days as to whether you qualify for a loan.</p>

    <p>Enclosed are loan disclosures that we are sending to you because your application <i>may</i> be approved as a
        secured loan.
        To determine if the interest paid on a secured home improvement loan is <i>tax deductible</i>, you may consult
        your tax
        preparer.</p>

    <p>The enclosed disclosures include:</p>

    <p class="indent">1) <u>LOAN ESTIMATE</u> - This form shows the <i>estimated</i> loan terms if your application is
        approved as requested.</p>

    <p class="indent">2) <u>CREDIT SCORE NOTICE</u> - This form contains your credit score information.</p>

    <p class="indent">3) <u>HOUSING COUNSELOR LIST</u> - The good news is you are not required to attend any loan
        counseling session, but lending
        regulations still require that we send you this list.</p>

    <p class="indent">4) <u>PRIVACY DISCLOSURE</u> - This form explains how we protect your personal information.</p>

    <p class="indent">5) <u>ACKNOWLEDGEMENT</u> – Sign and return this form only to confirm you have received the
        disclosures listed above and that
        you intend to proceed with your loan request.</p>

    <p><mark><b><u>PLEASE SIGN & RETURN only the enclosed page(s) which have a signature line on them.</u></b></mark>
        You may return the form(s) by
        mail, fax, or email.</p>

    <p>Sincerely,</p>

    <p>Evergreen Bank Group <br />
        Home Improvement Loan Dept.</p>

    <footer class="fontInfo" align="center">
        Evergreen Bank Group (NMLS 456809) </br>
        1515 West 22nd Street, Suite 100W • Oak Brook, IL 60523 </br>
        Ph 630-413-9580 • FAX 630-684-0419 </br>
        email: hi@evergreenbankgroup.com </br>
    </footer>

    <footer class="fontDocId">
        Form coverletter-sec-72220
    </footer>
</body>

</html>
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

        @media only screen and (max-width: 1024px) {
            .contentBody {
                width: 85%;
            }
        }
    </style>
</head>

<body class="background">
    <header class="header contentBody">
        <img src="${storeLogo}" alt="Bank Logo" class="headerImage" />
    </header>

    <div class="contentBody">
        <p class="salutation">
            Date: ${.now?date?string.long} ${.now?time?string.long} <br />
            Loan application: ${orderId!"-"} <br />
            Status: ${(orderStatus)!"-"} <br />
            Application submitted on: ${(entryDate)!"-"}
        </p>
        <p class="salutation">
            Contracting Company: ${(dealerName)!"-"} <br />
            Representative: ${(contacts[0].person.firstName)!"-"} ${(contacts[0].person.lastName)!"-"} <br />
            Primary Applicant: ${primaryApplicant.partyName!"-"} <br />
            Co-Applicant: <#list coApplicants as coApplicant> ${(coApplicant.person.firstName)!"-"} ${(coApplicant.person.lastName)!"-"}</#list>
        </p>
        <p>
            Thank you for your home improvement loan application which was submitted by your contactor. We have prepared a Loan Estimate based on the current terms requested, which could later change.
        </p>
        <p>
            <b><u>Promptly e-sign the Acknowledgement Form using the link below</u></b> to confirm that you would like us to continue processing your loan application. There is  no obligation to accept the loan terms you may be approved for by e-signing this form.
        </p>
        <a href="${detailLinkPath}?orderId=${orderId}" class="button">Access Your Status</a>
    </div>

    <footer class="footer contentBody">
        <p>Thank you for your business.</p>
        <p>
            ${(dealerName)!"-"}
            <br />
            ${vendorCombinedAddress}
            <br />
            <#if (vendorContactInfo?? && (vendorContactInfo.telecomNumber)??)>
                ${vendorContactInfo.telecomNumber.areaCode}-${vendorContactInfo.telecomNumber.contactNumber}
            </#if>
            <br />
            <#if (vendorContactInfo.emailAddress)??>${(vendorContactInfo.emailAddress)!"-"}</#if>
        </p>
    </footer>
</body>

</html>
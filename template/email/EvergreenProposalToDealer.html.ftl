<#assign isSecured = false>
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
        .salutation {
            font-size: 0.825rem;
        }

        .small {
                font-size: 12px;
                line-height: 16px;
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

        <#if counterOffer>
            <p>Thank you for submitting an application!</p>
            <p>Although the applicant(s) did not qualify for the credit terms initially requested, we can make a <b><u>COUNTER-OFFER</u></b> with these terms:</p>
            <table>
                    <tr>
                        <td>Credit Product:</td>
                        <td>${(productName)!"-"}</td>
                    </tr>
                    <tr>
                        <td>Credit Amount:</td>
                        <td>${(creditLine?string.currency)!"-"}</td>
                    </tr>
                    <tr>
                        <td>Payment:</td>
                        <td>$${(estimatedPayment)!"-"}</td>
                    </tr>
                    <tr>
                        <td>Fees financed:</td>
                        <td>$${(loanFee)!"-"}</td>
                    </tr>
                    <tr>
                        <td>Dealer Fees:</td>
                        <td>$0</td>
                    </tr>
            </table>
            <p>Income verification is required. Any other requirements will appear on the <i>Conditional Loan Approval</i> letter.</p>

            <p><i>Please confirm that these <u>COUNTER-OFFERED</u> terms are acceptable to you and your customer by accepting the terms using the online Dashboard, or by contacting us directly. </i></p>

            <a href="${detailLinkPath}?orderId=${orderId}" class="button">Accept Application on Dashboard</a>

            <#if isSecured>
             <p>Title must confirm ownership and only one open mortgage</p>
                </p>If you and your customer accept the terms of the secured <u>counter-offer</u>, we will then order a title search to verify property information and continue processing this credit application. Once title is received, we will notify you if it is acceptable and finish processing the application.</p>
            <#else>
                 <p>If you accept the terms of the unsecured <u>counter-offer</u>, we can quickly finish processing this application.</p>
            </#if>

            <p>If no reply is received soon or the terms are not acceptable, a denial letter (based on the terms initially requested and which the applicants do not qualify for) will be sent to each applicant in approximately 2 weeks.</p>
            <p class="small">Notice: a reply is needed within 14 days, otherwise a denial letter (based on the terms initially requested and which the applicants do not qualify for) will be sent to each applicant in compliance with lending regulations.</p>
        <#else>
            <p>Good news! This credit application qualifies for these terms:</p>
            <table>
                <tr>
                    <td>Credit Product:</td>
                        <td>${(productName)!"-"}</td>
                    </tr>
                    <tr>
                        <td>Credit Amount:</td>
                        <td>${(creditLine?string.currency)!"-"}</td>
                    </tr>
                    <tr>
                        <td>Payment:</td>
                        <td>$${(estimatedPayment)!"-"}</td>
                    </tr>
                    <tr>
                        <td>Fees financed:</td>
                        <td>$${(loanFee)!"-"}</td>
                    </tr>
                    <tr>
                        <td>Dealer Fees:</td>
                        <td>$${(loanFee)!"-"}</td>
                    </tr>
            </table>
            <p>Income verification is required. Any other requirements will appear on the <i>Conditional Loan Approval</i> letter.</p>

            <#if isSecured>
            <p>Title report must confirm ownership and only one open mortgage.</p>
            <p><i><u>Please confirm that these loan terms are acceptable</u> to you and your customer by using the online Dashboard, or by contacting us directly. We will then order a title report to confirm ownership and lien information.</i></p>
            </#if>

            <p>Click the link below to view the application.</p>
            <a href="${detailLinkPath}?orderId=${orderId}" class="button">View Application on Dashboard</a>

        </#if>
    </div>

    <footer class="footer contentBody">
        <p>We greatly appreciate being your business partner!</p>
        <p>
            Evergreen Bank Group<br />
	        Dealer Services: (888) 505-2265<br />
	        Email: hi@evergreenbankgroup.com<br />
	        Online Dashboard 24/7: https://evergreenbank.close.mkdecision.com/dashboard/
        </p>
    </footer>
</body>

</html>

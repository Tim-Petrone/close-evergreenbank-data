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
            Thank you for your credit application. Unfortunately, we are unable to approve the
            application for the following reason(s):
        </p>
        <#if adverseActionReasons??>
            <#list adverseActionReasons>
                <ul>
                    <#items as adverseActionReason>
                        <li>${adverseActionReason!""}</li>
                    </#items>
                </ul>
            </#list>

        </#if>
        <p>
            Please contact Dealer Services if you have questions.
        </p>
    </div>

    <footer class="footer contentBody">
        <p>We greatly appreciate being your business partner!</p>
        <p>
            Evergreen Bank Group<br />
	        Dealer Services: (888) 505-2265<br />
	        Email: hi@evergreenbankgroup.com<br />
	        Online Dashboard 24/7: https://evergreenbank.close.mkdecision.com/capps
        </p>
    </footer>
</body>

</html>
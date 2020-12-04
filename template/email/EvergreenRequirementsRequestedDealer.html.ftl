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
            Thank you for submitting this application!
        </p>
        <p>
            Before you start the project, you must submit the unsatisfied stipulations listed below. Note that this list <i>excludes</i> the standard loan forms that are to be signed as shown on the Conditional Approval Letter.
        </p>
        <ul>
            <li>Proof of Income (paystub dated within 30 days for each applicant listed)</li>
            <li>Proof of home ownership (copy of a HUD or deed, or a closing statement confirming the customer owns the residence).</li>
            <li>Whatever other stipulations</li>
            <li>Copy of divorce</li>
        </ul>
        <p>
            For any document submissions, if you <u>upload</u> them using the Dealer Dashboard, we will review them with priority. Alternatively, you may email, fax or ship documents to us for standard review service.</p>

        <p>Click the button below to upload documents:</p>
        <a href="${detailLinkPath}?orderId=${orderId}" class="button">Upload Documents</a>

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

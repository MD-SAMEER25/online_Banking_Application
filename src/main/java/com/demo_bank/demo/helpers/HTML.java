package com.demo_bank.demo.helpers;

public class HTML {

    public static String htmlEmailTemplate(String token, int code) {

        // Verify Account URL:
        String url = "http://127.0.0.1:8070/verify?token=" + token + "&code=" + code;

        String emailTemplate = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <link rel=\"stylesheet\" href=\"css/email.css\">\n" +
                "    <title>Email Verification</title>\n" +
                "    <style>\n" +
                "        * {\n" +
                "            box-sizing: border-box;\n" +
                "            font-family: Comfortaa, sans-serif;\n" +
                "        }\n" +
                "\n" +
                "        body {\n" +
                "            height: 100vh;\n" +
                "            background-color: #d4dee6;\n" +
                "            display: flex;\n" +
                "            align-items: center;\n" +
                "            justify-content: center;\n" +
                "            margin: 0;\n" +
                "        }\n" +
                "\n" +
                "        .wrapper {\n" +
                "            width: 100%;\n" +
                "            max-width: 550px;\n" +
                "            padding: 20px;\n" +
                "            background-color: #ffffff;\n" +
                "            border-radius: 8px;\n" +
                "            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);\n" +
                "            text-align: center;\n" +
                "        }\n" +
                "\n" +
                "        .email-msg-header {\n" +
                "            font-size: 24px;\n" +
                "            color: #333333;\n" +
                "            margin-bottom: 20px;\n" +
                "        }\n" +
                "\n" +
                "        .company-name {\n" +
                "            font-size: 36px;\n" +
                "            color: #4a4a4a;\n" +
                "            margin: 10px 0;\n" +
                "        }\n" +
                "\n" +
                "        .welcome-text {\n" +
                "            font-size: 16px;\n" +
                "            color: #555555;\n" +
                "            margin: 20px 0;\n" +
                "        }\n" +
                "\n" +
                "        .verify-account-btn {\n" +
                "            display: inline-block;\n" +
                "            padding: 12px 20px;\n" +
                "            background-color: #007bff;\n" +
                "            text-decoration: none;\n" +
                "            color: #ffffff;\n" +
                "            border-radius: 5px;\n" +
                "            font-size: 16px;\n" +
                "            font-weight: bold;\n" +
                "            margin-top: 20px;\n" +
                "        }\n" +
                "\n" +
                "        .verify-account-btn:hover {\n" +
                "            background-color: #0056b3;\n" +
                "        }\n" +
                "\n" +
                "        .copy-right {\n" +
                "            font-size: 14px;\n" +
                "            color: #888888;\n" +
                "            margin-top: 20px;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "\n" +
                "    <div class=\"wrapper\">\n" +
                "        <h2 class=\"email-msg-header\">\n" +
                "            Welcome and thank you for choosing\n" +
                "        </h2>\n" +
                "\n" +
                "        <div class=\"company-name\">Bank Of India</div>\n" +
                "        <hr>\n" +
                "\n" +
                "        <p class=\"welcome-text\">\n" +
                "            Your account has been successfully registered. Please click the button below to verify your account.\n" +
                "        </p>\n" +
                "\n" +
                "        <center><a href='" + url + "' class='verify-account-btn' role='button'>Verify Account</a></center>\n" +
                "\n" +
                "        <div class=\"copy-right\">\n" +
                "            &copy; 2024 Bank Of India. All rights reserved.\n" +
                "        </div>\n" +
                "    </div>\n" +
                "\n" +
                "</body>\n" +
                "</html>\n";

        return emailTemplate;
    }
}

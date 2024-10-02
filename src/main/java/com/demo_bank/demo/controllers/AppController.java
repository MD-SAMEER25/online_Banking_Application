package com.demo_bank.demo.controllers;

import com.demo_bank.demo.models.Account;
import com.demo_bank.demo.models.PaymentHistory;
import com.demo_bank.demo.models.TransactionHistory;
import com.demo_bank.demo.models.User;
import com.demo_bank.demo.repository.AccountRepository;
import com.demo_bank.demo.repository.PaymentHistoryRepository;
import com.demo_bank.demo.repository.TransactHistoryRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    private final AccountRepository accountRepository;
    private final PaymentHistoryRepository paymentHistoryRepository;
    private final TransactHistoryRepository transactHistoryRepository;

    public AppController(AccountRepository accountRepository,
                         PaymentHistoryRepository paymentHistoryRepository,
                         TransactHistoryRepository transactHistoryRepository) {
        this.accountRepository = accountRepository;
        this.paymentHistoryRepository = paymentHistoryRepository;
        this.transactHistoryRepository = transactHistoryRepository;
    }

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session) {
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        // Get the details of the logged-in user:
        User user = (User) session.getAttribute("user");

        // Check if the user is null, redirect to login if so
        if (user == null) {
            return new ModelAndView("redirect:/index");  // Redirect to login page
        }

        // Get the accounts of the logged-in user:
        List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        // Get balance:
        BigDecimal totalAccountsBalance = accountRepository.getTotalBalance(user.getUser_id());

        // Set objects:
        getDashboardPage.addObject("userAccounts", getUserAccounts);
        getDashboardPage.addObject("totalBalance", totalAccountsBalance);

        return getDashboardPage;
    }

    @GetMapping("/payment_history")
    public ModelAndView getPaymentHistory(HttpSession session) {
        ModelAndView getPaymentHistoryPage = new ModelAndView("paymentHistory");

        // Get logged-in user:
        User user = (User) session.getAttribute("user");

        // Check if the user is null, redirect to login if so
        if (user == null) {
            return new ModelAndView("redirect:/index");  // Redirect to login page
        }

        // Get payment history/records:
        List<PaymentHistory> userPaymentHistory = paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());

        getPaymentHistoryPage.addObject("payment_history", userPaymentHistory);

        return getPaymentHistoryPage;
    }

    @GetMapping("/transact_history")
    public ModelAndView getTransactHistory(HttpSession session) {
        ModelAndView getTransactHistoryPage = new ModelAndView("transactHistory");

        // Get logged-in user:
        User user = (User) session.getAttribute("user");

        // Check if the user is null, redirect to login if so
        if (user == null) {
            return new ModelAndView("redirect:/index");  // Redirect to login page
        }

        // Get transaction history/records:
        List<TransactionHistory> userTransactHistory = transactHistoryRepository.getTransactionRecordsById(user.getUser_id());

        getTransactHistoryPage.addObject("transact_history", userTransactHistory);

        return getTransactHistoryPage;
    }
}

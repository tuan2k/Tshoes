package edu.vinaenter.controllers.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

@Controller
public class PaymentController {
	
	@GetMapping("review_payment")
	public String review(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("payerId");
         
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.getPaymentDetails(paymentId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
             
            
            model.addAttribute("payer",payerInfo);
            model.addAttribute("transaction",transaction);
            model.addAttribute("shippingAddress",shippingAddress);
           // String url = "review.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
            model.addAttribute("paymentId",paymentId);
            model.addAttribute("payerId",payerId);
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            System.out.println(ex.getMessage());
            System.out.println("error");
            //request.getRequestDispatcher("error.jsp").forward(request, response);
        }   
		return "review";	
		
	}
	
	@PostMapping("execute_payment")
	public String payment(HttpServletRequest request,HttpServletResponse response,Model model) {
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);  
            model.addAttribute("payer",payerInfo);
            model.addAttribute("transaction",transaction);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            System.out.println("error");
            //request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        return "receipt";
	}

}

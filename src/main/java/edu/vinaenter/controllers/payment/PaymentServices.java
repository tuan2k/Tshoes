package edu.vinaenter.controllers.payment;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import edu.vinaenter.models.Order;
import edu.vinaenter.models.User;
import edu.vinaenter.services.UserService;

@Service
public class PaymentServices {
	
	@Autowired
	private UserService userService;

	private static final String CLIENT_ID = "AVYVKrTT2TaPaoEU7vwpUbQ0wnrMI_kQsRLP5r8AcQ8hpC2OEDjO8fS-Xjl42D6Qo3fR_8mKjB6Et3EH";
	private static final String CLIENT_SECRET = "EGWbzZd58QjpX7iWP_ofZDKDLzNgjulFrJMBuKzWJk8HtZOxblea52kCHUUxh8xD4AvutSpP54Z6OlZe";
	private static final String MODE = "sandbox";

	public String authorizePayment(Order orderDetail) throws PayPalRESTException {

		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(orderDetail);

		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		Payment approvedPayment = requestPayment.create(apiContext);

		return getApprovalLink(approvedPayment);

	}

	private Payer getPayerInformation() {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName("Nguyen").setLastName("Tuan").setEmail("treynguyen2k.it@gmail.com");
		payer.setPayerInfo(payerInfo);
		return payer;
	}

	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/PaypalTest/cancel");
		redirectUrls.setReturnUrl("http://localhost:8080/PaypalTest/review_payment");
		return redirectUrls;
	}

	private List<Transaction> getTransactionInformation(Order orderDetail) {
		Details details = new Details();
		details.setShipping("10");
		details.setSubtotal("100");

		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal("100");
		amount.setDetails(details);

		Transaction transaction = new Transaction();
		User u = userService.getById(orderDetail.getUser_id());
		transaction.setAmount(amount);
		transaction.setDescription(u.getUsername());

		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<>();

		Item item = new Item();
		item.setCurrency("USD");
		item.setName("");
		item.setPrice("");
		item.setTax("");
		item.setQuantity("1");

		items.add(item);
		itemList.setItems(items);
		transaction.setItemList(itemList);

		List<Transaction> listTransaction = new ArrayList<>();
		listTransaction.add(transaction);

		return listTransaction;
	}

	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
	    String approvalLink = null;
	     
	    for (Links link : links) {
	        if (link.getRel().equalsIgnoreCase("approval_url")) {
	            approvalLink = link.getHref();
	            break;
	        }
	    }      
	    return approvalLink;
    }

	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
	    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
	    return Payment.get(apiContext, paymentId);
	}
	
	public Payment executePayment(String paymentId, String payerId)
	        throws PayPalRESTException {
	    PaymentExecution paymentExecution = new PaymentExecution();
	    paymentExecution.setPayerId(payerId);
	 
	    Payment payment = new Payment().setId(paymentId);
	 
	    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
	 
	    return payment.execute(apiContext, paymentExecution);
	}
}

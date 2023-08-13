import React from "react";
import { loadStripe } from "@stripe/stripe-js";
import { Elements } from "@stripe/react-stripe-js";
import { useGetOrder } from "../../libs/business-logic/src/lib/order/process/hooks";
const stripePromise = loadStripe("YOUR_STRIPE_PUBLIC_KEY");

const Checkout = () => {
  const order = useGetOrder();
  console.log(order);

  const handleSubmit = async (event) => {
    event.preventDefault();

    const stripe = await stripePromise;
    const { error } = await stripe.redirectToCheckout({
      items: [{ sku: "YOUR_SKU_ID", quantity: 1 }],
      successUrl: "YOUR_SUCCESS_URL",
      cancelUrl: "YOUR_CANCEL_URL",
    });

    if (error) {
      console.error("Error: ", error);
    }
  };

  return (
    <Elements stripe={stripePromise}>
      <form onSubmit={handleSubmit}>
        <h1>Payment Information</h1>

        <label>
          Card Number
          <input type="text" placeholder="Card Number" />
        </label>

        <label>
          Expiry Date
          <input type="text" placeholder="MM/YY" />
        </label>

        <label>
          CVV
          <input type="text" placeholder="CVV" />
        </label>

        <label>
          Phone Number (for Momo)
          <input type="text" placeholder="Phone Number" />
        </label>

        <button type="submit">Pay</button>

        <button type="submit">Pay</button>
      </form>
    </Elements>
  );
};

export default Checkout;

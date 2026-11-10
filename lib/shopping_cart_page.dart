import 'package:flutter/material.dart';

const Color kPrimaryBlue = Color(0xFF2F6BFF);
const Color kLightBlue = Color(0xFFE8F0FE);
const Color kTextDark = Color(0xFF111827);
const Color kTextMuted = Color(0xFF6B7280);
const Color kBorderGrey = Color(0xFFD9E0EC);

BoxDecoration kCardDecoration({double radius = 16}) => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 12,
          offset: const Offset(0, 3),
        ),
      ],
    );

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              _IntroSection(),
              SizedBox(height: 16),
              _DeliveryCard(),
              SizedBox(height: 20),
              _OrderItemsSection(),
              SizedBox(height: 4),
              _DiscountBanner(),
              SizedBox(height: 16),
              _PaymentSummaryCard(),
              SizedBox(height: 16),
              _PlaceOrderButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      leading: IconButton(
        tooltip: 'Back',
        icon: const Icon(Icons.arrow_back, color: kTextDark),
        onPressed: () => debugPrint('Back clicked'),
      ),
      title: const Text(
        'My Cart',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: kTextDark,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            tooltip: 'Cart',
            onPressed: () => debugPrint('Cart clicked'),
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  size: 28,
                  color: kTextDark,
                ),
                Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 17, minHeight: 17),
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    decoration: const BoxDecoration(
                      color: kPrimaryBlue,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        height: 1.1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _IntroSection extends StatelessWidget {
  const _IntroSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: kLightBlue,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: kPrimaryBlue,
              fontSize: 11,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Ready for checkout',
          style: TextStyle(
            fontSize: 28,
            height: 1.15,
            fontWeight: FontWeight.w800,
            color: kTextDark,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Review your items before placing your order.',
          style: TextStyle(fontSize: 14, color: kTextMuted),
        ),
      ],
    );
  }
}

class _DeliveryCard extends StatelessWidget {
  const _DeliveryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: kCardDecoration(),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.location_on, color: kPrimaryBlue, size: 22),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to John Lloyd Ramos',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: kTextDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Matina, Davao City',
                  style: TextStyle(fontSize: 12.5, color: kTextMuted),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => debugPrint('Change delivery address clicked'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Change',
              style: TextStyle(
                color: kPrimaryBlue,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderItemsSection extends StatelessWidget {
  const _OrderItemsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Text(
              'Order Items',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: kTextDark,
              ),
            ),
            Spacer(),
            Text(
              '3 items',
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
          ],
        ),
        SizedBox(height: 12),
        CartItemCard(
          name: 'Wireless Mouse',
          price: 'PHP 450.00',
          quantity: 1,
          icon: Icons.mouse_outlined,
        ),
        CartItemCard(
          name: 'USB-C Hub',
          price: 'PHP 850.00',
          quantity: 1,
          icon: Icons.usb,
        ),
        CartItemCard(
          name: 'Laptop Stand',
          price: 'PHP 700.00',
          quantity: 1,
          icon: Icons.laptop_mac_outlined,
        ),
      ],
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: kCardDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon container
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 32, color: kPrimaryBlue),
          ),
          const SizedBox(width: 12),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                          color: kTextDark,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: 'Remove $name',
                      onPressed: () => debugPrint('Remove item: $name'),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 28, minHeight: 28),
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: Color(0xFF9AA3B2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryBlue,
                  ),
                ),
                const SizedBox(height: 10),
                _QuantitySelector(name: name, quantity: quantity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  const _QuantitySelector({required this.name, required this.quantity});

  final String name;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _QtyButton(
          icon: Icons.remove,
          onTap: () => debugPrint('Decrease quantity: $name'),
        ),
        Container(
          width: 34,
          height: 30,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(color: kBorderGrey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$quantity',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ),
        _QtyButton(
          icon: Icons.add,
          onTap: () => debugPrint('Increase quantity: $name'),
        ),
      ],
    );
  }
}

class _QtyButton extends StatelessWidget {
  const _QtyButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: kBorderGrey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: kPrimaryBlue),
        ),
      ),
    );
  }
}

class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFCBDCFB)),
      ),
      child: Row(
        children: const [
          Icon(Icons.local_offer_outlined, size: 22, color: kPrimaryBlue),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryBlue,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '10% discount on items',
                  style: TextStyle(fontSize: 12.5, color: kTextMuted),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, size: 24, color: kPrimaryBlue),
        ],
      ),
    );
  }
}

class _PaymentSummaryCard extends StatelessWidget {
  const _PaymentSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: kCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: kTextDark,
            ),
          ),
          SizedBox(height: 14),
          _SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          SizedBox(height: 10),
          _SummaryRow(label: 'Discount (10%)', amount: '- PHP 200.00'),
          SizedBox(height: 10),
          _SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          SizedBox(height: 12),
          Divider(height: 1, color: Color(0xFFE5E9F0)),
          SizedBox(height: 12),
          _SummaryRow(
            label: 'Total',
            amount: 'PHP 1,850.00',
            emphasize: true,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.amount,
    this.emphasize = false,
  });

  final String label;
  final String amount;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final double size = emphasize ? 15 : 13.5;
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: size,
              fontWeight: emphasize ? FontWeight.w800 : FontWeight.w400,
              color: emphasize ? kTextDark : kTextMuted,
            ),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: size,
            fontWeight: emphasize ? FontWeight.w800 : FontWeight.w600,
            color: kTextDark,
          ),
        ),
      ],
    );
  }
}

class _PlaceOrderButton extends StatelessWidget {
  const _PlaceOrderButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () =>
            debugPrint('Place order clicked! Total: PHP 1,850.00'),
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        icon: const Icon(Icons.lock_outline, size: 20),
        label: const Text('Place Order'),
      ),
    );
  }
}
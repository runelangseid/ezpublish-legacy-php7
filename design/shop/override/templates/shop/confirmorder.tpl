<form method="post" action={"/shop/confirmorder/"|ezurl}>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
    <td width="1">
    <img src={"basket_icon_1.gif"|ezimage} alt="basket" width="28" height="1" border="0" /></td>
    <td  width="100%">
    <img width="66" src={"1x1.gif"|ezimage}  height="1" alt="" border="0"/></td>
</tr>
<tr>
    <td>
    <img src={"basket_icon_2.gif"|ezimage} alt="basket"  width="28" height="24" border="0" /></td>
    <td style="background-color: #4e75b0; color: #ffffff; font-size: 10px;  padding-left: 4px; ">
    Confirm order
    </td>
</tr>
<tr>
    <td>
    <img src={"basket_icon_3.gif"|ezimage} alt="basket"  width="28" height="3" border="0" /></td>
    <td>
    <img width="66" src={"1x1.gif"|ezimage}  height="1" alt="" border="0"/></td>
</tr>
</table>

{shop_account_view_gui view=html order=$order}

<p>
<b>Comment</b>
</p>
<p>
{$order.account_information.comment|wash(xhtml)}
</p>
<p>
<b>{"Product items"|i18n("design/standard/shop")}</b>
</p>
<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<th>
	{"Product name"|i18n("design/standard/shop")}
	</th>
	<th>
	{"Qty."|i18n("design/standard/shop")}
	</th>
	<th>
	{"Price ex. VAT"|i18n("design/standard/shop")}
	</th>
	<th>
	{"VAT"|i18n("design/standard/shop")}
	</th>
	<th>
	{"Discount"|i18n("design/standard/shop")}
	</th>
	<th>
	{"Total inc. VAT"|i18n("design/standard/shop")}
	</th>
	<th>
	&nbsp;
	</th>
</tr>
{let name=ProductItem product_price_ex_vat_ex_discount=0}
{section loop=$order.product_items show=$order.product_items sequence=array(bglight,bgdark)}
{set product_price_ex_vat_ex_discount=sum($:product_price_ex_vat_ex_discount,$:item.price_ex_vat)}
<tr>
	<td class="{$ProductItem:sequence}">
	<input type="hidden" name="ProductItemIDList[]" value="{$ProductItem:item.id}" />
	<a href={concat("/content/view/full/",$ProductItem:item.node_id,"/")|ezurl}>{$ProductItem:item.object_name}</a>
	</td>
	<td class="{$ProductItem:sequence}">
	{$ProductItem:item.item_count}
	</td>
	<td class="{$ProductItem:sequence}">
	{$ProductItem:item.price_ex_vat|l10n(currency)}
	</td>
	<td class="{$ProductItem:sequence}">
	{sub($:item.price_inc_vat,$:item.price_ex_vat)|l10n(currency)}
	</td>
	<td class="{$ProductItem:sequence}">
	{$ProductItem:item.discount_percent}%
	</td>
	<td class="{$ProductItem:sequence}">
	{$ProductItem:item.total_price_inc_vat|l10n(currency)}
	</td>
</tr>
{section show=$ProductItem:item.item_object.option_list}
<tr>
  <td class="{$ProductItem:sequence}" colspan='3'>
     <table width="100%"  border="0">
<tr>
<td colspan='3'>
Selected options
</td> 
</tr>
     {section name=Options loop=$ProductItem:item.item_object.option_list}
      <tr> 
        <td width="33%">{$ProductItem:Options:item.name}</td>
        <td width="33%">{$ProductItem:Options:item.value}</td>
        <td width="33%">{$ProductItem:Options:item.price|l10n(currency)}</td>
      </tr>
    {/section}
     </table>
   </td>
  <td class="{$ProductItem:sequence}" colspan='3'>
  </td>
</tr>
{/section}

{/section}

<tr>
     <td colspan='6'>
     <hr size='2' />
     </td>
</tr>
<tr>
  <td>
    <b>{"Total:"|i18n("design/standard/shop")}</b>
  </td>
  <td>
  </td>
  <td>
    {$:product_price_ex_vat_ex_discount|l10n(currency)}
  </td>
  <td colspan='2'>
  </td>
  <td>
    {$order.total_inc_vat|l10n(currency)}
  </td>
  <td>
  </td>
</tr>

</table>
{/let}


<b>{"Order summary:"|i18n("design/standard/shop")}</b><br />
<table class="list" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td class="bgdark">
    {"Subtotal of items:"|i18n("design/standard/shop")}
    </td>
    <td class="bgdark">
    {$order.product_total_inc_vat|l10n(currency)}
    </td>
    <td class="bgdark">
    &nbsp;
    </td>
</tr>

{section name=OrderItem loop=$order.order_items show=$order.order_items sequence=array(bglight,bgdark)}
<tr>
	<td class="{$OrderItem:sequence}">
	{$OrderItem:item.description}:
	</td>
	<td class="{$OrderItem:sequence}">
	{$OrderItem:item.price_inc_vat|l10n(currency)}
	</td>
	<td class="{$OrderItem:sequence}">
	( {$OrderItem:item.vat_value}% VAT )
	</td>
</tr>
{/section}
<tr>
    <td class="bgdark">
    <b>{"Order total:"|i18n("design/standard/shop")}</b>
    </td>
    <td class="bgdark">
    <b>{$order.total_inc_vat|l10n(currency)}</b>
    </td>
    <td class="bgdark">
    &nbsp;
    </td>
</tr>
</table>

<p>
Should you have any questions, feel free to send an e-mail to <a href="mailto:{ezini("MailSettings","AdminEmail")}">{ezini("MailSettings","AdminEmail")}</a>.
</p>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td>
<input class="button" type="submit" name="CancelButton" value="{'Cancel'|i18n('design/standard/shop')}" /> &nbsp;
</td>
<td align="right">
<input class="defaultbutton" type="submit" name="ConfirmOrderButton" value="{'Confirm'|i18n('design/standard/shop')}" /> &nbsp;
</td>
</tr>
</table>

</form>

</td>
<td class="rightmenuarea" width="120">
&nbsp;
{* right area *}


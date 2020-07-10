Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189B21BFFF
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 00:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FC06ED34;
	Fri, 10 Jul 2020 22:38:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863576ED34
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 22:38:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594420686; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=zibTUJTH6MFdxW//DfqanSRTw7aZklvYX/+cHS6yCOw=;
 b=pUfx2Ef3eYDVbeu0NZUcq312pWwZZTd5yMSZc+/exzgUOl6A8521fvYYkNECSnYxICwi1o86
 xr+YDkRA4LFDKDQrSUKrsia02TWPAdpPhgeufIv+wEh0TZsgna7lRhJLdiXomUrK8xQStYeZ
 vj/nKzvRh9jGTaJEtYET/cybASc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f08ed80d3d6508422f97de4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 22:36:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 737BFC433C6; Fri, 10 Jul 2020 22:36:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.185.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B02ABC433C8;
 Fri, 10 Jul 2020 22:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B02ABC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
 <322c921f-7c8f-7052-b191-44f0dade742e@marek.ca>
 <40f6df1d-f524-c612-9215-591fd7f16e3b@codeaurora.org>
Message-ID: <d9875eae-d7e5-e091-4f3d-b279157ac1c1@codeaurora.org>
Date: Sat, 11 Jul 2020 04:06:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40f6df1d-f524-c612-9215-591fd7f16e3b@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v4 3/7] drm: msm: a6xx: set gpu freq through
 hfi
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 viresh.kumar@linaro.org, sibis@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Ck9uIDcvMTEvMjAyMCAyOjQzIEFNLCBBa2hpbCBQIE9vbW1lbiB3cm90ZToKPgo+IE9uIDcvMTAv
MjAyMCAxOjM0IEFNLCBKb25hdGhhbiBNYXJlayB3cm90ZToKPj4gT24gNy85LzIwIDQ6MDAgUE0s
IEFraGlsIFAgT29tbWVuIHdyb3RlOgo+Pj4gTmV3ZXIgdGFyZ2V0cyBzdXBwb3J0IGNoYW5naW5n
IGdwdSBmcmVxdWVuY3kgdGhyb3VnaCBIRkkuIFNvCj4+PiB1c2UgdGhhdCB3aGVyZXZlciBzdXBw
b3J0ZWQgaW5zdGVhZCBvZiB0aGUgbGVnYWN5IG1ldGhvZC4KPj4+Cj4+Cj4+IEl0IHdhcyBhbHJl
YWR5IHVzaW5nIEhGSSBvbiBuZXdlciB0YXJnZXRzLiBEb24ndCBicmVhayBpdCBpbiBvbmUgCj4+
IGNvbW1pdCB0aGVuIGZpeCBpdCBpbiB0aGUgbmV4dC4KPgo+IE9vcHMuIEkgc29tZWhvdyBnb3Qg
Y29uZnVzZWQuIFdpbGwgZml4IGFuZCByZXNlbmQuCj4KPiAtQWtoaWwKCkkgYnJva2UgdGhlIHBt
X3J1bnRpbWVfZ2V0X2lmX2luX3VzZSgpIGNoZWNrIHRvby4gT3RoZXIgdGhhbiB0aGF0LCBqdXN0
IApzcXVhc2hpbmcgdGhpcyBwYXRjaCB3aXRoIHRoZSBwcmV2aW91cyBvbmUgc2hvdWxkIGJlIGVu
b3VnaC4KCi1Ba2hpbC4KCj4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFAgT29tbWVuIDxh
a2hpbHBvQGNvZGVhdXJvcmEub3JnPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hNnh4X2dtdS5jIHwgMTEgKysrKysrKy0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgCj4+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vYWRyZW5vL2E2eHhfZ211LmMKPj4+IGluZGV4IDIzM2FmZWEuLmI1NDczMzkgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4+PiBAQCAtMTIxLDYgKzEy
MSwxMiBAQCB2b2lkIGE2eHhfZ211X3NldF9mcmVxKHN0cnVjdCBtc21fZ3B1ICpncHUsIAo+Pj4g
c3RydWN0IGRldl9wbV9vcHAgKm9wcCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZ3B1X2Zy
ZXEgPT0gZ211LT5ncHVfZnJlcXNbcGVyZl9pbmRleF0pCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsKPj4+IMKgICvCoMKgwqAgaWYgKCFnbXUtPmxlZ2FjeSkgewo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGE2eHhfaGZpX3NldF9mcmVxKGdtdSwgZ211LT5jdXJyZW50X3BlcmZfaW5k
ZXgpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGljY19zZXRfYncoZ3B1LT5pY2NfcGF0aCwgMCwgTUJw
c190b19pY2MoNzIxNikpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+ICvCoMKgwqAg
fQo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCBnbXUtPmN1cnJlbnRfcGVyZl9pbmRleCA9IHBlcmZfaW5k
ZXg7Cj4+PiDCoMKgwqDCoMKgIGdtdS0+ZnJlcSA9IGdtdS0+Z3B1X2ZyZXFzW3BlcmZfaW5kZXhd
Owo+Pj4gwqAgQEAgLTg5MywxMCArODk5LDcgQEAgaW50IGE2eHhfZ211X3Jlc3VtZShzdHJ1Y3Qg
YTZ4eF9ncHUgKmE2eHhfZ3B1KQo+Pj4gwqDCoMKgwqDCoCBlbmFibGVfaXJxKGdtdS0+aGZpX2ly
cSk7Cj4+PiDCoCDCoMKgwqDCoMKgIC8qIFNldCB0aGUgR1BVIHRvIHRoZSBjdXJyZW50IGZyZXEg
Ki8KPj4+IC3CoMKgwqAgaWYgKGdtdS0+bGVnYWN5KQo+Pj4gLcKgwqDCoMKgwqDCoMKgIGE2eHhf
Z211X3NldF9pbml0aWFsX2ZyZXEoZ3B1LCBnbXUpOwo+Pj4gLcKgwqDCoCBlbHNlCj4+PiAtwqDC
oMKgwqDCoMKgwqAgYTZ4eF9oZmlfc2V0X2ZyZXEoZ211LCBnbXUtPmN1cnJlbnRfcGVyZl9pbmRl
eCk7Cj4+PiArwqDCoMKgIGE2eHhfZ211X3NldF9pbml0aWFsX2ZyZXEoZ3B1LCBnbXUpOwo+Pj4g
wqAgwqDCoMKgwqDCoCAvKgo+Pj4gwqDCoMKgwqDCoMKgICogImVuYWJsZSIgdGhlIEdYIHBvd2Vy
IGRvbWFpbiB3aGljaCB3b24ndCBhY3R1YWxseSBkbyAKPj4+IGFueXRoaW5nIGJ1dCBpdAo+Pj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBt
YWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

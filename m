Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED0221BF0E
	for <lists+freedreno@lfdr.de>; Fri, 10 Jul 2020 23:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEF18828C;
	Fri, 10 Jul 2020 21:13:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7908828C
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 21:13:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594415594; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Y1rBBSjHn58KkYWcfa8FN19qXT4mpd6FmEsIOBn/G4I=;
 b=AB2dPD1ni0iGUgKeHvbSEWTnY2tCNQ3tivi7l7QKhc+W2+7Mzflqp5pddvTzAz3uJ+VGgWih
 OBaYfcUo6OffZ+OFCBn4R5GNj4TLYrl/WlcisvUu/UnQWisYHQk1vQLpTRoOfTSNb/1rK61o
 pwQMLP1bjua7uMzzE/jdLTQHVhI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f08d9e5e3bee12510675c81 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 21:13:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 361D8C43391; Fri, 10 Jul 2020 21:13:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.185.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 66CF0C433C8;
 Fri, 10 Jul 2020 21:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66CF0C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
 <322c921f-7c8f-7052-b191-44f0dade742e@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <40f6df1d-f524-c612-9215-591fd7f16e3b@codeaurora.org>
Date: Sat, 11 Jul 2020 02:43:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <322c921f-7c8f-7052-b191-44f0dade742e@marek.ca>
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

Ck9uIDcvMTAvMjAyMCAxOjM0IEFNLCBKb25hdGhhbiBNYXJlayB3cm90ZToKPiBPbiA3LzkvMjAg
NDowMCBQTSwgQWtoaWwgUCBPb21tZW4gd3JvdGU6Cj4+IE5ld2VyIHRhcmdldHMgc3VwcG9ydCBj
aGFuZ2luZyBncHUgZnJlcXVlbmN5IHRocm91Z2ggSEZJLiBTbwo+PiB1c2UgdGhhdCB3aGVyZXZl
ciBzdXBwb3J0ZWQgaW5zdGVhZCBvZiB0aGUgbGVnYWN5IG1ldGhvZC4KPj4KPgo+IEl0IHdhcyBh
bHJlYWR5IHVzaW5nIEhGSSBvbiBuZXdlciB0YXJnZXRzLiBEb24ndCBicmVhayBpdCBpbiBvbmUg
Cj4gY29tbWl0IHRoZW4gZml4IGl0IGluIHRoZSBuZXh0LgoKT29wcy4gSSBzb21laG93IGdvdCBj
b25mdXNlZC4gV2lsbCBmaXggYW5kIHJlc2VuZC4KCi1Ba2hpbAoKPgo+PiBTaWduZWQtb2ZmLWJ5
OiBBa2hpbCBQIE9vbW1lbiA8YWtoaWxwb0Bjb2RlYXVyb3JhLm9yZz4KPj4gLS0tCj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgfCAxMSArKysrKysrLS0tLQo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyAKPj4gYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4+IGluZGV4IDIzM2FmZWEuLmI1
NDczMzkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+PiBAQCAt
MTIxLDYgKzEyMSwxMiBAQCB2b2lkIGE2eHhfZ211X3NldF9mcmVxKHN0cnVjdCBtc21fZ3B1ICpn
cHUsIAo+PiBzdHJ1Y3QgZGV2X3BtX29wcCAqb3BwKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KGdwdV9mcmVxID09IGdtdS0+Z3B1X2ZyZXFzW3BlcmZfaW5kZXhdKQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqAgK8KgwqDCoCBpZiAoIWdtdS0+bGVnYWN5KSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBhNnh4X2hmaV9zZXRfZnJlcShnbXUsIGdtdS0+Y3VycmVudF9wZXJm
X2luZGV4KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGljY19zZXRfYncoZ3B1LT5pY2NfcGF0aCwgMCwg
TUJwc190b19pY2MoNzIxNikpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiArwqDCoMKg
IH0KPj4gKwo+PiDCoMKgwqDCoMKgIGdtdS0+Y3VycmVudF9wZXJmX2luZGV4ID0gcGVyZl9pbmRl
eDsKPj4gwqDCoMKgwqDCoCBnbXUtPmZyZXEgPSBnbXUtPmdwdV9mcmVxc1twZXJmX2luZGV4XTsK
Pj4gwqAgQEAgLTg5MywxMCArODk5LDcgQEAgaW50IGE2eHhfZ211X3Jlc3VtZShzdHJ1Y3QgYTZ4
eF9ncHUgKmE2eHhfZ3B1KQo+PiDCoMKgwqDCoMKgIGVuYWJsZV9pcnEoZ211LT5oZmlfaXJxKTsK
Pj4gwqAgwqDCoMKgwqDCoCAvKiBTZXQgdGhlIEdQVSB0byB0aGUgY3VycmVudCBmcmVxICovCj4+
IC3CoMKgwqAgaWYgKGdtdS0+bGVnYWN5KQo+PiAtwqDCoMKgwqDCoMKgwqAgYTZ4eF9nbXVfc2V0
X2luaXRpYWxfZnJlcShncHUsIGdtdSk7Cj4+IC3CoMKgwqAgZWxzZQo+PiAtwqDCoMKgwqDCoMKg
wqAgYTZ4eF9oZmlfc2V0X2ZyZXEoZ211LCBnbXUtPmN1cnJlbnRfcGVyZl9pbmRleCk7Cj4+ICvC
oMKgwqAgYTZ4eF9nbXVfc2V0X2luaXRpYWxfZnJlcShncHUsIGdtdSk7Cj4+IMKgIMKgwqDCoMKg
wqAgLyoKPj4gwqDCoMKgwqDCoMKgICogImVuYWJsZSIgdGhlIEdYIHBvd2VyIGRvbWFpbiB3aGlj
aCB3b24ndCBhY3R1YWxseSBkbyAKPj4gYW55dGhpbmcgYnV0IGl0Cj4+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

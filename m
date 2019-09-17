Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250FB53E7
	for <lists+freedreno@lfdr.de>; Tue, 17 Sep 2019 19:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F386ED15;
	Tue, 17 Sep 2019 17:20:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715DA6ED15
 for <freedreno@lists.freedesktop.org>; Tue, 17 Sep 2019 17:20:25 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C131A2053B;
 Tue, 17 Sep 2019 17:20:23 +0000 (UTC)
Date: Tue, 17 Sep 2019 18:20:20 +0100
From: Will Deacon <will@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20190917172020.hpv5qqdpihvqkehp@willie-the-truck>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
 <1566327992-362-6-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566327992-362-6-git-send-email-jcrouse@codeaurora.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568740825;
 bh=LwKNamw9E4oxB1xQosrZOWdgQe92VETqR14nO7/u3js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rJlZcMxRdss/C5nXphHfwkC11ZGWaIGXj83MelUvHMUq8I5gSd3pOW0iqwlgLnYdo
 Pgfz4aYr9Vr2E/C3Kyr89FbWapiRPt+LjPYLADOrXfUF9UNAeOhYsNWikqPBTHHu5L
 OYwtmN9LUz73DR3FfZJOVIZucfs12gYrcDTf4euM=
Subject: Re: [Freedreno] [PATCH 5/7] iommu/arm-smmu: Support
 DOMAIN_ATTR_SPLIT_TABLES
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDE6MDY6MzBQTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiBTdXBwb3J0IHRoZSBET01BSU5fQVRUUl9TUExJVF9UQUJMRVMgYXR0cmlidXRlIHRv
IGxldCB0aGUgbGVhZiBkcml2ZXIKPiBrbm93IGlmIHNwbGl0IHBhZ2V0YWJsZXMgYXJlIGVuYWJs
ZWQgZm9yIHRoZSBkb21haW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNy
b3VzZUBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPiAKPiAgZHJpdmVycy9pb21tdS9hcm0tc21tdS5j
IHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMK
PiBpbmRleCAzZjQxY2Y3Li42YTUxMmZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9tbXUvYXJt
LXNtbXUuYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwo+IEBAIC0xNDQyLDYgKzE0
NDIsOSBAQCBzdGF0aWMgaW50IGFybV9zbW11X2RvbWFpbl9nZXRfYXR0cihzdHJ1Y3QgaW9tbXVf
ZG9tYWluICpkb21haW4sCj4gIAkJY2FzZSBET01BSU5fQVRUUl9ORVNUSU5HOgo+ICAJCQkqKGlu
dCAqKWRhdGEgPSAoc21tdV9kb21haW4tPnN0YWdlID09IEFSTV9TTU1VX0RPTUFJTl9ORVNURUQp
Owo+ICAJCQlyZXR1cm4gMDsKPiArCQljYXNlIERPTUFJTl9BVFRSX1NQTElUX1RBQkxFUzoKPiAr
CQkJKihpbnQgKilkYXRhID0gISEoc21tdV9kb21haW4tPnNwbGl0X3BhZ2V0YWJsZXMpOwo+ICsJ
CQlyZXR1cm4gMDsKCkhtbS4gQ291bGQgeW91IG1vdmUgdGhlIHNldHRpbmcgb2YgdGhpcyBhdHRy
aWJ1dGUgaW50bwphcm1fc21tdV9kb21haW5fc2V0X2F0dHIoKSBhbmQgcmVqZWN0IGl0IGlmIHRo
ZSBpYXMgIT0gNDggaW4gdGhlcmU/IFRoYXQgd2F5CnRoZSB1c2VyIG9mIHRoZSBkb21haW4gY2Fu
IHJlcXVlc3QgdGhpcyBmZWF0dXJlLCByYXRoZXIgdGhhbiB1cyBlbmZvcmNpbmcgaXQKYmFzZWQg
b24gdGhlIGNvbXBhdGlibGUgc3RyaW5nLgoKSSdkIGFsc28gcHJlZmVyIHRvIGNhbGwgaXQgRE9N
QUlOX0FUVFJfVVNFX1RUQlIxIGluc3RlYWQsIHNpbmNlIGl0J3MgcHJldHR5CkFSTSBzcGVjaWZp
YyBhdCB0aGlzIHBvaW50LgoKV2lsbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9mcmVlZHJlbm8=

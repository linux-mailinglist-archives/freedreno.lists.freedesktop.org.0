Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D0FB55C1
	for <lists+freedreno@lfdr.de>; Tue, 17 Sep 2019 20:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E546A6E314;
	Tue, 17 Sep 2019 18:56:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4C46E314
 for <freedreno@lists.freedesktop.org>; Tue, 17 Sep 2019 18:56:25 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A4A8214AF;
 Tue, 17 Sep 2019 18:56:25 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
 <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
To: Jordan Crouse <jcrouse@codeaurora.org>, freedreno@lists.freedesktop.org
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Tue, 17 Sep 2019 11:56:24 -0700
Message-Id: <20190917185625.8A4A8214AF@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568746585;
 bh=mbODalGRNQoWNnowm2tS1pcY2EbwBFAWll84phPGxbA=;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
 b=X2afMEBspYqrVXT0KNPzGo8hs6SqE7bnObaYtDnvMs7z38QOJlK4gbKabuaAqCbOP
 ECW6wcm77plYCjJXgCBwwyyI+0OSQOARJZVVveEUXUP3MPVeTbryP4q99Pt9Jmw6Ld
 HKuDFOJ+H+7HjkuwaGkz3B4DI6P4W2cia6BT6KaQ=
Subject: Re: [Freedreno] [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU
 variant
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBKb3JkYW4gQ3JvdXNlICgyMDE5LTA4LTIwIDEyOjA2OjI3KQo+IEFkZCBhIGNvbXBh
dGlibGUgc3RyaW5nIHRvIGlkZW50aWZ5IFNNTVVzIHRoYXQgYXJlIGF0dGFjaGVkCj4gdG8gQWRy
ZW5vIEdQVSBkZXZpY2VzIHRoYXQgd2lzaCB0byBzdXBwb3J0IHNwbGl0IHBhZ2V0YWJsZXMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4K
PiAtLS0KPiAKPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2FybSxz
bW11LnR4dCB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9h
cm0sc21tdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvYXJt
LHNtbXUudHh0Cj4gaW5kZXggMzEzM2YzYi4uM2IwNzg5NiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvYXJtLHNtbXUudHh0Cj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2FybSxzbW11LnR4dAo+IEBAIC0x
OCw2ICsxOCw3IEBAIGNvbmRpdGlvbnMuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICJhcm0s
bW11LTUwMCIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgImNhdml1bSxzbW11LXYyIgo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAicWNvbSxzbW11LXYyIgo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICJxY29tLGFkcmVuby1zbW11LXYyIgoKSXMgdGhlIHRhYmJpbmcgd2VpcmQgaGVyZSBv
ciBqdXN0IG15IE1VQSBpcyBmYWlsaW5nPwoKPiAgCj4gICAgICAgICAgICAgICAgICAgIGRlcGVu
ZGluZyBvbiB0aGUgcGFydGljdWxhciBpbXBsZW1lbnRhdGlvbiBhbmQvb3IgdGhlCj4gICAgICAg
ICAgICAgICAgICAgIHZlcnNpb24gb2YgdGhlIGFyY2hpdGVjdHVyZSBpbXBsZW1lbnRlZC4KPiBA
QCAtMzEsNiArMzIsMTIgQEAgY29uZGl0aW9ucy4KPiAgICAgICAgICAgICAgICAgICAgYXMgYmVs
b3csIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlczoKPiAgICAgICAgICAgICAgICAgICAgInFjb20s
c2RtODQ1LXNtbXUtNTAwIiwgImFybSxtbXUtNTAwIgo+ICAKPiArICAgICAgICAgICAgICAgICAi
cWNvbSxhZHJlbm8tc21tdS12MiIgaXMgYSBzcGVjaWFsIGltcGxlbWVudGF0aW9uIGZvcgoKSGVo
LCBzcGVjaWFsLgoKPiArICAgICAgICAgICAgICAgICBTTU1VIGRldmljZXMgYXR0YWNoZWQgdG8g
dGhlIEFkcmVubyBHUFUgb24gUWNvbSBkZXZpY2VzLgo+ICsgICAgICAgICAgICAgICAgIElmIHNl
bGVjdGVkLCB0aGlzIHdpbGwgZW5hYmxlIHNwbGl0IHBhZ2V0YWJsZSAoVFRCUjEpCgpJcyB0aGlz
IHNlbGVjdGVkPyBTb3VuZHMgbGlrZSBLY29uZmlnIGhlcmUuCgo+ICsgICAgICAgICAgICAgICAg
IHN1cHBvcnQuIE9ubHkgdXNlIHRoaXMgaWYgdGhlIEdQVSB0YXJnZXQgaXMgY2FwYWJsZSBvZgo+
ICsgICAgICAgICAgICAgICAgIHN1cHBvcnRpbmcgNjQgYml0IGFkZHJlc3Nlcy4KPiArCj4gIC0g
cmVnICAgICAgICAgICA6IEJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgU01NVS4KPiAgCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBt
YWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

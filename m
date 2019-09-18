Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E4B6723
	for <lists+freedreno@lfdr.de>; Wed, 18 Sep 2019 17:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388AC6F3CF;
	Wed, 18 Sep 2019 15:32:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931086F3CF
 for <freedreno@lists.freedesktop.org>; Wed, 18 Sep 2019 15:32:51 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 55CAE611C5; Wed, 18 Sep 2019 15:32:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 11D456034D;
 Wed, 18 Sep 2019 15:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11D456034D
Date: Wed, 18 Sep 2019 09:32:48 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20190918153248.GC25762@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1568756922-2829-1-git-send-email-jcrouse@codeaurora.org>
 <20190918115058.GB9880@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918115058.GB9880@bombadil.infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1568820771;
 bh=TNmAPCB7e2qEqf6X6jXwm3UGb2yqNQTB+ZXg9tdTpQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OpcRnCZTCW6E4/7RqkverZwxbwC+kRsF1qSbrSw1RD+WyM+CbiBtNIOXl2/W5zXZF
 jmFKPyA79C0l+w6zXXmy4VzHZ9bpAPdsindefawaxQYadfzqWbUPAIfaOEcgBQemsK
 ihUXknr5Lw/NRp9zhrdnrciufcF6j4pMcYaQeA2g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1568820770;
 bh=TNmAPCB7e2qEqf6X6jXwm3UGb2yqNQTB+ZXg9tdTpQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EA/X6sJt/OwsZs68vHUGHAlVHrrFC1qbanywuabEu6rk/6VZRkIkegBN+AhImTk3z
 /Yl/GAiL6XrIQhn3wa9+BHtW39EGDE2MASsOjlzYtvQJLMhzmjXpbo74EY4rIUpPsl
 76sHfF/0JMocsmg6t9j8PrvYOfwA0AQ245+Pmt1c=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: Re: [Freedreno] [PATCH] idr: Prevent unintended underflow for the
 idr index
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
Cc: linux-fsdevel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDQ6NTA6NThBTSAtMDcwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDM6NDg6NDJQTSAtMDYwMCwgSm9yZGFu
IENyb3VzZSB3cm90ZToKPiA+IEl0IGlzIHBvc3NpYmxlIGZvciB1bmF3YXJlIGNhbGxlcnMgb2Yg
c2V2ZXJhbCBpZHIgZnVuY3Rpb25zIHRvIGFjY2lkZW50YWxseQo+ID4gdW5kZXJmbG93IHRoZSBp
bmRleCBieSBzcGVjaWZ5aW5nIGEgaWQgdGhhdCBpcyBsZXNzIHRoYW4gdGhlIGlkciBiYXNlLgo+
IAo+IEhpIEpvcmRhbi4gIFRoYW5rcyBmb3IgdGhlIHBhdGNoLCBidXQgdGhpcyBzZWVtcyBsaWtl
IGEgZGlzdGluY3Rpb24KPiB3aXRob3V0IGEgZGlmZmVyZW5jZS4KPiAKPiA+ICB2b2lkICppZHJf
cmVtb3ZlKHN0cnVjdCBpZHIgKmlkciwgdW5zaWduZWQgbG9uZyBpZCkKPiA+ICB7Cj4gPiArCWlm
IChpZCA8IGlkci0+aWRyX2Jhc2UpCj4gPiArCQlyZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICAJcmV0
dXJuIHJhZGl4X3RyZWVfZGVsZXRlX2l0ZW0oJmlkci0+aWRyX3J0LCBpZCAtIGlkci0+aWRyX2Jh
c2UsIE5VTEwpOwo+IAo+IElmIHRoaXMgdW5kZXJmbG93cywgd2UnbGwgdHJ5IHRvIGRlbGV0ZSBh
biBpbmRleCB3aGljaCBkb2Vzbid0IGV4aXN0LAo+IHdoaWNoIHdpbGwgcmV0dXJuIE5VTEwuCj4g
Cj4gPiAgdm9pZCAqaWRyX2ZpbmQoY29uc3Qgc3RydWN0IGlkciAqaWRyLCB1bnNpZ25lZCBsb25n
IGlkKQo+ID4gIHsKPiA+ICsJaWYgKGlkIDwgaWRyLT5pZHJfYmFzZSkKPiA+ICsJCXJldHVybiBO
VUxMOwo+ID4gKwo+ID4gIAlyZXR1cm4gcmFkaXhfdHJlZV9sb29rdXAoJmlkci0+aWRyX3J0LCBp
ZCAtIGlkci0+aWRyX2Jhc2UpOwo+IAo+IElmIHRoaXMgdW5kZXJmbG93cywgd2UnbGwgbG9vayB1
cCBhbiBlbnRyeSB3aGljaCBkb2Vzbid0IGV4aXN0LCB3aGljaAo+IHdpbGwgcmV0dXJuIE5VTEwu
Cj4gCj4gPiBAQCAtMzAyLDYgKzMwOCw5IEBAIHZvaWQgKmlkcl9yZXBsYWNlKHN0cnVjdCBpZHIg
Kmlkciwgdm9pZCAqcHRyLCB1bnNpZ25lZCBsb25nIGlkKQo+ID4gIAl2b2lkIF9fcmN1ICoqc2xv
dCA9IE5VTEw7Cj4gPiAgCXZvaWQgKmVudHJ5Owo+ID4gIAo+ID4gKwlpZiAoaWQgPCBpZHItPmlk
cl9iYXNlKQo+ID4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7Cj4gPiArCj4gPiAgCWlkIC09
IGlkci0+aWRyX2Jhc2U7Cj4gPiAgCj4gPiAgCWVudHJ5ID0gX19yYWRpeF90cmVlX2xvb2t1cCgm
aWRyLT5pZHJfcnQsIGlkLCAmbm9kZSwgJnNsb3QpOwo+IAo+IC4uLiBqdXN0IG91dHNpZGUgdGhl
IGNvbnRleHQgaXMgdGhpcyBsaW5lOgo+ICAgICAgICAgaWYgKCFzbG90IHx8IHJhZGl4X3RyZWVf
dGFnX2dldCgmaWRyLT5pZHJfcnQsIGlkLCBJRFJfRlJFRSkpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBFUlJfUFRSKC1FTk9FTlQpOwo+IAo+IExvb2tpbmcgdXAgYW4gaW5kZXggd2hpY2ggZG9l
c24ndCBleGlzdCBnZXRzIHlvdSBhIE5VTEwgc2xvdCwgc28geW91IGdldAo+IC1FTk9FTlQgYW55
d2F5Lgo+IAo+IEkgZGlkIHRoaW5rIGFib3V0IHRoZXNlIHBvc3NpYmlsaXRpZXMgd2hlbiBJIHdh
cyB3cml0aW5nIHRoZSBjb2RlIGFuZAo+IGNvbnZpbmNlZCBteXNlbGYgSSBkaWRuJ3QgbmVlZCB0
aGVtLiAgSWYgeW91IGhhdmUgYW4gZXhhbXBsZSBvZiBhIGNhc2UKPiB3aGVyZSBJIGdvdCB0aGFz
dCB3cm9uZywgSSdkIGxvdmUgdG8gc2VlIGl0Lgo+IAo+IE1vcmUgZ2VuZXJhbGx5LCB0aGUgSURS
IGlzIGRlcHJlY2F0ZWQ7IEknbSB0cnlpbmcgdG8gY29udmVydCB1c2VycyB0bwo+IHRoZSBYQXJy
YXkuICBJZiB5b3UncmUgYWRkaW5nIGEgbmV3IHVzZXIsIGNhbiB5b3UgdXNlIHRoZSBYQXJyYXkg
QVBJCj4gaW5zdGVhZD8KClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJIGhhcHBlbmVkIHRv
IHdhbGsgYnkgd2hpbGUgY29kZSBpbnNwZWN0aW5nIGFuCmV4aXN0aW5nIG91dC1vZi10cmVlIHVz
ZXIgYW5kIHRob3VnaHQgdGhlcmUgbWlnaHQgYmUgYSBzbWFsbCBob2xlIHRvIGZpbGwKYnV0IEkg
YWdyZWUgaXQgaXMgdW5saWtlbHkgdGhhdCB0aGUgdW5kZXJmbG93IGlzIGxpa2VseSB0byBiZSBh
IHZhbGlkIGlkLgoKSm9yZGFuCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBD
b2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5v

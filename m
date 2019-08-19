Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEB94CC6
	for <lists+freedreno@lfdr.de>; Mon, 19 Aug 2019 20:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A976E261;
	Mon, 19 Aug 2019 18:26:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2060B6E261
 for <freedreno@lists.freedesktop.org>; Mon, 19 Aug 2019 18:26:55 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A950222CF6;
 Mon, 19 Aug 2019 18:26:54 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190819165255.GA26807@tuxbook-pro>
References: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
 <20190807234232.27AA720880@mail.kernel.org>
 <20190819165255.GA26807@tuxbook-pro>
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
User-Agent: alot/0.8.1
Date: Mon, 19 Aug 2019 11:26:53 -0700
Message-Id: <20190819182654.A950222CF6@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566239214;
 bh=Ivyitg0Ej4OT9+wlNtHSfddysy0Yzo6f+ai2y1gszXo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=yKwuiNEaKXSYTOZwJLHBcizgkZa/S9//ofj0LoEwmolfjTUp76LpNj7X/Gw2u9OVT
 lA2rQ2cnpzqET0Sj2IWzg0jTiYtu6cz3rBpDG/h5df4HVfJVWcUGMAydFgak4HldCg
 yjvbx6h0fC4neMZWruWmN2spKfWn+0bAiGb0txB4=
Subject: Re: [Freedreno] [PATCH v2] drivers: qcom: Add BCM vote macro to
 header
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
Cc: Taniya Das <tdas@codeaurora.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jordan Crouse <jcrouse@codeaurora.org>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBCam9ybiBBbmRlcnNzb24gKDIwMTktMDgtMTkgMDk6NTI6NTUpCj4gT24gV2VkIDA3
IEF1ZyAxNjo0MiBQRFQgMjAxOSwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+IAo+ID4gUXVvdGluZyBK
b3JkYW4gQ3JvdXNlICgyMDE5LTA4LTA1IDEzOjMzOjQ2KQo+ID4gPiBUaGUgbWFjcm8gdG8gZ2Vu
ZXJhdGUgYSBCdXMgQ29udHJvbGxlciBNYW5hZ2VyIChCQ00pIFRDUyBjb21tYW5kIGlzIHVzZWQK
PiA+ID4gYnkgdGhlIGludGVyY29ubmVjdCBkcml2ZXIgYnV0IG1pZ2h0IGFsc28gYmUgaW50ZXJl
c3RpbmcgdG8gb3RoZXIKPiA+ID4gZHJpdmVycyB0aGF0IG5lZWQgdG8gY29uc3RydWN0IFRDUyBj
b21tYW5kcyBmb3Igc3ViIHByb2Nlc3NvcnMgc28gbW92ZQo+ID4gPiBpdCBvdXQgb2YgdGhlIHNk
bTg0NSBzcGVjaWZpYyBmaWxlIGFuZCBpbnRvIHRoZSBoZWFkZXIuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+ID4gPiAt
LS0KPiA+IAo+ID4gQWNrZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KPiA+
IAo+ID4gVW5sZXNzIHRoaXMgaXMgc3VwcG9zZWQgdG8gYmUgYXBwbGllZCBieSBtZT8KPiA+IAo+
ID4gQlRXLCBJIHdvbmRlciB3aHkgd2UgbmVlZCBhbiBycG0gY2xrIGRyaXZlciBtdWNoIGF0IGFs
bCBub3dhZGF5cywgZXhjZXB0Cj4gPiBtYXliZSBmb3IgdGhlIFhPIGNsayBzdGF0ZS4gVGhlIGJp
ZyB1c2VyLCBmcm9tIHdoYXQgSSBjYW4gdGVsbCwgaXMgdGhlCj4gPiBpbnRlcmNvbm5lY3QgZHJp
dmVyIGFuZCB3ZSBkb24ndCB1c2UgYW55IG9mIHRoZSBmZWF0dXJlcyBvZiB0aGUgY2xrCj4gPiBm
cmFtZXdvcmsgYmVzaWRlcyB0aGUgQVBJIHRvIHNldCBhIGZyZXF1ZW5jeS4gTWF5YmUgaXQgd291
bGQgYmUgYmV0dGVyCj4gPiB0byBqdXN0IHB1c2ggcHVzaCB0aGUgYnVzIGZyZXF1ZW5jeSBsb2dp
YyBpbnRvIGludGVyY29ubmVjdCBjb2RlLCB0aGVuCj4gPiBYTyBjbGsgaXMgdGhlIG9ubHkgdGhp
bmcgd2UgbmVlZCB0byBrZWVwLCBhbmQgaXQgY2FuIGJlIGEgc2ltcGxlIG9uL29mZgo+ID4gdGhp
bmcuCj4gPiAKPiAKPiBUaGVyZSdzIGJlZW4gYSBudW1iZXIgb2YgY2FzZXMgd2hlcmUgd2UnbGwg
bmVlZCB0byBlbmFibGUgdGhlIGJ1ZmZlcmVkCj4gWE9zLCBidXQgcGVyaGFwcyB0aGVzZSBhcmUg
aGFuZGxlZCBieSBvdGhlciBzdWJzeXN0ZW1zIHRoZXNlIGRheXMoPykKPiAKPiBJZiBzbyB0aGUg
b25lIGNhc2UgdGhhdCByZW1haW5zIHdvdWxkIGJlIHRoZSBvcGVyYXRpb24gb2YgZXhwbGljaXRs
eQo+IGhvbGRpbmcgQ1hPIGVuYWJsZWQgZHVyaW5nIG9wZXJhdGlvbnMgc3VjaCBhcyBib290aW5n
IHRoZSByZW1vdGVwcm9jcy4KPiAKClllcyBJIHRoaW5rIHRoZSBYTyAoYW5kIHRoZSBidWZmZXJz
KSBpcyB0aGUgb25seSB0aGluZyB0aGF0IHdlIHJlYWxseQpzZWVtIHRvIGNhcmUgYWJvdXQgZm9y
IHRoZSBjbGsgdHJlZS4gT3RoZXJ3aXNlLCB0aGUgc29sZSB1c2VyIGlzCmludGVyY29ubmVjdCBj
b2RlIGFuZCB0aHVzIGhhbmRsaW5nIGl0IGluIHRoZSBycG1oIGNsayBkcml2ZXIgZG9lc24ndApy
ZWFsbHkgZ2FpbiB1cyBhbnl0aGluZy4gSW4gZmFjdCwgaXQganVzdCBtYWtlcyBpdCB3b3JzZSBi
ZWNhdXNlIGl0IHRpZXMKdGhlIGNsayB0cmVlIHVwIHdpdGggdGhpbmdzIHRoYXQgY291bGQgdGFr
ZSBhIHdoaWxlIHRvIHByb2Nlc3Mgb24gdGhlClJQTSBzaWRlLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVl
ZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215D8C0FE
	for <lists+freedreno@lfdr.de>; Tue, 13 Aug 2019 20:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4736E229;
	Tue, 13 Aug 2019 18:47:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528806E229
 for <freedreno@lists.freedesktop.org>; Tue, 13 Aug 2019 18:47:21 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 2BFED605A2; Tue, 13 Aug 2019 18:47:21 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8773B605A2;
 Tue, 13 Aug 2019 18:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8773B605A2
Date: Tue, 13 Aug 2019 12:47:17 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Message-ID: <20190813184717.GA28465@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Stephen Boyd <sboyd@kernel.org>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-clk@vger.kernel.org,
 Taniya Das <tdas@codeaurora.org>
References: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
 <20190807234232.27AA720880@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807234232.27AA720880@mail.kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565722041;
 bh=4vlQBHXZefdhk1fMpS9K60hc0yLOya2J7kL8k05ISsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MzKvf3Bdi4lF9Vx/WDwVpzChgPmmDmNM7n9XD4ndxMS3tZ059aEv6ySa4+kR+OrzE
 HNHphu71chDg5he16DcbDOtVAJK+L0j3dBYXgru4z3u6C8z2tEI+KOAU0cYKcFBXAH
 kL6gHFGYnvZ+YvCWfkbGRdWNl624vTAvguWhac+Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565722040;
 bh=4vlQBHXZefdhk1fMpS9K60hc0yLOya2J7kL8k05ISsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kEw1XN3rhVtk1HvRWxOSp3f/VsT0koH4XYN1tvdk1wXd1LTOGh6wtXqQoohnlgqM2
 Z14vc2EYUHFduUw/JlE0KKNQK/QVsWiRyBpzrUzpAenAVE15VT6q77Zoqjzkx3id0M
 gPM9ohyoSWiM14roPi3Dx7z7EfQykuA02NczTqPw=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDQ6NDI6MzFQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdy
b3RlOgo+IFF1b3RpbmcgSm9yZGFuIENyb3VzZSAoMjAxOS0wOC0wNSAxMzozMzo0NikKPiA+IFRo
ZSBtYWNybyB0byBnZW5lcmF0ZSBhIEJ1cyBDb250cm9sbGVyIE1hbmFnZXIgKEJDTSkgVENTIGNv
bW1hbmQgaXMgdXNlZAo+ID4gYnkgdGhlIGludGVyY29ubmVjdCBkcml2ZXIgYnV0IG1pZ2h0IGFs
c28gYmUgaW50ZXJlc3RpbmcgdG8gb3RoZXIKPiA+IGRyaXZlcnMgdGhhdCBuZWVkIHRvIGNvbnN0
cnVjdCBUQ1MgY29tbWFuZHMgZm9yIHN1YiBwcm9jZXNzb3JzIHNvIG1vdmUKPiA+IGl0IG91dCBv
ZiB0aGUgc2RtODQ1IHNwZWNpZmljIGZpbGUgYW5kIGludG8gdGhlIGhlYWRlci4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiA+
IC0tLQo+IAo+IEFja2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4gCj4g
VW5sZXNzIHRoaXMgaXMgc3VwcG9zZWQgdG8gYmUgYXBwbGllZCBieSBtZT8KCkkgZmlndXJlZCB0
aGlzIGxhbmRlZCBpbiBCam9ybidzIGRvbWFpbiwgYnV0IHlvdSBndXlzIGNhbiBmaWdodCBpdCBv
dXQgaWYgeW91CndhbnQuCgpKb3JkYW4KCj4gQlRXLCBJIHdvbmRlciB3aHkgd2UgbmVlZCBhbiBy
cG0gY2xrIGRyaXZlciBtdWNoIGF0IGFsbCBub3dhZGF5cywgZXhjZXB0Cj4gbWF5YmUgZm9yIHRo
ZSBYTyBjbGsgc3RhdGUuIFRoZSBiaWcgdXNlciwgZnJvbSB3aGF0IEkgY2FuIHRlbGwsIGlzIHRo
ZQo+IGludGVyY29ubmVjdCBkcml2ZXIgYW5kIHdlIGRvbid0IHVzZSBhbnkgb2YgdGhlIGZlYXR1
cmVzIG9mIHRoZSBjbGsKPiBmcmFtZXdvcmsgYmVzaWRlcyB0aGUgQVBJIHRvIHNldCBhIGZyZXF1
ZW5jeS4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyCj4gdG8ganVzdCBwdXNoIHB1c2ggdGhlIGJ1
cyBmcmVxdWVuY3kgbG9naWMgaW50byBpbnRlcmNvbm5lY3QgY29kZSwgdGhlbgo+IFhPIGNsayBp
cyB0aGUgb25seSB0aGluZyB3ZSBuZWVkIHRvIGtlZXAsIGFuZCBpdCBjYW4gYmUgYSBzaW1wbGUg
b24vb2ZmCj4gdGhpbmcuCj4gCgotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJ
bmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24g
Q29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ZyZWVkcmVubw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E2F8C1D7
	for <lists+freedreno@lfdr.de>; Tue, 13 Aug 2019 22:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391CF6E100;
	Tue, 13 Aug 2019 20:10:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3B16E0F7
 for <freedreno@lists.freedesktop.org>; Tue, 13 Aug 2019 20:10:00 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D5692067D;
 Tue, 13 Aug 2019 20:10:00 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190813184717.GA28465@jcrouse1-lnx.qualcomm.com>
References: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
 <20190807234232.27AA720880@mail.kernel.org>
 <20190813184717.GA28465@jcrouse1-lnx.qualcomm.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
User-Agent: alot/0.8.1
Date: Tue, 13 Aug 2019 13:09:59 -0700
Message-Id: <20190813201000.6D5692067D@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565727000;
 bh=IiCD7IsT67JhzKzMH/tdAui5BDrSXtu3NUCLmNQc6n0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=XXoWIRKlGSg9iDPpwqt+n7qPov9+Y81AxhP2IGS5o4ds4+Pf25nRy0LFC8t3z1klw
 Xk+fVp92/JUXpkJShUwE+FrauPx8Ah4KPjQujcJPjhTERhCnnj5oePyrsVsgBbIi/O
 OY6wc0S+N7ESGb6XRuu1kcS5gQF7Jl3V8D8lsqeY=
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

UXVvdGluZyBKb3JkYW4gQ3JvdXNlICgyMDE5LTA4LTEzIDExOjQ3OjE3KQo+IE9uIFdlZCwgQXVn
IDA3LCAyMDE5IGF0IDA0OjQyOjMxUE0gLTA3MDAsIFN0ZXBoZW4gQm95ZCB3cm90ZToKPiA+IFF1
b3RpbmcgSm9yZGFuIENyb3VzZSAoMjAxOS0wOC0wNSAxMzozMzo0NikKPiA+ID4gVGhlIG1hY3Jv
IHRvIGdlbmVyYXRlIGEgQnVzIENvbnRyb2xsZXIgTWFuYWdlciAoQkNNKSBUQ1MgY29tbWFuZCBp
cyB1c2VkCj4gPiA+IGJ5IHRoZSBpbnRlcmNvbm5lY3QgZHJpdmVyIGJ1dCBtaWdodCBhbHNvIGJl
IGludGVyZXN0aW5nIHRvIG90aGVyCj4gPiA+IGRyaXZlcnMgdGhhdCBuZWVkIHRvIGNvbnN0cnVj
dCBUQ1MgY29tbWFuZHMgZm9yIHN1YiBwcm9jZXNzb3JzIHNvIG1vdmUKPiA+ID4gaXQgb3V0IG9m
IHRoZSBzZG04NDUgc3BlY2lmaWMgZmlsZSBhbmQgaW50byB0aGUgaGVhZGVyLgo+ID4gPiAKPiA+
ID4gU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4K
PiA+ID4gLS0tCj4gPiAKPiA+IEFja2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5v
cmc+Cj4gPiAKPiA+IFVubGVzcyB0aGlzIGlzIHN1cHBvc2VkIHRvIGJlIGFwcGxpZWQgYnkgbWU/
Cj4gCj4gSSBmaWd1cmVkIHRoaXMgbGFuZGVkIGluIEJqb3JuJ3MgZG9tYWluLCBidXQgeW91IGd1
eXMgY2FuIGZpZ2h0IGl0IG91dCBpZiB5b3UKPiB3YW50Lgo+IAoKT2suIEknbSBoYXBweSB0byBh
dm9pZCB0aGUgZmlnaHQhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVl
ZHJlbm8=

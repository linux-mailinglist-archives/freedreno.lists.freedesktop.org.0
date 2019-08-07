Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34548568F
	for <lists+freedreno@lfdr.de>; Thu,  8 Aug 2019 01:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962066E777;
	Wed,  7 Aug 2019 23:42:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1586E777
 for <freedreno@lists.freedesktop.org>; Wed,  7 Aug 2019 23:42:32 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27AA720880;
 Wed,  7 Aug 2019 23:42:32 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
References: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>, freedreno@lists.freedesktop.org
User-Agent: alot/0.8.1
Date: Wed, 07 Aug 2019 16:42:31 -0700
Message-Id: <20190807234232.27AA720880@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565221352;
 bh=AB0/GU2h6UDA8h5FXu3N6Lb3ksMEGrIp/OcfbfuwI5w=;
 h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
 b=g4jKpvg5O2bjHaVoG/3b91MBzydKjYsPJ2V0u9zxzG6GvKDjfXVeFp1uM+ImQHCyW
 9SekbeHZnKbmLeUs0RGRBDVh1e0A5D8PCKq2ZbGyzc0O3hIPbBec02LHfya3GJcxIQ
 wACvdtfptz19RL9raollDDdGq9xtTPTII5QVkuWw=
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
 Andy Gross <agross@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBKb3JkYW4gQ3JvdXNlICgyMDE5LTA4LTA1IDEzOjMzOjQ2KQo+IFRoZSBtYWNybyB0
byBnZW5lcmF0ZSBhIEJ1cyBDb250cm9sbGVyIE1hbmFnZXIgKEJDTSkgVENTIGNvbW1hbmQgaXMg
dXNlZAo+IGJ5IHRoZSBpbnRlcmNvbm5lY3QgZHJpdmVyIGJ1dCBtaWdodCBhbHNvIGJlIGludGVy
ZXN0aW5nIHRvIG90aGVyCj4gZHJpdmVycyB0aGF0IG5lZWQgdG8gY29uc3RydWN0IFRDUyBjb21t
YW5kcyBmb3Igc3ViIHByb2Nlc3NvcnMgc28gbW92ZQo+IGl0IG91dCBvZiB0aGUgc2RtODQ1IHNw
ZWNpZmljIGZpbGUgYW5kIGludG8gdGhlIGhlYWRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3Jk
YW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+IC0tLQoKQWNrZWQtYnk6IFN0ZXBo
ZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KClVubGVzcyB0aGlzIGlzIHN1cHBvc2VkIHRvIGJl
IGFwcGxpZWQgYnkgbWU/CgpCVFcsIEkgd29uZGVyIHdoeSB3ZSBuZWVkIGFuIHJwbSBjbGsgZHJp
dmVyIG11Y2ggYXQgYWxsIG5vd2FkYXlzLCBleGNlcHQKbWF5YmUgZm9yIHRoZSBYTyBjbGsgc3Rh
dGUuIFRoZSBiaWcgdXNlciwgZnJvbSB3aGF0IEkgY2FuIHRlbGwsIGlzIHRoZQppbnRlcmNvbm5l
Y3QgZHJpdmVyIGFuZCB3ZSBkb24ndCB1c2UgYW55IG9mIHRoZSBmZWF0dXJlcyBvZiB0aGUgY2xr
CmZyYW1ld29yayBiZXNpZGVzIHRoZSBBUEkgdG8gc2V0IGEgZnJlcXVlbmN5LiBNYXliZSBpdCB3
b3VsZCBiZSBiZXR0ZXIKdG8ganVzdCBwdXNoIHB1c2ggdGhlIGJ1cyBmcmVxdWVuY3kgbG9naWMg
aW50byBpbnRlcmNvbm5lY3QgY29kZSwgdGhlbgpYTyBjbGsgaXMgdGhlIG9ubHkgdGhpbmcgd2Ug
bmVlZCB0byBrZWVwLCBhbmQgaXQgY2FuIGJlIGEgc2ltcGxlIG9uL29mZgp0aGluZy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

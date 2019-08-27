Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE79DCC4
	for <lists+freedreno@lfdr.de>; Tue, 27 Aug 2019 06:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A3489214;
	Tue, 27 Aug 2019 04:47:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CFE89214
 for <freedreno@lists.freedesktop.org>; Tue, 27 Aug 2019 04:47:21 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c81so13245109pfc.11
 for <freedreno@lists.freedesktop.org>; Mon, 26 Aug 2019 21:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZggmcMPjgmDFSK8EEYOInY8FueVBR2R/tMdLkVfa1po=;
 b=reKOH9vg+b66qJpRg/jEj8cFq0G4ssfOpe8OarXgOoFZ1iIr5SlgMZHa7egswmQKUK
 rh1p3JhCTszQlU6yDAYDXJaHPinRdbdH/Al+q7vGbomB/HzZgSc2tn0chSDnxx8i73Yi
 yKAfl7zz1/dr+o6NI5cDbW4jQipNf0OeFSEvsg/MZ7y5i6mBR7kXp+0NyyWP6T5UOXch
 D0yoC55oLdc9rDh6L6r3qd/zzZ6VWAIiLs/J5UDeiy1vv0NALgYfm72AU8kXmIa8mSsV
 MiTGcsRHTqEDAO+D5F15pzrNFioLJx6Hci0VHmuY2zxcVc8oh/GZXirsliI6yF48t+sy
 9M9w==
X-Gm-Message-State: APjAAAVslRIZ7Peojfg+vH7dG6ceJopI94aBVyN2sOZLn4ewGUgX1jS4
 Nrj5fmHd+u5Zu4d9OonqFknnBQ==
X-Google-Smtp-Source: APXvYqyE8chtCs5y/WfhbpCulmRV//9zfesOLjWPH3tkAUvp8citEd3eNp1ZCu7OM1j6VaK7ZpbMrg==
X-Received: by 2002:aa7:9516:: with SMTP id b22mr23967083pfp.106.1566881240912; 
 Mon, 26 Aug 2019 21:47:20 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id v8sm11778661pgs.82.2019.08.26.21.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 21:47:20 -0700 (PDT)
Date: Mon, 26 Aug 2019 21:49:09 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20190827044909.GD1892@tuxbook-pro>
References: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org>
 <1565707585-5359-2-git-send-email-jcrouse@codeaurora.org>
 <CACRpkdbtPo9dr7E2hZ4=fEWTXappWTaypKJyd9M2jz0tYu7HXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbtPo9dr7E2hZ4=fEWTXappWTaypKJyd9M2jz0tYu7HXw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZggmcMPjgmDFSK8EEYOInY8FueVBR2R/tMdLkVfa1po=;
 b=yFZSCiB0NW9TOMOMqdidHpwU9VtRg9aI8PKGUtwURiN/LSCSiAG8exF7F0huz7CfIL
 QQrFiClqVQ3U2EjlN2hfiqEZ99GCerlGf1avMwsuZtsJP6VnG/Clqi+NBV7UAwu/KEbQ
 rw6E6odIo0bhJnHBiNd9jASUNaNbxjat/1qiGjGgaydb8GNp8oMcgl2+EZYhgyiE0CsC
 FX2DpA4XR5PCqXzyKQxRJcJEmVKFZgAiwfvzpWXtWVjmtkStQCz9jFTivfjatl41qYO3
 6jTQpp7DHUdMzuU3hk2T9d7A3jxalfb8PjBrFy5mRbisSu3f5tXPGrpTx1bs9e5TBwai
 SpiA==
Subject: Re: [Freedreno] [PATCH v2 2/2] arm: Add DRM_MSM to defconfigs with
 ARCH_QCOM
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Anson Huang <Anson.Huang@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Andy Gross <agross@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Brian Masney <masneyb@onstation.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 MSM <linux-arm-msm@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Simon Horman <horms+renesas@verge.net.au>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick Fertr? <yannick.fertre@st.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>,
 Frank Rowand <frank.rowand@sony.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1IDIyIEF1ZyAyMzo1MiBQRFQgMjAxOSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gT24g
VHVlLCBBdWcgMTMsIDIwMTkgYXQgNDo0NiBQTSBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVh
dXJvcmEub3JnPiB3cm90ZToKPiAKPiA+IE5vdyB0aGF0IENPTkZJR19EUk1fTVNNIGlzIG5vIGxv
bmdlciBkZWZhdWx0ICd5JyBhZGQgaXQgYXMgYSBtb2R1bGUgdG8gYWxsCj4gPiBBUkNIX1FDT00g
ZW5hYmxlZCBkZWZjb25maWdzIHRvIHJlc3RvcmUgdGhlIHByZXZpb3VzIGV4cGVjdGVkIGJ1aWxk
Cj4gPiBiZWhhdmlvci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3Jv
dXNlQGNvZGVhdXJvcmEub3JnPgo+IAo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gCj4gSSBzdXBwb3NlIEFuZHkgd2lsbCBwaWNrIHRoaXMg
dXA/Cj4gCgpOb3Qgc3VyZSB3aHksIGJ1dCB0aGlzIHBhdGNoIGlzbid0IGluIGFueSBvZiBteSBt
YWlsYm94ZXMuIFNvIHRoYW5rcyBmb3IKdGhlIHJlbWluZGVyLCBJJ3ZlIHBpY2tlZCBpdCBmcm9t
IHBhdGNod29ya3MgZm9yIDUuNC4KClJlZ2FyZHMsCkJqb3JuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

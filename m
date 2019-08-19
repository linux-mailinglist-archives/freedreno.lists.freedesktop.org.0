Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64B94ACF
	for <lists+freedreno@lfdr.de>; Mon, 19 Aug 2019 18:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F746E22E;
	Mon, 19 Aug 2019 16:49:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BB26E22E
 for <freedreno@lists.freedesktop.org>; Mon, 19 Aug 2019 16:49:12 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id z3so1233315pln.6
 for <freedreno@lists.freedesktop.org>; Mon, 19 Aug 2019 09:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JfNQ1P5D1q5FjOjoMZsxiAYKvHd+lD5nnopxEzzzvMc=;
 b=lUqGZDFdtxsVyt8QdPHwk5GtI0zqX9gNmtuyHJYA5cLvu8XqQxsB5vBkW4V3vv/aGF
 m56W22h0fDhPU1MyKJGr5LY+jXAZt643LpNR8PqOf18uDKQsgDo30KLPZDi5/BpE4uo6
 33FnxRh2O3gUa8Wk8imMAjVV4v3YKc6+nFK1uOOmGa6CagfWlYosPZelIyHIjRmzb0Pg
 4f8KHxEXrCTY5mf+FmQVdMFQ5xZqOsoauUFO4wwvam6YemP/Meebt5RhEFJnok68peDa
 F6/8Ht/3f58O6nyNyoTgWaJeWgyQuX694CFOf7lUcwWrWobuOtPduIcmQTUyF6p+jZ03
 a2mg==
X-Gm-Message-State: APjAAAXnt5OIWOX9HKfpRSKh3EbMud3agqQumKiCTomFAnDqqelXEDZw
 UaDt4tAEF25B6lNjEmro4tYTvw==
X-Google-Smtp-Source: APXvYqwsgMZ2k5xp/8T99zAMciVVeb0hTMubBeJKxyPqVgwJxwc1NAU5VwwX26QtDrUgiabgaf1rsA==
X-Received: by 2002:a17:902:8f81:: with SMTP id
 z1mr23101913plo.290.1566233351811; 
 Mon, 19 Aug 2019 09:49:11 -0700 (PDT)
Received: from tuxbook-pro (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id i9sm15901499pgg.38.2019.08.19.09.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 09:49:11 -0700 (PDT)
Date: Mon, 19 Aug 2019 09:50:55 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20190819165055.GZ26807@tuxbook-pro>
References: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JfNQ1P5D1q5FjOjoMZsxiAYKvHd+lD5nnopxEzzzvMc=;
 b=st33qIY1DLlZc5OvsEzD7D1yWQ6hmvX+dVih9ZV5bdrQXdJmL/lUIoWwzRIUHzf9v7
 gm9s3iQNDchMgOfFPmebeTLO/NRHeFwsXaaLO1Chj0qjhcxJrvcowr/Wx4jIrvVuWVcW
 ZYU/qrzgTGSERPHcs79EDmrXD2fBK1k8Snsudj3aaO/leTo2L09hqCYIqQ4+saj+8By2
 V5OGMPTdJhn+apEajZvjx+Oh2uU2OIOaQFZUjXSCiyMA0q9w/sxBhRlW9OIivxNGWWiW
 W5Ly/o55dTV6UBs86QCDaZxG7ZFQOapqS2HNC4DEz1pzI20uFnMj464hnN7iq3+kt6Vc
 KIBw==
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
Cc: linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gTW9uIDA1IEF1ZyAxMzozMyBQRFQgMjAxOSwgSm9yZGFuIENyb3VzZSB3cm90ZToKCj4gVGhl
IG1hY3JvIHRvIGdlbmVyYXRlIGEgQnVzIENvbnRyb2xsZXIgTWFuYWdlciAoQkNNKSBUQ1MgY29t
bWFuZCBpcyB1c2VkCj4gYnkgdGhlIGludGVyY29ubmVjdCBkcml2ZXIgYnV0IG1pZ2h0IGFsc28g
YmUgaW50ZXJlc3RpbmcgdG8gb3RoZXIKPiBkcml2ZXJzIHRoYXQgbmVlZCB0byBjb25zdHJ1Y3Qg
VENTIGNvbW1hbmRzIGZvciBzdWIgcHJvY2Vzc29ycyBzbyBtb3ZlCj4gaXQgb3V0IG9mIHRoZSBz
ZG04NDUgc3BlY2lmaWMgZmlsZSBhbmQgaW50byB0aGUgaGVhZGVyLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+CgooRGlzY3Vzc2VkIHdp
dGggR2VvcmdpLCBoZSB3aWxsIHBpY2sgdGhlIHBhdGNoKQoKQWNrZWQtYnk6IEJqb3JuIEFuZGVy
c3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+CgpSZWdhcmRzLApCam9ybgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGlu
ZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

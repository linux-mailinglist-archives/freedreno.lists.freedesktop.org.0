Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9A4827A9
	for <lists+freedreno@lfdr.de>; Tue,  6 Aug 2019 00:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64CA89F45;
	Mon,  5 Aug 2019 22:41:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425A26E1BB
 for <freedreno@lists.freedesktop.org>; Mon,  5 Aug 2019 22:41:16 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id t16so40332174pfe.11
 for <freedreno@lists.freedesktop.org>; Mon, 05 Aug 2019 15:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GWbcR3xvFDNmBGhYbznH6s7cLBaKp4a0/ddWesxNcF8=;
 b=myOmdl5IxygQwobrWj0V2JyG7P6f01ti429cgfoRMfuCQKv72S6gh7Vac/P8qIeo0k
 Bm6/utdyQgeQ5FTMC6+nefcswp47nt0znkgynIJfEmB08ksxdNjWCZuPyErM8KwxSIVo
 ZFi+JmPvX6GJNpOpmCOq9dFRbcF9hcJ5yrY5G2RymzKXSqdtlbg0CGWnua2u7zMMauqD
 CGLkw/It22KM5t++ofLsVov81qDFOjuWkD4Ze2zJFTdOZoj+Z7MsBtG5uqdrDF4EF674
 n5q6dhsdMUkimg1/2lSamMw7TaG8JU9KjWJa4N63Oqe/G1NGV06fdpc3IqjFiOx1A32X
 SssA==
X-Gm-Message-State: APjAAAVSxpe9BpdG8dvlNazrPVDHYZU9RhONUDmNYZ7z+NUj7ipLFWHi
 iZCeK7Y6NqMCSSHeVWfXTNEWgg==
X-Google-Smtp-Source: APXvYqzLFSHj9hIrglUjQkYpFeaYOh80cYaOP+fMjZebJjv9jSvgLHClQzlfLnbBTszfX7Ribw6fZg==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr196402pgq.130.1565044875625; 
 Mon, 05 Aug 2019 15:41:15 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id w22sm90250322pfi.175.2019.08.05.15.41.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 15:41:14 -0700 (PDT)
Date: Mon, 5 Aug 2019 15:41:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Message-ID: <20190805224112.GA6470@builder>
References: <20190803142026.9647-1-masneyb@onstation.org>
 <20190803142026.9647-6-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190803142026.9647-6-masneyb@onstation.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GWbcR3xvFDNmBGhYbznH6s7cLBaKp4a0/ddWesxNcF8=;
 b=yIptHBFKiXtoJSpxG3bR7btwflHxC+u7tsW/YMVsilyZv3CTs+hJ3/PAxxja3yprwN
 K2/s/xCu4j+TWNoXy/J6zSUNZAocXBZ1mR4kh0psZKMbQ2lX1CQgghFFQBAegs65elzk
 VqLFyHVt/3zuzmKlOHgufofFKYe0yx0kj9YJGhq/pA1qRoo7gdfKltcISoR17nHf+j5i
 hyAkAlGYhIiubvjjO37w2cwMfYzNcTgDzChUGsK7ckYLT8fJCsnIv7HVEYD0C/VHdWS+
 CeTU3VVek8p8cm9q6Px8AcLxRA0Lw7yu7tMcmQFN8wcxAT4VdpzZe70ltRJHwtskyk2b
 tLHw==
Subject: Re: [Freedreno] [PATCH v4 5/6] soc: qcom: add OCMEM driver
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org,
 jcrouse@codeaurora.org, jonathan@marek.ca, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, robdclark@gmail.com, agross@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gU2F0IDAzIEF1ZyAwNzoyMCBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9xY29tL29jbWVtLmMgYi9kcml2ZXJzL3NvYy9xY29tL29jbWVt
LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uN2MyOGFkMzEw
OGE2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvc29jL3Fjb20vb2NtZW0uYwo+IEBA
IC0wLDAgKzEsNDMzIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKWy4uXQo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7CgpTaG91bGRuJ3QgdGhpcyBiZSAiR1BM
IHYyIj8KCgpBcGFydCBmcm9tIHRoYXQgSSB0aGluayB0aGlzIGxvb2tzIGdvb2QuClJldmlld2Vk
LWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgoKQFJvYiwg
d291bGQgeW91IGxpa2UgdG8gdGFrZSB0aGlzIHNlcmllcyB0aHJvdWdoIHlvdXIgdHJlZSBvciB3
b3VsZCB5b3UKbGVuZCBtZSBhbiBBY2sgb24gdGhlIGFkcmVubyBwYXRjaCBhbmQgSSdsbCBhcHBs
eSBpdCB0aHJvdWdoIHRoZSBxY29tCnRyZWU/IEZlZWwgZnJlZSB0byBhZGQgbXkgQWNrZWQtYnkg
dG8gdGhlIHJlbGV2YW50IHBhdGNoZXMsIGlmIG5lZWRlZC4KClJlZ2FyZHMsCkJqb3JuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

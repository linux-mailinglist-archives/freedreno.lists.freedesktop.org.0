Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF42B32B8E2
	for <lists+freedreno@lfdr.de>; Wed,  3 Mar 2021 16:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A03689650;
	Wed,  3 Mar 2021 15:19:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1E86E81E
 for <freedreno@lists.freedesktop.org>; Wed,  3 Mar 2021 04:01:25 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id q204so14259640pfq.10
 for <freedreno@lists.freedesktop.org>; Tue, 02 Mar 2021 20:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Sf0sHmQlDAnRMVroNklxTV9sD5YAM/nZAMHjs+CyJB4=;
 b=DqjN4DryIrwYkAZERDCNYsxYTCg/FgOx9g1tN3t7SP5NtBAhKPdo3lCnaiNnrvavBj
 ydQv0eborD4BkC3Y+XzqoGy8aiCKnHRP/JylIcwHTxxvnmHfiNck3OubW7XBEGVgwM/E
 eyPJ8aPDHdCm58TuvDHH1oXt8LBXlpvuzLeu0uEQYnF2tpIuFpM9aTgmkMnNPRxOhiUp
 6urTlvt4r1gJIWV2+KwsuriqRhtODU56xJwHEbD5X45GvkFali3XUBHAsbusiBqISTAG
 QjqQrRgogRk0iqTBD5b5SIRJMgViOx9k1dBWLNi6KV3Q8WtSrwTaeC9YwaQEP5fqZsTD
 H6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Sf0sHmQlDAnRMVroNklxTV9sD5YAM/nZAMHjs+CyJB4=;
 b=tem1gBT2CypfDZyoNbZpujDYyzNd+jF0H1s3Mv7Sw8CPdgybfuk/CVX/Y7PuLC7AgG
 IW2QtV8OL8RAN/8QIxTMZhe6FPvcIfskQ7YUAYfrOV+lyBdb7B123+R0s3bhQL8/scG3
 QF3GFjqapfV7cW54LUbMqRyCbScgT3B5W1Aamy6BsnLlUu37TV61KHD5TZio5WqvgnXI
 qh34YWwUVwH6ALToE8EGVcLOwyrozm457fFm7M9/8N3TC4ounlLtMtAEQ6hUDdfX8p69
 K2398ORrBw5xzitVvnFh+fX3egR+VtvDGHciuTpxdlD8tj9CE/Pd930EUDFdRx89f7qQ
 w/vQ==
X-Gm-Message-State: AOAM532SvOYDwEhhx/OVu4Ky94kNPZ4NkvYPgNZSWtexfzTYslJ8PSkI
 /8PkK5qOmo27aF9Ey915IUVDjA==
X-Google-Smtp-Source: ABdhPJyoXDxfKpU/1wXB2PIFN0nnkGXEo3xzDutxggeVYQFsmIzt54/Cnp3VafjpSiT43J+plIUXXQ==
X-Received: by 2002:a63:4a44:: with SMTP id j4mr20987404pgl.199.1614744084943; 
 Tue, 02 Mar 2021 20:01:24 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id e1sm4992656pjt.10.2021.03.02.20.01.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Mar 2021 20:01:24 -0800 (PST)
Date: Wed, 3 Mar 2021 09:31:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20210303040119.hpeybankxph4fyuj@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <6bd6730c-6f4e-df93-65cd-93fa4785a8d8@gmail.com>
 <c7a246a4-ab25-a193-f74a-98351780135e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7a246a4-ab25-a193-f74a-98351780135e@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 03 Mar 2021 15:19:47 +0000
Subject: Re: [Freedreno] [PATCH 00/31] Introduce devm_pm_opp_* API
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: nm@ti.com, ulf.hansson@linaro.org, gustavoars@kernel.org,
 jirislaby@kernel.org, airlied@linux.ie, linux-mmc@vger.kernel.org,
 stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, natechancellor@gmail.com, eric@anholt.net,
 thierry.reding@gmail.com, tongtiangen@huawei.com, groeck@chromium.org,
 marijn.suijten@somainline.org, steven.price@arm.com, festevam@gmail.com,
 mka@chromium.org, chandanu@codeaurora.org, emil.velikov@collabora.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, jonathan@marek.ca,
 cw00.choi@samsung.com, adrian.hunter@intel.com, vireshk@kernel.org,
 linux-pm@vger.kernel.org, kyungmin.park@samsung.com, krzk@kernel.org,
 jonathanh@nvidia.com, Yangtao Li <tiny.windzz@gmail.com>,
 myungjoo.ham@samsung.com, alyssa.rosenzweig@collabora.com,
 linux-serial@vger.kernel.org, airlied@redhat.com, smasetty@codeaurora.org,
 linux-imx@nxp.com, freedreno@lists.freedesktop.org, kernel@pengutronix.de,
 tzimmermann@suse.de, linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, jcrouse@codeaurora.org, broonie@kernel.org,
 rikard.falkeborn@gmail.com, kalyan_t@codeaurora.org,
 linux-tegra@vger.kernel.org, varar@codeaurora.org, jsanka@codeaurora.org,
 mchehab@kernel.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org, akashast@codeaurora.org, rnayak@codeaurora.org,
 parashar@codeaurora.org, tomeu.vizoso@collabora.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, rjw@rjwysocki.net,
 agross@kernel.org, harigovi@codeaurora.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, miaoqinglang@huawei.com, hoegsberg@google.com,
 yuq825@gmail.com, daniel@ffwll.ch, ddavenport@chromium.org,
 masneyb@onstation.org, shawnguo@kernel.org, georgi.djakov@linaro.org,
 lukasz.luba@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMDItMDMtMjEsIDE2OjQwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjAuMDEuMjAyMSAx
OTowMSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gPiAwMS4wMS4yMDIxIDE5OjU0LCBZ
YW5ndGFvIExpINC/0LjRiNC10YI6Cj4gPj4gSGksCj4gPj4KPiA+PiBUaGlzIHBhdGNoc2V0IGFk
ZCBkZXZtX3BtX29wcF9zZXRfY2xrbmFtZSwgZGV2bV9wbV9vcHBfcHV0X2Nsa25hbWUsCj4gPj4g
ZGV2bV9wbV9vcHBfc2V0X3JlZ3VsYXRvcnMsIGRldm1fcG1fb3BwX3B1dF9yZWd1bGF0b3JzLAo+
ID4+IGRldm1fcG1fb3BwX3NldF9zdXBwb3J0ZWRfaHcsIGRldm1fcG1fb3BwX29mX2FkZF90YWJs
ZSBhbmQKPiA+PiBkZXZtX3BtX29wcF9yZWdpc3Rlcl9ub3RpZmllci4KPiA+IAo+ID4gSGVsbG8g
WWFuZ3RhbywKPiA+IAo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGVmZm9ydCwgbG9va2luZyBmb3J3
YXJkIHRvIHYyIQo+IAo+IFlhbmd0YW8sIGNvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgd2hh
dCBpcyB0aGUgc3RhdHVzIG9mIHRoaXMgc2VyaWVzPwo+IFdpbGwgeW91IGJlIGFibGUgdG8gbWFr
ZSBhIHYyIGFueXRpbWUgc29vbj8KCkRtaXRyeSwgaWYgWWFuZ3RhbyBkb2Vzbid0IHJlcGx5IGJh
Y2sgdGhpcyB3ZWVrIHdpdGggYSBwcm9wb3NhbCwgcGxlYXNlIGdvIGFoZWFkCmFuZCByZXNwaW4g
dGhlIHBhdGNoZXMgeW91cnNlbGYuIFRoYW5rcy4KCi0tIAp2aXJlc2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApG
cmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

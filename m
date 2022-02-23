Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD0B4C1DCF
	for <lists+freedreno@lfdr.de>; Wed, 23 Feb 2022 22:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEA410F09D;
	Wed, 23 Feb 2022 21:33:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8901510F09D
 for <freedreno@lists.freedesktop.org>; Wed, 23 Feb 2022 21:33:34 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s5so399138oic.10
 for <freedreno@lists.freedesktop.org>; Wed, 23 Feb 2022 13:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=QeXjVrsBd2xyaX1fRJaTjrZFWoYw6M95k9VES1X7evg=;
 b=F8GR4eOAQdUqj8xaPWZ5qOSFdkWgvYEYKqpoEZk+xnLsYM5YSI168fW9lNpJQ3I6eg
 xGQbFIIR0qKbCZCZ7r5ZTROq59hxodBtBtt/NZyGXrBB10nuHyNFaS1Y8KkKuC5A88L/
 LeK2D+4fvQtxKD3HWSnwj13iqsyZj8cd6rKf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=QeXjVrsBd2xyaX1fRJaTjrZFWoYw6M95k9VES1X7evg=;
 b=ej7sg8Z0mfOR50EYPULuLiIFREVtkX2Zbb+TpckfNC52lqeFiESzxQKUVsHgkE/CRF
 Vx4VXprDrETjcHOF5J2rwRWDAgiE6Px8DZjaowya5AuSe68FlJsTCS3YBqvZlxncAIcU
 2h6caAZ05oEo4mjnd9LrTwUfIcOmRfyXUCkGwBChVzb8z69/rFgeRk2PQW+KNZnN9ioF
 yf4xCJdgISDPJ8UE+1cKx42DfFtcdgXVkCO/IBxhKR+K2ekPTCgTaLLXUalbzU3jrOLC
 eY0vYE0aF2+bUKn2hkv6gA8vYLHqpV92YtlgdC6RAB3l9BhnPoXkh50kMunHp1I/8Aew
 mVmQ==
X-Gm-Message-State: AOAM530tINv00Vl6SIlwntLYl+OhBUU1oMSoogR6mtJzbjVlvcXrVPeH
 ILudScfSz7iwQ7PEgmUEWnpNJx19X+inh8RC1L3cjg==
X-Google-Smtp-Source: ABdhPJwMsBuwNLFN0DBErvCeoCglDEp1SX7tXlUppHD/4h1YVd2LnidJwPJVI5P14E867PxLF7abnNOt8Xa11rmPXQ4=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr946625oiw.112.1645652013614; Wed, 23 Feb
 2022 13:33:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Feb 2022 21:33:33 +0000
MIME-Version: 1.0
In-Reply-To: <a803c7a9-de4c-8fe5-d80d-56366df78611@quicinc.com>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
 <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
 <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
 <7f9e2181-bb1a-c734-2e90-c5922952acb4@quicinc.com>
 <493749c1-6305-1a94-4e05-519c825e9d4d@linaro.org>
 <a803c7a9-de4c-8fe5-d80d-56366df78611@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 23 Feb 2022 21:33:33 +0000
Message-ID: <CAE-0n50VWH9Mum_W9e+6X1vjxvS3KWDqBtPfKHL-weA7S+_3Hg@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Subject: Re: [Freedreno] [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector
 with drm_bridge_connector
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBLdW9nZWUgSHNpZWggKDIwMjItMDItMjMgMTA6Mjc6MjYpDQo+DQo+IE9uIDIvMjMv
MjAyMiAxMDoyMiBBTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPiBPbiAyMy8wMi8yMDIy
IDIwOjIxLCBLdW9nZWUgSHNpZWggd3JvdGU6DQo+ID4NCj4gPiBJbiB0aGUgcGFuZWwgZGV2aWNl
IG5vZGUuDQo+ID4NCj4gPiBDYW4geW91IHBsZWFzZSBzaGFyZSBpdCB0b28/DQo+DQo+DQo+ICZz
b2Mgew0KPiAgwqDCoMKgwqDCoMKgwqAgZWRwX3Bvd2VyX3N1cHBseTogZWRwX3Bvd2VyIHsNCj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1m
aXhlZCI7DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVndWxhdG9yLW5hbWUg
PSAiZWRwX2JhY2tsaWdodF9wb3dlciI7DQo+DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjsNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWd1bGF0b3ItYm9vdC1vbjsNCj4gIMKgwqDCoMKgwqDCoMKgIH07DQo+DQo+ICDCoMKg
wqDCoMKgwqDCoCBlZHBfYmFja2xpZ2h0OiBlZHBfYmFja2xpZ2h0IHsNCj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInB3bS1iYWNrbGlnaHQiOw0KPg0KPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB3bXMgPSA8JnBtODM1MGNfcHdtIDMgNjU1
MzU+Ow0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvd2VyLXN1cHBseSA9IDwm
ZWRwX3Bvd2VyX3N1cHBseT47DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW5h
YmxlLWdwaW8gPSA8JnBtODM1MGNfZ3Bpb3MgNyBHUElPX0FDVElWRV9ISUdIPjsNCj4NCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0K
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbmN0cmwtMCA9IDwmYmFja2xpZ2h0
X3B3bV9kZWZhdWx0PjsNCj4gIMKgwqDCoMKgwqDCoMKgIH07DQo+DQo+ICDCoMKgwqDCoMKgwqDC
oCBlZHBfcGFuZWw6IGVkcF9wYW5lbCB7DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29tcGF0aWJsZSA9ICJzaGFycF9scTE0MG0xanc0NiI7DQoNCklzIHRoYXQgc3VwcG9zZWQg
dG8gYmUgc2hhcnAsbHExNDBtMWp3NDYgd2l0aCBhIGNvbW1hIGluc3RlYWQgb2YgYW4NCnVuZGVy
c2NvcmU/DQo=

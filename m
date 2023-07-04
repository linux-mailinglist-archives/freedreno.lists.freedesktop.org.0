Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7259746687
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 02:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2CD10E0FA;
	Tue,  4 Jul 2023 00:24:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA86310E261
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 00:24:09 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-c50c797c31bso2260813276.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 17:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688430248; x=1691022248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ooo4dM5jALOtaXQ/scLIfMMHfxc7psGFc61PPL8SXI=;
 b=EC4ri2XnmUEcT5FMvk1S4XnLO2FYde1MbnG23B0qy9D1+GCfXYLTNHmwycc3q0wrcE
 9B37RTnYYPWSj1v9wdi5dXdv7P3/4Ac7BIxWQZolk/Kc2uYG5d5bT6Ki6Nj0BhODFQ0h
 CxVJ/BOxEsc/hM59vOeh63h5QiHPa3fXeXu6Uh69oNKD99VHeFA3UrkHyQUKk03TST/h
 2F6jT9YJ2CJA+LedHj1CNAOT2K44HTN0rTu5jxeb3qp8XEHkUzUOMXKsMhdQoj1Qvral
 WKGQBBPo37H8byJZb9Cl9z7NEo3oAA2bkSYT44mjeFFp0IrUud2RFaoXTSswBcziv0U3
 T/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688430248; x=1691022248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ooo4dM5jALOtaXQ/scLIfMMHfxc7psGFc61PPL8SXI=;
 b=e1V2Wac5Y5UhF31izTBpPK7/BJqurecVvlksP1cS2/1dAjD+bDbiANUbqjqHP5Xy+E
 mmYCMGGXH2xjzGkq33V0YzhUGuK933R7Mp5GxWmmFprI59b6ICUin4lYkgV1ecIg7TDe
 7o2UF0yxHZgsNJyGf3LrSaJyEb+zLpMg/3HUi4DfPfYTcKt/5eq/7O2UFHTx/mnc6K6k
 j8TjfQzVCRUuZ9kbRuKMRqSNIGVPHdXexTEBBqprpxmUMGfS/YtwYqOMyzJM32ZXdjCt
 ryA7iUpXDCwKf6kBDeT5Ld+WlO2Fn69V2Xqbyo1cbdlnDLE0myy+Apfe4MHhN8bNiBxC
 FaAA==
X-Gm-Message-State: ABy/qLabopKIH5S+MDrTGtsJoG6782MaEj5Ev2HVtidxaOTJ/ia4w9zz
 fVtsRxHaWEJlklzLGePFsU86jL0gVzl/Pel3XaGAaQ==
X-Google-Smtp-Source: APBJJlGwBuEBQNkpWTGVzwAN8wHVIS3Z+h6RfADCfyBaNnBSNplPPR2iH9n5YEdPJApMCn3LPV+eq1ag4FSh0bWCATg=
X-Received: by 2002:a25:3ac5:0:b0:ba8:1aeb:2b68 with SMTP id
 h188-20020a253ac5000000b00ba81aeb2b68mr10197957yba.41.1688430248788; Mon, 03
 Jul 2023 17:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
 <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
In-Reply-To: <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 03:23:57 +0300
Message-ID: <CAA8EJpqfF0aep1E26yWQRQT_xUVTQBBUtghGv=hq_2M0w05few@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 0/4] Qualcomm REFGEN regulator
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 at 01:59, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jul 03, 2023 at 08:15:53PM +0200, Konrad Dybcio wrote:
>
> > Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
> > responsible for providing a reference voltage to some on-SoC IPs (like DSI
> > or PHYs). It can be turned off when unused to save power.
> >
> > This series introduces the driver for it and lets the DSI driver
> > consume it.
>
> What's the expected plan for merging this - should I be applying the DRM
> patch?

I'd pick the least two patches into msm-next after -rc1.

-- 
With best wishes
Dmitry

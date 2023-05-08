Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5E56FBAC4
	for <lists+freedreno@lfdr.de>; Tue,  9 May 2023 00:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2C510E30F;
	Mon,  8 May 2023 22:03:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8695A10E30F
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 22:03:27 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E398B3F586;
 Tue,  9 May 2023 00:03:24 +0200 (CEST)
Date: Tue, 9 May 2023 00:03:23 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7pqaid23xlcksxy3pzc7wzud226nmucklhe37bpy6n2b3bbft3@g6lpuun6kpk5>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
 <bfed3b0a-9672-fa59-5591-27ad17f5e96c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfed3b0a-9672-fa59-5591-27ad17f5e96c@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-04-28 16:03:54, Dmitry Baryshkov wrote:
<snip>
> >> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> > 
> > I thought it was QSEED3LITE, but doesn't really matter as both are
> > handled similarly.  It'll anyway change when I resubmit:
> 
> If I understood correctly, we mixed two things: hw stuff and the 
> userspace library. QSEEDv2 was a hardware scaler. "qseedv3/v3lite/v4" 
> are software library names that are used with the scalers newer than 
> QSEED2. From the driver point we can ignore that and use scaler's hw 
> version (which mostly but not always corresponds to the 3/3lite/4).

If I remember correctly, that matches the register changes we intended
to do in the patch below.  This was only available starting at qseedv3.
One of the replies in that thread clarifies which register value is used
on what hardware, and that is what downstream switches on.

I'll try and respin it once we're through the DSC series.

- Marijn

> > https://lore.kernel.org/linux-arm-msm/20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org/T/#u
> > 
> > which should hardcode the register value directly, making this field
> > superfluous.

<snip>

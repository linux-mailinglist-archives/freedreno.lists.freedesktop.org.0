Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A29CE168
	for <lists+freedreno@lfdr.de>; Fri, 15 Nov 2024 15:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392D510E011;
	Fri, 15 Nov 2024 14:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DtszGI+l";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A7710E871
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 14:39:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53d9ff8f1e4so2187251e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731681555; x=1732286355; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=51jmKSwVle1x+SelryYShRFN85JrDXZwY4DieM6p0Rk=;
 b=DtszGI+lgrjGUbUdZ3Z95yzA4gePlCgwWfGw0Yp/CglDGU+JszvQ1B7ztFmFqp0NHX
 yoPOcwu3XoNPrAz9VURLc4NxYu7VLqXDAauBZeQ6k8hlbuO5EtLMWvG+p8WxrQfaYwcy
 ozAYoYCnnlXQ/OKd+NmYYsyHzu4e9V1jPysc+oc53WtoOKX/u00Pw//QNjTA/vTakmj9
 X5eYRKPqL0Q88L8RApuRXHfkh52fOZCRjccRb8jxZdN8ge0PEiEHfSHOtqIJT86hjVMH
 FV/PGNOxyA7qbnhPnANs9SKKfXD//Kk/F3yMciP4Z7rrpUYDprUcp5Ip205JgJimPAK5
 2UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731681555; x=1732286355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=51jmKSwVle1x+SelryYShRFN85JrDXZwY4DieM6p0Rk=;
 b=qfc8bMYTCzwx7xTIPHq1Qo0Tv9mSQZhHzdXJgc7Xf+qrjc7a3lndM0R17pnZISMiZs
 Xx7WVLCUOqMqWcxxWBXXF04yruNukg7cxm4fyNTfqGembzprGcosWRFUJPNFUsrzly7t
 bXFiwx31qBEP42FPWEZTbkUUYqWuKqNj/qLkjYNEfhPe6eqoWegbXqTx8EAglvTp9dxj
 +Lz5Gp+BEk6O47fNvtnSLesJdRZHjwiGpRUnqm1eqzeFvmXS2pUC+Svv8pEvBUPTmrdU
 ENRDdi0W3v3OOpkgZPXyKJQlGhp1rvv7lp+UUTIDfk1RtBb6xkqcVrnvNiZHniEUpx9B
 /xyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcWPbxYizhcsxuqfeLjqFqpIGOLUqofeJGl/tkmhT38IKgBfGT3yAWi0EqNP6Y4Am4DBlRCI8UOB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzwz1b95wYo1tb4Ajp5Sr9cwl8JDbEjK+dVMpIoor/sk0+U2KLN
 XfmKFhGzytTx/ET+dpL7HTewsO8q3HHZczGUDwSrTlRvfRwSImbzPzQkirKGkKQ=
X-Google-Smtp-Source: AGHT+IFFXq6ZdVs+esKVUTRY3iUZ2e43HpYp71jG48QwgglW7QLb5Zy314u5bVlw4Lh3Mu4F4rG/gw==
X-Received: by 2002:a05:6512:3d07:b0:539:918c:5124 with SMTP id
 2adb3069b0e04-53dab2a2e59mr1717693e87.31.1731681554662; 
 Fri, 15 Nov 2024 06:39:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da65019ccsm593960e87.110.2024.11.15.06.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 06:39:14 -0800 (PST)
Date: Fri, 15 Nov 2024 16:39:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 6/8] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
Message-ID: <p4pqswgaxbx2aji6y5v2qngn3xp4gdlruthhbzpb4cgfs2earz@mo7zbsgqwc4b>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-6-3b8d39737a9b@linaro.org>
 <nw2sqnxmhntvizzvygfho6nhiwfni4xfquwst5gd5g2tel6pnr@h66d4mw46jcf>
 <8df952a8-3599-4198-9ff0-f7fac6d5feaf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df952a8-3599-4198-9ff0-f7fac6d5feaf@linaro.org>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Nov 15, 2024 at 10:20:01AM +0100, Neil Armstrong wrote:
> On 15/11/2024 08:33, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 04:48:32PM +0100, Neil Armstrong wrote:
> > > Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> > > is in place, let's declare the Bus Control Modules (BCMs) and
> > 
> > s/let's //g
> > 
> > > it's parameters in the GPU info struct and add the GMU_BW_VOTE
> > > quirk to enable it.
> > 
> > Can we define a function that checks for info.bcm[0].name isntead of
> > adding a quirk?
> 
> Probably, I'll need ideas to how design this better, perhaps a simple
> capability bitfield in a6xx_info ?

I'm not sure if I follow the question. I think it's better to check for
the presens of the data rather than having a separate 'cap' bit in
addition to that data.

> There's other feature that are lacking, like ACD or BCL which are not supported
> on all a6xx/a7xx gpus.

Akhil is currently working on ACD, as you have seen from the patches.

> 
> > 
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
> > >   1 file changed, 24 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..014a24256b832d8e03fe06a6516b5348a5c0474a 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > > @@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
> > >   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> > >   		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > >   			  ADRENO_QUIRK_HAS_HW_APRIV |
> > > -			  ADRENO_QUIRK_PREEMPTION,
> > > +			  ADRENO_QUIRK_PREEMPTION |
> > > +			  ADRENO_QUIRK_GMU_BW_VOTE,
> > >   		.init = a6xx_gpu_init,
> > >   		.zapfw = "a740_zap.mdt",
> > >   		.a6xx = &(const struct a6xx_info) {
> > > @@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
> > >   			.pwrup_reglist = &a7xx_pwrup_reglist,
> > >   			.gmu_chipid = 0x7020100,
> > >   			.gmu_cgc_mode = 0x00020202,
> > > +			.bcm = {
> > > +				[0] = { .name = "SH0", .buswidth = 16 },
> > > +				[1] = { .name = "MC0", .buswidth = 4 },
> > > +				[2] = {
> > > +					.name = "ACV",
> > > +					.fixed = true,
> > > +					.perfmode = BIT(3),
> > > +					.perfmode_bw = 16500000,
> > 
> > Is it a platform property or GPU / GMU property? Can expect that there
> > might be several SoCs having the same GPU, but different perfmode_bw
> > entry?
> 
> I presume this is SoC specific ? But today the XXX_build_bw_table() are
> already SoC specific, so where should this go ?

XXX_build_bw_table() are GPU-specific. There are cases of several SoCs
sharing the same GPU on them.

> Downstream specifies this in the adreno-gpulist.h, which is the equivalent
> here.

-- 
With best wishes
Dmitry

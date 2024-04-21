Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A76F8AC1EF
	for <lists+freedreno@lfdr.de>; Mon, 22 Apr 2024 00:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100CF10FECE;
	Sun, 21 Apr 2024 22:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="grVSAH3k";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9C10FECE
 for <freedreno@lists.freedesktop.org>; Sun, 21 Apr 2024 22:35:07 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5196c755e82so5280590e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 21 Apr 2024 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713738906; x=1714343706; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9bRTN9Ob4QM4MboZv5j+iipkeqQdN46sghn8IdzK36Q=;
 b=grVSAH3kTMkkqBMKPPSpIlbXdLTYw5we+iNKTHVoA9/Gmo/dFQG9OBa+mHhIrQNK1R
 waIHvu+FEH/tY6I7x7+33uHQaXgiD3cxBjMn3CksYrdgUELYl1CPLwHQIYDlFg3wfi4k
 R4v2zU4C6ziDp34RXICdkE1JlSj3J3JiAMQK2/+fdkWdwcv3ecDoGhDaeN/LntuYb1FT
 LfXybHbY/kTWWD6bg5fUwwFHedEiqCHan05CxmFHhYRkmAtIeCchGMGY0O1fgjcimnRu
 nZbFkUG1yyMjH+KsHRTJnDvHmYGPHfdgPEmFuIQMuBvhodfb1HRHg9FtjhLHcwsHk5mk
 Y8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713738906; x=1714343706;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bRTN9Ob4QM4MboZv5j+iipkeqQdN46sghn8IdzK36Q=;
 b=JSqvbtUnhFStpjplJPW/V9cFJZhQmDKmCzLAUORRz587uxN6H2i62h3bPL+G371cE5
 KgB1iBj7SppYrMfP0w1e16n76luSV4/Sp4wfaIdTHqmbHlqbC8FKuEoWxjxIDModETYQ
 ylsFLUEJWk/Y2h0y6GL75gi27+GRqAOp5+ia/AOe0oNn1RIbWpw3LGY5ccCewm3CMWz5
 MurNvLxsmI9nto7Umeau70rBT/VOBdR++PZLS95eIG+mG0P/eBexbxO47qBmIYQ71sEn
 aaQcPSyvcGbVI3uaDDI9QVqrttgNWI94bXY1OwCI9RYP5pph7WwBJX6XB34ieL4+PDyX
 /UEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAG12dL77FdmmTp6UK/kMJm7ynhaHknE5r9q6vVEXlFGVGpT7u8sQRi4jym8UCluq7cLYZHOWtkri+I0ybJxRQ1hDw3wjIDXXTHl/c1Nq2
X-Gm-Message-State: AOJu0YzReLizpAl56esH2ie+lT+HnrCpt44bE3I7p+dUsKF4WUHO/9/p
 mAdWKHqCfnRpiG0yKpZx8BBBZjAfWdxg0bksD/t8uy+8F4vkWACNyAYxflaKLAM=
X-Google-Smtp-Source: AGHT+IHLjZAuG9ugDalv8mPVHpO3RxdThgs11PfJ94yvOVMbJYooEIDDJ73Y6EPItQfYa7v0M9uNww==
X-Received: by 2002:a05:6512:7a:b0:519:1eba:6381 with SMTP id
 i26-20020a056512007a00b005191eba6381mr4931611lfo.49.1713738905670; 
 Sun, 21 Apr 2024 15:35:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a05651203d100b00515b62690a6sm1572911lfp.32.2024.04.21.15.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 15:35:05 -0700 (PDT)
Date: Mon, 22 Apr 2024 01:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/msm: don't clean up priv->kms prematurely
Message-ID: <n7eet54g72usmuh4hdz6yce3i4ieweu4orgd7gewu7y53ejucc@dzmq2a2wdxkc>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-1-96a70f64fa85@linaro.org>
 <67fbd629-3e80-b706-83a3-7baff3efd6c1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67fbd629-3e80-b706-83a3-7baff3efd6c1@quicinc.com>
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

On Sat, Apr 20, 2024 at 04:02:00PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
> > MSM display drivers provide kms structure allocated during probe().
> > Don't clean up priv->kms field in case of an error. Otherwise probe
> > functions might fail after KMS probe deferral.
> > 
> 
> So just to understand this more, this will happen when master component
> probe (dpu) succeeded but other sub-component probe (dsi) deferred?
> 
> Because if master component probe itself deferred it will allocate priv->kms
> again isnt it and we will not even hit here.

Master probing succeeds (so priv->kms is set), then kms_init fails at
runtime, during binding of the master device. This results in probe
deferral from the last component's component_add() function and reprobe
attempt when possible (once the next device is added or probed). However
as priv->kms is NULL, probe crashes.

> 
> > Fixes: a2ab5d5bb6b1 ("drm/msm: allow passing struct msm_kms to msm_drv_probe()")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_kms.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> > index af6a6fcb1173..6749f0fbca96 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.c
> > +++ b/drivers/gpu/drm/msm/msm_kms.c
> > @@ -244,7 +244,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
> >   	ret = priv->kms_init(ddev);
> >   	if (ret) {
> >   		DRM_DEV_ERROR(dev, "failed to load kms\n");
> > -		priv->kms = NULL;
> >   		return ret;
> >   	}
> > 

-- 
With best wishes
Dmitry

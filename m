Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0727A22787
	for <lists+freedreno@lfdr.de>; Thu, 30 Jan 2025 02:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5ACB10E195;
	Thu, 30 Jan 2025 01:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NlElrGcc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6E310E036
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jan 2025 01:43:29 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30762598511so2220491fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jan 2025 17:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738201408; x=1738806208; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gnzIb+9wXFz5+lazKFHTW6EVZCQW0TtbqaQtm0YVUI8=;
 b=NlElrGccZWqnPCWGd0JAw5RnK2eHDLgh+2NeIsHtEcHcstc+NPGQBAQ0nDesRVvozL
 SL4DniErJaMrE9BEQ88bTI3vzuCC+AzMdpuBajURbYw5PltqflEjltoD04vyiSsTlVXF
 uKuS8ecjrqud9vZ+YJnj245WOmZ7HAx4qaXb1lpKekQDyWZB5ACnlhG+9/kCQYTJjpru
 OobLqxlteCe/W5pUyuBBaApnMGHRMvMLislmgOpr+Vw+NFsVIYKKRcy+3thc5TzWP78h
 b0JVtUXPvxQgQuMoipJmiJqazPznmifonPy8kKnDVD4fkYmZO7SAW7LFwkyTiHQlS8TR
 FerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738201408; x=1738806208;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gnzIb+9wXFz5+lazKFHTW6EVZCQW0TtbqaQtm0YVUI8=;
 b=osRXIyRFrIB7Yo0gEIPJrRdjKdv108v5NJG6mKt0bvyX7xZGr9K96VDN/YUirC3lF4
 ldEQV29KgDB7bzQxVCep88Z+aqLZrOGPnP+4DfmI/2JnmeJZCPlXcjK3InwjKmPYYYny
 ziP0ToGaFQ761fkuntIkVXFKV+G17xUuiUw4Cx3VlznmpBAUkiwxifQ3etAy4WCTe0sf
 e+F5DcpjTjMI0FjzB0k5ClTDednOe08bE1vQ+3LUBwrSOUNEHCiGTDKQ/RWFWP3smWbc
 k/RbUsqVFYwCwr329ehsMphcuA9hDjGDgX/bypo/gTlrvuiND67O7RonZY/HtmHwlSva
 D+sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI6ogusu3JO+F2Zyf/PB5Ap1BNN8A7dZWik/wwmTK2sLkiBNKtT4Bq1o/GR/deYFuv3/cL0e8IqC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwafDiKAQ2MHa0FU4r/CFrpmvCUN18ipV4aKYumbJr+eBDULNbc
 qewj9uoBa4X6tExWgrZzmNl3p1naGw9TlrY51xvE8WphdbClkqVgn/Hva8w2Pk4=
X-Gm-Gg: ASbGncvLnygPwhW1+uf6NRHb5DjHTapywCHv9ZcTXOlccdT3XBD+8FJbd36FBygJeT5
 GFm0+D6gC6w3ORNm8MHPQPra+4aMKZG/cIb6kHaF37ou9g8Hnrcs9Xl9WCK9xi+JXz0h+0Bq8Zv
 rCMLIwPjyJgSVb0BPzLXrZu2zscnL6+oN/gCNAJCGRqKUO6w18ZyyndO9979FrHjUALYCb0QC0q
 Td4JM8Z2m9Do1vRleMd47/Sb2FqMZmQAENusnX6ZO8aex8rOAikXuC83RoEQYF0yeDoDS9S1Fpg
 YsQA0gbIIyr57CH3R9zHvB3fOoeCB9GjFjeS7YCHc6/9kk2JTd2zVyr6Kpi+nlWjyk7I/Uk=
X-Google-Smtp-Source: AGHT+IFQ4ROSqBoLumU6cps0fxCphR6LyRS4J9t+UuOgpON6XgpcsFKDCCwkSmmwVIIpI0Ne/byzGA==
X-Received: by 2002:a05:651c:2126:b0:302:1b18:2bfe with SMTP id
 38308e7fff4ca-3079694dfbdmr24041561fa.25.1738201407782; 
 Wed, 29 Jan 2025 17:43:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a33f7cbcsm521981fa.87.2025.01.29.17.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 17:43:26 -0800 (PST)
Date: Thu, 30 Jan 2025 03:43:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <jr7zbj5w7iq4apg3gofuvcwf4r2swzqjk7sshwcdjll4mn6ctt@l2n3qfpujg3q>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-3-6464ca5360df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-concurrent-wb-v5-3-6464ca5360df@quicinc.com>
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

On Tue, Jan 28, 2025 at 07:20:35PM -0800, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Up to now the driver has been using encoder to allocate hardware
> resources. Switch it to use CRTC id in preparation for the next step.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v5:
> - Reordered to prevent breaking CI and upon partial application
> 
> Changes in v4 (due to rebase):
> - moved *_get_assigned_resources() changes for DSPP and LM from
>   encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  20 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
>  5 files changed, 113 insertions(+), 125 deletions(-)

This patch seems to make kms_color@ctm-max and
kms_writeback@writeback-check-output fail on sc7180-trogdor-kingoftown
(limozeen didn't start job execution for this commit at this moment).

- https://gitlab.freedesktop.org/drm/msm/-/jobs/70213449
- https://gitlab.freedesktop.org/drm/msm/-/jobs/70213446

I've restarted the jobs, but it would be nice to understand the cause.

-- 
With best wishes
Dmitry

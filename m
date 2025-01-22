Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1DA198BE
	for <lists+freedreno@lfdr.de>; Wed, 22 Jan 2025 19:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44CD10E73E;
	Wed, 22 Jan 2025 18:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oeVTrARS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFE710E73E
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 18:44:09 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540215984f0so113048e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 10:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737571448; x=1738176248; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EUgHEQvD1kwE2u4wD1OjgHGNz901+pm9SiPReBHmq0k=;
 b=oeVTrARSm8Z/uvCWD3nfSzADzcI4VlI7eBu5YfRBgx9EV8jgpiHvXK1eWpWZN8UsLx
 2Aoqm8P77o8/2njQlZS+cYzdYH6jSdzzMuHpGhhyj05eUI3ZYyyZKqvyan25bHwcLZTy
 R1m9923H2xjuyNlxyzKYMArXTp+5gANhRKIljwQUppqCKhD0Jz8RPaCxMv6C8wrLwZdl
 MEGk2YmDBoe/03g9vYAI0sdetrnV4frvK0TR1XwqSszIxMXEVT2K4v+wmFiA6ZMtDxeM
 2dRTqN3751NxpOcg53r7A38cKH78aGte/PTBAxnwifUT7Q/wGbXW0TUPDxqsVH4Md590
 4puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737571448; x=1738176248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUgHEQvD1kwE2u4wD1OjgHGNz901+pm9SiPReBHmq0k=;
 b=YGNshKb31PQPAseqJ9S2L2ya6OARcQPjgEBQoUWun2+9KVwqFjDXbNOq7mvsM1yIKP
 oUwmnjS6dAfQ8ZmWzE+a2DhKKYU03dBlefLOdpEdTBVU0YOquYrx4++/4+JcG18YGoeW
 rCtR/LwpjSAi6FzPTxi2eDiFGcBB7kwq6kU46BapGFhLrRLxr7q+qoggoImA2/F9lRmj
 RnRJJYi4RVSNZelHIIdUe3BBqhI+myWkKM7QCHA3kU3auqTd0L5SbKgafpd1GQO/Ftf8
 u+RZk2qiY08lvwPt9hFmjOqNpII9ImqbweK98io7qkFVIX0B8bGlSpw45PtNS5n8foRP
 sl+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbsHXhan81OSBqmFcdXxUukUwwUYdGiQHtfKYMDJzeBJmUR5CxPxWqEDwA3cNLbtoQJi2xEX0ruR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7444j5GtOR0IA2DX7Q1vCb0eu/s3tAJM/K1HSboATsJs0B4XO
 5HS3d7ioiGIv56/YAwv/3GWxxmilAJCBg7GFws8bHPwlIlKOh4VJ+xQLWf0BE8A=
X-Gm-Gg: ASbGnctvPVS/URcMGK9qAzrteo+6T93JK4kPUyqNqeyHPisNfErJIV9LSvSflBq8tJS
 0ddNPmWEHTRxdtIuoNsqvh3NLbUMJ6W52padmXWY/4APx2BWErmT3ZmxufQB5YFXqsCsuVnbIZQ
 Hq4Z8GJlQgdhu2iDfAqlwhAze2vVAKXPdiAXp7oIb3tNh2ZxT2aKsicQ63mSwaWg1AlATapBLpo
 FjpGtF8XxuPf7cKXaklVvq+JcgB6TG1zEIVDa3M1iZJyOw+4UBHqeXL4blsKIFEh2aGLrtaaUK5
 QJCFChjK+amYFhWdWx0CV8Jxqj+EhcV4VTEhsCEnz8alEn+2VA==
X-Google-Smtp-Source: AGHT+IHMuKyIPqrIK1IC1oXzTkFTwuVuxFfR+V2buzAGSQuYz6439CoiOvQ3yyfJTt2r4jUPkmIBJw==
X-Received: by 2002:ac2:5611:0:b0:53f:f074:801c with SMTP id
 2adb3069b0e04-5439c2830e9mr7436905e87.41.1737571447759; 
 Wed, 22 Jan 2025 10:44:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543bb0e6feasm452237e87.12.2025.01.22.10.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 10:44:06 -0800 (PST)
Date: Wed, 22 Jan 2025 20:44:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
Message-ID: <kzmxf6r5kiyh2pr6hdzlwi3gwrlh3g257zlrpk4p5s66rhofio@qm2lbenuc2gw>
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
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

On Wed, Jan 22, 2025 at 05:23:44PM +0100, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
> Changes in v2:
> - Fairphone is one word, lowercase the P from phone (Luca);
> - Skip unnecessary if (dpu_enc->dsc) check and always count the number
>   of non-NULL dpu_enc->hw_dsc[i] instead (Dmitry);
> - Revert irrelevant whitespace cleanup in DSC comment, even if
>   worthless enough to send separately (Dmitry);
> - Drop dsc_common_mode=0 initialization and move existing 0-assignment
>   from a random place in the function down to where this variable is
>   actually being updated (Dmitry);
> - Link to v1: https://lore.kernel.org/r/20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

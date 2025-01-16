Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947BA1345D
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E033810E8C6;
	Thu, 16 Jan 2025 07:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eoghUWyp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116DF10E8C9
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:54:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401ab97206so643326e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014088; x=1737618888; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Jjg1mbduj57rKOjNRlVksmRWcTyDNvupEP5TEf++8E=;
 b=eoghUWyp0qCmmzRUFO5K6pDeRXm/ZJmkWO1P5HlGD+4T7u0DwDFdXhBCadpI/MwGu9
 9ZBIgeysADVSx1pZ6rYNhmo8ljJKVgEEXJ51G+EW1toLFPFXtdX84Z0a/aVDNwqgOOB2
 UFW5MqpN0lbowb0CD5b18R68YYYQg2+V51lD4Afyocq564xASHQuPpCDMUNjYelCz+Ei
 m0tiuIgd4ATCOWi2heo4YGNXP9IAHmofa2y3WYFeTpQrvT2cZG/nk+1sltp6oY0iNk3+
 g2Zw/00Y7lUG2E38F7H4MWvsmCbENEqWHyY/DbbEEjbyjWnv5oBXBt2hWTyuOpbak9hm
 I3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014088; x=1737618888;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Jjg1mbduj57rKOjNRlVksmRWcTyDNvupEP5TEf++8E=;
 b=MYQPPxHtzlb+zLByTU48iX99T7+Nls8Ypx5oOP0MQ9RTlu7PCM+FbBv9t+H+xBB+8M
 fZgqnbliPLYbk67Ft7zWdnYWjUo2sZadQFhhmh3DlslanRisZoUDZauTO7tM56dUHVoJ
 Tca7YlDq8tHHjTpDGad340eeBpczvapXZRmIPnTR/HokPmrbAp6k8wbLB9MmZ0Yl/r1i
 hgLTqq6LA7D3X3N2Bpzf2ASyUzej/pYTaIIiVzZKnUYvGriSswsKAkxHGA0WTxw6HAnY
 UAJulGYqT962bO8MRBJ90VcKSN4IhWDYcNO9CAYi0j+/Whk/ST57LBN3UjGK05O1bq26
 JnbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFJzReHQwo8z+Lz1di5wa2eNpIm9sp5iBvSbyOXoYZTUum8a86fhSRdb3lhBxjYpDUbQ/2r1cXupE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTkT83qEtRdTzdrHPfa+Tg7Xsl9g0jOZE26qNWd7aAH6+JmtRW
 JOKM2m29MNDFlnJSPjdWDICut12jVLuCGFMoIYTHKMrI9D7gH0j1ozQN5hLA9hU=
X-Gm-Gg: ASbGncuSKmjTeLz1aGCr1RKojloJmsGVM/2A7YZFfgc29z8Leb7HERNTxaFy7f3uoNK
 U3mX1km/7HuFxUto8ZtFZPX9EsuxBqIdnGLuBIXtemiU1J4CD5bOm3M335r1ad0hop1gMjzrjo7
 FRE9En5weXe3vxTGAmS9qQmN7Pl1XW3LwKoHo6LxL8uXGVFcHkPWEOfOSdrNwGA1CALymCUq2Wq
 Qx7XRbwFxwIO1Dn4H0E32fj/FlUh5llzCCaLOEQdjDwXLuc/d7vUsas+jzMZ4ID6NeRKALAiky+
 s3e7nKAbHRn8yTs45a+Fvs8Jf0BCf4wmbYGC
X-Google-Smtp-Source: AGHT+IGWSf/yOZvfXpZLF9q6SysUzRLStDO6lKJGlRWpgWwJ6ksytVOsuvgX8Usotsu+jYmZJps9Bg==
X-Received: by 2002:a05:6512:3c82:b0:542:622f:124 with SMTP id
 2adb3069b0e04-5428444d202mr11223288e87.0.1737014088248; 
 Wed, 15 Jan 2025 23:54:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49f0bsm2221108e87.36.2025.01.15.23.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:54:47 -0800 (PST)
Date: Thu, 16 Jan 2025 09:54:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/16] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <lyl74bqxrc46ygtkhawdmmjrfrl3jnxmmkoyjtlhjmghmztqvt@c3zlpfxcz4st>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:55PM +0800, Jun Nie wrote:
> Add the case to reserve multiple pairs mixers for high resolution.
> Current code only supports one pair of mixer usage case. To support
> quad-pipe usage case, two pairs of mixers are needed.
> 
> Reset the current lm_count to an even number instead of completely
> clearing it. This prevents all pairs from being cleared in cases
> where multiple LM pairs are needed.

- The pairs are not being cleared here.
- Problem description before solution.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 24e085437039e..3b3660d0b166d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  		if (!rm->mixer_blks[i])
>  			continue;
>  
> -		lm_count = 0;
> +		/*
> +		 * Reset lm_count to an even index. This will drop the previous
> +		 * primary mixer if failed to find its peer.
> +		 */
> +		lm_count &= ~1;
>  		lm_idx[lm_count] = i;
>  
>  		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

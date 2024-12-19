Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A3D9F8799
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 23:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC0910E2A7;
	Thu, 19 Dec 2024 22:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cAo59qTj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F6010E4B1
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 22:14:25 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso981120e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734646464; x=1735251264; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lp/0WgoJMYBw3pbcjem9wtwnD12qURoBMg8Gz+u8iz0=;
 b=cAo59qTjR6bmbiZdnwqXsFF0L9RGNA1Ja9uqRt4Pa6KFWB8p7uJPo1Kl5ZRKWsTPQd
 F58qYkiIkbVNOT22qb1wrwqlAtn+zTWYDqHWwB84Bm6t98c0CNtMwxS+zOiXy+fMWIeA
 lcnyF3rBWqO8SUq3yDcRVGgqpS110GRTsEm2Rn78LbY+G/TfvgpSSOUUHAEuxHRgWaOv
 WVgVtTyv345cSYhwn3MUxzTNv+zMHHUcrBr28Jm/PAZXV28ozJWWE4z8gGSQueSitFnK
 OiK19sBFnY0syIUb0cro/ot8ASIpcvLNowTDw/cljrX78AR5oNYbKdFZxaUBHeJM69BP
 gBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734646464; x=1735251264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp/0WgoJMYBw3pbcjem9wtwnD12qURoBMg8Gz+u8iz0=;
 b=mojjgzUhBOyfYoNelWgumPSnCLuGLaXPlcVTsuBo0LqozXnA8/PwSG5LlbxoSA3MNV
 /nX7kjTAHN6aXIn/mpoUFO2JU1NLg6AKMIbfKPAxTcKkTpaqbdITL45gC9ERqc+xbN+C
 rmjvlaeiqSomqotFLGteGfT/X2zGY14bt+ix/0dzVt5uZpBwk+c69as6hCEsQ57rHRA3
 yfcsimSUV7mHE0nBlqGxxRz7DTVyDMhI16M0LIa35D3sbP1B5bBldqZ8V3lsVuPqm0Oo
 iDUoz0M8HaOPya1Znp8r65Zi7oGXm4jvVfPDuH5jSi1Xzy7gN1ezf6v2UCjhazn4JcA3
 lVHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJxH3hgJVDIt0ozIIx8bWMHl4vI0SohVq8DCiBzrCeXN5yudGaeuhmqJqEntR1Qfjkp2yj+c5J6Tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNvgCphwXV+F0Py3fJFYqTktEfTVhgtQP+AvXw9D0nxKpT3jSM
 XpeUGx2wVfoMT/3oHncJrCkcJHYlgfvLZyInznRo2dveX7yzBMoCaIxG2FSNAYg=
X-Gm-Gg: ASbGnctjDK4PutaR88y5AdFskpA5UZ44BIV7P4Mb0xVEzi3Bd8rSdmfsphSgOeOLsYo
 QI5h8fSD5Sc9ShuB3I4+ecc7Y+SVPIOySRy8RP4T4HFQEOqdRwA/Gp0VG3chMMuYYmlWydkmyFO
 oodR0xPD3sdxNlqgQZhAMGy28Sj9SeZMaTw8hGv4L9FW/W75lhstFLPkXmb3eMYvlBjZ2o4NYDc
 VTyt+kxrDb8To20qXhAQrcNOFI59GgSfMHcPH0LO3lohM7yNMLdkqEyVwpgHUt7Agbn1Goc2R6g
 c4El5UDBDvZIER4E6jIToAns+1M8Roli8wgo
X-Google-Smtp-Source: AGHT+IFNifr8Kzw3iPEBcMsxUT1SldWwUcNVnrkSzCCYrK96VGVfXM2/WECOPOwNTnRen4dFc2DMfw==
X-Received: by 2002:a05:6512:234d:b0:540:30df:b3ea with SMTP id
 2adb3069b0e04-54229533d4emr96410e87.15.1734646464146; 
 Thu, 19 Dec 2024 14:14:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422382fa6asm286103e87.229.2024.12.19.14.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:14:22 -0800 (PST)
Date: Fri, 20 Dec 2024 00:14:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <auo3266g3wt6q4kowutx7tvysqrgr2v6v2kw4mnnzd2gqbxb5h@5473wmczjtjc>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:23PM +0800, Jun Nie wrote:
> Add the case to reserve multiple pairs mixers for high resolution.

You are not adding anything.

> Current code only supports one pair of mixer usage case. To support
> quad-pipe usage case, two pairs of mixers are needed.
> 
> Current code resets number of mixer on failure of pair's peer test and
> retry on another pair. If two pairs are needed, the failure on the test
> of 2nd pair results clearing to the 1st pair. This patch only clear the
> bit for the 2nd pair allocation before retry on another pair.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index cde3c5616f9bc..a8b01b78c02c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  		if (!rm->mixer_blks[i])
>  			continue;
>  
> -		lm_count = 0;
> +		/*
> +		 * Clear the last bit to drop the previous primary mixer if
> +		 * fail to find its peer.

if the driver failed

> +		 */
> +		lm_count &= 0xfe;
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

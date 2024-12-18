Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7A9F64AC
	for <lists+freedreno@lfdr.de>; Wed, 18 Dec 2024 12:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C6910EB72;
	Wed, 18 Dec 2024 11:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bZdGe+h8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0128A10EB73
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 11:20:12 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so6768050e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734520811; x=1735125611; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qjj+KlXAewunzNPcgO1iCpfTnrF5Imc7Y+KKQVgYXa0=;
 b=bZdGe+h8PfepLb1dn8TXlgWwOnp2Go4BlekislIETEJ1Npw9bxndY8rGv+Wt9m7Mjl
 RWTfhsPWjFcNnjfRZHxHnenJUc2r0rpW6wz0HolIFoNwYU+7fSIQ4gto1jSLeTvheZ9p
 OBmmX/F+IRlpnHur6JXNLDEccCPQbX26zZP5CssRpgBuSycExevVZIAlUMVvOPJayxl5
 r3EkcwtizduPZofgaoeqB3UOm4N+NZ8EDej2/DilPoyv08VuRcB/8ofyTxIje9xqQSLw
 REFb5ChygL5meeevt5SLhsedYlKRMiDl0Dz0kaeilGq6bPHK8XeM0LIH7H/h3R+h94tF
 2Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734520811; x=1735125611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qjj+KlXAewunzNPcgO1iCpfTnrF5Imc7Y+KKQVgYXa0=;
 b=Rfd4TUAwL/KPnLrLq+CWqGr1D1Mpl4cL3/B1RJEiotFHPLT0/JYJY2G4CJq8MBVpt3
 lNSWXKT5kWVHcwt4CH7EoJ6XVeBkXsGiXryC119f3BPOiGPBMPGuNsxWVCPv0TiZMhBz
 tvfOn0NdV2/qaW3EutVdRjtJI8jrXTH3JadnEVQbn//v0U+uDnc/4du7yp1W89c7MmiF
 JqHXqIVmCldUJT6oh6Wjpm8idef0m3MpShbAnHP/A31oCv5AQNqcbTZx/4AzSIqfRBBM
 PV0Ron9fEcKdsyqYsesub1omSAwnD0L1//EjerFKuCAvQP403GD6DuLjce7ZnoEaCnR0
 JNNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpfjfIq1cwuktuPxWG9toNLZzTGBCW8Pt9io4ZSOz8QKLfYdALlm4ktrD+2jN31GCOJxLDsJfPD3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH7YR8yMY6jW9i7E/qMhf07uArF2ZMa9Foeta/GVWAm2LTbJoM
 MV53/ZB47R+2x5YEAmpQP0tw9X7uj6YcbTRPn2urCg+SGKi0bEF6lG+WCxCkn48=
X-Gm-Gg: ASbGnct+hn6sJadMYSqRbYNm6OvUdx2INevDcInaCVZQ5oQGr1eMD31vRH0ktZoXqEu
 Dx9HqEYC7u0LOI58+PxKy/TuGNqAeMeRtzwX+V9CuUl1sdOs7FTfqJzDWhlZPTQW6Zelw6mcEYc
 QfULGBRW+K7v+lkd74GBwI5qD4lKS6M53ZoZyGiHsXcrWqI1Hi6u8xg+o0R212rHuEiTBjSJ6bl
 4FUb4+UL2Krh3V8w27F94xqN5gtKi6A8zIKBfIxORI8Uky7Td/FIsR30+DlHaP+RzWzhsWJnF/7
 yhavE2iPwJzsY7sTU4gFSMorGWMPjj/oMP/E
X-Google-Smtp-Source: AGHT+IGoMLpfK0AlU4GXbEuAfh2gfaHTUuRjjC5sL5Ab5KUlHrgJDsb/9UEzt0pS0syIvxRwbaMgOQ==
X-Received: by 2002:a05:6512:15a2:b0:540:c349:a80f with SMTP id
 2adb3069b0e04-541ed90142fmr1009563e87.38.1734520811195; 
 Wed, 18 Dec 2024 03:20:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm1412055e87.138.2024.12.18.03.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:20:09 -0800 (PST)
Date: Wed, 18 Dec 2024 13:20:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Message-ID: <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
 <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
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

On Tue, Dec 17, 2024 at 04:27:57PM -0800, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> There is no recovery mechanism in place yet to recover from mmu
> faults for DPU. We can only prevent the faults by making sure there
> is no misconfiguration.
> 
> Rate-limit the snapshot capture for mmu faults to once per
> msm_atomic_commit_tail() as that should be sufficient to capture
> the snapshot for debugging otherwise there will be a lot of DPU
> snapshots getting captured for the same fault which is redundant
> and also might affect capturing even one snapshot accurately.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>  drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
>  drivers/gpu/drm/msm/msm_kms.h    | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  	if (kms->funcs->prepare_commit)
>  		kms->funcs->prepare_commit(kms, state);
>  
> +	kms->fault_snapshot_capture = 0;
> +

- Please move it before the prepare_commit().
- You are accessing the same variable from different threads / cores.
  There should be some kind of a sync barrier.

>  	/*
>  	 * Push atomic updates down to hardware:
>  	 */
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
>  {
>  	struct msm_kms *kms = arg;
>  
> -	msm_disp_snapshot_state(kms->dev);
> +	if (!kms->fault_snapshot_capture) {
> +		msm_disp_snapshot_state(kms->dev);
> +		kms->fault_snapshot_capture++;
> +	}
>  
>  	return -ENOSYS;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -128,6 +128,9 @@ struct msm_kms {
>  	int irq;
>  	bool irq_requested;
>  
> +	/* rate limit the snapshot capture to once per attach */
> +	int fault_snapshot_capture;
> +
>  	/* mapper-id used to request GEM buffer mapped for scanout: */
>  	struct msm_gem_address_space *aspace;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

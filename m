Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FAA99BCE6
	for <lists+freedreno@lfdr.de>; Mon, 14 Oct 2024 02:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B7910E0B0;
	Mon, 14 Oct 2024 00:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UwjRKX6X";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4169710E0B0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Oct 2024 00:20:25 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb4ec17f5cso3271631fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 13 Oct 2024 17:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728865223; x=1729470023; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=swd9SOpmUHVcicvma+OufGb4RDFxiOnKh6x1UILpxe0=;
 b=UwjRKX6XrKRLQn1iH2ZiYVv0VtYc0OKdZWz/Zlc5dkG3mQSIwTUJTK2Td4UrvcTVYy
 TJ61UUiF8A1u/+E8S0bwv8pQAf7NvbgshRRjsgCNzpxr99JOSwK0HtY0sgZThty9ax+s
 6aSLAlXecVmEeLjarQTaoM0mt0GCEeIOtXQySetn1J/6rUajvBssOFNJQOPPdBOCRId5
 ReUvMBNzHX0nPdEx+8bL9w/wYxhSRyl92LlM27pnaAFRAjFKte6PmAy5HRYQ/tyC/k7Y
 Vc01PSjB4SSRWBukhqYZjahYCdNm7gyUi9+gjbxuA80MI5G2sfLQBKsh3HMgXWpP1fCn
 BgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728865223; x=1729470023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swd9SOpmUHVcicvma+OufGb4RDFxiOnKh6x1UILpxe0=;
 b=dVmq3y+PWpiAOzxyLL+JJLau7Fg1z3/IwbQg87sPm8lv9GBP8Pp0WtlyJ5h3pWd8i4
 0YelSj9wapNfqdHjFAgQj9i6GS3F4gtSZ/fGe6jsvZigf8CS5Re1B4xkT9VKF5LI7K3Y
 x/k7hgcmETHVdgVJarRo6fqTP0/oU/A6bT08Z/WZT/yDsx53zPt3UDutJXK33FR0e2vF
 mnmy+ecrVoTM2jCfGFpUGksx1h2nINLR+NIe2jYqPkIUjuvdQTmLAZLIV7nozTdHRWcm
 lrvm9+hyidyiEMVRP14ZdBshRVb0tqL5uhWP3eYiL+B4rxmyxyp/Oa1Z3OqK1TiHZaKZ
 VXBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLZSSHrtW45Pvw1fKrX1uNloZtyCezSloF0xLYdKG+kqwCuu8GmtZfWHKUflF2HHN2Rds3vGE0+ds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo/Ucpsl+Tz/MNaBcklUNc2BXaMcQ6dCJpAEbHohhueT3TYH2z
 yOOI7DAmpQQIsyo5KnL+fLpPS4yMHvOjytAyVnKsahYX6jO0R9FxXcZ0iQepXCc=
X-Google-Smtp-Source: AGHT+IGjRsmqSYQFY+6zoTW+yfBoQhD0tYy9X1EZBeZeH5UdHQqVss0BDD8UraLZ7HffqL/AYWBRQQ==
X-Received: by 2002:a2e:4e01:0:b0:2fb:5035:11e6 with SMTP id
 38308e7fff4ca-2fb50351533mr4455441fa.36.1728865223272; 
 Sun, 13 Oct 2024 17:20:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb48a13d11sm4121121fa.53.2024.10.13.17.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 17:20:21 -0700 (PDT)
Date: Mon, 14 Oct 2024 03:20:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
Message-ID: <kah73euzauizsxvcrgmfsatshfe4pytgb7xe5iprtajg7abhsv@l7jdcxza5gd2>
References: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
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

On Fri, Oct 11, 2024 at 10:25:13AM -0700, Jessica Zhang wrote:
> Only enable the merge_3d block for the video phys encoder when the 3d
> blend mode is not *_NONE since there is no need to activate the merge_3d
> block for cases where merge_3d is not needed.
> 
> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v2:
> - Added more detailed commit message
> - Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

LGTM now. Please clarify, is there any dependency between this patch and
[1]

[1] https://lore.kernel.org/dri-devel/20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com/

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ba8878d21cf0e1945a393cca806cb64f03b16640..c5e27eeaff0423a69fad98122ffef7e041fbc68e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -302,7 +302,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>  	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>  	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>  	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> -	if (phys_enc->hw_pp->merge_3d)
> +	if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
>  		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>  
>  	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
> 
> ---
> base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
> change-id: 20240828-merge3d-fix-1a8d005e3277
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry

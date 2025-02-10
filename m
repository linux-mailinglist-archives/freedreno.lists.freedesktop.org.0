Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58178A2E2DC
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 04:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F2910E116;
	Mon, 10 Feb 2025 03:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FAtdmj2P";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34D210E116
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 03:41:14 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30797730cbdso38208451fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 09 Feb 2025 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739158873; x=1739763673; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=npEs8jA07Ng6Z03mAEVt5n9zo6OF7AFtNoGrjJ2+5Mw=;
 b=FAtdmj2PUI9K69wSRb6wVVnsrS9AJXFlfG8c+dIcJrRBjrd0GmRK6GlBY7xFwYsbf4
 pshi6sG6KQtA12dspH5MezkA8uveVE+2lK7b7Sf8VNIUF4UR1IDpTX7xJmbr5xiBtOX9
 d2nYK9ahd2efP/x0wZQviE3vIubC0httcDvP3W7UP6LYBtXMH49SIhH4e4L8dDBvsjy0
 EiTzNYgip3cpYozpUvuDo/gx82SbY+0nJHHgP9GQpJlqZYpQHOip4KjzE7fOsZ880nYd
 QDL22EIfLi6eXcvwQ/RRIpmHT0rEVXhsOK0mhuPLipJel4N3SgY08vPMsVtODZvZ1FBk
 K15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739158873; x=1739763673;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npEs8jA07Ng6Z03mAEVt5n9zo6OF7AFtNoGrjJ2+5Mw=;
 b=Dc+6Hico0eYjbUTJW6d0vXUI+L6dA3iVictI0YwpNXHESljU9dolOdyCBCT6GxtgVm
 SE5FEX8rl1whA9XuMXOc00s8alIwa8ICmSE6qxqLbV43IigBzYi7IsHGMv2iBnMWVRVs
 Vq9mNcOr3B1VkrPi9L+4J2BHxo94vi6mSQSlvzyzovnXBFJc1s+k8VzlR86YINW/lWhz
 2KozJ93RWBR09iYZT0iZi5q/zqmz3Jh3T5abMhjAI4fAoDvJqYkUF1R1e57t81cwaP1s
 ov1Xu1i7Cpr7vMNxzDpilk4sr+swcyayzCOJF1RklP2dpPt7IiQGfIHGE35FPWCqgePA
 EINg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeDCdgneml6peSSLWXsJjUddGKosqy3sPkZ4mO2S9WDvbiu3zq+lCDI3RK07WByQuFeq2LlknziW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNhD/QF8hELAEErW2rJcuNkdmCtK5SLUco+7al1+NtAb6lemvs
 EDAS8VtN9XPl0uf0UJi55mcix95soVaH8MSp8MiXprcLWNvIHnPgEmBJOud1P8A=
X-Gm-Gg: ASbGncsRWozm8AOR9fZnnCpseV+o3f8QPAChZQ5seFiDG4egC2Yiw8pfSKdGAH2WNvf
 Qdll7g0j7MD1iEecG2pmtH9L7lRfm8d/3R5g6ThbIdVLmohFQmhag+XenHIJsqeHyIGcYAHHkbc
 pwFCqjgNK81nCdL/+KB31K7qtXY72z5L9dfT23ZY3li6M7zlL8KTpemOdpaIWM9pK4YGaXaxhAP
 B3D6eY5knobgdZmfK0EqnRhwjKFxYAd5B4iMKkkjut8yZ/4y9FE/whLxE/cqMGjXgP6mwmONb/D
 MMDidItOF87W5c/UY6iZYgz5uJ/srMO9S7wVUGhmBoFRtAxx5wzcA2wQ6kuS88aG7IJIcsg=
X-Google-Smtp-Source: AGHT+IH7m6oiasYVqnzqsfHHyi3NYn+WrwlbtgfZKMfhDxmQoU4N6KPHZD2MhJ82kLTvoCVN0EbGyg==
X-Received: by 2002:a05:651c:1986:b0:302:3356:7ce2 with SMTP id
 38308e7fff4ca-307e57ca9acmr39237721fa.11.1739158872958; 
 Sun, 09 Feb 2025 19:41:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308f2d7fae7sm567661fa.39.2025.02.09.19.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 19:41:12 -0800 (PST)
Date: Mon, 10 Feb 2025 05:41:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix uninitialized variable
Message-ID: <o7yqskbm6px5t2klbiid7dklogrchyn4we2radaoznopupczxw@imywm2ngpoc5>
References: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
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

On Sun, Feb 09, 2025 at 10:32:33PM -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       unsigned int num_planes)
>  {
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;

Thanks, but I think it better to make the function return ret from
within the loop and return explicit 0 if there was no error.

>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> 
> ---
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> change-id: 20250209-dpu-c3fac78fc617
> 
> Best regards,
> -- 
> Ethan Carter Edwards <ethan@ethancedwards.com>
> 

-- 
With best wishes
Dmitry

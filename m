Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44FA333C5
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 01:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0548810E338;
	Thu, 13 Feb 2025 00:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eT8MQV7j";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84F410E338
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 00:04:28 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5450d56199cso1589286e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 16:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739405067; x=1740009867; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g/dX/qzqd6dVtCQvTD6EDKh/RRBcZW8oAwKMkEiG/94=;
 b=eT8MQV7j7vNwGq3IcspWeX7dNtgnWT3T1qYT0KApyZJ6EknpGrnj5u6vRDk6XrkrQ0
 f9EeNEVNXrRzMd8B3V1USbG1QRz6wrZBI/C3JQmZRejclP0fsaoBzAwtG8qAJsO8uDWg
 qvfAOGqDN46xEFKv9CHNusVYEywdzXMOHaRYsLeTGH1Cl85jazko+zt6FHmfY+Gub9Kl
 BXqOh5MNq1e+yom7/tbBev2w9Y1Lmm2H/LSFHI3T9ztqaRQ7jNEFUuhWM7CIzw7Vo9KI
 NoM6EcLLGh+hDxAPet7EiX4lazHEj/KhBu1duv+jZUI0ocAyJAIGXHc6c/umaYcYc47w
 GMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739405067; x=1740009867;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/dX/qzqd6dVtCQvTD6EDKh/RRBcZW8oAwKMkEiG/94=;
 b=EmCyzEzYHcqS5rtyvcI80R1896HXg6tu0sr7FK7CRNRj6BwQaUPzVj4ZtXRqN98wW+
 /PtP14RsR5H3aaACA4DLtiH18E3G+5xoljkv6cyAgxGC6l2Rs4GiUBPBYS7TESN2FLNF
 /l7hPjSmJkphxu5vyrqOQRexeP8zm4RmlftkoMDt91yDkhSsZS+dlzrZZ7XwkcClx5MK
 07qg9HSYnK8613ZkCLOWEw5+byAMJKwWqR9Q6udZuArz8Lb41eaRWYoHgv0Hh4dynuLn
 8cwqsEg0kDn/O8OTrfFKrGLT2TChb8v6OF319DK3OG93z5eDBjGrTLlsqzIZez2XQbF6
 8aPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6q5LBCNewWPf1rHI/Pj2osmm3NU+fbwRf6w/GVtiC053DMXyHTbR3OhxHOqCRqp41GNg5QZwLhyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqdyRtSvnH2ZEK98ykx7B6Qeu7CjPo3Fd0Q2xIkA1NLWs5ObXe
 eZNLduVU0XvMiqLl9L/qXL58iyziZcxoSEl0gchiw5H5E/4gswkAHqq4fH8aBX/gMsxePBGY0VY
 tpLk=
X-Gm-Gg: ASbGnctzeAy0Z7prZMhHcpM7vcYu9iXYvFRcufCeHmeTu6bF9oD11fwxwi2w/vAoGfN
 H/PLsflzCewzI0OInJWL3jqwiyiAioxDMCBVfq4R+X44KCjkybGnOA+S228m5GGLF3crn7MIvk7
 y9YmkVHWGbzApdRDsx4W0G5/zHPE6mBzsn49eowg/BKW0a77pf6adf+ChMNoKyYMoTWDqq8aRe+
 mqP718TpKFRy58TW3ZpZqr/bfesba0BrFKwVwA9R+6hQTghqssqn1qeB2Dr4N3xXi99scRITo8T
 SYggNKzd/Wp/KYtHYd4ZRq/zKLZYwHjdH9A1g+UC6ZXPF3lFNIOBPKFzC8ycyoNr5Fg4j/g=
X-Google-Smtp-Source: AGHT+IH+fxi9VKUfSEWdeJIAsmbcn/rRwU9rp6DokXIOHewLvT5877lvjYqtDg8LhsfdCVvtFd5JDw==
X-Received: by 2002:a05:6512:220a:b0:545:1d04:5dff with SMTP id
 2adb3069b0e04-5451e01f3a6mr241356e87.24.1739405066968; 
 Wed, 12 Feb 2025 16:04:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f11ec34sm12035e87.235.2025.02.12.16.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 16:04:25 -0800 (PST)
Date: Thu, 13 Feb 2025 02:04:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <5yli2sqw5hxoinlaguxjq2lleez7p4qjkwvexrgn7uphnu44ws@trlvdrpep5uv>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
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

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting

Unfortunately I don't know enough details to comment on this change.
Maybe Abhinav can check it. I can only notice that msm-4.14 disables
programmable_fetch_config for non-DSI calls. Would disabling that call
for DP interface fix your issue?

> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index abd6600046cb..a21addc4794f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -94,17 +94,21 @@ static void drm_mode_to_intf_timing_params(
>  		timing->vsync_polarity = 0;
>  	}
>  
> -	/* for DP/EDP, Shift timings to align it to bottom right */
> -	if (phys_enc->hw_intf->cap->type == INTF_DP) {
> +	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> +	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
> +
> +	/*
> +	 *  For DP/EDP, Shift timings to align it to bottom right.
> +	 *  wide_bus_en is set for everything excluding SDM845 &
> +	 *  porch changes cause DisplayPort failure and HDMI tearing.
> +	 */
> +	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
>  		timing->h_back_porch += timing->h_front_porch;
>  		timing->h_front_porch = 0;
>  		timing->v_back_porch += timing->v_front_porch;
>  		timing->v_front_porch = 0;
>  	}
>  
> -	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> -	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
> -
>  	/*
>  	 * for DP, divide the horizonal parameters by 2 when
>  	 * widebus is enabled
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

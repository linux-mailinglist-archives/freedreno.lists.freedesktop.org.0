Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34621A58190
	for <lists+freedreno@lfdr.de>; Sun,  9 Mar 2025 09:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E39610E34D;
	Sun,  9 Mar 2025 08:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="edN5oXdB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0955810E34D
 for <freedreno@lists.freedesktop.org>; Sun,  9 Mar 2025 08:16:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54963160818so3796328e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 09 Mar 2025 00:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741508195; x=1742112995; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=89SfYDl9Q5QnukNfbtuYibaaCHpU8JBYjMuTQ2U+dPA=;
 b=edN5oXdBI08ktVkjxHW15G938RYLkf160Kh71BZi8Rnkb/gqcOcFp6FfT1sUufDp+F
 RX7Sblt35SwlxazM1nnfqHKOMgKWw1kY+e4B/V1VOBpG1q5j5tJDYZOGdF3lVsONaGKM
 W5QA32Kb5z3iLPRHKVu1t9g/bV4DFZUEr8MU/cnxWbcRrPFyI/zw5HNaDJHpw/HwnhbP
 ubx7FHPoBgRbdBvkSLV1m6bCQHQ8qAgt7qvCoz2TedFVABZwuU9dv7Bec5aquNFk3Iwd
 /OOzBCOapAhuesnr+tDbBoxZd5hkyLOkn58jPLHtNNpbcl+53jqDzhJhzwvU3yNNaINB
 Bjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741508195; x=1742112995;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89SfYDl9Q5QnukNfbtuYibaaCHpU8JBYjMuTQ2U+dPA=;
 b=E7kFfyoeHRNF8UnlHl3UwSB9Hr8/H2SLEYRTckAxJ4xU/xv7DRK93lesZKlDT+Slmo
 KBqn3fVwllGaMm3iPM4ObdpcVosEzKL2cp+7xxKrFsipQ4KUw9eCwMcuxPrODBcXsv1q
 OVKZieZOACllZP0WT+bW/5ncVH9D3yLX9ky7Yf/J4D59tXYBI2XEVG9fFrSAB3/wUviS
 QX43FsxizHMg1XztnYIczO18njtPORnqc4IQ/8ms13xR4zpirpdvuHUB4DURQH1Bi50I
 32l8RD1A6V2YmJ3IzjND4QuEvwQlRrBVrLQyFufVqsiW6X0Rw6vFKIUV4BFbFkVt7LAO
 8X5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv7piz8f5oCt0l9x1APcmVkjT8HTRU5UHWc/U4YQFuk+m9Nna9Lrn/PAAHCsn6IRmjryoNW87Tun0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkAUHtTHY5kvuso19L//he51HAgL77qpHsW/2aWQB4kSnXAId0
 qMrXuApHvAr6Qv0DWMkUPWw4jnsE90j836A8uFZc1ASNxLsPGyo9FYuP5wxvuJo+M6yvUlmuEcp
 wnjI=
X-Gm-Gg: ASbGncvzTHWK/Q+PjntoHkd2sc37vtl8l7F0n3ZS68W2O8U/hPwXhe7zCzFikHFpD1U
 hb1eaZ5djKxkhYZGN//N+QNnACG4VnToWShSQaL4TpiHTLmxxxhluZvZ8btdLmV3jngQs9HMM/x
 X2g/T49/zlg5TtIDvbHv0JMMVbHQkJH92KFkwMhUeGsl/X+zmttmiLBCmmSMEqv3ANBhRDOKvj8
 V4Bgm9EDfgkVjJcBv5qPAEJtjNHaRENA1j90RxOxrBtZSvX8LE4Fc1R9rvvf+wzbormA3GfIJaD
 DDXSvNzeCZFKz9rg3UDoeGfv1aztz2RkBhKA69p5GxxdzIlsNflDFBHLvA/4Umwkhb0etyMQUy1
 R/PlBgeAkl6nzjh1224l1Rw4i
X-Google-Smtp-Source: AGHT+IHonFYRVCOD3hc2ZLZ2k0nh0AnV9X63OZNmrpqQRQXGzg2TI3GANig2LQlLgV4Hue3Yp7RGkw==
X-Received: by 2002:a05:6512:1112:b0:548:9786:c18a with SMTP id
 2adb3069b0e04-54990e5da6emr3725516e87.19.1741508195235; 
 Sun, 09 Mar 2025 00:16:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae46199sm1054491e87.39.2025.03.09.00.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 00:16:33 -0800 (PST)
Date: Sun, 9 Mar 2025 10:16:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref
Message-ID: <5x4bmy52gxc6y3m6qswqxoxvjsk52zz7lvjpudqgr4d2hwaz4b@bdf2dzgji7gf>
References: <20250308144839.33849-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308144839.33849-1-qasdev00@gmail.com>
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

On Sat, Mar 08, 2025 at 02:48:39PM +0000, Qasim Ijaz wrote:
> _dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys" 
> before the sanity checks which can lead to a NULL pointer dereference if 
> phys is NULL. 
> 
> Fix this by reordering the dereference after the sanity checks.
> 
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")

Your SoB should be the last tag. Fixes comes before it.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0eed93a4d056..ba8b2a163232 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1667,8 +1667,6 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>   */
>  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  {
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> -
>  	if (!phys) {
>  		DPU_ERROR("invalid argument(s)\n");
>  		return;
> @@ -1679,6 +1677,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  		return;
>  	}
>  
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> +

I'm not a fan of having variable defs in the middle of the code. Please
keep the def at the top and assign it here.

>  	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
>  	    dpu_enc->cwb_mask) {
>  		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

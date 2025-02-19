Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26602A3BE68
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 13:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98DF10E7CE;
	Wed, 19 Feb 2025 12:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cJy0g+CY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF0610E7CE
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 12:45:47 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3072f8dc069so69943811fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 04:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739969145; x=1740573945; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BPuwrJxY2WcVgAzy4da4UTcGT1UhygelXhUrEvq+Dmg=;
 b=cJy0g+CYYuYKGTlMpPTIaM13eWvhW+5NkO+AhLTKDRm6LGSQr5kEomIrKX+6S1nltS
 ZupvT7eknY9O+m1FOImDWYIyD4G0QxcEW8Pf/AfAiT7IxKEcHfZHfJgoRch2IA1G1rXe
 h8jjJgdUBl39dqvuyvfqcJBaScz05zPxmkastaA1NJvvmFKmuoknLiRaGGGlcF+sxAta
 qJXBuqMeaIWJkx2kcnaLYjaOK1lXirL5tsPSLG5NVGCxUvb+70UDBEB2X9OzJuDe/lT5
 J5PK5MR635ela83tWuK3198y9tyP35pC7tGUkCqhN3RRrbJmLNF0dS0JisAuoMOcva0c
 nhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969145; x=1740573945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BPuwrJxY2WcVgAzy4da4UTcGT1UhygelXhUrEvq+Dmg=;
 b=xFTK76yhGQXvqcF8Tj2N4H6+xO/Jg2s3jEVxlrZh7ady7BBHMn/g6jeIQLXcvA2hWP
 heiRlPfkcrEq5sGTmCMz9SiZIzVg0jmPah0CLLY6Fmf6YShOncRs/z+oaqVUNvHet1kt
 1uUx7tmrYAsaJXPQvoGY/1BX38nzqmt5CFSoaMDCHTqJl8R0NX+NtQzurgHuq5KWXju6
 zw3OgU6moh/4YaZbMDoU4mpjmqBx5dax/YwW7oqITksJC24SVZi0f9TWweDrPuPDVK0b
 oiZ9v7LTinqKm6iIlFjAvFcs3kEaX9+bw0Fhr7Oz6N3x/Z7Gei6rwppB+3S2zyIAHuMz
 OGKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcvSODZMqMqse5WoF/hlrCHhZsYnKJKX+qCcTVSe/8Ky3tytyz/Qr6IJBjC2gA4NDPh+rzko/vWoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySn7fSQvOT7K+1VJyKAJieIl0MJpGSDQxJCsTyYcEcSEGvNz8q
 KL4gsMfeuApMTu/mLfwHBCrb7IJgnKLN9vMbg0bCB2gURt5laCDXbPWJMFgh0/c=
X-Gm-Gg: ASbGncsF1bOqmsArbegH0GxxrlJEZ5goQsYwFe+Zq81bsGU5dzdQzueSDJxGg3oO9GK
 /7e0dwNXPME8fBIXDhgR67AFIU2wIs0loRP6R308XLTfbg9bHNd9pHbhtDb5m120rulAKZVyKmy
 u54UinivXhtrIhugMZ4KboKuTbPVUa5aK72H+KI1ku597N9tAGP2LNm6M32rm3QWzhsLCJhfqre
 rd+JmKi1rdQ9Y4wk7a3BtKKBVNXrfS3EmzpvR7hAKz89mAfHafpV8EFsT9VsQOr+sNvlMLJTvdy
 6FyGL05YbXCt41wwREUOsAXUNBJU4eqLAN4Pcd1qG2EW0HhNrXynyWqYHzHKt1SAnK507MU=
X-Google-Smtp-Source: AGHT+IHqzXvswBBHdB6BuGTvdIaOpP/9m10nx1rxuNNktCu7rOUQ1riauWad8Yd8fM2T5tKt6/n/Ow==
X-Received: by 2002:a2e:780c:0:b0:302:40ee:4c2e with SMTP id
 38308e7fff4ca-30a44dac851mr10131541fa.2.1739969145292; 
 Wed, 19 Feb 2025 04:45:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3092fb236cbsm14835491fa.69.2025.02.19.04.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:45:44 -0800 (PST)
Date: Wed, 19 Feb 2025 14:45:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 jonathan@marek.ca, quic_jesszhan@quicinc.com, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
Message-ID: <lwtvnlt7rfmsbdgyo32fs4mx2xbcyrnjsjq53nkk5pdzrpqgox@nn27ythhg23k>
References: <20250219040712.2598161-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219040712.2598161-1-haoxiang_li2024@163.com>
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

On Wed, Feb 19, 2025 at 12:07:12PM +0800, Haoxiang Li wrote:
> Add check for the return value of devm_kstrdup() in
> dsi_host_parse_dt() to catch potential exception.
> 
> Fixes: 958d8d99ccb3 ("drm/msm/dsi: parse vsync source from device tree")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

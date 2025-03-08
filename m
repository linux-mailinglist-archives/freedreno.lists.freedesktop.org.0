Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC591A576A8
	for <lists+freedreno@lfdr.de>; Sat,  8 Mar 2025 01:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A9C10E1D6;
	Sat,  8 Mar 2025 00:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NC5nAAyE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C829510E176
 for <freedreno@lists.freedesktop.org>; Sat,  8 Mar 2025 00:14:59 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30795988ebeso24622961fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Mar 2025 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741392898; x=1741997698; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OI+9sOurb7xWpdPzZDCFl9IV8OhNe2U1hJtvoJa6TD4=;
 b=NC5nAAyE7BYFPGDfoC2uPOJGZwPlwdOyWLGbSNqRyA8Jaltqa8xHLzdjJhmK6+4tnA
 iYqpg/j2URPgaSMDhNLEnJUK9SI1jTriBMYARcfmObFQFZnkkKShGb4NjZ8jmwui8mS0
 Mm7k8Iq44hFT2RYCJJKZV98lfsl1gBzWGyFVKfYa8IcW6ZnKoUwp4dlx94fSMwlgHZey
 OeOKxq4+QtvnmxZm0uZVO6yhP6LcJrrQz3e7smchMntuH2bmLtOP//OqImul6MJbmYSq
 31IeghCZ1rdJEBmhDsCiyounADRdgPWaJEokbqTLNT8wu66nGIt9Dbo7YFGe4R2uSJHW
 kuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741392898; x=1741997698;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OI+9sOurb7xWpdPzZDCFl9IV8OhNe2U1hJtvoJa6TD4=;
 b=FqtcwQJRij8UPrMrJbCnR1F7haOa5/y5dpLGg3LA/vY4x2A9tgWtkr5dAi5MyGy464
 JItI1r4qtY3Jc9eKyKsVxm0fiUA5RnzZZz1UE/AvpLaw7HvP8fLRjChTWl0HxQkRrZ6H
 cqFnBu48ECBvm1DqKKstl25CAFPASi7xrrIWdp5rv61jYFuLLulo7KHBbwnhyo2jh3I7
 8hx6FTV25UdWYhCdlZ/a6TvholekppGOlOWi/th3CSCfs2NFanqKpOEpjGzztn6/iN/o
 QKKiZ12IPQawP4qn9OH9hEtRYax8ePBAGAHLngLiDpl1ULOJdHdewRGTKxIx2qmATBHt
 vjew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5AHEF8FiiVjyB2QTKpGfots8PXqeWinITrL2VXyvgM8o7CqtI2lEgNsQWm1Bc5STY3OcZXEaQV1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJIMdWhBYmNPrXh0xefitU9vCwY2lqpCE98TN9N0JCpHsbSsjy
 ILw4jEOLsmfhN0BqA7JDTfd2uoyacaVXfGP5Qe47Oz1orVM/s0MNE6kWBdZkJso=
X-Gm-Gg: ASbGncsOzLGWuLTaE5d8n0ialCfdqXk5DrQB5PppowZtno2s6WRaFB3wCifugJbMOXF
 z5w+eTiFkHPtJJqYupDGwgnJ6iLTerxHj+LRETfxInoqYrDsfL40eu95xGptVpVRx8Lrmxw2P0k
 oeFKROzSgTId9B6aHpTCXe3qprDVdWz9TSNrchVLfL7gMZhYmWVTjw8D0JWaq83bA8jRS1BBGSS
 SDGVzvKrwTSdSTMkykOt+mT3I7qCBrNUVKF5DXfOi20htP9wzyOeNHhFgDJ/dc3doJ2RVFLTrC1
 Qk79xxzbKaE/8xhbfr06wmQV6Vx1Mu2+yRXdXZBycECBQ8uWiNntfm6TaQx+u8FXmS3Q179pnGr
 8EcUyiwLuGEM92PCTOD87KAhg
X-Google-Smtp-Source: AGHT+IFbuhinx1qF4on+W3zSP7LNgSQf0IHtNKaQVFWJQ8VobeRY0aVJ73nWM+CnKCUkmpRbt4NgHA==
X-Received: by 2002:a05:6512:118a:b0:549:5b54:2c77 with SMTP id
 2adb3069b0e04-54990eaa9e3mr1876943e87.32.1741392897791; 
 Fri, 07 Mar 2025 16:14:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bd5b5sm651008e87.158.2025.03.07.16.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 16:14:56 -0800 (PST)
Date: Sat, 8 Mar 2025 02:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: Fix uninitialized variable in
 dpu_crtc_kickoff_clone_mode()
Message-ID: <vvg6cvpjtcekulvjrovxhjpsd2loh7ath4eu3nya2dffoabgvw@mtcmctbmpble>
References: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
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

On Fri, Mar 07, 2025 at 12:29:39PM +0300, Dan Carpenter wrote:
> After the loop there is a check for whether "wb_encoder" has been set
> to non-NULL, however it was never set to NULL.  Initialize it to NULL.
> 
> Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

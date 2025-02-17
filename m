Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA1AA38CC3
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AB110E5C4;
	Mon, 17 Feb 2025 19:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gj5u4HBR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EA210E5CD
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:51:58 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3091fecb637so30285041fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739821916; x=1740426716; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=du441ZCOQupNPXiNMHUbWNZp53UAbJ7rrRkJ3qKot/U=;
 b=gj5u4HBR0cP/3QlMFHKiN5QG0vE4yLOjDeNUYirptPmMWgIbk8g3qtMYlEM0Q9xO7S
 1OOLQfc+fHbDlpNY/1UNLxZI9zDdqRSZE3f+hwbgjtw7gk2fghbloqEAipQYQuP6O6Mj
 m49sLL4cMOQ1wmyt/9yeiy5U3kgxtAzp6ubaRQdk1b9V1oKbGQ4/rF/R5as7XJJxBMHs
 4+dBlzbogS+3C3cO+eqf+iaEJ4V6rRLci+yWtf2PechmHLPgvSx3EbFieY7+mQNRd5Vb
 zEFDGxV9rGMk6Vhe0/0AcbJv96YLNMvH7UAEC+A0GXPz285dFoHl96U+lP7Fj78HoqJ2
 K/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739821916; x=1740426716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=du441ZCOQupNPXiNMHUbWNZp53UAbJ7rrRkJ3qKot/U=;
 b=mUzy0d5MTiDC2f0deXHDAyTzOjdc/EvkITZEXtpCh09kl+34wqqRyALPB74uRl+F6y
 soEv0hWO+UBHl/HseXglAHBwl9XpayYRTGlq6LWrhkdce3l7RXCjMA1pFZ0BTHRGMDCB
 RfmjvVgAmjJAKpj4AIGBjJo/owzRQKrKIDJcIUfk5eBGPEeMxXGIi1rw88OdY1EtHcqC
 BtlYrQ1Tnv/DQeQR5d3eAdv7aGeZPztItFLDnx+W0+Jdx0b3Tn77tTxEu/AUVXlQMpwr
 DGydXd3J/rbg7fAO3ncg9iZGb3zNS8NRGuXG1k5g/Ve2rautgKAdjbpg2O7jctm5YWvv
 2Leg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhxw1LNrSMQyB7VtjDlbcYWe3gUU2jkKHGd/9wOQmuoYJ9nUTRGSwmAzYCGnRTRs1tQQlY8q3nKZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTbBzHEJcFmYrGpbT8iIAsz7dpFy/vtOU3reXGgnhr6L2zs+bt
 Tw12vETLyfJaPRJcUcM0ridJW9q6XwwLlRvnLxz/Dxl0VFQCdONoLqiv+Aa5SQo=
X-Gm-Gg: ASbGncuQrnskPP/Ap6RbdY/rhkKstNbfOR6b/mqduf77uhkIOdWPGsIBejKH/h+4+Vs
 6ymsR3nEolejv2/UJIgTuX9b6rp6ZEVDWkQpy6ZNUOkWDcXZXCMX82kDrOtIWTMNG7LwK6ek7F/
 Pwncj9uPC6w+0YDQWWJMJLxm/YQyq4jZZZlswJJYc9TJPJLLWPhSl79nmkfMffbLEpATcMxU+zV
 uDtjtZkkfSmcRdIKdnK06V1cDNJ4wRmKj/vXGDKtCjSMW28vRKrrs+ZSY84Qf7XaZt0Dd2+KAut
 bhlehHnFNHmB/+id3kBtxukxaKJnhO1ibj++7HbKTFwjjWr4K11rPGR5tp2QEGm5Hj5RYDs=
X-Google-Smtp-Source: AGHT+IH1cgaF5tU76THnhAXO4GxVx1EqnJgKWJ8zkZhai7T85xKUgyK77lVetaexQtb3yZ7M3uAvow==
X-Received: by 2002:a2e:8657:0:b0:2ff:df01:2b43 with SMTP id
 38308e7fff4ca-30927a6f5bfmr35430101fa.18.1739821916381; 
 Mon, 17 Feb 2025 11:51:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a3a6d3dcesm1478471fa.67.2025.02.17.11.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:51:55 -0800 (PST)
Date: Mon, 17 Feb 2025 21:51:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 06/15] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <2gpvg22nvrmcm5ln3ft4oovt3xy5uedvw5oehb3odf74mvvhkn@hz7wwy7jf6cn>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-6-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-6-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:15:55PM +0800, Jun Nie wrote:
> Current code only supports usage cases with one pair of mixers at
> most. To support quad-pipe usage case, two pairs of mixers need to
> be reserved. The lm_count for all pairs is cleared if a peer
> allocation fails in current implementation. Reset the current lm_count
> to an even number instead of completely clearing it. This prevents all
> pairs from being cleared in cases where multiple LM pairs are needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

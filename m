Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4399F23DC
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 13:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94D910E37D;
	Sun, 15 Dec 2024 12:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YclMuUxa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D84A10E37B
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 12:42:46 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30227ccf803so35554261fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734266565; x=1734871365; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hYI3tK4z04wmka3DeGZjKOkOw0GlWVobEE9u3MV0cX0=;
 b=YclMuUxaof0BaV5t+uB/yV13EMqMPYfcMhqktWtlLKGp0UTnCObDbW5vvz/QxU77vE
 aWs8K9pHmwFxS5MuAaugt+wo9BmKyiuDMg3BpdIq7geZFZA8mxaXBQZZaudGCu16yTMB
 HW93FkKsapjaFEMstZ/XkTiE4QiCugufQ0r0RlxWUADeCNUDA09tgM9P8UsljU3sLqG+
 4kK57xxnJMGXLsbksqcYo9a7uLScBoIj2aY0eMlXqABz7UJvZkuHq9ZrM6PRxdIOMEur
 7nXcPu2bhsdPKg4i7X9YkLHdpMaJXGi7cM8s/3PSAzYWmI+FPmKJ4BXZLD4CIlcKCNiT
 LWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734266565; x=1734871365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hYI3tK4z04wmka3DeGZjKOkOw0GlWVobEE9u3MV0cX0=;
 b=cdjGcLRTQE8UfDR5Wm2dVbhpU6JDKozDD+Mn9FqwlNYm73w0EzJzm9l0LNZJrCq/fy
 ghPYiS7P1ORfytzzBNdhz+mfBCQvtRH+TP1cKD9aBFziEb74G8dzJrEvE/3dYIyiyzO7
 8p1MKEfthFQl9l0hrnbYrQRjd1YVXBSxauaVFM4l2GQoQka19BBqZg5OT9FlappmomKI
 f/4JFUJJXXnWnR4hR5RGK+hJGShvt1vgRazRmbjwnejDxBuuJ7+ugv6bge/oEXVLGREG
 69aJK9Fv579YGr7Wy/U3IiTt3+6jCsmQl6RYnRXUBsDnjR2jcL/kmnskhW2ouG7alQew
 29iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTOUkxb8jwLQgqiQOWii0MyGrPWr5lYOTvfgKU7NWt1sIXLLhYd99S5Ki5h85nPkdkrULMDRjVxvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb0j1HJa6i6nbYMQ1FNtUR//8nXn1zx581z2k9MSpuq6hLmf0w
 JuNsUtNY6pbV0gC+DtaHlQ0Nkok5Sp8OIW2/RzsRWT7waWtRrFar3SqsaAJNnu8=
X-Gm-Gg: ASbGncu+dxGSistsnsat4CavMdoj+Nu3R4J8kXohZzNCkYRho8ZBWzc2NGyMtqnfoHf
 /0xMdO1FnMaJz0VhEmOHPN4Rs3/it7IKvIulLmqPFFwZLipvpcoDWcbnBIAWI527/UYto8RX+Mh
 Cootw2ncHSYrxRQMcQUJAUHptPyKt0CrwunCbgCkzgYNaEk0y5E5R0WinmipYDffR5w7AuU8KJs
 9oBh9kt8Cwf+qQW3qx6lvWwaZhXJ1Z3AGzFpVK034d7OXdi1Mv3rgo+Hy61wNWhiWVHT+AnePE7
 Ba8HnHdBlULwanUEN4548vPUitjbH/tCEyLM
X-Google-Smtp-Source: AGHT+IHsbdhkAZECyyNTJWfHo8P5cXdKXaUUsnfTwGl+ugfHZQYfSxPEs6t1dmb15lJWqB6WTYjwMw==
X-Received: by 2002:a05:651c:54f:b0:300:de99:fcd9 with SMTP id
 38308e7fff4ca-3025459d0d8mr36236791fa.29.1734266564741; 
 Sun, 15 Dec 2024 04:42:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344061d5dsm5850411fa.52.2024.12.15.04.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 04:42:44 -0800 (PST)
Date: Sun, 15 Dec 2024 14:42:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Message-ID: <tynudqtodz46ti2j6paivfmvczijokhqiqxh3c2hy5ujdyuuzv@t627uosi3fhp>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
 <20241215-dpu-virtual-wide-v8-2-65221f213ce1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215-dpu-virtual-wide-v8-2-65221f213ce1@linaro.org>
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

On Sun, Dec 15, 2024 at 02:40:17PM +0200, Dmitry Baryshkov wrote:
> Virtual wide planes give high amount of flexibility, but it is not
> always enough:
> 
> In parallel multirect case only the half of the usual width is supported
> for tiled formats. Thus the whole width of two tiled multirect
> rectangles can not be greater than max_linewidth, which is not enough
> for some platforms/compositors.
> 
> Another example is as simple as wide YUV plane. YUV planes can not use
> multirect, so currently they are limited to max_linewidth too.
> 
> Now that the planes are fully virtualized, add support for allocating
> two SSPP blocks to drive a single DRM plane. This fixes both mentioned
> cases and allows all planes to go up to 2*max_linewidth (at the cost of
> making some of the planes unavailable to the user).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 144 ++++++++++++++++++++----------
>  1 file changed, 98 insertions(+), 46 deletions(-)

And I forgot to pick up the tag from the previous iteration:

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


-- 
With best wishes
Dmitry

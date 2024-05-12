Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87F8C3546
	for <lists+freedreno@lfdr.de>; Sun, 12 May 2024 09:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5CF10E06C;
	Sun, 12 May 2024 07:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eOMg/Kts";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C3B10E06C
 for <freedreno@lists.freedesktop.org>; Sun, 12 May 2024 07:18:25 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e6792ea67dso5710861fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 12 May 2024 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715498304; x=1716103104; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Ho2M1HiQIdWbeZZb6QjJWcaSs+2rhcKJwgaqpenjTE=;
 b=eOMg/Kts+G/6f4vVGxx6e1T1H+PUQ4VUVaMw1pzJSgLtXqYkNDvkvBWLRSvCXFfl3g
 vL+ZXb1t6L68cDnANKtLoI+DyUQtOBUGt6UEjrKHiWoeuShvlUOy3NBD+pE2afkQihXw
 TLjIHHA9WubZ3Fozaw91m6aDrLWauWmQHt2CqlNJ8Fc1nBoti9VZgI/uhr1tSwbLVzu7
 G9vJXV0W4vJ2L7x1xDqtvV2dUpFoqeCAbJep8WhFo6NhwEfovlU629byHp8AwKoFr3sS
 ur82hv/K80x5bVE/5bQrti7BQoAVzfUwczMpp2FDRvZykGUhJQ92IdTZtltsm6Xu43yf
 DYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715498304; x=1716103104;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Ho2M1HiQIdWbeZZb6QjJWcaSs+2rhcKJwgaqpenjTE=;
 b=WxAXWXPjz0xhM6VgXfEARXAZo1Lm1xueg2nTU+4Yn31iOt9x+6tvXr4bIBeS0UNkS0
 XTEfsVJHs4Giy0c81cDrVypgX84cnp8lG0AGsC2RkrTrXKgr4e4BBP9IUaUhWpk6xFnS
 8lAD/wq9cI46COKGLsMAieBgWN0E1lXm5yzKjzDwCRLPWa8bWJTuwVgmu1M2spEa/Sgb
 jxenedQH6vzX1QKjto7HaopyljvK/wH1i8mAEzv/kzgINYM8PIwOhrRYQMFV41jIVgzc
 cCgTfefTyzOc07EVmmdjF75Yst0++2wtUs914/N2OHhoz08w2fxzUUQF5XvtjMbEIARu
 hKcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURAthpV5DT7crvVIrt66T+oFE1TARPPN+ZLHnMdI9RxwYNCtiaYwtydxwd1kcu9kijxiAoko0Wh9iX5cF3C6vTc3wzrdk5H7hbeqWrFsOo
X-Gm-Message-State: AOJu0Yyh4SKXvce5EcONCtDp2f8ly6qayS49g4kOXn2ETjK9dllyXwpt
 IsxWH1vJATTL49FxIIC3PeFz6FIfA1QfH3Y8kbBxtZVvZrxB4RsHAYA465GI46w=
X-Google-Smtp-Source: AGHT+IHFq0ufNNWxWGNJhbjtEqg492vkkSDjHXTgvyYhd5RDqv8PEWr4+4kRdkTRVvckVFOTc9ZeNg==
X-Received: by 2002:a2e:3c0c:0:b0:2dc:14d5:4621 with SMTP id
 38308e7fff4ca-2e52028a8femr59741201fa.34.1715498303593; 
 Sun, 12 May 2024 00:18:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d151569bsm10126371fa.87.2024.05.12.00.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 00:18:23 -0700 (PDT)
Date: Sun, 12 May 2024 10:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/msm/a6xx: request memory region
Message-ID: <vwxnwf6um4vmazqfomx46w5hc7swf4boiaaqtta3tmytwbbazo@g3ey2d4jxknm>
References: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
 <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>
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

On Sun, May 12, 2024 at 01:49:39AM -0400, Kiarash Hajian wrote:
> The devm_iounmap function is being used unnecessarily,
> managed resource mechanisms (devres) are handling resource cleanup automatically
> 
> This commit removes the calls to devm_iounmap and relies on devres
> 
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ------------------
>  1 file changed, 18 deletions(-)

In my opinion, this patch is better be squashed into the first patch.
Though I'd leave a final word here to Rob and Konrad.

BTW: for some reason your patches don't appear on freedreno's patchwork,
although they definitely hit the list and appear on lore.kernel.org.

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F939B2D4E
	for <lists+freedreno@lfdr.de>; Mon, 28 Oct 2024 11:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BE810E468;
	Mon, 28 Oct 2024 10:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e1PYAAom";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D8710E46F
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 10:50:29 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so4089409e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2024 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730112628; x=1730717428; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xT9gfcNhArTE1c2C7RUJiJlGQ17PepUqnBsoFt7gaK0=;
 b=e1PYAAomAlKatjhuRQ+G7bCguvSzfvSlmtouiGWk9ZKRX3CMX/DbsXkgexB5ffnxR9
 7a3fldRY2JHWX40hFk1Cr8mx+x3YOeJJpkmNIku4jEax2/Mj1Yim22j/jNbvTKYcdO+o
 w2k4XF3dsoPtNjT2Y+XueU0XPIEe9KVPDDbxmaOaiy8bslo6T5ps7zUPFD7laIJY3J4U
 JXC2PLj/6A7jCZZjx+xS7j6r4JIZVg5foN9rTzVc24TpbKZEuJBIHAV0tIHhLrZI0x+v
 LyqMvEQ5cgG73zfcku3qgVEeF2rhndu0mTm+BzZxbmztkqyVX92Cs2vX89jUoyfwJiJ1
 1LPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730112628; x=1730717428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xT9gfcNhArTE1c2C7RUJiJlGQ17PepUqnBsoFt7gaK0=;
 b=OKnP3JT5OoWYbSKd56y0CtIjup/uNK2VofHVlc8W8QIAiKS4NLqmy1VIhc4xVQUaNr
 agLxvreugNzfjnHm+McZSAff5b9Oj4/uG8SXXAUvWkYacHljHAd7LSf9U4WEpyIyvOXU
 pG79juHirtmaBley7JjBVC9EN9O+/FgqeT1xY2PF40G37dDFI5oySF6Mxz4M5BHPowDo
 Skx7xPGDsPelPUv7DCfDd+mApOzuoqPWZxezPtupGtHf60Js+HrLTgVdAggGR+R7q97Q
 aIOfkK+vo8XWkBNaZRl8KtrMP9GOe7292MF0cezUge4T+Kox+A5Lk79vyGMipy82CgSC
 7zwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEDLj0Bc2OCL7BFUsrk4ltS9POaSgWj5lhmiSBBoZqiV7PcT3tZhqnLzU5mrR/OuHW03CUObFCst8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZhPbU08BDQIKpq4IiPulh45gX8OYyeldxc5VvO8UE+UFsJmLe
 csem2H7NGBuN+K9aJ7+GtLpzYjWG8z8ieSU3g8etiRZCS2+xQO9hNKZbsk8aQps=
X-Google-Smtp-Source: AGHT+IH8FSgEZPGmIDpEZ2RxUjOJo65ME5pGZDusIyUmphRyeZHRXp0OHKNRYZxJAZ8p5+Tv9Q1f6Q==
X-Received: by 2002:a05:6512:33d3:b0:539:e7b9:df03 with SMTP id
 2adb3069b0e04-53b348c3954mr3544985e87.1.1730112627826; 
 Mon, 28 Oct 2024 03:50:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1244d7sm1052368e87.68.2024.10.28.03.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:50:27 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:50:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
Message-ID: <pipbl5fxssydcw3ehqsq3oea56nc37un7ok3oersvrqrlssyo6@5ksxbtcixfbo>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
 <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
 <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>
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

On Mon, Oct 28, 2024 at 11:39:16AM +0100, Konrad Dybcio wrote:
> On 28.10.2024 10:52 AM, Akhil P Oommen wrote:
> > On 10/28/2024 12:13 AM, Arnd Bergmann wrote:
> >> On Sun, Oct 27, 2024, at 18:05, Akhil P Oommen wrote:
> >>> Clang-19 and above sometimes end up with multiple copies of the large
> >>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >>> fill the structure, but these create another copy of the structure on
> >>> the stack which gets copied to the first.
> >>>
> >>> If the functions get inlined, that busts the warning limit:
> >>>
> >>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size 
> >>> (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' 
> >>> [-Werror,-Wframe-larger-than]
> >>>
> >>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >>> the stack. Also, use this opportunity to skip re-initializing this table
> >>> to optimize gpu wake up latency.
> >>>
> >>> Cc: Arnd Bergmann <arnd@kernel.org>
> >>
> >> Please change this to "Reported-by:"
> > 
> > Sure.
> > 
> >>
> >> The patch looks correct to me, just one idea for improvement.
> >>
> >>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>>  	struct completion pd_gate;
> >>>
> >>>  	struct qmp *qmp;
> >>> +	struct a6xx_hfi_msg_bw_table *bw_table;
> >>>  };
> >>
> >> I think the bw_table is better just embedded
> >> in here rather than referenced as a pointer:
> >>
> > There are some low tier chipsets with relatively lower RAM size that
> > doesn't require this table. So, dynamically allocating this here helps
> > to save 640 bytes (minus the overhead of tracking).
> 
> I'd second this, said chipsets often ship with 1-2 GiB of RAM (which
> is still a lot in comparison, but you know.. every little bit counts)

Okay from my side. Yeah, poor Gnome runnning on top of 1 GiB device is
very sad.

-- 
With best wishes
Dmitry

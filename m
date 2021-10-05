Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5064232EE
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 23:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590116EC68;
	Tue,  5 Oct 2021 21:38:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131836EC68
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 21:38:57 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso623355ota.8
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XwBxFBF/Wz7qJo21AO0Spsmb8Z2fz8+ghFhMq6YjQTU=;
 b=WQ8XmZxsPfbZllzokRO7+Jjx/nD/hJboaXKtbethxbp3yID6yrPSP1lSPe2WQPhrn5
 aeG5uWM9yj3v7XY1gQVk6l3rK/YsaGZIADln28Ae7thnLpJf9Ee1SIDTiQdmshxmsX20
 nRwZfEheKCBrFroqZt1ZFnHViTUarBBJrk/mHHGt9sZpCdy06NetQ5pQv86QuaHuLGOf
 keRle//NDqbe2CoGUEJb57LfABJe3RsjgPaU2tIFKthI80mE0XR+6OrW4NKZuCu0ZZnP
 EnhGft/J5pAEvxsRah9fc9NjZjBOlRsX8VYzyOnNtTbHbBtod0DGP66L9iPCddng66Ge
 zmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XwBxFBF/Wz7qJo21AO0Spsmb8Z2fz8+ghFhMq6YjQTU=;
 b=M4goAPQp/ANIRGwGyclx6uDmptgO+JjWbbeb9GYkq+atVM3JDJLb/Rrqc28PXrfGi9
 r1jNW5wDT6QkQDV2XFgSmpoClAyUIQJicNje8sAkuiOxyZHVu573SMTKHSl5fNT1mP7F
 mepL0LYC1BrrU+pCQqPaxwv/h/i62puzk0Rjv3TXkTqHTLjMM21gRyUhJNJHuoMMDqEE
 mhCB9PvsHmAi2UFOz8CaoQRFI4PAi3GOWqsyGPNhrl+z08r1LMkWcBLgDzObQ5P5BT0w
 gJFKcFrQ0YR2pEo92HnoKr/q+grGL+EEmIHhhUy9y0/IJvJ6cAZtISwZnycV0tD56O3A
 T03A==
X-Gm-Message-State: AOAM531V3qF8qG7Gq1n+QilBdh+bh8Fo2+uc0mawrKkSndLhmHIkvU0/
 QgNhh7Y941IBETwGM3F0WArvZQ==
X-Google-Smtp-Source: ABdhPJxZU82kUOM2pe8hCHCAjxEF1gNb5QXbBnbhthExkr2zHei0ZXp/UlrjxB3s9dJBtIBvaocs5w==
X-Received: by 2002:a05:6830:812:: with SMTP id
 r18mr16200467ots.282.1633469936358; 
 Tue, 05 Oct 2021 14:38:56 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id z24sm3514610oic.26.2021.10.05.14.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 14:38:55 -0700 (PDT)
Date: Tue, 5 Oct 2021 14:40:38 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sankeerth Billakanti <sbillaka@codeaurora.org>
Message-ID: <YVzGVmJXEDH0HfIL@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Shorten SETUP timeout
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

On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > Found in the middle of a patch from Sankeerth was the reduction of the
> > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > is initalized and HPD interrupt start to be serviced, so in the case of
> > eDP this reduction improves the user experience dramatically - i.e.
> > removes 9.9s of bland screen time at boot.
> >
> > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> re-read the code a couple times to understand that it's waiting 100ms
> times the 'delay' number. Whaaaaat?
> 

I assume you're happy with the current 10s delay on the current
devices, so I don't think we should push for this to be backported.
I have no need for it to be backported on my side at least.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks,
Bjorn

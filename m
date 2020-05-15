Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B059B1D4287
	for <lists+freedreno@lfdr.de>; Fri, 15 May 2020 02:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC4E6E3D3;
	Fri, 15 May 2020 00:58:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BEF6EB9A
 for <freedreno@lists.freedesktop.org>; Fri, 15 May 2020 00:58:19 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id ms17so238827pjb.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PYudng5R/wrTc6vNtO9kYwTzA6rGU6HzaC8pWT1Yijs=;
 b=im5Kif4hQbjYjGoKpn59HdHsewBmXMA5l9xRvjBaBG8IMXIe228lODRusVefCZp+wB
 lMMb74JQf1vcjIYjoRXUJ9onY/hyUMpdJ0LaVDqcXRyhyQyiVyU5lzHm1RH8l3/gpQCX
 FAoLbHI0FEMXWhjTR5xznZStgNuNZ0Hc5G628=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PYudng5R/wrTc6vNtO9kYwTzA6rGU6HzaC8pWT1Yijs=;
 b=Da5FDi5mfc/FmuQWOhQlQexEDfKh5SsIgEuU1Z72+NLVCZ9nvopAfc3GxbZYF7Bi7q
 dWBAwwGB740AHP2IzlmmAOadY8ELPAO+3RpxlHfOlFmiNTFzj6x3e58j8b5pgAifDPTb
 2nQwQnT3zgE5aGAyERyu5NAZFNGx2s9v/kzwIuCHPukatDLs2n6WXfEI560I9pQYYkwy
 STeSCgZ6nRTrCinIg9Imx6kKzYIjhWxSuwIpbpeMhXmdQx0hDDdtIKZ34BudI6UM8tIJ
 dzpSKFE+TwsCxTvvfirV7ImEeXmCYJW5+bVmuR16/+Bp7Jyhu4AIqYmXUjY+6kTIIMqi
 MjaA==
X-Gm-Message-State: AOAM531QY00OR3BFFcx63CIJvMWXxF/sYS7UOFNt5fTFiOyrUhAekFHS
 B9z4NcDB5fV4PNRDUtbMxsAnyw==
X-Google-Smtp-Source: ABdhPJxye5U4MtIWKA8XEV+Ile2cxBdIwWMj2P7B8bI+uQVmvGBl5gA50D6rwtjuL+/STdr3NPYmXw==
X-Received: by 2002:a17:90a:22d0:: with SMTP id
 s74mr701194pjc.200.1589504299208; 
 Thu, 14 May 2020 17:58:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id m188sm363345pfd.67.2020.05.14.17.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 17:58:18 -0700 (PDT)
Date: Thu, 14 May 2020 17:58:17 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200515005817.GW4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
 <20200515003957.GV4525@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515003957.GV4525@google.com>
Subject: Re: [Freedreno] [PATCH 4/6] drm: msm: a6xx: send opp instead of a
 frequency
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 05:39:57PM -0700, Matthias Kaehlcke wrote:
> On Thu, May 14, 2020 at 04:24:17PM +0530, Sharat Masetty wrote:
> > This patch changes the plumbing to send the devfreq recommended opp rather
> > than the frequency. Also consolidate and rearrange the code in a6xx to set
> > the GPU frequency and the icc vote in preparation for the upcoming
> > changes for GPU->DDR scaling votes.
> 
> Could this be relatively easily split in two patches, one passing the OPP
> instead of the frequency, and another doing the consolidation? It typically
> makes reviewing easier when logically unrelated changes are done in separate
> patches.

After looking at the "upcoming changes for GPU->DDR scaling votes", which is
essentially one line I'm doubting if the splitting would actually make sense.
I'm now rather inclined to see "drm: msm: a6xx: use dev_pm_opp_set_bw to set
DDR bandwidth" squashed into this patch.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

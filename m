Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41BD28D78F
	for <lists+freedreno@lfdr.de>; Wed, 14 Oct 2020 02:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C476E156;
	Wed, 14 Oct 2020 00:37:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72596E156
 for <freedreno@lists.freedesktop.org>; Wed, 14 Oct 2020 00:37:48 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f19so899843pfj.11
 for <freedreno@lists.freedesktop.org>; Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=hj/dmzhSD6nEq1ECbJRrN5k3Yj70fyLPOHyyW3Lpa2M=;
 b=kubmvMu5gTY7pe6tnlFzYeC3gTJERFLXcbo2oIc2aoaGVmm+rI0CYNxe0OLsyZjRws
 xiq1KhAlYf0lKT3uew8qUdM2El6LoZ2FsouGYxKdKL2OQNPwgXebCx9wmHNtYiYyZI4q
 vTh4pcTulPq9jus3R3S/D25hLkJgue+fJuk6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=hj/dmzhSD6nEq1ECbJRrN5k3Yj70fyLPOHyyW3Lpa2M=;
 b=Y5KP+EzbzHTi1STMh70gqXjzVpVM2LJejI1cT3fccoIICAZ5K2U8+1UmcpQt30SHk3
 IoJcCjlGQ45rItKeoGsZBgUsHPiKRHl2jzmXh6jVpqEgdERHWtqU27IUjsT6j6yd7Qyg
 YVUhPSy9u7ezW30n2CuUwP7Me3l67m4LYTbEg7hUP3bzyRvdxdyXsg0zkvLI6S6PhuRU
 TEkhN4PCqohGwiOqggj7zfEWqpPgvOVtLfNl81wmno7PIf0rmXExDkauP4NfVXiTJ2N9
 ClHGiUganinqfvUqj5wzzk5YHFdnkqhJEhM7jdpybZh1bagxAMqz7kidjz3R2+51Ojxs
 TYtg==
X-Gm-Message-State: AOAM532x06YYOYQ7864dirAFTpREc4W441/26anlluFX5W+z5F6b/CvL
 URh3suwJec946VqGzRR/BVHeOA==
X-Google-Smtp-Source: ABdhPJy6yojyBg652Pz+i9adM86lSaHrUVX9BrY5jyJAsPNpduOoyeGyfJRzzoqU3rl001da66WPpQ==
X-Received: by 2002:a62:cd85:0:b029:152:6881:5e2c with SMTP id
 o127-20020a62cd850000b029015268815e2cmr2060162pfg.36.1602635868572; 
 Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u8sm833323pfk.79.2020.10.13.17.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20201013233544.5324-1-khsieh@codeaurora.org>
References: <20201013233544.5324-1-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 13 Oct 2020 17:37:46 -0700
Message-ID: <160263586661.310579.4100614256936519238@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: fixes wrong connection state
 caused by failure of link train
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-10-13 16:35:44)
> Connection state is not set correctly happen when either failure of link
> train due to cable unplugged in the middle of aux channel reading or
> cable plugged in while in suspended state. This patch fixes these problems.
> This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.
> 
> Changes in V2:
> -- Add more information to commit message.
> 
> Changes in V3:
> -- change base
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any Fixes tag?

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

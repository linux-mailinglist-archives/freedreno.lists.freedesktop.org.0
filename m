Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161440F090
	for <lists+freedreno@lfdr.de>; Fri, 17 Sep 2021 05:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA096EB4C;
	Fri, 17 Sep 2021 03:53:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F196EB49
 for <freedreno@lists.freedesktop.org>; Fri, 17 Sep 2021 03:53:51 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so11180437otc.4
 for <freedreno@lists.freedesktop.org>; Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=si11JPg2tUx3AsVeQ/TovCztnetl7T3psWWpp1fS5lA=;
 b=DZOnQvfjYVw2eK0gwNwwxEXWEm5xLno5eGrvLjhgQGrgMCGhtM4kv/W42j9sLJbi3O
 pcEBZnF0iu+0HiMKill8pmsE1UQpkECyjgiq3K0ICvlL6rldHZyw/e152XjZ/43P2ZnG
 mzjiCCe9lkGDxEZvO+/SMpdWDYkRwaGvJ8SB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=si11JPg2tUx3AsVeQ/TovCztnetl7T3psWWpp1fS5lA=;
 b=EaZW3f4SH/6M/RwrNmI8BCgdQx5qUZ7Uh74pALy82nfE5A4s0YZ/HdVEt1RD+BM2wB
 KPfvktHSoggit8JcipvW7sA6mQFUSMtVaGJY0BgLiYL0LZXGsTbLoMWsK8dz9c93TC0m
 1Duwb//w86wZy9UJypqJmpBmFHdmGdnp7x/jTWZK+7WuC75YOZDquMZA2mnoXC6oE/WQ
 V5qedkZBWDBWp/UN6HfK8FojILqLPbVM8+SW6O0ofuCkIVOZ4PQ3a3M70Qla8Qnrvou5
 o4ln/jEdviIaY1VblUTjqJbE36GGPbpQIhaqxRHbWasZif6OSDIWXAixBjNH1Ycj13yi
 KgJQ==
X-Gm-Message-State: AOAM5320XrArY4hFcKVcCuZ4g1f4SKuVqnQBGf9V1CF++hk6SCLqBg5y
 +K9wP5IIW7W7QC8tQclmFzrdEVOlM6Yx09EDTsOFhg==
X-Google-Smtp-Source: ABdhPJy6tPkXKq2HM2Xabj28+m9bCyAX8hcbLJrNjiL+b85iLZXT99WZxbBBCWiIknpSoYbGwM1DrBLiHpKljB+xkBQ=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr7659104ote.126.1631850831069; 
 Thu, 16 Sep 2021 20:53:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:53:50 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-11-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-11-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:53:50 -0700
Message-ID: <CAE-0n53uAEcj8Rpx36cRUU34k9mqtg2_tiXW_4+CYmrcihguHg@mail.gmail.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 10/13] drm/msm/dpu: Remove
 encoder->enable() hack
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

Quoting Sean Paul (2021-09-15 13:38:29)
> From: Sean Paul <seanpaul@chromium.org>
>
> encoder->commit() was being misused because there were some global
> resources which needed to be tweaked in encoder->enable() which were not
> accessible in dpu_encoder.c. That is no longer true and the redirect
> serves no purpose any longer. So remove the indirection.

When did it become false? Just curious when this became obsolete.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-11-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25B40F083
	for <lists+freedreno@lfdr.de>; Fri, 17 Sep 2021 05:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07166EB49;
	Fri, 17 Sep 2021 03:51:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C166EB47
 for <freedreno@lists.freedesktop.org>; Fri, 17 Sep 2021 03:51:54 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so65116otj.2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Sep 2021 20:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=eC8WWm0GB9m9+OiTXjvJDwwJ4bOx9YsGIUwSquTEdkE=;
 b=leXlvUp4wCgJ+WDoSlsI5mfKEeObgFzMYEyDUeRToizAqmkwRLhzsTBxrdEHJ1LdYD
 F1jlqshs/rFCIBHW6i5CscigoTLiIEwaxQ1O/7w84B5WqXaa6JB05tIBgBGUouTzY+BZ
 5ngRCTCyGAVKY1/dVw68vCIPuKawOTvBfu5lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=eC8WWm0GB9m9+OiTXjvJDwwJ4bOx9YsGIUwSquTEdkE=;
 b=xNLC00jjFpBEnwtut1LxVJsCoW+aosmV7y7SCpNY1Tm73prb2vLuoZgogR8q6Ah7//
 ayjq/2Uvrs1/ErHsBUp0JNYhokEbYcB+7Zxz2VX3pL7FTx9hM4GxlfwUTS4Q+lnbMprd
 Bl8DZSjAKXM6K6Lnk2Xbzz2U/LaEwGWYP76tvLnDrcVLJ+HuIstXvs3CVJiJZZ17hLHG
 ebCetFxHX2MblbahkSesJqydQRyqDH4llQl8MmnAoeJLd8aIv/SY8uX31PQOzK0aLzZF
 NhqW94o+qcq5sCHEuf/1Uij7AoJmL6ufrnTPkh/iwDhy4wbkz45t6fXY7WFQ6hyAB+Iy
 2t3g==
X-Gm-Message-State: AOAM5310Slr9sXSigSQN/1ylIob/xCMw7r1YSxDLkxaXdj48dYMmu2W+
 /hFJWgAFVgRlQmszjo75wim19iv6uf8qXMP7rTYJOg==
X-Google-Smtp-Source: ABdhPJwb+CAeP1LbhPRSrTra9NOvhp96+APdALmb4BWvnUD6hxz1CMABXqTRzuUhf7PFT5ityKS48rAG+XuHAMo+ZcQ=
X-Received: by 2002:a05:6830:719:: with SMTP id
 y25mr7534615ots.77.1631850713468; 
 Thu, 16 Sep 2021 20:51:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 20:51:52 -0700
MIME-Version: 1.0
In-Reply-To: <20210915203834.1439-12-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-12-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 20:51:52 -0700
Message-ID: <CAE-0n53jiiasodgaat9jJPifxGg=mNo8vewzORdBB+ZVd3VXTw@mail.gmail.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 11/13] drm/msm/dp: Re-order dp_audio_put
 in deinit_sub_modules
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

Quoting Sean Paul (2021-09-15 13:38:30)
> From: Sean Paul <seanpaul@chromium.org>
>
> Audio is initialized last, it should be de-initialized first to match
> the order in dp_init_sub_modules().

I don't really understand why the driver is written with all this "get"
stuff but sure.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
>
> Changes in v2:
> -None
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

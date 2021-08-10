Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB873E8573
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 23:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78D889CAA;
	Tue, 10 Aug 2021 21:35:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72EB89C0A
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 21:35:55 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 v10-20020a9d604a0000b02904fa9613b53dso816379otj.6
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+XhXVGH3fkIOnE1t2XNmliygvN33fb2RS+mFgm8hrtU=;
 b=nssXy17hVHdZO0veyfk+XdCrAZ190q+aijoQHy4Dd8jrwccS37npEBDWKfa3tVRsX/
 +Fl4rkROGtig5v474uHf01f0pMk20xiMuc0h1oIPnL+D2G1YT6fL3foT9JFhM9c//9dr
 RsidGeTpYH3eYySbmAdTb06F49h/EbOOXoBT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+XhXVGH3fkIOnE1t2XNmliygvN33fb2RS+mFgm8hrtU=;
 b=XPV28he/iWT3AcTJpMflJtFkhSMbysQqRGjdegRAyi/NAcAc8HRyQ5OZva8gWDhZa0
 Ov6NKHwEzovPDJzapT5r2xzAE9D9Ks71FDphQG2/z30OAmh4KiYQwQVJI+Jg4kDrkS5t
 1o+dyt0ceGsPTgvPDzmJIejfvlJrI73rlFuNv9mlvGhGbrxp3WJ+Hi72NupRg3iaUeRB
 RXMgLWbesOj0myjQPq5helOJ9OEflrBE5XXWXKuVFgOZWiFjiExyX+RbBQIpcPznoN4+
 A2Xry8k+cbhdOmSin8bfOQYorEmxpkAIkqOjvgTb9y1icAUQhy89sVyJEHfA5DuWzUoE
 Nz9w==
X-Gm-Message-State: AOAM530f/ocjtqqVH6gnG/duh/jKrQPTYzJ6LnjSpu0MG4MCunZ3dwL8
 5mz03rfSIROReNU35J0smHPQYlwScEeL9r+9INWKYQ==
X-Google-Smtp-Source: ABdhPJyiH0XE2MMSHvDD3YnTgiPVuRbdk1llKiBAiTDs/gIGZngoYWW5dJsF6iglEkjwRPIOdlrPTB7kIDitYcTjbyY=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr22748568otq.233.1628631355080; 
 Tue, 10 Aug 2021 14:35:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:35:54 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-7-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
 <1628196295-7382-7-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:35:54 -0700
Message-ID: <CAE-0n52n6ypCLrA3mWHekh9Caq8rT5ngV2X5MWdGYA8DJQb92g@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 6/6] drm/msm/dp: do not end dp link
 training until video is ready
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

Quoting Kuogee Hsieh (2021-08-05 13:44:55)
> Initialize both pre-emphasis and voltage swing level to 0 before
> start link training and do not end link training until video is
> ready to reduce the period between end of link training and video
> start to meet Link Layer CTS requirement.  Some dongle main link
> symbol may become unlocked again if host did not end link training
> soon enough after completion of link training 2. Host have to re
> train main link if loss of symbol locked detected before end link
> training so that the coming video stream can be transmitted to sink
> properly. This fixes Link Layer CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3
> and 4.3.2.4.
>
> Changes in v3:
> -- merge retrain link if loss of symbol locked happen into this patch
> -- replace dp_ctrl_loss_symbol_lock() with dp_ctrl_channel_eq_ok()
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

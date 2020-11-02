Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7F02A36EC
	for <lists+freedreno@lfdr.de>; Tue,  3 Nov 2020 00:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD81B6E56A;
	Mon,  2 Nov 2020 23:06:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D33F6E56A
 for <freedreno@lists.freedesktop.org>; Mon,  2 Nov 2020 23:06:29 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i26so12103343pgl.5
 for <freedreno@lists.freedesktop.org>; Mon, 02 Nov 2020 15:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=MiCRiUAdPtsLXaGvjbQBzyyJUrnFc6MXAvKphG8N+fw=;
 b=HB2VQ4LipmHehQpflvi4jZaT8TKSiBlksAPjBkdBtZAkd/+vReYZbE7CruYplu56vx
 OQZ+WkZKBw7mHQ0ubIR+Y6ijsFl0EAf+hc469Q5L1I3uqnhseQG8ZETWKV7AfAk0hBiK
 6AEBoGWexiK1cNYCtHR2WqmzEmoagJZ4esUjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=MiCRiUAdPtsLXaGvjbQBzyyJUrnFc6MXAvKphG8N+fw=;
 b=Xjrx2VUIq5SoEXMqI+Qe8cYfRS37L5yMxXAIt099fyGd+YS3AIjHvaYxDehYs/P8HB
 gobFFEprCDQt/PUZ6c99slYtVVxikN2rYwIBK7mcljOR6vMJgoTgmcMVH2RbCqyUC7Rh
 Mai0oaAXWDHQZec1p3cNvhiKCWsrBJdeS970aWcKTUdAW1IoqISkbbanQ49h0oT9BIWx
 XuSVyYi9Jg4M2SF5D7WAnXXS9L6ultwbo6mXYWWLnCNjrt+oq7aA6EAE/ADft8SJ4IeP
 b9266f0P6TqODzBM4odklBjf1B++Z1FXipDGeSk5OcKpjwpV9c7/fupW3W5HvEyXL/F6
 UIEQ==
X-Gm-Message-State: AOAM53146LBeJHa9gQfBaFF2z3gtm5/oq+HAhSUmJI+u79AccUM/FklQ
 dNAxi4UngFaQUeruVHVLKIruBw==
X-Google-Smtp-Source: ABdhPJxZLj/rSGcCridPBQV5YFibWzWNNb2SEwrfK11Q8oy7fvvspH7TS8SeClh60+6vrfnZ4WCC7A==
X-Received: by 2002:a17:90a:ed97:: with SMTP id
 k23mr540562pjy.100.1604358388782; 
 Mon, 02 Nov 2020 15:06:28 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id w10sm499336pjy.57.2020.11.02.15.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 15:06:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <99476b913b8b6ed28fc7af8e80c6db52@codeaurora.org>
References: <20201029205509.13192-1-abhinavk@codeaurora.org>
 <160435199458.884498.6173218904854698184@swboyd.mtv.corp.google.com>
 <99476b913b8b6ed28fc7af8e80c6db52@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: abhinavk@codeaurora.org
Date: Mon, 02 Nov 2020 15:06:26 -0800
Message-ID: <160435838669.884498.2757039786150233129@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: do not notify audio subsystem
 if sink doesn't support audio
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting abhinavk@codeaurora.org (2020-11-02 14:43:33)
> Hi Stephen
> 
> Thanks for the review.
> 
> On 2020-11-02 13:19, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2020-10-29 13:55:09)
> >> For sinks that do not support audio, there is no need to notify
> >> audio subsystem of the connection event.
> >> 
> >> This will make sure that audio routes only to the primary display
> >> when connected to such sinks.
> >> 
> > 
> > Does this need a Fixes tag? Or it's just an optimization patch?
> This is an unhandled corner case ( VGA dongle ) for DP audio and will 
> make
> sure we do not switch audio output from primary to external when 
> connected to
> a sink which does not support audio.
> I thought of adding a fixes tag pointing to 
> https://patchwork.freedesktop.org/patch/390236/.
> But at the same time, thought this can go in as a standlone patch as 
> well.
> If you think its required, I will add the fixes tag pointing to the base 
> audio patch.

Yeah Fixes is nice so we know what is fixed.

> > 
> >> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
> >>  1 file changed, 10 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 4a5735564be2..d970980b0ca5 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -555,8 +555,16 @@ static int dp_connect_pending_timeout(struct 
> >> dp_display_private *dp, u32 data)
> >>  static void dp_display_handle_plugged_change(struct msm_dp 
> >> *dp_display,
> >>                 bool plugged)
> >>  {
> >> -       if (dp_display->plugged_cb && dp_display->codec_dev)
> >> -               dp_display->plugged_cb(dp_display->codec_dev, 
> >> plugged);
> >> +       struct dp_display_private *dp;
> >> +
> >> +       dp = container_of(g_dp_display,
> > 
> > What is g_dp_display? I guess this doesn't compile?
> g_dp_display is the global dp_display pointer in the dp_display.c file. 
> It does compile.

Oh gross. Can we not use it if dp_display points to it?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

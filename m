Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2E87FBF8E
	for <lists+freedreno@lfdr.de>; Tue, 28 Nov 2023 17:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FC610E166;
	Tue, 28 Nov 2023 16:49:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C26210E166
 for <freedreno@lists.freedesktop.org>; Tue, 28 Nov 2023 16:49:49 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5ce8eff71e1so39028827b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Nov 2023 08:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701190188; x=1701794988; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GD78XLjf7azY9M1YBLSr3MhFJROFOKxRGQJfpbe9EqI=;
 b=gDgWPKcuzAymdIBSIVbMQ6r29xVW5uddMDDcb2MfWuooYeQNN3MWR9VPBnYUwWaVrg
 NTpvoOmbEwenLgqnBSr/1xpYm7NmjySol2Fbn1qo0AmJO9G9Zo/0unqL9rEIgXeu9qkj
 3V46DMlUwww1cBtbGa9Z5IaJP8UsR0HhVz5aN6xUKpVgsyKntm4a0iwoZufBIpDbOha0
 Le36qpLhb0pQ4NOLquymF56JS+z8q7D+KBtq8ti2cBUAe392QPQbU0B/Udcc5PP91RNP
 YpzKd6xQXfzKyfP5rHXZK65pIFkA6UZNQleEcBjJtOytYKlDn1PrJd9OSB1pqAC7UIHf
 nOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701190188; x=1701794988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GD78XLjf7azY9M1YBLSr3MhFJROFOKxRGQJfpbe9EqI=;
 b=MshbzK+fjnwlBHLPBRkpkmbOiqAt6H1AVPD30WiHHx1ULLdnKaPh4aWT7xjFhpNRcA
 AoNdcWNAI7YSVmRAHBomrA4UURuGuiWvV4VW3S1mW8fPTy+bFyWeFEdnILBwwGYbRVUw
 4hS9YZU+AbVGIJmExPjmvIfKPCl7edZP5BhneM/J3Cg49Gtx6ywfCHOX1tuxNXAIG+It
 aB3pHOjjH76q/ze/JkDLux8Kj0KIteh6mea5vkSyf24IBLfwbXhsTlsJgBaUAUYTI26L
 0+aiCrPnQw7cMesQx06GxUVwYtB/KFZBZ09s0ylhQzOl8XMnX0sAdNJtzy778xzUFdx2
 YkYA==
X-Gm-Message-State: AOJu0Yy2XrCsiSrDp2gFQSTt+WtMp/VPwoRJ3G7xWgVtea15Qy3b1Cs8
 dGp+VkyNfhXGGYwWaKS08TXNLBECrJu7/ltk5/ctyA==
X-Google-Smtp-Source: AGHT+IHvWlPlRTUJ/I2oNwEaIU1VT4yRPgec2UooToA0iRvEqgCTansBlFO5MCgGr8obm68fHQ3hfvqtxUtgQALcFMs=
X-Received: by 2002:a05:690c:3383:b0:5d0:57a6:5f21 with SMTP id
 fl3-20020a05690c338300b005d057a65f21mr7997955ywb.2.1701190188094; Tue, 28 Nov
 2023 08:49:48 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <20231127160658.2164612-1-mwalle@kernel.org>
In-Reply-To: <20231127160658.2164612-1-mwalle@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 18:49:36 +0200
Message-ID: <CAA8EJpphwXoKnzDkY3cBqzsDZwdw+nze-Ev2toPBJm-2VJvY_g@mail.gmail.com>
To: Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 03/10] drm/mipi-dsi: add API for manual
 control over the DSI link power state
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
Cc: tony@atomide.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, marijn.suijten@somainline.org, marex@denx.de,
 rfoss@kernel.org, dave.stevenson@raspberrypi.com, jernej.skrabec@gmail.com,
 alexander.stein@ew.tq-group.com, quic_jesszhan@quicinc.com, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, dianders@chromium.org,
 konrad.dybcio@linaro.org, tzimmermann@suse.de, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 27 Nov 2023 at 18:07, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi,
>
> > DSI device lifetime has three different stages:
> > 1. before the DSI link being powered up and clocking,
> > 2. when the DSI link is in LP state (for the purpose of this question,
> > this is the time between the DSI link being powered up and the video
> > stream start)
> > 3. when the DSI link is in HS state (while streaming the video).
>
> It's not clear to me what (2) is. What is the state of the clock and
> data lanes?

Clk an Data0 should be in the LP mode, ready for LP Data Transfer.

I don't think we support ULPS currently.


>
> I'm facing similar issues with the tc358775 bridge. This bridge needs
> to release its reset while both clock and data lanes are in LP-11 mode.
> But then it needs to be configured (via I2C) while the clock lane is
> in enabled (HS mode), but the data lanes are still in LP-11 mode.
>
> To me it looks like there is a fouth case then:
> 1. unpowered
> 2. DSI clock and data are in LP-11
> 3. DSI clock is in HS and data are in LP-11
> 4. DSI clock is in HS and data is in HS
>
> (And of course the bridge needs continuous clock mode).
>
> > Different DSI bridges have different requirements with respect to the
> > code being executed at stages 1 and 2. For example several DSI-to-eDP
> > bridges (ps8640, tc358767 require for the link to be quiet during
> > reset time.
> > The DSI-controlled bridges and DSI panels need to send some commands
> > in stage 2, before starting up video
> >
> > In the DRM subsystem stage 3 naturally maps to the
> > drm_bridge_funcs::enable, stage 1 also naturally maps to the
> > drm_bridge_funcs::pre_enable. Stage 2 doesn't have its own place in
> > the DRM call chain.
> > Earlier we attempted to solve that using the pre_enable_prev_first,
> > which remapped pre-enable callback execution order. However it has led
> > us to the two issues. First, at the DSI host driver we do not know
> > whether the panel / bridge were updated to use pre_enable_prev_first
> > or not. Second, if the bridge has to perform steps during both stages
> > 1 and 2, it can not do that.
> >
> > I'm trying to find a way to express the difference between stages 1
> > and 2 in the generic code, so that we do not to worry about particular
> > DSI host and DSI bridge / panel peculiarities when implementing the
> > DSI host and/or DSI panel driver.
>
> For now, I have a rather hacky ".dsi_lp11_notify" callback in
> drm_bridge_funcs which is supposed to be called by the DSI host while the
> clock and data lanes are in LP-11 mode. But that is rather an RFC and me
> needing something to get the driver for this bridge working. Because it's
> badly broken. FWIW, you can find my work-in-progress patches at
> https://github.com/mwalle/linux/tree/feature-tc358775-fixes
>
> -michael
>


--
With best wishes
Dmitry

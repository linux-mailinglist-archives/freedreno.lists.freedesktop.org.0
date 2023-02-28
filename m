Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFD6A5021
	for <lists+freedreno@lfdr.de>; Tue, 28 Feb 2023 01:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD2810E451;
	Tue, 28 Feb 2023 00:27:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BDE10E451
 for <freedreno@lists.freedesktop.org>; Tue, 28 Feb 2023 00:27:03 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id 4so5368919ilz.6
 for <freedreno@lists.freedesktop.org>; Mon, 27 Feb 2023 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4dpmjldCe+HY2ES0MFLHn2sS+ItBfNAWhdQJof6PBI=;
 b=TpO+O+hxXuNDUwB79mR9KtWXctPZotDM9vhyCIcH6Jc2f2Y35AnyS+Cv+eluuuFqx0
 3a5m/YFwr3YLlY0Latc16v0xtytbe/eWenIXf9AXgNtpOcY40dkrAl15c0MUJQwuoLf/
 1bo2qseIehw6e2br6xQzfDlhjVYwJx/7bpnjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4dpmjldCe+HY2ES0MFLHn2sS+ItBfNAWhdQJof6PBI=;
 b=3osfgx9M0AFJ8UeK6HBwFe5O/jD2f6d2bTw0BDqIUX/pRbHepvq5uNcLA0jUCLlKyx
 ypfDiN+A8SNZpRVWqSHsD94h/sReRHzzjvXU2P686qFU6gHpkRmqioT5mek8ms22oqUF
 fzSxPFhaSHHmtFRb78PqewhYjHlbhotTX1c0/gfDjrksB8awOnQI7QRlZFXE39y49V+C
 pqjyDRnPVE9jN/xrm22x3wBNEL6+yIxl3j84abbf+pDgFneu0z9hcMJ/WNGbu0btO7uA
 r/Uhg5dScnQVC3Xu2JzxPs6JacJoGYP/+7YqxlVamQO6iCeJ7lsqpsi2xjKiCPGzWLXO
 O1ow==
X-Gm-Message-State: AO0yUKXAvoOjOAEtd5gGhKD57tVsmDm6s79X8vBBy+vTOKWjvLDm8/9o
 ivqMPkYDVZicaG1BTXzEKFk8kOmGYmGw1r/9
X-Google-Smtp-Source: AK7set+8peaU54eno+QKOFQF7uLNOs4/3NEF+iBz/QKp1ZWrDyQUK64KgbdVYSqfX5gUr2mSE/XeyA==
X-Received: by 2002:a05:6e02:1404:b0:314:f7f:a35a with SMTP id
 n4-20020a056e02140400b003140f7fa35amr888315ilo.7.1677544022110; 
 Mon, 27 Feb 2023 16:27:02 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 z11-20020a02ceab000000b003c4860eb853sm2515309jaq.109.2023.02.27.16.26.59
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 16:27:00 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id v10so3384378iox.8
 for <freedreno@lists.freedesktop.org>; Mon, 27 Feb 2023 16:26:59 -0800 (PST)
X-Received: by 2002:a02:858c:0:b0:3c5:1971:1b7f with SMTP id
 d12-20020a02858c000000b003c519711b7fmr440124jai.6.1677544019208; Mon, 27 Feb
 2023 16:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay89_0Nw@mail.gmail.com>
In-Reply-To: <CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay89_0Nw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Feb 2023 16:26:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UNx7ivymvpGKcuyvvepvo-T2B2aREJy2GyawTHCnazsw@mail.gmail.com>
Message-ID: <CAD=FV=UNx7ivymvpGKcuyvvepvo-T2B2aREJy2GyawTHCnazsw@mail.gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [RFT PATCH v2 1/3] drm/bridge: tc358762: Set
 pre_enable_prev_first
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 1, 2023 at 1:51=E2=80=AFAM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Tue, 31 Jan 2023 at 22:22, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
> > ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
> > order"). This should allow us to revert commit ec7981e6c614
> > ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
> > commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> > time").
>
> I see no reference in the TC358762 datasheet to requiring the DSI
> interface to be in any particular state.
> However, setting this flag does mean that the DSI host doesn't need to
> power up and down for each host_transfer request from
> tc358762_pre_enable/tc358762_init, so on that basis I'm good with it.
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/bridge/tc358762.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge=
/tc358762.c
> > index 0b6a28436885..77f7f7f54757 100644
> > --- a/drivers/gpu/drm/bridge/tc358762.c
> > +++ b/drivers/gpu/drm/bridge/tc358762.c
> > @@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device *d=
si)
> >         ctx->bridge.funcs =3D &tc358762_bridge_funcs;
> >         ctx->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
> >         ctx->bridge.of_node =3D dev->of_node;
> > +       ctx->bridge.pre_enable_prev_first =3D true;
> >
> >         drm_bridge_add(&ctx->bridge);

Abhinav asked what the plan was for landing this [1]. Since this isn't
urgent, I guess the plan is to land patch #1 in drm-misc-next. Then we
sit and wait until it percolates into mainline and, once it does, then
patch #2 and #3 can land.

Since I have Dave's review I can commit this to drm-misc-next myself.
My plan will be to wait until Thursday or Friday of this week (to give
people a bit of time to object) and then land patch #1. Then I'll
snooze things for a while and poke Abhinav and Dmitry to land patch #2
/ #3 when I notice it in mainline. If, at any point, someone comes out
of the woodwork and yells that this is breaking them then, worst case,
we can revert.

[1] https://lore.kernel.org/r/1f204585-88e2-abae-1216-92f739ac9e91@quicinc.=
com/

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94EC6A886F
	for <lists+freedreno@lfdr.de>; Thu,  2 Mar 2023 19:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E7810E272;
	Thu,  2 Mar 2023 18:20:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18A810E52E
 for <freedreno@lists.freedesktop.org>; Thu,  2 Mar 2023 18:20:05 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536c02c9dfbso441724507b3.11
 for <freedreno@lists.freedesktop.org>; Thu, 02 Mar 2023 10:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZAPXM0LrNiqSTWbCG2CR8IPVb5EwH+3MFjYQTbFfCc=;
 b=TI8oAEznTj0VbOLCat1DPNqMU06vdate7f6rAjVdP5wpmvMipvaE7Y+c4QzmwWSIXM
 lAaN4vVSZ7VQi2YHztan6+crDPP0eLCnNq/7pjcQ+HxaMlq3epLNaIsGS/s0pBjuUNc8
 HoBc9LdjkUHbEN6yCc87Hl6kAkNUlBPeq8S3QBTZZlzPjq7jCZuANxpZQWdVMCjHOhON
 lYNbySLjyjujXc1zizmCIW+lexghQWo6DM8gquFowDffkmpE1THRLdvmk4sx9E1VSvEp
 AD3Lj5P3sxY4EaM3IKTF03UwF+Q9iwroahk/JpaLH86fM9TNvfDEx5cb6nQXY59CyW8t
 Er1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZAPXM0LrNiqSTWbCG2CR8IPVb5EwH+3MFjYQTbFfCc=;
 b=v80XYWoVaIHnAt8gE2jtIT/P6os/6DtYrNTEHhaZn4xgmsLmbhlzAS2pChfLKRr+wn
 z8TTA7P12sDAtxqlqazeUMwQCImkUZ5LCK1UwgcjQ+Xf0Xze7GZpxYYPuQ++HLX263WC
 QZfde9w2PiT6TUaH3d8wL88nW/y22uTYRF3Vt+4e4+VCjOyLAO/6vKbvFL5x6QLPovch
 Lpl87PQki4DcuXDv4kqNfVg2TTPS2yEo4m71iRBKRGU06qItAL2I7W5p2NS7xpVpEDwl
 5W6c6hy0sMuH8xjI5f01c91QQDbeO1oU5LJdrosreoF4HVQft6qqSEVEknm/7gWYnE9f
 2aoQ==
X-Gm-Message-State: AO0yUKW18VuE+1EeReeITsoXettscHwWqT8fAEeooQaxs4Fvr8OG0BFS
 7/PleJ4Q8K31ZMHyX2dnDdXmlMBUfqS1O0Gaaf4AQQ==
X-Google-Smtp-Source: AK7set8MuWxgyggg2x5O2vzdSY/MWzzPRlU35FhPBPzcMfaqX0BnsN2Uz7YPLspM/KtBSWLbypAoRUS5my77kUFM1R4=
X-Received: by 2002:a0d:d946:0:b0:52e:c5f1:a0d4 with SMTP id
 b67-20020a0dd946000000b0052ec5f1a0d4mr1859997ywe.4.1677781204806; Thu, 02 Mar
 2023 10:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay89_0Nw@mail.gmail.com>
 <CAD=FV=UNx7ivymvpGKcuyvvepvo-T2B2aREJy2GyawTHCnazsw@mail.gmail.com>
 <e077d60d-5881-1ccc-a17a-fbe64392e29d@linaro.org>
 <CAD=FV=W_FVUOD6T0Lx-JTqrqaP9gPgb4R-2TaSqKwkaBkqHJmQ@mail.gmail.com>
In-Reply-To: <CAD=FV=W_FVUOD6T0Lx-JTqrqaP9gPgb4R-2TaSqKwkaBkqHJmQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Mar 2023 20:19:54 +0200
Message-ID: <CAA8EJpq-gHjtNzDya-50K3mz5Odhgfd=cSKYfNReSnoRf5reTQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
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
 linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 2 Mar 2023 at 19:26, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Feb 27, 2023 at 5:24=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 28/02/2023 02:26, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Feb 1, 2023 at 1:51=E2=80=AFAM Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > >>
> > >> On Tue, 31 Jan 2023 at 22:22, Douglas Anderson <dianders@chromium.or=
g> wrote:
> > >>>
> > >>> Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
> > >>> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
> > >>> order"). This should allow us to revert commit ec7981e6c614
> > >>> ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") an=
d
> > >>> commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> > >>> time").
> > >>
> > >> I see no reference in the TC358762 datasheet to requiring the DSI
> > >> interface to be in any particular state.
> > >> However, setting this flag does mean that the DSI host doesn't need =
to
> > >> power up and down for each host_transfer request from
> > >> tc358762_pre_enable/tc358762_init, so on that basis I'm good with it=
.
> > >>
> > >> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >>
> > >>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >>> ---
> > >>>
> > >>> (no changes since v1)
> > >>>
> > >>>   drivers/gpu/drm/bridge/tc358762.c | 1 +
> > >>>   1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/br=
idge/tc358762.c
> > >>> index 0b6a28436885..77f7f7f54757 100644
> > >>> --- a/drivers/gpu/drm/bridge/tc358762.c
> > >>> +++ b/drivers/gpu/drm/bridge/tc358762.c
> > >>> @@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_devic=
e *dsi)
> > >>>          ctx->bridge.funcs =3D &tc358762_bridge_funcs;
> > >>>          ctx->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
> > >>>          ctx->bridge.of_node =3D dev->of_node;
> > >>> +       ctx->bridge.pre_enable_prev_first =3D true;
> > >>>
> > >>>          drm_bridge_add(&ctx->bridge);
> > >
> > > Abhinav asked what the plan was for landing this [1]. Since this isn'=
t
> > > urgent, I guess the plan is to land patch #1 in drm-misc-next. Then w=
e
> > > sit and wait until it percolates into mainline and, once it does, the=
n
> > > patch #2 and #3 can land.
> > >
> > > Since I have Dave's review I can commit this to drm-misc-next myself.
> > > My plan will be to wait until Thursday or Friday of this week (to giv=
e
> > > people a bit of time to object) and then land patch #1. Then I'll
> > > snooze things for a while and poke Abhinav and Dmitry to land patch #=
2
> > > / #3 when I notice it in mainline. If, at any point, someone comes ou=
t
> > > of the woodwork and yells that this is breaking them then, worst case=
,
> > > we can revert.
> >
> > This plan sounds good to me.
>
> Pushed to drm-misc-next:
>
> 55cac10739d5 drm/bridge: tc358762: Set pre_enable_prev_first
>
> If my math is right then I'd expect that to get into mainline for
> 6.4-rc1. I guess that means it'll be in Linus's tree mid-May. I'll
> schedule a reminder to suggest landing at patches #2 and #3 again in
> late May.

It might be earlier, if msm-next merges drm-misc earlier (e.g. for the
PSR patches).

--=20
With best wishes
Dmitry

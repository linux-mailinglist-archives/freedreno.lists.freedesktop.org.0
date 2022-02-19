Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A1D4BC409
	for <lists+freedreno@lfdr.de>; Sat, 19 Feb 2022 01:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D3010EAE3;
	Sat, 19 Feb 2022 00:55:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777B010EADB
 for <freedreno@lists.freedesktop.org>; Sat, 19 Feb 2022 00:55:30 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so5603012ooa.11
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 16:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=maCiXDsH7Piecw7CFVUouSN0+BxrDTavlzWiZL+tFJ0=;
 b=bOv6CwZIKZHtpIQnWvILAOBC6r25um6+oH4DrZQ93R6IHHUGHJs3CAD+Z9LEFIjR99
 WR3GZPsEdjaf65IzYPiE5r/XtX4oii/eGmJPX8XtHB4nAzcD3EBdZeKklVvfPetXdY2t
 2q8dHpsk4Ax/DonkZqiE3ylaePFUkWbpKjXQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=maCiXDsH7Piecw7CFVUouSN0+BxrDTavlzWiZL+tFJ0=;
 b=Fgld3GCov6oExh+clZ7GSy1ugByfAeZw0l2JeRE6Ixc/FtSq/tdUmjXbRHXJIg8bIg
 /4/n4E+0ifwuNWJMJ7xerlNr6qxTcGfByEgePUAxjb1oiJ+Fe5rot+gQe6cWIkTFQH/N
 VbqnXG3HHoUIrvBeS3c6mMCwVck+TfMgvoIe8diXk+MxTVXub0byfKNvfgNkNJqQWY1o
 deR8isNKrocAGgno7f0TnByXjf72YzDRj4TXl4nKGi5lLdFA5rSNVNfmqrCTqW1jC+GW
 GTvihRaLZ7/IOrfcJNHNwb2CrsXpGrpolntagx/eTzqpJWi3QXnC0b4tdrGU/QZudxhk
 +rrg==
X-Gm-Message-State: AOAM532RUC0wL4gcR1TzYCbso8kDLQvDIEvQNaDgwTH828n3UM9RoHGY
 Yk9SH1hYUUnkaKbCZ2ggPDu5aiBoUKZeOrZqgYXU3Q==
X-Google-Smtp-Source: ABdhPJywGtHkEJiSikl5mOrCZbkSyqbuSbXwCo5TdExAry7Ny8z6sSuvbtjak34CZwM8SLSxuRi5rOWWPRfvbKAu8mQ=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr3727706oao.8.1645232129818; Fri, 18 Feb
 2022 16:55:29 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 16:55:29 -0800
MIME-Version: 1.0
In-Reply-To: <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 16:55:29 -0800
Message-ID: <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector
 with drm_bridge_connector
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-18 14:32:53)
> On 19/02/2022 00:31, Kuogee Hsieh wrote:
> >
> > On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> >> There is little point in having both connector and root bridge
> >> implementation in the same driver. Move connector's functionality to t=
he
> >> bridge to let next bridge in chain to override it.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > This patch break primary (edp) display
> >
> > -- right half of screen garbled
> >
> > -- screen shift vertically
> >
> > below are error messages seen --
> >
> > [=C2=A0=C2=A0 36.679216] panel-edp soc@0:edp_panel: No display modes
> > [=C2=A0=C2=A0 36.687272] panel-edp soc@0:edp_panel: No display modes
> > [=C2=A0=C2=A0 40.593709] panel-edp soc@0:edp_panel: No display modes
> > [=C2=A0=C2=A0 40.600285] panel-edp soc@0:edp_panel: No display modes
>
> So, before the patch the drm core was getting modes from the
> drm_connector (which means, modes from drm driver itself). With this
> patch the panel-edp tries to get modes.
>
> Could you please check, why panel_edp_get_modes() fails? Assuming that
> you use platform panel-edp binding (rather than 'edp-panel') could you
> please check you have either of the following:
> - ddc bus for EDID?

I don't see anywhere where the ddc pointer is set for the dp bridge in
msm_dp_bridge_init(). Is that required though? I'd think simple panel is
still being used here so reading EDID isn't required.

> - either num_timing or num_modes in your panel desc.
>

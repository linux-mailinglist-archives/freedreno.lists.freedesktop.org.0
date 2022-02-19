Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3265A4BC4CA
	for <lists+freedreno@lfdr.de>; Sat, 19 Feb 2022 03:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9702010EB14;
	Sat, 19 Feb 2022 02:22:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC3310EB1E
 for <freedreno@lists.freedesktop.org>; Sat, 19 Feb 2022 02:22:58 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id d3so18319009qvb.5
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 18:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAPX59R95iQoqcb29QNi0y25GZdCHmhAw3GFp0BvSug=;
 b=oAhv0YrAA95noECsF1VbXIg8i78c6RDiGTgt32Xgs2QfTWnOUwejdg56m7O6BuSfJt
 mBS1H8+U04XHHJjKtPH5fPXVc9RSuoogDbGZU9mTSLm+37/AHSpI/tyHAF6j1pr5Fmtd
 WWfA9NplFb2DarN8kpLrSHgcSx8jLmfgaFtkjCfvviErOXezqUlRTjIj6NO5mSCu7KjZ
 wRmauT3uYlTcJjwgUPzL1Lu7E2ZO1EnZYJcV+nM/y4tIBW7ckjbnyfnR3ezV8boSDE6r
 qoCr2Pyuq/l0EneuUB05TOM/u71/6DgjQSpTCYufy4JjRe0Gq/wawCT3eiXM9Z1LOP5e
 +64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAPX59R95iQoqcb29QNi0y25GZdCHmhAw3GFp0BvSug=;
 b=fjdfA1r9nvjKXWtpAvTnkUs7zd6fOj/JKqynlRgINKNK+ryxGqKJv4fqvr2sCBjN7h
 /lljktgGhBnc/zXYVFqkr1XQpEjbnVYCLN8odMHTflalLjEyXz/0uXAwYjJ9SEQ0Jfi6
 mkZv3bPa+OZGAqDS/5vSl+DgA/ev+laGkVQqeYbPtgmy2b22SXy+W7ZTwAIEJ9EHAJSZ
 nINYdDDTbmK/HExisnEJ/ZxB8U3qJVjNemCpggY1Ai3ATwzkrdwhHEYRIbOE6sS2V6QM
 D3mN6JqEi95ChjyZfrX/UU3b2BjSQ2htXcHKN7KaTJh1vrz/5kzVJMQ6658E5Nhhr6Wu
 ld5Q==
X-Gm-Message-State: AOAM531BSm3c5Vw4pHxr5/FEk9IXRDqJefLrpvyGrxqn40/hlR4AXBnY
 cE3ND4WdBxfcl4jAy7y7yuSJViaxw7pp4f3s4Luf+Q==
X-Google-Smtp-Source: ABdhPJzwxVrkef+NHwg4T52gU0d1zJda+hVFqEPfCpfPgZzWo0dNrJqWTDqoKAkziUUE2ntG8G4fFfSZOAAdOx63+sU=
X-Received: by 2002:ac8:5716:0:b0:2d6:4f00:6a76 with SMTP id
 22-20020ac85716000000b002d64f006a76mr9178340qtw.682.1645237377621; Fri, 18
 Feb 2022 18:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
 <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
In-Reply-To: <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Feb 2022 05:22:46 +0300
Message-ID: <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 19 Feb 2022 at 03:55, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-18 14:32:53)
> > On 19/02/2022 00:31, Kuogee Hsieh wrote:
> > >
> > > On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> > >> There is little point in having both connector and root bridge
> > >> implementation in the same driver. Move connector's functionality to the
> > >> bridge to let next bridge in chain to override it.
> > >>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > This patch break primary (edp) display
> > >
> > > -- right half of screen garbled
> > >
> > > -- screen shift vertically
> > >
> > > below are error messages seen --
> > >
> > > [   36.679216] panel-edp soc@0:edp_panel: No display modes
> > > [   36.687272] panel-edp soc@0:edp_panel: No display modes
> > > [   40.593709] panel-edp soc@0:edp_panel: No display modes
> > > [   40.600285] panel-edp soc@0:edp_panel: No display modes
> >
> > So, before the patch the drm core was getting modes from the
> > drm_connector (which means, modes from drm driver itself). With this
> > patch the panel-edp tries to get modes.
> >
> > Could you please check, why panel_edp_get_modes() fails? Assuming that
> > you use platform panel-edp binding (rather than 'edp-panel') could you
> > please check you have either of the following:
> > - ddc bus for EDID?
>
> I don't see anywhere where the ddc pointer is set for the dp bridge in
> msm_dp_bridge_init(). Is that required though? I'd think simple panel is
> still being used here so reading EDID isn't required.

I meant the 'ddc-i2c-bus' property for the corresponding eDP panel.

> > - either num_timing or num_modes in your panel desc.

After reading the panel-edp's code I don't have another cause for
panel_edp_get_modes(). It should either have a DDC bus specified using
the mentioned device tree property, or it should have specified the
timings.

Kuogee, which platform were you using when testing this patch? Could
you please share the dts fragment?

-- 
With best wishes
Dmitry

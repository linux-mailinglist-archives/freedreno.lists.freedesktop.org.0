Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD424F1CE3
	for <lists+freedreno@lfdr.de>; Mon,  4 Apr 2022 23:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED31310E527;
	Mon,  4 Apr 2022 21:29:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FD010E517
 for <freedreno@lists.freedesktop.org>; Mon,  4 Apr 2022 21:29:43 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id p25so8809139qkj.10
 for <freedreno@lists.freedesktop.org>; Mon, 04 Apr 2022 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IxUdjcC4It/JwdPOTj9qf8Z2Z9qsMxlLajpUd7Bfk/o=;
 b=POnOfkKB5D3FdXZ3FUx89riusD8I3RIEffDsh+KNc9BBUacT82hSW46tJsWf5CUr4Z
 9tCpUVA2vzJ6RNSV/hyhPsGW4fXWyimM+aqGrXtvHqFWENOgXa0eSohh92R0UixG7UKr
 1bjSfBJUFUZn1kS8Ji0hY0DtdpXo4oXUVxihn5JotQ+VNqNImvdCWoCrPC97P5Sn1i66
 EM927H4AOz07RCNVWrzp6LqIsP/DQjPaOUctdkXuIL4EbpcA1zIiGPByFm/qCWWMZg3F
 ImgWoGm+3GVLuS8Nr1Bt8asoBnKLtm3VyUMwZrECsO5hKNb4WDBZrLmIQDDHYNzG+3fS
 VnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IxUdjcC4It/JwdPOTj9qf8Z2Z9qsMxlLajpUd7Bfk/o=;
 b=DUMhZvqEGm9UP7O6tKowBKS7ZcOmr61sO9bUwtGGyNRlk1n1omdfjU+NgZ6+gGGlFY
 6fJAcjq5Q2mIjXwBJyP+yFfjjeWoKBSRTfDHjqnWLSrpDs8uwNuFVH1JQu3P7HtBfQ+I
 sNErrbz7r5x6YiPesXZESW/Ni/Q2DgP8HkbB83+Hc3dXetYMqvTi247pfmTX2HGoSEp6
 E4g0SroqW/Vey3bdXw2Qpc6yYsJSEjGTAj7jCe11xtTJibZNBm4jmCBVMKXeWYnMQCul
 44wCiW1jjKc6mMOUaEHeciBCcMJ2NQzH9V8xjFk6dC5TwqUH5CecKlRwXfXS0OwqGl1B
 WWgQ==
X-Gm-Message-State: AOAM531zcToYslIMfOyHD713HJySi0l+CDvgk/X4SUnCPQdsi3exyOts
 lCTakdOeaLseKTd+0HPAWK3+1oXE29DkgyYwTCHkLg==
X-Google-Smtp-Source: ABdhPJyyRMlOkHW8q1Mhm5p13Qfm1ifyp2XYVK5SyJAhakAFTtHNbQGpzkKzG2wqiZ5LZOfnuNwc68wkA3oO+hVOi0A=
X-Received: by 2002:a05:620a:2453:b0:67d:9539:495c with SMTP id
 h19-20020a05620a245300b0067d9539495cmr215335qkn.30.1649107782604; Mon, 04 Apr
 2022 14:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
 <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
 <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Apr 2022 00:29:31 +0300
Message-ID: <CAA8EJpqFh7c9ohDbR_0kG5t106-djE7TYfaoAbiT-W4-294jTw@mail.gmail.com>
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid
 differently from dp
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 4 Apr 2022 at 21:21, Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Doug,
>
> > On Wed, Mar 30, 2022 at 11:02 PM Sankeerth Billakanti (QUIC)
> > <quic_sbillaka@quicinc.com> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > > On Wed, 30 Mar 2022 at 19:04, Sankeerth Billakanti
> > > > <quic_sbillaka@quicinc.com> wrote:
> > > > >
> > > > > The panel-edp driver modes needs to be validated differently from
> > > > > DP because the link capabilities are not available for EDP by that time.
> > > > >
> > > > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > > >
> > > > This should not be necessary after
> > > >
> > https://patchwork.freedesktop.org/patch/479261/?series=101682&rev=1.
> > > > Could you please check?
> > > >
> > >
> > > The check for DP_MAX_PIXEL_CLK_KHZ is not necessary anymore but we
> > > need to return early for eDP because unlike DP, eDP context will not
> > > have the information about the number of lanes and link clock.
> > >
> > > So, I will modify the patch to return after the DP_MAX_PIXEL_CLK_KHZ
> > check if is_eDP is set.
> >
> > I haven't walked through all the relevant code but something you said above
> > sounds strange. You say that for eDP we don't have info about the number
> > of lanes? We _should_.
> >
> > It's certainly possible to have a panel that supports _either_ 1 or 2 lanes but
> > then only physically connect 1 lane to it. ...or you could have a panel that
> > supports 2 or 4 lanes and you only connect 1 lane.
> > See, for instance, ti_sn_bridge_parse_lanes. There we assume 4 lanes but if
> > a "data-lanes" property is present then we can use that to know that fewer
> > lanes are physically connected.
> >
> > It's also possible to connect more lanes to a panel than it supports.
> > You could connect 2 lanes to it but then it only supports 1. This case needs to
> > be handled as well...
> >
>
> I was referring to the checks we do for DP in dp_bridge_mode_valid. We check if the
> Link bandwidth can support the pixel bandwidth. For an external DP connection, the
> Initial DPCD/EDID read after cable connection will return the sink capabilities like link
> rate, lane count and bpp information that are used to we filter out the unsupported
> modes from the list of modes from EDID.
>
> For eDP case, the dp driver performs the first dpcd read during bridge_enable. The
> dp_bridge_mode_valid function is executed before bridge_enable and hence does
> not have the full link or the sink capabilities information like external DP connection,
> by then.

It sounds to me like we should emulate the HPD event for eDP to be
handled earlier than the get_modes()/prepare() calls are attempted.
However this might open another can of worms.

> So, we need to proceed with the reported mode for eDP.

Well... Even if during the first call to get_modes() the DPCD is not
read, during subsequent calls the driver has necessary information, so
it can proceed with all the checks, can't it?

-- 
With best wishes
Dmitry

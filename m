Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35404E792B
	for <lists+freedreno@lfdr.de>; Fri, 25 Mar 2022 17:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EB810E2A4;
	Fri, 25 Mar 2022 16:45:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B548710E2A4
 for <freedreno@lists.freedesktop.org>; Fri, 25 Mar 2022 16:45:40 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id j15so16473449eje.9
 for <freedreno@lists.freedesktop.org>; Fri, 25 Mar 2022 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94PEXMIFvyyJQFPubb1Xaa+0LbyxHkePHlhp9zj/Z+g=;
 b=SjSMuLWWBMRDZCZAYqkZjt8DVD1lMxcnTQ0pRcoYE6pc5KA03fRjaO+NG5JnARI9G0
 FdIxBtqN2SuWVe3DEw0nVislGa6FeRILBe77MlmD72/jA9e8G3JD5rKHwo6BJ0bvdI0A
 HSMzQ+1ZTMcraGaMFyqLA5koHqo6CEQtOaaRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94PEXMIFvyyJQFPubb1Xaa+0LbyxHkePHlhp9zj/Z+g=;
 b=AqjATJOqruKHFpoyYb7VlSBSw8uitiYS5kcKUfmo4tGaId/0QVaenFqaW8YZ+XRWIV
 5J811T36oPnOvyyEawv+UKyEPy6+oG6BlBnV6VqBvBjutlQzkUVC9A8OguZs8aaa92L2
 xmjMs4vfU3bxkQSay0grC0vSiZP0agv8F5n/4TIl4QtY3cmD5Z6T+YWV42mkeAWTgyN8
 LvdPmilyTgsnkjWbahPU65JqqluNsWak+Ju4/0UBZ51KxN1/93mOrCW7fLEfr8SOmvUA
 uMou4XPqixDZ8fPAnyiw72FGd6gqkUi/Uz/YUJWsqihyVhrxrhRzea/Cm8yqV5/BKNJg
 dqaA==
X-Gm-Message-State: AOAM533WlOk5BhcW1a74ovMMS3jSumg3FR0iyLpVHAjatOsvpcUPDTEP
 TAl/vBSTskiJFIYj1Ty/IvjsxKf903gd0C+oI7A=
X-Google-Smtp-Source: ABdhPJzNy0GLbwmKaUZeowJf3/CgFfxWx54fnvgNV8VmvHWR4D/FoH83EE+PqhvqkZVXGvL6oiZelQ==
X-Received: by 2002:a17:907:7209:b0:6da:9781:ae5d with SMTP id
 dr9-20020a170907720900b006da9781ae5dmr11927739ejc.73.1648226738800; 
 Fri, 25 Mar 2022 09:45:38 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 p3-20020a1709060e8300b006d0e8ada804sm2475090ejf.127.2022.03.25.09.45.37
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 09:45:38 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 i67-20020a1c3b46000000b0038ce25c870dso1247488wma.1
 for <freedreno@lists.freedesktop.org>; Fri, 25 Mar 2022 09:45:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3c8a:b0:389:cf43:eaf6 with SMTP id
 bg10-20020a05600c3c8a00b00389cf43eaf6mr10706474wmb.199.1648226737471; Fri, 25
 Mar 2022 09:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-6-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n50dmA0ETgNvaBGs+XmGu+r=6RbfbmnHqXAFqUBGjVGDvg@mail.gmail.com>
 <MW4PR02MB718688EF42698851322BBF6DE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB718688EF42698851322BBF6DE11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Mar 2022 09:45:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7yHoC=7Fj24AjkGwgKvTL6qYfW+yPRstF5j6qt1Lw_Q@mail.gmail.com>
Message-ID: <CAD=FV=X7yHoC=7Fj24AjkGwgKvTL6qYfW+yPRstF5j6qt1Lw_Q@mail.gmail.com>
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 5/9] drm/msm/dp: Add eDP support via
 aux_bus
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>, quic_kalyant <quic_kalyant@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 25, 2022 at 7:11 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> > > @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct
> > msm_dp *dp_display, struct drm_device *
> > >         bridge->funcs = &dp_bridge_ops;
> > >         bridge->type = dp_display->connector_type;
> > >
> > > -       bridge->ops =
> > > -               DRM_BRIDGE_OP_DETECT |
> > > -               DRM_BRIDGE_OP_HPD |
> > > -               DRM_BRIDGE_OP_MODES;
> > > +       if (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {
> >
> > Why can't eDP have bridge ops that are the same?
> >
>
> eDP needs to be reported as always connected. Whichever bridge is setting these ops flags should provide the ops.
> The farthest bridge from the encoder with the ops flag set should implement the ops.
> drm_bridge_connector_detect  reports always connected for eDP. So, we don't need DRM_BRIDGE_OP_DETECT
> eDP panel bridge will add DRM_BRIDGE_OP_MODES in drm_panel_bridge_add_typed and will call panel_edp_get_modes.
> As we are not supporting HPD for EDP, we are not setting the HPD ops flag.

Right. It's Expected that eDP and DP would have different ops. If we
define "detect" and "HPD" as whether the display is _physically_
connected, not the status of the poorly-named eDP "HPD" pin, then eDP
is _supposed_ to be considered always connected and thus would never
support DETECT / HPD.

...and right that the panel is expected to handle the modes.

This matches how things have been progressing in Laurent's patches
(taken over by Kieran) to add full DP support to sn65dsi86. For
instance:

https://lore.kernel.org/r/20220317131250.1481275-3-kieran.bingham+renesas@ideasonboard.com/
https://lore.kernel.org/r/20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com/

-Doug

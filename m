Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C904C03E8
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 22:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C0210E758;
	Tue, 22 Feb 2022 21:33:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6638110E758
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 21:33:16 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u18so40170574edt.6
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2mHyuXRZ8I3kYyoLE5Iu8QS0sxIBaqpluj4s82tM14=;
 b=XU8m9oP18Bpix//+UfSCTLIeU0VonowaQlKnTBNjXvrf7Sh63zBVsvoj6iNCdjssqx
 sOLjMKD1S+Q9lPtN1ITHaXj2KgS6DfyohVrHjXxgbWst8I1vZfKJZ+uE6Zffys1MgxIg
 gsMi91m2uVrFrWU/GnUevsMXhSnRsE9nBQ254=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2mHyuXRZ8I3kYyoLE5Iu8QS0sxIBaqpluj4s82tM14=;
 b=uhQAr8eFp+mWJ121rWsUGB9I45WL+uzSpuUek0hlc2Grrpn2m/CyCGGs/jrCtBzP4k
 uD9MuhyzRu9oGXc0VP9rHIM7sPvRgAjjoRlArZpyefVxbG/jgmSVSgMksmW7mt4dPoYW
 OTb512Wp6ijesscEhqDtp8eXYdzqnQt3l751jJu2sMRk0XuLg0Sx9dWJ8m4hTGC9p5Ac
 Gm2ZVUaMzELO9M8GaSs8g3pGjalt/4ugrRlJARoKQbTjScQbv3iUztiM1h5d2+WW7blA
 mZj0pXRHPeZWlalUpdqRKAwkGnTJsiwECA+l+TErkgQMC8xd2mC+ezv3fJ+JQKT95b8L
 GjzA==
X-Gm-Message-State: AOAM532fD8+1B+SO4ZrWangX8Eyo/eoxw8d0owEO38maAZPmOZyiKPZm
 HCJrll3eObJK8almQQod6GiPRIXtElHi0NVQRko=
X-Google-Smtp-Source: ABdhPJwmOYYBmljG/9pvKuNkRRD31NW/x5SljCuZC4tQHISI6HSVbY6GTQNKmH+EHwrQPEgLMzcY7Q==
X-Received: by 2002:aa7:df17:0:b0:410:d029:ce90 with SMTP id
 c23-20020aa7df17000000b00410d029ce90mr28008126edy.50.1645565594638; 
 Tue, 22 Feb 2022 13:33:14 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id 25sm6706142ejh.5.2022.02.22.13.33.13
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:33:13 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id i19so12430637wmq.5
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:33:13 -0800 (PST)
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr4877434wmj.98.1645565592614; Tue, 22 Feb
 2022 13:33:12 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
 <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
 <c388d91c-ea00-8fa8-3fcf-4ce754edb1b4@linaro.org>
In-Reply-To: <c388d91c-ea00-8fa8-3fcf-4ce754edb1b4@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 13:32:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WJdcVEmnUvFfkJY3V2eWF2t4xkfCKNwaFHY+FwORg4VA@mail.gmail.com>
Message-ID: <CAD=FV=WJdcVEmnUvFfkJY3V2eWF2t4xkfCKNwaFHY+FwORg4VA@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/4] drm/msm/dp: Add basic PSR support
 for eDP
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 22, 2022 at 1:23 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 22/02/2022 22:25, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Feb 21, 2022 at 7:12 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >>> +static int dp_link_psr_status(struct dp_link_private *link)
> >>> +{
> >>> +       u8 status[2];
> >>> +
> >>> +       drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
> >>> +
> >>> +       if (status[0] & DP_PSR_LINK_CRC_ERROR)
> >>> +               DRM_ERROR("PSR LINK CRC ERROR\n");
> >>> +       else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
> >>> +               DRM_ERROR("PSR RFB STORAGE ERROR\n");
> >>> +       else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
> >>> +               DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
> >>> +       else if (status[1] & DP_PSR_CAPS_CHANGE)
> >>> +               DRM_INFO("PSR Capability Change\n");
> >>
> >> DRM_DEBUG_DP
> >
> > Not sure I'll have time to go back and review the series, but one
> > thing that caught my eye as this flashed through my inbox is that I
> > think all of these "shouting" are deprecated. It's even officially
> > documented now as of commit d2f0a8afc1be ("UPSTREAM: drm/print: Add
> > deprecation notes to DRM_...() functions").
>
> Agreed. But not the DRM_INFO too.

You're saying that DRM_INFO _isn't_ deprecated? I was pretty sure that
it was, too. If not, can you please submit a patch to `drm_print.h`
clarifying since my patch (which folks Acked) marked it as deprecated:

+/* NOTE: this is deprecated in favor of pr_info(). */
 #define DRM_INFO(fmt, ...)                                             \
        _DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)

My understanding (also in the description of my patch) was that
DRM_INFO() by itself didn't add much so we should just use the
standard pr_info(). If pr_info() wasn't to your liking then it was
better to do drm_info(drmdev, ...) or drm_info(NULL, ...);

-Doug

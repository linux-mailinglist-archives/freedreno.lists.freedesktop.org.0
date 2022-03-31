Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147394ED0E9
	for <lists+freedreno@lfdr.de>; Thu, 31 Mar 2022 02:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1867310E0CF;
	Thu, 31 Mar 2022 00:33:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87910E0CF
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 00:33:56 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u26so26330771eda.12
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYujwTSODoLsl28pxL/Kco6cVNKp164PEtJvRGhch7g=;
 b=LIfdAANbRqTkPOnpxYpODahOeq58jhaQDCbRX0ewZFvKdXZeAW4AkHth/rY399jQeA
 s29OfqcQ4X/oZAuMTJw1TZ+twD9KjvNly58+Betnq8PEp5NRg2YclK4NhtOUXif3D+OG
 B9DpasiswvJSuUWGNYlmZLBqNlkOp2jMpijmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYujwTSODoLsl28pxL/Kco6cVNKp164PEtJvRGhch7g=;
 b=AY7fGmgSdOlZSazu2HozdpZ1oS2o/nvxS2rukAJWU4kJiLik+KPZhdYBfj0r84WDCv
 jJ7anizTBLEbHIvEzf3pDshSXtP7uldOHyDxxiL4Fa7oCcIxwm6ug7gW4g1zxSml4dAV
 6UIkFEP1gp+4ghAU0CzpekPMajTE3N2BkNIRFPntxf8sw+oOiaDug4PrjEp5pJ+SYtf/
 Y9q+zw05NHEJ+cfoMi6CGNR1sRpGQdBktD6Ydwv+CrFv5R1n+Ej9Ki80YjJZK+AQ6TKW
 TKS3RLmyi2X0aNMbLwY9jcBTvVrLPqNuN0A8p5kAl0Hn8R9U1W+lKPBUbtKPn4gFU810
 Vs3A==
X-Gm-Message-State: AOAM530DZSEa03aaIXt8FV7Ti6EzdfDs2jOhm2PYZ9jJ0Ree6WlBj2cD
 +TGp8xoAyeUPxR1bdRgbl0ZQAWCopXVcBEgX
X-Google-Smtp-Source: ABdhPJxUhU1VDPEv/SMrtaWb73jdjdS1SU36husCLpAiB6NuIHbyw/uA5pMMX82EGN7V2lIE6EFdYQ==
X-Received: by 2002:aa7:da81:0:b0:419:11e8:1039 with SMTP id
 q1-20020aa7da81000000b0041911e81039mr14024887eds.285.1648686835015; 
 Wed, 30 Mar 2022 17:33:55 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 g23-20020a17090670d700b006ccfd4163f7sm8459901ejk.206.2022.03.30.17.33.52
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 17:33:53 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so837862wms.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 17:33:52 -0700 (PDT)
X-Received: by 2002:a05:600c:19ca:b0:38c:b84f:421a with SMTP id
 u10-20020a05600c19ca00b0038cb84f421amr2260341wmq.118.1648686832035; Wed, 30
 Mar 2022 17:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <daec6ea4-abb1-05e6-ad49-b0a418a1f43e@linaro.org>
In-Reply-To: <daec6ea4-abb1-05e6-ad49-b0a418a1f43e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Mar 2022 17:33:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTYQXngXmA_civiCMDctZr6tJNjNXynQuCwxvgiJijLg@mail.gmail.com>
Message-ID: <CAD=FV=UTYQXngXmA_civiCMDctZr6tJNjNXynQuCwxvgiJijLg@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 1/8] drm/msm/dp: Add eDP support via
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 4:19 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +             bridge->ops =
> > +                     DRM_BRIDGE_OP_DETECT |
> > +                     DRM_BRIDGE_OP_HPD |
> > +                     DRM_BRIDGE_OP_MODES;
>
> I think OP_MODES should be used for eDP, shouldn't it?

No. It's confusing, but basically to get the power sequencing correct
we end up driving the EDID read from the panel driver in the eDP case.

-Doug

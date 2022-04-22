Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0F50B9AB
	for <lists+freedreno@lfdr.de>; Fri, 22 Apr 2022 16:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF83610EB58;
	Fri, 22 Apr 2022 14:10:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1143F10EB58
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 14:10:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y20so16637377eju.7
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+w/lFm+gTC9eW9lBYMMnUgARDTN948ashX6/88jSSk=;
 b=ghMiyWVM5DKXsssoViKphQIWceZP/fjd3ty8ZXt7WVjJwP3cN3O9IT7qFAE/Jj/Qdw
 cR9jYLzNJMz5r3gE7L5BLvMguTvA0g7jVmzMc9rN0pTwKYDEQo4/M8O2xgTv2G8CrHaT
 U2LEsQ4bPR/y/gfgsnT9qyWh/kRicE14xKEec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+w/lFm+gTC9eW9lBYMMnUgARDTN948ashX6/88jSSk=;
 b=0+X9gt7Cfyc9qt12czY8q/tki2b9Gu7IvbC/ljJgCB7Tsx4t4XuYlJ+wpNcvrsSw7u
 9LvsFhtuMPfw3QyDZd9R3kdBcKPjzhnU3AYOsLVzqUz+FjQuA60OnSQNIc7mQDFbIK5A
 RFQy5/RC4Rju/474Zor5mQn4BL1AR8Sy0uuDCz2qCkOajFOPa/7Q1BjHCNPqBeDCqqvk
 lW20de1Nd8GeGuaxlaHdWxasqa1czX2+GNFwGn9tGG+h+otS2GWM4iWT+5u1fdRqeNdJ
 d02QL0XuQeEZlEbshzBdCQeFDx8QzSFj7hBHm50eB33aCle33VTY/7fdzDS0P4FAFuTj
 LBVA==
X-Gm-Message-State: AOAM5303pVBaEGRBYh9EPsP8cTWBMxIFEwQGmd1LfHVbXrSFkPgHnNRa
 znZn6RIx0rShAPgAFIdnpRNIMeMgtht+SwWTJQ0=
X-Google-Smtp-Source: ABdhPJyzi9obL2WIvcCdiSCOBZIGOfvASCKhyre+COhhdXB49ZlU5yeedAZRfCD0v6OhvAcizP00vw==
X-Received: by 2002:a17:907:968d:b0:6f0:d083:fd57 with SMTP id
 hd13-20020a170907968d00b006f0d083fd57mr3807638ejc.186.1650636641356; 
 Fri, 22 Apr 2022 07:10:41 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 u10-20020a170906b10a00b006e1004406easm803746ejy.93.2022.04.22.07.10.40
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:10:41 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so8046762wmb.4
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 07:10:40 -0700 (PDT)
X-Received: by 2002:a05:600c:502b:b0:38f:f7c6:3609 with SMTP id
 n43-20020a05600c502b00b0038ff7c63609mr4367415wmr.15.1650636228521; Fri, 22
 Apr 2022 07:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 07:03:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhznD3Nuiku9mS5YKFVX0GB8qxQZe8m8AgGCQz=a2chQ@mail.gmail.com>
Message-ID: <CAD=FV=XhznD3Nuiku9mS5YKFVX0GB8qxQZe8m8AgGCQz=a2chQ@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and
 REPLUG interrupts for eDP
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
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 22, 2022 at 2:11 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp enables the eDP panel power during probe, get_modes
> and pre-enable. The eDP connect and disconnect interrupts for the eDP/DP
> controller are directly dependent on panel power. As eDP display can be
> assumed as always connected, the controller driver can skip the eDP
> connect and disconnect interrupts. Any disruption in the link status
> will be indicated via the IRQ_HPD interrupts.
>
> So, the eDP controller driver can just enable the IRQ_HPD and replug
> interrupts. The DP controller driver still needs to enable all the
> interrupts.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> Changes in v9:
>   - add comment explaining the interrupt status register
>
> Changes in v8:
>   - add comment explaining the interrupt status return
>
> Changes in v7:
>   - reordered the patch in the series
>   - modified the return statement for isr
>   - connector check modified to just check for eDP
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 16 ++++++++++------
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
>  2 files changed, 31 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

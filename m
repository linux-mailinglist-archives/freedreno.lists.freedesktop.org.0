Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403DB4C01FC
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 20:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C772510E39C;
	Tue, 22 Feb 2022 19:25:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C144810E339
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 19:25:53 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a23so45837117eju.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 11:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxPYkxQ6mY3MfEsJx+8iE64/URTY/HAr2HMcmjeViMQ=;
 b=V83V6RXAXvourhNVZvf2jgxzgWgbvwcqNI4r4pat82eR93ldTr1f7UnyLwwf2qycr7
 a0xsJu4B7LJ0a8fb9YtI8NKspnKLSg3ZkC5edbZCl0z9GiEPzizCh1VTsL6b55uhFAT8
 5XLvUxqQKyaIUvk9UTZ0CbvKc9mBw+5pp329s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxPYkxQ6mY3MfEsJx+8iE64/URTY/HAr2HMcmjeViMQ=;
 b=Z4s3iAcivnzxkDPUcIogcODLxzigo17j5mohUz4YF6kw3svx1BjCNzfA2RAvPBmYmg
 TL2iBVRJu5QyaqJ3USJNDVpL7zaGT6l06mB7Hn86fFEVZXZ6UphJ+KGfELgQnTcLt8DY
 4/Ii/bhnx/X7SCPVbMG0HYjKm8Dxwaf6UtPRsDioH1Vhfe99+pr0CJwz+QpdSepUVjsg
 YCtnFJBjj7BGondjJ1e9OGzumT2GH/d/pq29gWvfZGtKTPktlVbIuWMa1voG2JA4A2kz
 WA8vtqqz83rNOJlr4qCdWwY8BlnZqgvfQinQaoBImHhDOvSQ9dY2riaR0yLRJX+2NAoM
 9YXQ==
X-Gm-Message-State: AOAM531LC42Ke78vd0Ks4tgxX34WfC8/ThA85I639dfc/1mMaRu9XRHS
 WRjXu5PXBLe+ryYOfRlMWZGaiHn0fi/mUR1p
X-Google-Smtp-Source: ABdhPJxSMxKS7FcnJgSeVkz4CZ8sG2Pyd/0kWV7uqDv8OeOxIjTbMyeIJ8y0uQyfuCmtPvsZnQu5gg==
X-Received: by 2002:a17:906:3708:b0:6cf:bb34:9d2e with SMTP id
 d8-20020a170906370800b006cfbb349d2emr20042306ejc.665.1645557952134; 
 Tue, 22 Feb 2022 11:25:52 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id gb37sm1012484ejc.223.2022.02.22.11.25.51
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:25:51 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id x15so972344wrg.8
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 11:25:51 -0800 (PST)
X-Received: by 2002:adf:e4c2:0:b0:1e3:3e5d:bd65 with SMTP id
 v2-20020adfe4c2000000b001e33e5dbd65mr21065461wrm.422.1645557950867; Tue, 22
 Feb 2022 11:25:50 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
In-Reply-To: <CAA8EJppRUZ5OHSMS1NdFXDDvRXJFNsdoJDWgU7ZPUoAW9OD+eQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 11:25:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
Message-ID: <CAD=FV=W2wi47egKmWDS+BZGSy85K+A8jX0gvi6CYhmFgoBBRmw@mail.gmail.com>
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

On Mon, Feb 21, 2022 at 7:12 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > +static int dp_link_psr_status(struct dp_link_private *link)
> > +{
> > +       u8 status[2];
> > +
> > +       drm_dp_dpcd_read(link->aux, DP_PSR_ERROR_STATUS, status, 2);
> > +
> > +       if (status[0] & DP_PSR_LINK_CRC_ERROR)
> > +               DRM_ERROR("PSR LINK CRC ERROR\n");
> > +       else if (status[0] & DP_PSR_RFB_STORAGE_ERROR)
> > +               DRM_ERROR("PSR RFB STORAGE ERROR\n");
> > +       else if (status[0] & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
> > +               DRM_ERROR("PSR VSC SDP UNCORRECTABLE ERROR\n");
> > +       else if (status[1] & DP_PSR_CAPS_CHANGE)
> > +               DRM_INFO("PSR Capability Change\n");
>
> DRM_DEBUG_DP

Not sure I'll have time to go back and review the series, but one
thing that caught my eye as this flashed through my inbox is that I
think all of these "shouting" are deprecated. It's even officially
documented now as of commit d2f0a8afc1be ("UPSTREAM: drm/print: Add
deprecation notes to DRM_...() functions").

-Doug

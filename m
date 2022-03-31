Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29A44EE4C1
	for <lists+freedreno@lfdr.de>; Fri,  1 Apr 2022 01:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6810E18F;
	Thu, 31 Mar 2022 23:28:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C14810E18F
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 23:28:44 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c62so1041788edf.5
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7juVurgjLt3GvUzI9U9c+xp5sahJ/Uk+aOlgugxy0EM=;
 b=RtJix/BsoQj0ELH2OMFl7dwsORWQLL0UBqSXWJr5KoYLICZZbVFRb/zdCkHwWWysN5
 3b5vtLz0FaF+JGho0PKGYaYoz18U0Fy53xtgtIwoMITco5McP4KTTF/FQkbhfbr91SR4
 pxJraAJYBLjynqhNcmQ0n9QTPBRiLktURUGCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7juVurgjLt3GvUzI9U9c+xp5sahJ/Uk+aOlgugxy0EM=;
 b=8E1w9omvQHUlHq920Zdr8X7UTJP7rdjizyFWYrNRbBc55Peq2qRP17dlW126WzFryC
 tI72Wndv7HEy68J6kWxLf8qGhp+/bvM9aL6NG2u3pcKHg7xwbz+MvFd/5kf/XtzHD05x
 noTYSUhEc83CZEkOBOIrQZtuu/qegdlFkqaBz0Mqr2C0cGPl98AzgD6H3pojJpMDQgL+
 uKoRZssuHmRSAL36e8JT8fNeChYNxzhnDt1lD1GdVdjCtuFi2HcEHFl2HeHqGzIUFmjL
 de1+0t8VNxVWfVaKFjOYZpIu5jvsxMoyLY9hlW/IlBqyxVfrDyF2KKdQaaNnrFuPnNDw
 n+VA==
X-Gm-Message-State: AOAM530WMdnoro5YaDQMRBoC1iL4zCT5bXSS9J4U5K5SjIDdP0k47VPM
 E8gbH3e1l8/vS1ED0TnOwwdbPciwH9n/FrpH4Hc=
X-Google-Smtp-Source: ABdhPJzu35v9SAaYLZfxYAXWbzyXLismbpyH5p2cp4xaK7A8tkGX8fIzGkwecKxZa2FEILgbCDL4Ag==
X-Received: by 2002:a50:954b:0:b0:41a:c9cb:8778 with SMTP id
 v11-20020a50954b000000b0041ac9cb8778mr18600779eda.165.1648769322442; 
 Thu, 31 Mar 2022 16:28:42 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 v20-20020a056402349400b00419651e513asm382999edc.45.2022.03.31.16.28.42
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:28:42 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id pv16so2537917ejb.0
 for <freedreno@lists.freedesktop.org>; Thu, 31 Mar 2022 16:28:42 -0700 (PDT)
X-Received: by 2002:adf:e7cd:0:b0:204:ba2:b106 with SMTP id
 e13-20020adfe7cd000000b002040ba2b106mr5551021wrn.679.1648768998053; Thu, 31
 Mar 2022 16:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-6-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-6-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:23:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wn-XypjRcw-D0VtBHZbuTz=RHiMq6RCHCa=CWmZM42nQ@mail.gmail.com>
Message-ID: <CAD=FV=Wn-XypjRcw-D0VtBHZbuTz=RHiMq6RCHCa=CWmZM42nQ@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 5/8] drm/msm/dp: prevent multiple votes
 for dp resources
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
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The aux_bus support with the dp_display driver will enable the dp
> resources during msm_dp_modeset_init. The host_init has to return early
> if the core is already initialized to prevent putting an additional vote
> for the dp controller resources.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

I'm not a huge fan of this but I'll leave it up to Dmitry. In general
it feels like there should be _a_ place that enables these resources.
Checks like this make it feel like we just scattershot enabling
resources in a bunch of random places instead of coming up with the
design for enabling them in the right place.

In any case, if we do end up landing this patch, it sure feels like it
needs to move earlier in the patch series, right? This patch shouldn't
hurt even without the other patches in the series but if you apply the
earlier patches in the series without this one then you'll have a bug,
right? That means this needs to come earlier.

-Doug

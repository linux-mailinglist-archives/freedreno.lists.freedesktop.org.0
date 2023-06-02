Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30C720ACE
	for <lists+freedreno@lfdr.de>; Fri,  2 Jun 2023 23:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810310E64A;
	Fri,  2 Jun 2023 21:05:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDE710E646
 for <freedreno@lists.freedesktop.org>; Fri,  2 Jun 2023 21:05:41 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-bad97da58adso2730085276.1
 for <freedreno@lists.freedesktop.org>; Fri, 02 Jun 2023 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685739939; x=1688331939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bGtOFR2mphGb3w/SKqqatTcmK2Pjhu9d+mT6IMF2bsA=;
 b=O8cWtf9dK3IVBtCzRm56Bvob5Vhhmtc5jm/bwtrzzNg5NFGeACg0/roonLuhnaKj9w
 l9zK+/K1wWpvLNvKbUMpYKoE5GSPi2MzMfZLq2V8rYqnQdDI79ckTFzhENhOotuajVBx
 rZLnuOHFhJdTfuviF+xyrGeIZowEG6c591jS++W2CWKFRNVKmG8W4l6ucVyIz0hqICLn
 1SJduWUuUDVhlUWYgc8KpFRBJyi/pdoJtLxorMHFCbmjaHgvsxBC8jZMAsTfAOIcK9Ta
 rxXWbKQojO6qVCNjmvwICCaFkBklLVyIxuyXU1of/N+71b5mF2YPzLb5Uln13dIpUknZ
 feUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685739939; x=1688331939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bGtOFR2mphGb3w/SKqqatTcmK2Pjhu9d+mT6IMF2bsA=;
 b=fTN41gc2B5UQOUiF2Ki2O7dwD+6j5iUyNVunhi0NZdJ7T7nanA4I5QcOX1XLBZP/xz
 Llag6BH5CjkkDlPIfDXLmZFn45zxYQTnAAty53F94dLMu0mwq+9U+TaK5XVMJZyf5s6P
 oy1eh47BZkCmUEJMUuUG2A8yq5CslIFexG9UZRo40OszvjybU7ZDETlPll/8pCcO2+Za
 IV7hcsnkedOsHwvh04zXCzvSkK7Htgp3J/W0rX/n7nC/I7OIB8cFGTzcr7QuLER22lxi
 jrFYcNiWBFRTYf+evnMatdg8irWAU3nv7OhsaJ1ecYulHQoIvYNW3a03vKs7JWtvWr+X
 u8Qw==
X-Gm-Message-State: AC+VfDwC9gCM/fDlu/PX6BOvZKN/Mj6qo47ZkdsLEAapcNeOO8z+4/jm
 fcv8KEJsj5wp/3E5xWC5u/7Xf6vpQwI0hZgizADj3g==
X-Google-Smtp-Source: ACHHUZ7Gn7c4DGB7V9sdrivTf8wBNtf7tCUcHwzPgc4kwSOC01IapgteGYaVZI1W8k3JxzfxAXKuXpFOGHc0YMbxFh8=
X-Received: by 2002:a25:768a:0:b0:ba9:6b90:e551 with SMTP id
 r132-20020a25768a000000b00ba96b90e551mr4566101ybc.50.1685739938909; Fri, 02
 Jun 2023 14:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
 <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
 <e69f02b7-eba9-5f33-5ca1-eb0638928414@quicinc.com>
 <CAA8EJpr9dfrrEsFf8heOvG3BWRTVCY-q1QYNH_3OBeMAWEwotA@mail.gmail.com>
 <d1a320c4-d851-ba75-ef7b-80dc369d1cfd@quicinc.com>
 <CAA8EJpqzyYQAg+VXLzttan7zGWv4w+k6kgS2SbRo26hFZ_9Efg@mail.gmail.com>
 <32aa41ee-4ab0-0915-a77f-5b0d6874b3e1@quicinc.com>
In-Reply-To: <32aa41ee-4ab0-0915-a77f-5b0d6874b3e1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 3 Jun 2023 00:05:27 +0300
Message-ID: <CAA8EJpp0aWd2i4vkbURgDx+s99KNZYeEkd9RK0+fP+QfzDgZKg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct
 at atomic_check()
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
Cc: Vinod Koul <vkoul@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Dave Airlie <airlied@gmail.com>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Generic note: please use reply-to-all instead of any other options to
answer the email. You have dropped all recipients (except the
freedreno@) in the message
<d1a320c4-d851-ba75-ef7b-80dc369d1cfd@quicinc.com> (and it was left
unnoticed).


On Fri, 2 Jun 2023 at 20:00, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> There is one option which is keep current
> >>
> >> 1) keep struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi
> >> *msm_dsi) at dsi.c
> >>
> >> 2) use  struct msm_display_info *disp_info saved at dpu_enc to locate
> >> struct msm_dsi from priv->dsi[] list (see item #3)
> >>
> >> 3)  info.dsc = msm_dsi_get_dsc_config(priv->dsi[info.h_tile_instance[0]]);
> >>
> >> 4) ballistically, keep original code but move  info.dsc =
> >> msm_dsi_get_dsc_config(priv->dsi[i]); to other place sush as
> >> atomic_check() and atomic_enable().
> >>
> > 5) leave drm_dsc_config handling as is, update the dsc config from the
> > DP driver as suitable. If DSC is not supported, set
> > dsc->dsc_version_major = 0 and dsc->dsc_version_minor = 0 on the DP
> > side. In DPU driver verify that dsc->dsc_version_major/_minor != 0.
>
> I am confusing with item 5)
>
> Currently, msm_dsi_get_dsc_config() of dsi side return dsc pointer if
> dsc enabled and NULL if dsc not enabled.
>
> Should checking dsc == NULL is good enough to differentiate between dsc
> is supported and not supported?

This is called a "shared memory area". Instead of either providing a
dynamic data pointer, one can provide a pointer to the static area
which is filled by DP or DSI. If there is no DSC available, one flags
'data not valid' by setting major,minor to 0.

>
> Why need to set both dsc->dsc_version_major = 0 and
> dsc->dsc_version_minor = 0 for dsc is not supported?

6) Another option (which is more in style of what is done in the
vendor kernel, if I'm not mistaken):

Enhance struct drm_display_mode to contain a pointer to the DSC
config. Use this pointer to check whether DSC should be enabled for
the particular mode or not. The panels with the static DSC
configuration can use a static data pointer.


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AFB36FFDA
	for <lists+freedreno@lfdr.de>; Fri, 30 Apr 2021 19:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E406F58C;
	Fri, 30 Apr 2021 17:44:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B2D6F584
 for <freedreno@lists.freedesktop.org>; Fri, 30 Apr 2021 17:44:55 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 k26-20020a4adfba0000b02901f992c7ec7bso2230797ook.13
 for <freedreno@lists.freedesktop.org>; Fri, 30 Apr 2021 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6g0Wub32949zlUmpDO6orwMigbfoDepmWih+zxo6Gik=;
 b=Hwdg91N23Pzm+MhntYiriTtK3LzxwTdtud93fhi+6PsD2MGghl+QzB5fD/KE4E/UOH
 rA+vVIVjaVzTOFbRvMMXkHYiDCWmryuId1VhGqaeOkuCUsxD1zdaAp83XrllM50f554B
 YII/rfNuz5fJX4CecLZUPgYKNcAoSrTUw9Yg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6g0Wub32949zlUmpDO6orwMigbfoDepmWih+zxo6Gik=;
 b=JtbTmUg35N2SXm46c4OcGRT3apDFtiE5eXvtZQADDBo5qwdbCCTlDHGfk/3QkorLkG
 Gjg/qaJ1Nf+jXVcNNYB8/xUFMMbepQzLbSQXH6Z4eh5ENanBaetkI4+ChmS1pN59jkkb
 N7oI5QsPpmF4OmnVWbZV3E2NW5e6ChSijAz/0V5+fdyNuYotusFEqrK6sIs2Jh3gU/5E
 ZCByyzs5e+xFHv2QrOHwz22ZyLvsf6VpBTE3DMqiS5xkLofCheaAmz2Fy9U/UUHo5g73
 ciefU/gJ1XKnWh5p4nYkTDzhUjFi/oCbIncwg4TIk4EQn+/+CMJi8Aoa4Ih1WzqqCy4l
 0Hmg==
X-Gm-Message-State: AOAM533Spx+WEYMnUPReTe3EdnnSTDKnD/uZhERwproExL9dsO+YrNAO
 ltpcf9dVVVXcAhN6Hx8sdRMBlgOsSANYP50CdatTKQ==
X-Google-Smtp-Source: ABdhPJyPyi4DIgMeRBNFsN/86pplbHjCV4+mrcMiD+kOFc0aF1HRvCFr6LF5hBxDNhe7lCnbhKeHNkeCcL52ICW+GsQ=
X-Received: by 2002:a05:6820:381:: with SMTP id
 r1mr5451224ooj.79.1619804694545; 
 Fri, 30 Apr 2021 10:44:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Apr 2021 10:44:54 -0700
MIME-Version: 1.0
In-Reply-To: <20210430171744.1721408-1-robdclark@gmail.com>
References: <20210430171744.1721408-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 30 Apr 2021 10:44:53 -0700
Message-ID: <CAE-0n513cwqs1c89PZpn0ojuDQ44nwxbRfaYssKHcGwKxK8JdA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Delete bonkers code
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org,
 Hongbo Yao <yaohongbo@huawei.com>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, John Stultz <john.stultz@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rob Clark (2021-04-30 10:17:39)
> From: Rob Clark <robdclark@chromium.org>
>
> dpu_crtc_atomic_flush() was directly poking it's attached planes in a
> code path that ended up in dpu_plane_atomic_update(), even if the plane
> was not involved in the current atomic update.  While a bit dubious,
> this worked before because plane->state would always point to something
> valid.  But now using drm_atomic_get_new_plane_state() we could get a
> NULL state pointer instead, leading to:
>
>    [   20.873273] Call trace:
>    [   20.875740]  dpu_plane_atomic_update+0x5c/0xed0
>    [   20.880311]  dpu_plane_restore+0x40/0x88
>    [   20.884266]  dpu_crtc_atomic_flush+0xf4/0x208
>    [   20.888660]  drm_atomic_helper_commit_planes+0x150/0x238
>    [   20.894014]  msm_atomic_commit_tail+0x1d4/0x7a0
>    [   20.898579]  commit_tail+0xa4/0x168
>    [   20.902102]  drm_atomic_helper_commit+0x164/0x178
>    [   20.906841]  drm_atomic_commit+0x54/0x60
>    [   20.910798]  drm_atomic_connector_commit_dpms+0x10c/0x118
>    [   20.916236]  drm_mode_obj_set_property_ioctl+0x1e4/0x440
>    [   20.921588]  drm_connector_property_set_ioctl+0x60/0x88
>    [   20.926852]  drm_ioctl_kernel+0xd0/0x120
>    [   20.930807]  drm_ioctl+0x21c/0x478
>    [   20.934235]  __arm64_sys_ioctl+0xa8/0xe0
>    [   20.938193]  invoke_syscall+0x64/0x130
>    [   20.941977]  el0_svc_common.constprop.3+0x5c/0xe0
>    [   20.946716]  do_el0_svc+0x80/0xa0
>    [   20.950058]  el0_svc+0x20/0x30
>    [   20.953145]  el0_sync_handler+0x88/0xb0
>    [   20.957014]  el0_sync+0x13c/0x140
>
> The reason for the codepath seems dubious, the atomic suspend/resume
> heplers should handle the power-collapse case.  If not, the CRTC's
> atomic_check() should be adding the planes to the atomic update.
>
> Reported-by: Stephen Boyd <sboyd@kernel.org>

Maybe better to use swboyd@chromium.org for this one.

> Reported-by: John Stultz <john.stultz@linaro.org>
> Fixes: 37418bf14c13 drm: Use state helper instead of the plane state pointer

Should be

Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")

to match the preferred format.

> Signed-off-by: Rob Clark <robdclark@chromium.org>

Otherwise looks good, thanks.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

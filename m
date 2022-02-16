Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B594B7C9D
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 02:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D22510E5E8;
	Wed, 16 Feb 2022 01:55:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DAF10E5E9
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 01:55:58 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so826764ooq.10
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 17:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=CJhjoTRvxQH3Sl2Ij3V6tCniMMQykN5CyDZxRb/sirI=;
 b=fdq+cchaNAWoAoifG+2eAVbbV+7J+Hi41i2WNBc1VFeC58pjfsH5M1gUHvEDo5Y360
 yXAO3GT0lQDVwTVJW4z1oZzQTVdlBLjnhWSmW32+Euizxmo4/f1RzuZbMnBJslRmZeWB
 L+7DjOS9YTcC5ZuLnFUKxTR/DHGZa98dJXoEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=CJhjoTRvxQH3Sl2Ij3V6tCniMMQykN5CyDZxRb/sirI=;
 b=TnZuJudnOyZNXTnGQWWhKdahWGcjsXVRWbhfdUKu5OJxE+oTZvD8AWVN8z6l0zdQCZ
 Z502Mf/WTOLpv8rcinp+enxDgMxM0phgByW+CwS19JmcjUYk0l6ULUWIFgpXTeGAevAY
 JnBKqx6m/Oc7T4TeMxIVsrLTJl4PZPprQHnCkJrWIIYm7YGO3FxLfeI7c9bHOtJMHbnM
 2/Pv6qL6SkjSUF/seoqo2XdxEo4SHsDcwJzaV3lRj9ax3rzfxjJ3KUXGtc+G7GlHnskc
 iavtjMZ7TULHXopuwLp938rMlLxm3GddOSOj4U0vBi2fyx+P8JBIORmzgn8N54BPYE4G
 l4KA==
X-Gm-Message-State: AOAM533OLAlSOaRx1fcJzdlKvQBbY2+3WrXi28ZJx5u1G0N4r1ydtzso
 MPH1ed4aCSrUSONREX5jFF7jB7qxdJPEjq56/rTjow==
X-Google-Smtp-Source: ABdhPJyF5QYowjU/VMhTob8LvbXIC/88vksqTiwGpPS2fwzuECy1aS/luIlww3Ts6x7SDjX/hk5y30nQU7ratUWjRBk=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr276529oap.54.1644976557620; Tue, 15 Feb
 2022 17:55:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:55:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:55:56 -0800
Message-ID: <CAE-0n51AZ4Phzkw_rmbxApSGZRUFyp8wuy7=EgMiM_eFkjeJRA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/8] drm/msm/dpu: fix dp audio condition
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:36)
> DP audio enablement code which is comparing intf_type,
> DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
> Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.
>
> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0280F7B0DE4
	for <lists+freedreno@lfdr.de>; Wed, 27 Sep 2023 23:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36CE10E5B2;
	Wed, 27 Sep 2023 21:11:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E7810E5BA
 for <freedreno@lists.freedesktop.org>; Wed, 27 Sep 2023 21:11:26 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-59f6441215dso106509727b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Sep 2023 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695849085; x=1696453885; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a74pdDrZrdwlkEh28Y630eaCwo/I4QCGA/VwQZGH4Q8=;
 b=lMcxi5f8nJvN+lG1t2TwDpNp6P/3lSUPzRYCNC7mJuWksMN5S+anGWWJdDInQh6RdV
 ie6ic62Vr6mAD3n61P1MySWRDE/LaKzBQEM1PgzQ6FmREDoBrzmXaw0XchKnrCTmLFbg
 Y8iE9tlpXVlMkuxRk2QfCtPAt0GpGro4gxon2A+kx8f+D0FgBIVnxfu1tZOwrJx+xuve
 pz28rXnR6vqvyG17H7+SVsJXHIEWWibnQYpgHdHnzRa/peeqxQO2QGd3cDpmdlR41Q8r
 il9Ejv/4kF4JgmccmpXMUc6txB5lYYjSCWsG43psz/MSqBS/Hmm+zy+HNKSUT02oPJWB
 wTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695849085; x=1696453885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a74pdDrZrdwlkEh28Y630eaCwo/I4QCGA/VwQZGH4Q8=;
 b=A/2H0dfseJt/6ETvLtxPAGfQgQ4PUobugxO4Oeo8WklWAxjnhwFrPvDLhW5EaLgkPa
 RMHJunADv6Awhyu3kFDbZmEa5r7N1n1hV0olsiKYYs8MdfBS34H0neTOVr/rS7dhFywC
 RJFt2a9rKjor6cglGnJe0TrhiQ0yHvDdDigLOWljDHUJt2e5g7Rr+tNJbZnFotq0N5DX
 gS0q1uu/c/D1sCVkftG1eqX4b3zrmACzGfWJyd/+7HTniObtgaAjd6NVHi8vWs6ZdRh2
 LUeaYVGnvvTG2XaMwNx3FuaqyuXdWJNXNUlW73GqrJACjKNPoHjIfWLFPvTAuXXsLv93
 BIGA==
X-Gm-Message-State: AOJu0Yx+RWNhMwEhi4fEVUhQFTtlXhfx/E1G/RIQIhMlEa8XkJrsuyL6
 hlKEFJyolZN7F3ZiLdLtXfm54Ouuj17UFPLUnekJ8g==
X-Google-Smtp-Source: AGHT+IH67numDaxZxD54zJxyc373zfgNCr6bHhLpTmrffYZJw6Y61+w8l7XIlNFAtKDeQo92EdTus8ziHzjBuyteBp8=
X-Received: by 2002:a0d:dcc1:0:b0:59e:9fbc:a16c with SMTP id
 f184-20020a0ddcc1000000b0059e9fbca16cmr3335409ywe.35.1695849085295; Wed, 27
 Sep 2023 14:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Sep 2023 00:10:18 +0300
Message-ID: <CAA8EJpodnwS7nLupewLJfmGw6HhVSpFj=EGxSp4gKXDwtLw2QA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 0/8] incorporate pm runtime framework and
 eDP clean up
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Incorporate pm runtime framework into DP driver and clean up eDP
> by moving of_dp_aux_populate_bus() to probe().

Dear Kuogee. Let me quote my response to v1 of your series:

Please use sensible prefix for cover letters too. It helps people
understand, which driver/area is touched by the patchset.

This is v4 already and the cover letter still has the same subject line.
If you are ignoring the review comments, should I start ignoring your patches?

>
> Kuogee Hsieh (8):
>   drm/msm/dp: tie dp_display_irq_handler() with dp driver
>   drm/msm/dp: rename is_connected with link_ready
>   drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
>   drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
>   drm/msm/dp: incorporate pm_runtime framework into DP driver
>   drm/msm/dp: delete EV_HPD_INIT_SETUP
>   drm/msm/dp: add pm_runtime_force_suspend()/resume()
>   drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   4 -
>  drivers/gpu/drm/msm/dp/dp_aux.c         |  40 +++-
>  drivers/gpu/drm/msm/dp/dp_display.c     | 341 +++++++++++---------------------
>  drivers/gpu/drm/msm/dp/dp_display.h     |   3 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c         |  14 +-
>  drivers/gpu/drm/msm/dp/dp_power.c       |  16 --
>  drivers/gpu/drm/msm/dp/dp_power.h       |  11 --
>  drivers/gpu/drm/msm/msm_drv.h           |   5 -
>  8 files changed, 161 insertions(+), 273 deletions(-)
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

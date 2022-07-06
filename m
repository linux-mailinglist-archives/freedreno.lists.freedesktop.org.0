Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A75695BF
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 01:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637DB10EAA7;
	Wed,  6 Jul 2022 23:19:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DB110EAA7
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 23:19:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id n4so10286423ejz.10
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 16:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q/Ysdr5RliGVgXwVXSg+b/L5hF2oyr6zGQqCB2KMY/0=;
 b=gUDNXgh8oYKcJZw0fUdo4BytcCdgQxI55O9Z8eNCVrgBjjaoaN+pidJLGzKrW3fAqI
 hsvgccN+NLv3W4Qd5dsHD4E/vPub65TAG6ylvI/+TfIpXY4YS8UOm1l61MtOvueWxmzh
 TU02Ugf9JLdShW2ETtxvEPvMRHEZhot0uKREE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q/Ysdr5RliGVgXwVXSg+b/L5hF2oyr6zGQqCB2KMY/0=;
 b=urjckI7tZnAm8oJ435XJy+XasRatJsz2vGbYZJlIYgnF9WjsTOMNikYe3hXT/ain3d
 HiLmLzmtvEk9oVAhM1/fYIGjzps2b+CVubpOe3tc28L+cB+rXappTFgxFQjTEm11FqQQ
 lD3qIEtZrOSD7ADJblkTpU5p/EyBMoZeq9vu4v6Q8gqU4FjvLP/qlfJFaSpZeNEVgMQE
 DHGJLzferpk/SBSvhp8MYU2pLv03WFF7OWZ4nONTzbifDxR9FtYFwzMw9iaKv7PXSRjQ
 mamfdkxlVFWfvf2x4n5ic6hGIDqi8cuBTWrhkNtZyWt6gN0kjJ1gE2bqo7lWUq2OHRG4
 aqMQ==
X-Gm-Message-State: AJIora8A67mW6B2MpODIRwR7LtT0r3F94s91tDJVJemhsKvhvK6LSplT
 LozU0R93gABHOMxK2pAGrFA0ZJFnq1W1Dngh
X-Google-Smtp-Source: AGRyM1sgwsUPBkOMPwB80jSZbFlcj9NdTgLc+Sc5PmX0zIYF1hs/bfZJmNv6ge3MTRfV60C6YWBzRA==
X-Received: by 2002:a17:907:d17:b0:726:a3be:bba4 with SMTP id
 gn23-20020a1709070d1700b00726a3bebba4mr41697506ejc.584.1657149552469; 
 Wed, 06 Jul 2022 16:19:12 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 en20-20020a056402529400b0043a6a7048absm7280318edb.95.2022.07.06.16.19.11
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 16:19:11 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id bk26so8931303wrb.11
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 16:19:11 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr38633425wrr.583.1657149550898; Wed, 06
 Jul 2022 16:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Jul 2022 16:18:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vx7LAXuUZjvgZZejPh7DvBinVbjNpOddFrL1xtHJMnjw@mail.gmail.com>
Message-ID: <CAD=FV=Vx7LAXuUZjvgZZejPh7DvBinVbjNpOddFrL1xtHJMnjw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: make eDP panel as the first
 connected connector
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 6, 2022 at 12:32 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Changes in v4:
> -- move drm_helper_move_panel_connectors_to_head() to msm_drm_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

NOTE: I tested this upstream with these two trees merged together:

msm-next: 1ff1da40d6fc Merge branches 'msm-next-lumag-core'...
qcom/for-next: d014f9463260 Merge branches 'arm64-for-5.20'...

...plus a revert to make things boot again [1]. I booted this on a
sc7280-herobrine running Chrome OS. When I do this, the original
reported glitching is fixed (yay) and I think we should land it.

...but I'm not convinced that all glitching is fixed by this. In
particular I've occasionally seen an underrun at bootup (blue color)
followed by a temporary glitch. With the above plus ${SUBJECT} patch I
also reliably see a glitch on my external (DP) display every time I
plug in. I don't see either on the downstream Chrome OS kernel,
though...

[1] https://lore.kernel.org/r/20220706144706.1.I48f35820bf3670d54940110462555c2d0a6d5eb2@changeid

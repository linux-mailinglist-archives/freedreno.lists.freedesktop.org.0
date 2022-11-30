Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F79463D1BC
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 10:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1926410E43E;
	Wed, 30 Nov 2022 09:23:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673F910E43F
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 09:23:49 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id 136so1725926ybl.4
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Io0nMOCW8iv7C49ek7QosikEfryx1Mcozl2/XH3V0Ys=;
 b=khEWx9lfrWvp89T043eZD6ERveqt4wO+YC+qtJJEgowPCNksgMASbx2w5juuA1QJfW
 xzfa6R57wEYrj63BCKjGDeo78fdo4pudjo0qr3KIf+0l4jM/460zHOSPxNvBJjv+BfJJ
 KCCDtzW8YiPu/q894Brfyi4YJ39Y4UXvgCEsruXea6YhZ3DWgWl6oKzt1NAbE3REd/6m
 BKiLEFhPp8hCuAmV9c/X28X0Tn/8uJl6DcC6lqEDuxBbM0H4+cmXSmJuJ4LHQpGG4Iyb
 ighRJJyOwJcUgbeiUSMt1NAOYKlEZzvSH9G771paKQwK4iOv+NXB9JLL4qxsSBcnUVKk
 ov+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Io0nMOCW8iv7C49ek7QosikEfryx1Mcozl2/XH3V0Ys=;
 b=Dq8B2UqeIGTg2PMp25CcidRqjm1O0ihN2RtZHJvS+7EcEf0mQ/6AuAI17AuuI/02w/
 Ann6sEB7xpAj3hG08VHAQryehVrbhcS9QXQErgbetxS6pMKDBR1QHGaujCch942GYO52
 EoVbJ747DNYSJXhBpJ2azB/r4z2p9Hta5ScR5IWEEs4Q+LJx3UwAwrAqv2cq+h0qt7JV
 ITUk54w99K+Dynrx3teNRqvkGo0T9XT6CRo9/yMgMbnUXX14on8K1jWjfoXK6Vt3hrl8
 P4B8uExht/bYRLNQ9SuFrJS0XKQAekCAIL7mO8Jz5xxeXPlxckS7oYxIhy9+WjPJQybP
 V0DA==
X-Gm-Message-State: ANoB5pkO5HeWMjViTmKewY5TVW6zp6RHGeboNfoAW0p/En6ShVJsdzTo
 2LelWGlQtOzgDbtrsb29471XrE+vfTUqARiq+JKnlw==
X-Google-Smtp-Source: AA0mqf4uTlRldLTHNX9Oy3lllFzfrO81W9GITTh4EKjh0UYYdSLL/UJzmCpC2WM9mGacYzXPaMI7WE8830cjJzkNgmU=
X-Received: by 2002:a25:cf4b:0:b0:6f4:6cd2:501b with SMTP id
 f72-20020a25cf4b000000b006f46cd2501bmr21007224ybg.194.1669800228605; Wed, 30
 Nov 2022 01:23:48 -0800 (PST)
MIME-Version: 1.0
References: <1669767131-13854-1-git-send-email-quic_khsieh@quicinc.com>
 <1669767131-13854-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1669767131-13854-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Nov 2022 11:23:37 +0200
Message-ID: <CAA8EJppAPCLj0JZf7v8ThFq1C=Ngx3AdzReatRwGC-_jhrANFA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 3/3] drm/msm/dp: add support of max dp
 link rate
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> By default, HBR2 (5.4G) is the max link link be supported. This patch add
> the capability to support max link rate at HBR3 (8.1G).
>
> Changes in v2:
> -- add max link rate from dtsi
>
> Changes in v3:
> -- parser max_data_lanes and max_dp_link_rate from dp_out endpoint
>
> Changes in v4:
> -- delete unnecessary pr_err
>
> Changes in v5:
> -- split parser function into different patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 7 ++++---
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

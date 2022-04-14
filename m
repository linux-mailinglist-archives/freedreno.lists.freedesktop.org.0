Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA393501C0C
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 21:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824D610E326;
	Thu, 14 Apr 2022 19:40:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258EB10E2FE
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 19:40:31 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso4117382otj.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IZs+lSCZqoVK/AKlAjq1EPKE7N59AQDgaVEofEcz/4k=;
 b=ETgEm9IDuhcJCpRZjCKvwitdHctDrYi29lxjTbWawEHjmBCyLjRt4MYCErwWxyIiIU
 9oGWk2XpMi1dM7n5ZXoIhJ0xbZW+2UzdP/epWdGbxtw72AUKBsEqN300BmeuFGb6JktJ
 WiZk4JZpzp/44sQgTfDviIGsknHKZQ6/7y4R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IZs+lSCZqoVK/AKlAjq1EPKE7N59AQDgaVEofEcz/4k=;
 b=8RrZ8lg/lJqpwB4viYl1YwJr5TB5erZ8JVAW9zxop3FLX6bONUNrhdCzrp7uItlDws
 3SZ9y/GfYPYHdWDwRTXxznSblXSYixIAL/OuFNEakxdbvugFJxKvXzwMMkyytIMQGPTg
 duuLGO7IL+rJvwmrIc7UWPRsYjU2AImhrwYg/yQRYlOh9FTSVm8sODi3QLBtG/MZ5M0r
 ONJngpnC/+derxblr/bjIStvMAG/SrfTPn+1UvGE1dL/TpBfiXodU94mqDNxaR+GBUs2
 xlTa8LEoVqPSo5qbw3YqLw7CX1JT0LfVqSC9/w0D4FooZgLppzxJFKz+3qh4yhF1v/yR
 3/8w==
X-Gm-Message-State: AOAM533Lbwuwyed+WGebim9a3AAC2OpnyTnwSwbOw0XmP58ISipY+G56
 ty8dtlFZRdHTRbXrxLSlkJtzIwQdhe+mbtdOtKyiFA==
X-Google-Smtp-Source: ABdhPJzlgZCJ3S0otpiIbEsDjjXXeYSCOZF8aExMi2XEL/qGTFsnoTp0g7uybuwoqYnKkMyfeBWPcXWlvFAuimKyVBc=
X-Received: by 2002:a9d:20a1:0:b0:5e8:d2b6:f63f with SMTP id
 x30-20020a9d20a1000000b005e8d2b6f63fmr1455625ota.159.1649965230478; Thu, 14
 Apr 2022 12:40:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 12:40:29 -0700
MIME-Version: 1.0
In-Reply-To: <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
 <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 12:40:29 -0700
Message-ID: <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Doug Anderson <dianders@chromium.org>, 
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 1/4] drm/msm/dp: Add eDP support via
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-14 12:16:14)
>
> I think it's too verbose and a bit incorrect.
> This is a bit saner:
> /*
>   * These ops do not make sense for eDP, since they are provided
>   * by the panel-bridge corresponding to the attached eDP panel.
>   */
>
> My question was whether we really need to disable them for eDP since for
> eDP the detect and and get_modes will be overridden anyway.

And to go further, I'd expect that a bridge should expose the
functionality that it supports, regardless of what is connected down the
chain. Otherwise we won't be able to mix and match bridges because the
code is brittle, making assumptions about what is connected.

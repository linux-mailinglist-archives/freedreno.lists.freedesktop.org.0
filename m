Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F14B7D17
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4CE10E609;
	Wed, 16 Feb 2022 02:17:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44AC10E608
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:17:42 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 f11-20020a4abb0b000000b002e9abf6bcbcso958371oop.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=LaRMq8ZhRCaHC8armaDs2spovSgD/IU1miVPMO3NaCs=;
 b=ZDc5CxFeekOyijQZ4h5KQniJAMH2o9I8ZvmGzmDO2zfxpGeolNEDVpyCqlaJ6Jw/EQ
 QuU7c7QyhcC4G7d6LTLkWesxBvXqAasTUO0w3txbmOToQ1In7mmICQr/j74fGbfcbcgn
 3d1VpCLWuT6leZVSTFVtv6qbZmN8YgfHr4/jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=LaRMq8ZhRCaHC8armaDs2spovSgD/IU1miVPMO3NaCs=;
 b=mrrDBZTiiUD91kUHxnFtC37xoY8ogSiw6uZ/J4Jkvtw6FRh217/voGtJ/mrxyzCINk
 /ZSXZ7EtYWCg3MIkf0TffYS/odj12kKyB9L7kEv48SNGMmUk5gtZXGHqh/owlQKfkj5m
 CAAFM7QGLDxTyAF0ucKcag1jN14PF8AXbHthPzIoxK7oKL8RRbi4wVYtMMjGicIpx6WF
 NrS41CQTEf6QgyzHEOWpgVIBajF6R36aLCMtofUHgb5EMZixLmwyd6++ASh6fXRvooE1
 ZskVZk59VD1TZ7vMM2JsU0o+K3KK/f2mpYet6ginF/Z4Pls/jokzO23IwttzC85OwOqV
 5z3A==
X-Gm-Message-State: AOAM533ilaIwADnDIjhOXmlVg4LlZNow7U/tjPEGXWUUjnHF9UCbSqXT
 Kxd+ZqGOMNmwqnPlMIkqM9n7pfFrAy8fBvWvZ1fQyw==
X-Google-Smtp-Source: ABdhPJyw8QdTeLdPkaSbn9MW+CqLKQfUvO/jujNN3XsSr4MZgwU3uIvJJqRAk/vug505l/EEco7tmML/hPNkhCH+j40=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr223719oos.1.1644977862132; Tue, 15 Feb
 2022 18:17:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:17:41 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-2-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:17:41 -0800
Message-ID: <CAE-0n52hXz0tptXxip4vJdPPfXa+Vk738+F49j66swAhTgSBXA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/6] drm/msm/dpu: remove extra wrappers
 around dpu_core_irq
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

Quoting Dmitry Baryshkov (2022-02-01 07:10:51)
> Remove extra dpu_irq_* wrappers from dpu_kms.c, merge them directly into
> dpu_core_irq_* functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

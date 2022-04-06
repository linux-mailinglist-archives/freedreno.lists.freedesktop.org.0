Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E34F526A
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 04:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F8310E748;
	Wed,  6 Apr 2022 02:51:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451A210E748
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 02:51:25 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-d39f741ba0so1490330fac.13
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 19:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=b3VgmcVE3acBeuODdkvAAtJXlVuslI4bEciUTqIWCXk=;
 b=Uv+PIrB6cyK6LLEXHNe2noHhf63P0v4ECfEtz/zC4+ThCOWRUaiT7C7Ei3Fflk8r8X
 Y8JNk9YQ8oaJTVUPPWKg6Afa+IcWnWZ/VLZehdbhOcW7rEpo0BdJaCM27cnSCvOT9yld
 YHThOe5G+JB5u6NVpg8gKhFqzWQgxAFswR/Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=b3VgmcVE3acBeuODdkvAAtJXlVuslI4bEciUTqIWCXk=;
 b=bv7143lD136aciff1KKfEbLQZ3aradQuGIexTyftvNZDn/MC2Z8VzlOtYs/Cj+XEut
 QerNCJ6z282KP01ypks1A90fifd1BhoVAPEdQy0r8Vq+FSw3nlxxcrNcxjpodXN/1J2b
 UHVdePQknH6t2Q7po52ysokjvjm01AHAChLNn+lnCFk3RhldKWpPDQ4im2xT6y0dFz31
 a50lrYYdnBzLBOd1A5YzREF7tZHi9zSW4Oa2jr3q//Xen9qizMnBwrf0MxQOWD6sOZUU
 ZRqbUsdjcrlq59FGLIeuxJ162zb66mG7KRKwwm81SaB4u6x0if7k7qqC/P3usA0gtoPg
 eToQ==
X-Gm-Message-State: AOAM531jYuVhcfXQQzuuNYIxRAjp3qLBIucQYrpZjpkWMpYZB5tCQWh5
 HwhLr2ep8s0dWhgvAxS3HXIxdpKjl895H/lA78KkrA==
X-Google-Smtp-Source: ABdhPJwyhOMQxO9obsul5Y1w7P3cWlG8E3ejPRdOhFNq/BGZk2T4u3pPnhmUkLRH6BtD6orCVzZkjOczXsYtx4cXWZk=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr2980516oao.63.1649213484466; Tue, 05
 Apr 2022 19:51:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 19:51:24 -0700
MIME-Version: 1.0
In-Reply-To: <20220405234551.359453-2-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
 <20220405234551.359453-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 19:51:24 -0700
Message-ID: <CAE-0n53p7MsvwzqzzyHdRzX2XV9_Lv7poTuZMQowha0=f=QZSA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm/hdmi: properly add and remove
 created bridges
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

Quoting Dmitry Baryshkov (2022-04-05 16:45:48)
> Add calls to drm_bridge_add()/drm_bridge_remove() for the internal HDMI
> bridges. This fixes the following warning.
>
> [    2.195003] ------------[ cut here ]------------

Usually this line is left out

> [    2.195044] WARNING: CPU: 0 PID: 1 at kernel/locking/mutex.c:579 __mutex_lock+0x840/0x9f4

And the timestamp is removed

> [    2.198774] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> [    2.198786] Modules linked in:
> [    2.211868] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-00002-g3054695a0d27-dirty #55
> [    2.214671] Hardware name: Generic DT based system
> [    2.223265]  unwind_backtrace from show_stack+0x10/0x14
> [    2.228036]  show_stack from dump_stack_lvl+0x58/0x70
> [    2.233159]  dump_stack_lvl from __warn+0xc8/0x1e8
> [    2.238367]  __warn from warn_slowpath_fmt+0x78/0xa8
> [    2.243054]  warn_slowpath_fmt from __mutex_lock+0x840/0x9f4
> [    2.248174]  __mutex_lock from mutex_lock_nested+0x1c/0x24
> [    2.253818]  mutex_lock_nested from drm_bridge_hpd_enable+0x2c/0x84
> [    2.259116]  drm_bridge_hpd_enable from msm_hdmi_modeset_init+0xc0/0x21c
> [    2.265279]  msm_hdmi_modeset_init from mdp4_kms_init+0x53c/0x90c
> [    2.272223]  mdp4_kms_init from msm_drm_bind+0x514/0x698
> [    2.278212]  msm_drm_bind from try_to_bring_up_aggregate_device+0x160/0x1bc

I'd probably cut it off here.

Is there any Fixes tag for this? Still seems worthwhile to have one even
if this is a lockdep warning.

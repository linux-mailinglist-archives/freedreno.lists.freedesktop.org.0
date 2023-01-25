Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB9A67B950
	for <lists+freedreno@lfdr.de>; Wed, 25 Jan 2023 19:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C810E802;
	Wed, 25 Jan 2023 18:30:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B81A10E0E0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 18:30:02 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id e8so16773641qts.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 10:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mQQ+b96bYTR/JdRx7lqvrfEUi55TNY9dz9cLJO4CiN8=;
 b=hisavarov1w5W1Psgb6++dahB/QO8VQceskeeHhNEm2K/HYSKp/ek8PCJtXp5Wcr7I
 gJFlg88ced3rjDWxpZLZlh/bdYD+xNek2hkD9nRMPGgLq0qNwF2kw70+d4/sZ14DS3NS
 F2cWRxngYJBjSmkvGBwxoNC3WL7bXBOpRqabY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mQQ+b96bYTR/JdRx7lqvrfEUi55TNY9dz9cLJO4CiN8=;
 b=7C1Ii/+eY8hqh3e4cs3RTYiP6uSxtiQ99VbvgZGGhglgCoNXrqfbAVsesNgA5Se+8o
 TWv+v7ekir2wpBnL/s2PN1nTVDt12Ul9DEHwnZFXLJ/bm8V9fbV4UTkOmoKHykmc12/n
 BkD6iiXpTrFT97oMeqWdWSYj8McCwHN55KJACgAermk55Nsl0fx+7ORI787VqgWhil+m
 qGRKaArjNl8s78aPyPdudbYpNPbG4pyK3JbiZeZl/h68yEQCZ72gpPiqiJFXgugBFuGZ
 Tko889PPO4rEs8pZzSlT3sHS6H3fnXO1gLte4qO/mslAxJXUuxo3chUU7MdjXCHxbpw8
 t27A==
X-Gm-Message-State: AFqh2krIoXov8q5hgJSKfZV+PN7o5qR+h4aBDYE4UOe23EIOrBKlyRRr
 cqrMjmANIZQbnHqoIYkAlOjKUUFIoBG3Ne6m
X-Google-Smtp-Source: AMrXdXsDHGzbqiH/qkummD+IK9R+W9zD5VLfrOiLKiAKVfzlftLmRs1d63Hn8V9I+SFeINaaVb0wbA==
X-Received: by 2002:ac8:7293:0:b0:3b6:2f60:35c0 with SMTP id
 v19-20020ac87293000000b003b62f6035c0mr48340108qto.35.1674671401087; 
 Wed, 25 Jan 2023 10:30:01 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 k14-20020ac8604e000000b003b697038179sm1837142qtm.35.2023.01.25.10.30.00
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 10:30:00 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id h24so12814073qta.12
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 10:30:00 -0800 (PST)
X-Received: by 2002:a05:6638:2727:b0:374:f967:4187 with SMTP id
 m39-20020a056638272700b00374f9674187mr4302979jav.130.1674670934658; Wed, 25
 Jan 2023 10:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20230119145248.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
 <20230119145248.2.I2d7aec2fadb9c237cd0090a47d6a8ba2054bf0f8@changeid>
 <f08b04b2-3fdd-38f5-6402-16c57a3322d2@quicinc.com>
In-Reply-To: <f08b04b2-3fdd-38f5-6402-16c57a3322d2@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Jan 2023 10:21:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHH5=NZPWSyu6P0HVMpSJK_53=S6PgyjJZCKz8-dE1rg@mail.gmail.com>
Message-ID: <CAD=FV=WHH5=NZPWSyu6P0HVMpSJK_53=S6PgyjJZCKz8-dE1rg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dp: Return IRQ_NONE for
 unhandled interrupts
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 25, 2023 at 9:22 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> > -void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
> > +irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
> >   {
> >       struct dp_ctrl_private *ctrl;
> >       u32 isr;
> > +     irqreturn_t ret = IRQ_NONE;
> >
> >       if (!dp_ctrl)
> > -             return;
> > +             return IRQ_NONE;
> >
> >       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> >
> >       isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
> can you add (!isr) check and return IRQ_NONE here to be consistent with
> dp_aux_isr()?

I could, though it doesn't really buy us a whole lot in this case and
just adds an extra test that's not needed. Here it should be easy for
someone reading the function to see that if "isr == 0" that neither of
the two "if" statements below will fire and we'll return "IRQ_NONE"
anyway.

...that actually made me go back and wonder whether we still needed
the "if" test in dp_aux_isr() or if it too was also redundant. It
turns out that it's not! The previous patch made dp_aux_irq() detect
unexpected interrupts. Thus the "if (!isr)" test earlier is important
because otherwise we'd end up WARNing "Unexpected interrupt:
0x00000000" which would be confusing.

So unless you or others feel strongly that I should add the redundant
test here, I'd rather keep it off. Let me know.

-Doug

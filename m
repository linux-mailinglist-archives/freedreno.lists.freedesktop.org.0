Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB53C5D78
	for <lists+freedreno@lfdr.de>; Mon, 12 Jul 2021 15:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E55B89BB2;
	Mon, 12 Jul 2021 13:39:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E351898EA
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jul 2021 13:39:44 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id j184so17938793qkd.6
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jul 2021 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/y3AswAn7xrfStWckKQ4mdfAYQv8LuashoWFVm7wmnI=;
 b=JIUoCU9T0XfyuPyJPuVrcxCa8UoWsH/qeP/iWmQomkfVNKt6Mnzy8lEYTsbBLAjQDY
 qA2lrYcGl7R7GwRo7zb4EcRYe0d2sy5LWLilGAQERXHWRpwcRsU4AXvQl2DgNurV6j9N
 GaO1ghyx3qKRzIY5oEx/5Ib8QbPhKF1MbPyX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/y3AswAn7xrfStWckKQ4mdfAYQv8LuashoWFVm7wmnI=;
 b=IKVIcAoJPI2afk89tlxb/puyvwHcTkYz4VxHZI5nCASsMEMmzPqE2Ln6dL9BBjrUYv
 tydPBYeUAeD65ANzuNm1BE8UwimC9484gbbzYsLRW2+oAoQlenRSMShaXdCV7DLctNcg
 PvgkRt5BNKnpeYwrgN95tKh2cQ0TXzClcb0gIV34zaQSG0ENqS0FWyl4Ode8RWWKaDX+
 CbKhIvz8pbWFPs0ufqZuHCVVd4tKNZ0lpL4XHCOnnFz34u5dgbGK2j2h4yAiV42xzLjD
 Mok1aQvTeRWEGHm0opRhe8HC46mrvlRJqhh5o5wteIJdAPFn4dfCAbZ4QXq5HQQx8Ny4
 8A2g==
X-Gm-Message-State: AOAM532kGgHcIhjUaCad21EOSiCIij8Xx9qelgHw/kGZ11+EIEn9aFaG
 E2GfopC82WJqUt61COWg7Ox8wsSs26Sh2Q==
X-Google-Smtp-Source: ABdhPJzahzflPRYezgIkrMlG3bM5s6d3zAr4ydyudPNZXFxnjNbcWxncJfl5Z5R2GSQo/h2NoDVJ1w==
X-Received: by 2002:a05:620a:ed8:: with SMTP id
 x24mr5112675qkm.299.1626097183672; 
 Mon, 12 Jul 2021 06:39:43 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id o27sm6537461qkj.98.2021.07.12.06.39.42
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 06:39:42 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id p22so29011356yba.7
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jul 2021 06:39:42 -0700 (PDT)
X-Received: by 2002:a25:3486:: with SMTP id
 b128mr71633896yba.523.1626097181672; 
 Mon, 12 Jul 2021 06:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
 <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
In-Reply-To: <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Jul 2021 06:39:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8CaKObbQTCsX2GrP=O8aJUaWLZY3zgBMRATtSn6Be4g@mail.gmail.com>
Message-ID: <CAD=FV=V8CaKObbQTCsX2GrP=O8aJUaWLZY3zgBMRATtSn6Be4g@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Freedreno] [v8 1/6] drm/panel: add basic DP AUX backlight
 support
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 12, 2021 at 2:41 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> > +     ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> > +                            EDP_DISPLAY_CTL_CAP_SIZE);
>
> This creates a cyclic dependency between drm_kms_helper-ko and drm.ko.
> drm_panel.c is in the latter, while drm_dp_dpcd_read() in
> drm_dp_helper.c is in the former. Please fix.

Yeah, this was reported Friday and I posted a patch to try to fix it:

https://lore.kernel.org/lkml/20210709152909.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid/

I see Rajeev had some feedback on it. Once I've dug out of my weekend
email hole I'll take a look at plan to post a v2 ASAP.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

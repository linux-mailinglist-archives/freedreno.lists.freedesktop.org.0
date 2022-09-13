Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6385B67F9
	for <lists+freedreno@lfdr.de>; Tue, 13 Sep 2022 08:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B5110E618;
	Tue, 13 Sep 2022 06:35:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27C910E616
 for <freedreno@lists.freedesktop.org>; Tue, 13 Sep 2022 06:35:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dv25so25098425ejb.12
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 23:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gKNkp5TT0XjbSEmbU4M+B2B1cDxK13/0CThFH853tls=;
 b=oWWEF/08VQtpBTsplhTEQ87f9wS6PdIe0WOT+m9wrHcVpU1Gbf6/v9mUpGSDwch3nR
 A0Zib3++wgkeB2Ne5BzvDdzU+eifZFHaQGbgrGEK0/vux33BpwRSjkNkzUNwtnnOeeHH
 s0dkzYSP2obWbdCHPijdD2H/iA0Pku8Ki4LTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gKNkp5TT0XjbSEmbU4M+B2B1cDxK13/0CThFH853tls=;
 b=D1Eu8e3xreIZOXhGJ+ktHIsuT5SxDZOuaNWMqPp3dOlloP5Pq4gaYfXkPEjJDBuumq
 LRwQ/KvVYmhbyu99qzqEZx5y1SaenOg/o2gKpRQPOAaSENxBQj0tO4mGoSWeufkdrMTZ
 +IcGxBN3V4Xl9mev2D7dvb3hz58bgEgxsQ1Ky4Bw4QMwj8Nna4gkdmH/HSzTjrieqwOG
 9279veLoKCSGcxznfjY/0DXParz3nQNEsWLwEEnQ5c9SMCE6l32y9cYPc4avgXNUqJ0x
 NbQroruOvVoJVbzVyvqOrm5ZDLeW3ynwGMGcGrGCcT47v5mg8BGIQavyTgNJannW4CUV
 bg1A==
X-Gm-Message-State: ACgBeo28XxIY6BZSxSRsi2pdQv9byiHP+3XdMsGvZ32ktiatyoNITN77
 IdC3cXmChmy74rN1QtytyY11m21qZPnKnvRLS6Y=
X-Google-Smtp-Source: AA6agR6MIz98F00fXcWM6tKUI762JWkRnw2kywnA25LA9BBA3Jt+7jxtcbLZzWbx2oFs7aSBpBxeWw==
X-Received: by 2002:a17:907:6285:b0:738:e862:a1b with SMTP id
 nd5-20020a170907628500b00738e8620a1bmr21812436ejc.70.1663050929739; 
 Mon, 12 Sep 2022 23:35:29 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906329100b007742cf42836sm5618922ejw.144.2022.09.12.23.35.27
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 23:35:28 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso8813477wmr.3
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 23:35:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr1199949wmq.85.1663050927147; Mon, 12
 Sep 2022 23:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-5-johan+linaro@kernel.org>
 <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
In-Reply-To: <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Sep 2022 07:35:15 +0100
X-Gmail-Original-Message-ID: <CAD=FV=U8_bjPm3NEOWqzehrx0xFV4U771nTuhhOiM9gKDVCo5g@mail.gmail.com>
Message-ID: <CAD=FV=U8_bjPm3NEOWqzehrx0xFV4U771nTuhhOiM9gKDVCo5g@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/dp: fix aux-bus EP lifetime
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "# 4.0+" <stable@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 12, 2022 at 7:10 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/09/2022 18:40, Johan Hovold wrote:
> > Device-managed resources allocated post component bind must be tied to
> > the lifetime of the aggregate DRM device or they will not necessarily be
> > released when binding of the aggregate device is deferred.
> >
> > This can lead resource leaks or failure to bind the aggregate device
> > when binding is later retried and a second attempt to allocate the
> > resources is made.
> >
> > For the DP aux-bus, an attempt to populate the bus a second time will
> > simply fail ("DP AUX EP device already populated").
> >
> > Fix this by amending the DP aux interface and tying the lifetime of the
> > EP device to the DRM device rather than DP controller platform device.
>
> Doug, could you please take a look?
>
> For me this is another reminder/pressure point that we should populate
> the AUX BUS from the probe(), before binding the components together.

Aside from the kernel robot complaints, I'm not necessarily convinced.
I think we know that the AUX DP stuff in MSM-DP is fragile right now
and Qualcomm has promised to clean it up. This really feels like a
band-aid and is really a sign that we're populating the AUX DP bus in
the wrong place in Qualcomm's code. As you said, if we moved this to
probe(), which is the plan in the promised cleanup, then it wouldn't
be a problem.

As far as I know Qualcomm has queued this cleanup behind their current
PSR work (though it's never been clear why both can't be worked on at
the same time) and the PSR work was stalled because they couldn't
figure out what caused the glitching I reported. It's still on my nag
list that I bring up with them every week...

In any case, if a band-aid is urgent, maybe you could just call
of_dp_aux_populate_bus() directly in Qualcomm code and you could add
your own devm_add_action_or_reset() on the DRM device.

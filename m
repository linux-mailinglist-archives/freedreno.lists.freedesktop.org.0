Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B56616AAD
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 18:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9C910E516;
	Wed,  2 Nov 2022 17:28:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D970A10E516
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 17:28:39 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id 21so27585310edv.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X2+9yxVt9jWEvW8G1POIGEGcQSupOLAIpJg0gweghVs=;
 b=EgGB89Zg2h2E8cHoQjjgPCz2n0IaFrtoRPxndhM06adDo28bUdZZyYjM7q7PGcAuCO
 qrK1/JRrMVIgQ54XSYURFj9EiicVAjN1F6gMP1c632DyLUMlyDJIn0yQ1+VaCn4KYaHU
 OW4PLBRpp/FdhTOokAVnaOpXhTYDriLrSphdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X2+9yxVt9jWEvW8G1POIGEGcQSupOLAIpJg0gweghVs=;
 b=alGJhEhw9DADOQb4cfe3Py5Wg/lf+3hG2aTJhShkHQoMUfwb+o2Gt3fj/8U2/aCXjW
 sTQA8N64cBZsohWmu+kCXfBI3cyUJf/ujWoEvVfJYlGJ8572v0If52vPp55Z0uNOjFhq
 XWMxP2qHb+E5PVcTN+IaEspyX40QY3hRVDs3z51tq0q72dFxUJS4KUC0vQXz/wG0oizt
 Ba/lijc8z//gPf8GT/lP1P5dM03w0bPncilNaKMBs8csU2SqH3teKsNxc/zdXem5hYr6
 zDkK1mDZkNNgjjuGqCqlBEFMi188D6xNl6eCH8ck9r9R4778EP7ULYMk9u7xDShwiRRn
 vwrA==
X-Gm-Message-State: ACrzQf03itC6fYvLBij1EYMIonQd0Z8+qf+alyS3X4cw1Xi/UY8fcvEb
 gS9OpO2idZXBgmanceyJEhsbUS/QYRUlp2G5
X-Google-Smtp-Source: AMsMyM6OTInRkFlsAEd3/TdjKQKH+aM6+56kk0yL+E2Eja26G41Nr7QCVn7AqjOWQpr6/aN4CkGL1w==
X-Received: by 2002:a05:6402:2893:b0:461:59fd:9b4 with SMTP id
 eg19-20020a056402289300b0046159fd09b4mr25683667edb.389.1667410117945; 
 Wed, 02 Nov 2022 10:28:37 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 x1-20020aa7dac1000000b00461bd82581asm6002640eds.84.2022.11.02.10.28.36
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 10:28:37 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 i5-20020a1c3b05000000b003cf47dcd316so1728541wma.4
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 10:28:36 -0700 (PDT)
X-Received: by 2002:a05:600c:2212:b0:3cf:6068:3c40 with SMTP id
 z18-20020a05600c221200b003cf60683c40mr16617338wml.57.1667410116349; Wed, 02
 Nov 2022 10:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
 <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
 <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com>
 <c5aedb31-3881-50e7-f747-e75b18c3f4b8@linaro.org>
In-Reply-To: <c5aedb31-3881-50e7-f747-e75b18c3f4b8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Nov 2022 10:28:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPde5wVOGCKQYGuGwgCwRebox4FF0MgV_2pPCTsfo_UA@mail.gmail.com>
Message-ID: <CAD=FV=WPde5wVOGCKQYGuGwgCwRebox4FF0MgV_2pPCTsfo_UA@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove limitation of link rate
 at 5.4G to support HBR3
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
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 2, 2022 at 10:23 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > 1. Someone figures out how to model this with the bridge chain and
> > then we only allow HBR3 if we detect we've got a TCPC that supports
> > it. This seems like the cleanest / best but feels like a long pole.
> > Not only have we been trying to get the TCPC-modeled-as-a-bridge stuff
> > landed for a long time but even when we do it we still don't have a
> > solution for how to communicate the number of lanes and other stuff
> > between the TCPC and the DP controller so we have to enrich the bridge
> > interface.
>
> I think we'd need some OOB interface. For example for DSI interfaces we
> have mipi_dsi_device struct to communicate such OOB data.
>
> Also take a note regarding data-lanes from my previous email.

Right, we can somehow communicate the max link rate through the bridge
chain to the DP controller in an OOB manner that would work.


> > 2. We add in a DT property to the display controller node that says
> > the max link rate for use on this board. This feels like a hack, but
> > maybe it's not too bad. Certainly it would be incredibly simple to
> > implement. Actually... ...one could argue that even if we later model
> > the TCPC as a bridge that this property would still be valid / useful!
> > You could certainly imagine that the SoC supports HBR3 and the TCPC
> > supports HBR3 but that the board routing between the SoC and the TCPC
> > is bad and only supports HBR2. In this case the only way out is
> > essentially a "board constraint" AKA a DT property in the DP
> > controller.
>
> We have been discussing similar topics with Abhinav. Krzysztof suggested
> using link-frequencies property to provide max and min values.

This sounds good to me and seems worth doing even if we eventually do #1.

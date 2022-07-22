Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6747257D803
	for <lists+freedreno@lfdr.de>; Fri, 22 Jul 2022 03:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D0C14BD7B;
	Fri, 22 Jul 2022 01:29:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A6A14A358
 for <freedreno@lists.freedesktop.org>; Fri, 22 Jul 2022 01:29:02 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id os14so6128090ejb.4
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 18:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SVPqfwH/07HlNOv2TRkPmLswn/QUPlQGAJ5mgKuBLO4=;
 b=MFIlp/LiIilyP6VUEC691FGgrKDYwLe0ZTn31yUfuKe208ESUqpgsUsgzvHrgZXuho
 CpRTNoUgxieKQSsv3drg4QbWVAb4S1/EUdYV3IRzwlqztu3dG35B1B1M3F/imiT3P5Am
 7L80f1thRVsnKNVab/YwGzlYyexpswU1yBHkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVPqfwH/07HlNOv2TRkPmLswn/QUPlQGAJ5mgKuBLO4=;
 b=kPPwDO0jemqjT9F4bKVwOFgE/V6n9i5UTy2OUiiJ/nIm543NYrgDOvL5OogmIhZCtC
 dJ2JqutK8nvLHExMzH20mwo3BFx/Tp7QsiE/Tda6oh4WQYrZLL9VFZ6yB9t9M9sX5Q8C
 o8nYwA6Qhgi0K08ZO3N9OOUdrPQQKj6QwisFuBei7LX/Yih2W7S3MiTITEf3ivIEK4Kl
 GpJybISC4jCuycrgFzacbPV38EW81PVBQbyxC1G+8O2nQC33bdmgaSTviQAjcOlfJ8KZ
 9/SpC0nKfunj/es3Va0Ubkc8N/x0fwOv6bQJukGOOzJjZyk0nG4yVHPH4cLTd3cPUfFI
 maGw==
X-Gm-Message-State: AJIora9GbvHua6dgz8KJ+4QnQGk8jvgAO7BdU9Ohlg8VnyqL3jLqgPDs
 VE1jWN1wQQ/xaeqU72ItpKkNms/uiF2L7cVLXbU=
X-Google-Smtp-Source: AGRyM1ut162yfCf9G+zqRvRTjpapaz99Beus3eXhY8NaD09QUmUjPSE1fMBuUQmfWe4aW1yyUs4+UQ==
X-Received: by 2002:a17:907:7e87:b0:72b:4af3:bf57 with SMTP id
 qb7-20020a1709077e8700b0072b4af3bf57mr1104444ejc.9.1658453340696; 
 Thu, 21 Jul 2022 18:29:00 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 kx20-20020a170907775400b0072aa014e852sm1409157ejc.87.2022.07.21.18.28.55
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 18:28:58 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id a11so1958266wmq.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 18:28:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4e86:b0:3a3:2edc:bcb4 with SMTP id
 f6-20020a05600c4e8600b003a32edcbcb4mr5596548wmq.85.1658453335156; Thu, 21 Jul
 2022 18:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <Ytk2dxEC2n/ffNpD@sirena.org.uk>
 <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
 <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
In-Reply-To: <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 18:28:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVxhZwJFmOAg2v1UmfOt9_HWz0LG8M3wac+RkMPGOwYg@mail.gmail.com>
Message-ID: <CAD=FV=XVxhZwJFmOAg2v1UmfOt9_HWz0LG8M3wac+RkMPGOwYg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v16 0/3] eDP/DP Phy vdda realted function
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
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 7:52 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jul 21, 2022 at 7:39 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > > You could add a way to specify constant base loads in DT on either a per
> > > regulator or per consumer basis.
> >
> > Yes, this please! ...on a per consumer basis. :-) It's been on my
> > wishlist for a while and would eliminate a massive amount of code /
> > tables in the drivers.
> >
> > We could debate syntax, but I guess you'd either do it w/ two cells
> >
> > vdda-phy-supply = <&vdda_mipi_dsi0_1p2 21800>;
> >
> > ...or with matching properties:
> >
> > vdda-phy-supply = <&vdda_mipi_dsi0_1p2>;
> > vdda-phy-supply-base-load = <21800>;
>
> Ah, sorry to respond to my own thread so quickly, but I just thought
> of a reason for the "matching properties" solution instead of the two
> cells. It would allow the SoC "dtsi" file to specify a base load while
> the board "dts" file can then specify the supply. That feels like it
> could be a nice solution.

This seemed easy, so I whipped up a quick prototype. Forewarned that I
did very little detailed testing. I didn't CC everyone on this thread,
but hopefully folks can find it if they are interested...

https://lore.kernel.org/r/20220721182622.RFC.1.I8a64b707169cfd73d9309c5eaf5d43b8bc4db988@changeid

-Doug

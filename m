Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE154E649
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 17:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF1B10E6CE;
	Thu, 16 Jun 2022 15:44:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D592C10E6CE
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 15:44:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id be31so2797476lfb.10
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dVDuCM8VRK665zH/HV+gDuurZlzqRaw3AF4f+4QEQY=;
 b=YpSpNH3K+KjKkXCuVKrFBcVrP5SWlYv3RWSSUdRdHJUnj+BZbndMy/7IyaCo4ZQ5rb
 d5YerNu+HSuaHbXK9sCxIH2I4yswgUI5cbWPgvOV+jsqmpGVVOzFPK8wchjbBtnuyFNC
 yiHYfw8thWjslkqgb7sZ31mB5KIv7561wqhQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dVDuCM8VRK665zH/HV+gDuurZlzqRaw3AF4f+4QEQY=;
 b=krl1oE+PLnkVqxvhYfkhHgzow7A8KywJqRA6hciCSgJX9GyvHCMXrRdNfjxEayqG4y
 WDTWhQrYis5r6YHWWjbz0Gg6VvEvQ9JimxIkZRvVgvmjFbGNiJ0J2SC8rvcsFnEFgan1
 aUa74PMpdpcUlTGU5hZiG3D6H8wCKpGAmOa0+T2Af4JHM9+D2RQxBWitB3l2iAfcuslT
 BLJsg0lseXv+45vMVBI4v9HhbMu1OT3jCxSgbLkaXHLShl5kHZ+BW9AFyWnhfHayKo/4
 VtZtYGGZ2VM9AVHRexWjreinbsdYJ8Jo7bXE7KZMHiUncM3nGjzZu8cJw/o2t0EtQA6X
 oYnw==
X-Gm-Message-State: AJIora9kMOZRojDqncICPZZr6U8wL0jpBqH/62PTI/LMVWZq65WQkHQ2
 IwSqBzrIDgDSs44KZwRTAwnhDe4xVoatyl+BdRM=
X-Google-Smtp-Source: AGRyM1vNW5MJ7IHuFoxF7Tz7b/fCXoeEHDygHNWKKSRQmC7LrWTZS3E/O9QAXe25fEO0BnisVOgGVQ==
X-Received: by 2002:ac2:4c50:0:b0:479:4fac:dd8e with SMTP id
 o16-20020ac24c50000000b004794facdd8emr2970788lfk.678.1655394237531; 
 Thu, 16 Jun 2022 08:43:57 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 s13-20020a056512214d00b004785ad6c74esm277374lfr.270.2022.06.16.08.43.57
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 08:43:57 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id y32so2814776lfa.6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 08:43:57 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr5183133wrw.679.1655393766098; Thu, 16
 Jun 2022 08:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.2.Iae013f0ff4599294189f3a6e91376fad137bbabf@changeid>
In-Reply-To: <20220425140619.2.Iae013f0ff4599294189f3a6e91376fad137bbabf@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Jun 2022 08:35:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wbi=CXhPpOUJj=1PdgB8i6Lf1Sfr=T7wrQsgBx790S_w@mail.gmail.com>
Message-ID: <CAD=FV=Wbi=CXhPpOUJj=1PdgB8i6Lf1Sfr=T7wrQsgBx790S_w@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/2] dt-bindings: phy: List supplies for
 qcom, edp-phy
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 25, 2022 at 2:07 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> We're supposed to list the supplies in the dt bindings but there are
> none in the eDP PHY bindings.
>
> Looking at the driver in Linux, I can see that there seem to be two
> relevant supplies: "vdda-phy" and "vdda-pll". Let's add those to the
> bindings.
>
> NOTE: from looking at the Qualcomm datasheet for sc7280, it's not
> immediately clear how to figure out how to fill in these supplies. The
> only two eDP related supplies are simply described as "power for eDP
> 0.9V circuits" and "power for eDP 1.2V circuits". From guessing and
> from comparing how a similar PHY is hooked up on other similar
> Qualcomm boards, I'll make the educated guess that the 1.2V supply
> goes to "vdda-phy" and the 0.9V supply goes to "vdda-pll" and I'll use
> that in the example here.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Even though patch #1 in this series should be dropped, this patch
(patch #2) is still valid. Vinod: I assume this would land in your
tree along with the first two patches in Kuogee's series [1], which
are related. Please let me know if you need me to re-send or anything.
Thanks!

[1] https://lore.kernel.org/r/1653507433-22585-1-git-send-email-quic_khsieh@quicinc.com/

-Doug

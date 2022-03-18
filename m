Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BC4DD1E3
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 01:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A72210E0F5;
	Fri, 18 Mar 2022 00:20:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B09510E0F5
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 00:20:28 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qa43so13943581ejc.12
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6L19eqyYX4dJCc3XEpRDxDO0mhCk2mFkPhjOK7UiSQ=;
 b=GeSJ4KYz58tHKZxX3/boqgrHRuZmFHBI9sOAa070OEI0Wapz8rONQwHrT4jv/9jeXJ
 QQPJq/kVqzlEtaKjMqsYMeNN9AxQ4VoP8L0j5g5eKR3oZfiEpAfpH72syE/k+v1kiPeG
 Q8ldjmLxpem6iXFiOdEji6Mp7d/vGptTgtNpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6L19eqyYX4dJCc3XEpRDxDO0mhCk2mFkPhjOK7UiSQ=;
 b=uWLXvYARyfutHPVhyQx1I7Np7HH0KTkslAqHNKjpgd1cPs06PoKpYzU0xsosrBrSRP
 WouSqrNHnPidxIXjd8BD3oZvTsuVjC8Qg7qUnnPD4Dg3Qi+fzC3NLazhfT4E8a62w8Of
 aRydwePdJIsvyhkwm4q8fRZSM3pXH69+by2OiBBP7zi0KhV4B+aMOb+k1Bo5/gZ9E/sc
 CketOZ+3zIBq7M5J+R2bLTUwKT2KQRhlT827NmH4wmpMc49b1ABN++Is1o9Hjshm3YDh
 puDeisAKQxJKZD2wH0QFI1pdGSpYom/CUlC6gPml3fcZQWD8pqy//XT+zgHnQ5JoHRk+
 3t6w==
X-Gm-Message-State: AOAM531xcMWHLZnOHdyTZawOjyFUyo5gPJjXqzcnOxgL/lgrH0fOea3B
 Vgv1OgMJlEYtp7pEXx1PKrOmBeBfgD0+k48mtYU=
X-Google-Smtp-Source: ABdhPJwYlKDl0kyM9ZI0vnkTZyGPOpG2iTSkQhsTpRIBvbyg5OY0VlrYnWa1WPxBvqb2O51PLx7NVw==
X-Received: by 2002:a17:907:2d0a:b0:6df:87bd:4cd5 with SMTP id
 gs10-20020a1709072d0a00b006df87bd4cd5mr6705447ejc.423.1647562826358; 
 Thu, 17 Mar 2022 17:20:26 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 y15-20020a170906518f00b006df87a2bb16sm2337484ejk.89.2022.03.17.17.20.25
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:20:26 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id r13so14027217ejd.5
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:20:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr6072332wrc.513.1647562397219; Thu, 17
 Mar 2022 17:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:13:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAxdo9yjGS5d=W5s5OFo6BG6DyQr6WQxBv9r-vfU7D3Q@mail.gmail.com>
Message-ID: <CAD=FV=VAxdo9yjGS5d=W5s5OFo6BG6DyQr6WQxBv9r-vfU7D3Q@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/9] arm64: dts: qcom: sc7280: rename
 edp_out label to mdss_edp_out
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant <quic_kalyant@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 16, 2022 at 10:36 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Rename the edp_out label in the sc7280 platform to mdss_edp_out
> so that the nodes related to mdss are all grouped together in
> the board specific files.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v5:
>   - Change the order of patches
>   - Modify commit text
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

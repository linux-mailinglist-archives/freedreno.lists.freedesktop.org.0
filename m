Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408157CE1C
	for <lists+freedreno@lfdr.de>; Thu, 21 Jul 2022 16:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557D514B97C;
	Thu, 21 Jul 2022 14:50:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD8218A1EF
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 14:50:16 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id os14so3607507ejb.4
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pcZOB/ApWbNF0eW5n1wK25WOXQGFTiPvR0q+4tEoNh8=;
 b=G3YMfG/1UshoRnypsy2wF1GATgIebl3pHBLTFzdgoM2X/Uoe71KwDZ1NlkC9aKIHRD
 gssmJqeb6tLPv4PMRn5MOMSkjkFFVPDspiiT/qVNq/GgwUIgVP5mj+QOrgopShFwil+N
 KmGbGJFviFlxnH+lFltHw5UGi4GByFZDZxLjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pcZOB/ApWbNF0eW5n1wK25WOXQGFTiPvR0q+4tEoNh8=;
 b=mcDDo2r1zZNC1RxEOoM7fgBPvvYehJNfAfZbCw4UNanikUluGclq+2fYVosolEq6CO
 t7Pnz3D10wXrFwXIea76NdgD3L973NJ/pNyh02sooLHlr05LHwo+/BBNDQ24ZjDnLlCA
 A6Qj9hJoUEPUJ4fV+pE3rTk8mnrQduQWHFkibydjbfYPYHTjKI2vb9Czc4NXfZuMGvPA
 f0DqzWIUpkLY67/4E4m8yZiUj8SuuHD/iwKzhQoheIlsVOVqE+bsx7quPT3SAPsPNvR7
 IXCAVveA+aVCHiPOQ+7iMkVLau6j71VCShMD53ysU94ZSZzVpvP1P7ebutMs2lJdYAd6
 pY/Q==
X-Gm-Message-State: AJIora/yhkVFnSmqr8aY8PChrper+B+byR2STdHdgXxEzQ8DP/0OPDsP
 nBpXtObXN1oOwWB5Yx8b4LOffg7dkXeHZ0nqo6w=
X-Google-Smtp-Source: AGRyM1udDu1vtvW6UrS8DKOpfJh9vl/DDGc0N4rF/Do1MEGFh2jioiUVX69+KmCAH8Ike9PDeOLIRg==
X-Received: by 2002:a17:907:6d8b:b0:72b:5f51:a9e7 with SMTP id
 sb11-20020a1709076d8b00b0072b5f51a9e7mr41133665ejc.628.1658415014409; 
 Thu, 21 Jul 2022 07:50:14 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 l12-20020a1709060e0c00b00706242d297fsm898477eji.212.2022.07.21.07.50.10
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 07:50:11 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id bv24so2633783wrb.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jul 2022 07:50:10 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr34236872wrf.659.1658415009781; Thu, 21
 Jul 2022 07:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
In-Reply-To: <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 07:49:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
Message-ID: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 6:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > This series breaks USB and PCIe for some SC8280XP and SA540P machines
> > where the DP PHY regulators are shared with other PHYs whose drivers do
> > not request a load.
>
> I'm trying to understand, why does this series cause the regression.
> Previously it would be the DP controller voting on the regulators
> load, now it has been moved to the DP/eDP PHYs.

I think in the past not many device trees actually hooked up the
regulators to the DP/eDP but did hook up the regulators to the PHYs?
That means they didn't used to get a regulator_set_load() on them and
now they do?

It should also be noted that we're now setting the load for a bunch of
USB PHYs that we didn't used to set a load on...


> > It seems quite likely that changes like this one affects other systems
> > too, and the effects may be hard to debug. So a more general solution
> > than playing whack-a-mole using DT would be good to have.
>
> I think enabling a regulator which supports set_load() and without
> load being set should cause a warning, at least with
> CONFIG_REGULATOR_DEBUG. WDYT?

I'm not a total fan. I'd love to see evidence to the contrary, but I'm
a believer that the amount of extra cruft involved with all these
regulator_set_load() calls is overkill for most cases. All the extra
code / per-SoC tables added to drivers isn't ideal.

Every single LDO on Qualcomm's PMICs seems to be able to be set in
"high power mode" and "low power mode", but I think the majority of
clients only really care about two things: on and in high power mode
vs. off. I think the amount of stuff peripherals can do in low power
mode is super limited, so you have to be _really_ sure that the
peripheral won't draw too much current without you having a chance to
reconfigure the regulator.

Of course, if the load could be easily specified in the device tree
and we could get rid of all the cruft in the drivers then maybe that
would be OK.

-Doug

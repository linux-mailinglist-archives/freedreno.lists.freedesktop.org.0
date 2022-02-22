Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F84C03BB
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 22:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2210E749;
	Tue, 22 Feb 2022 21:25:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AE010E25D
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 21:25:22 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x5so39987757edd.11
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ncH9c7SiYmN6itdECS9f8vr7OT3dx9aRl+ruQf7+yUg=;
 b=bie/EqstQq7cMH+SvIyYScs9hMbdl5FmT1j31NstckurYsN72clBvZSAs4si7yh9wD
 r/miD7WgoTgKOsFCyHBeU2c8gQTdgqSJy1y26X892UgDwNWsMNYp9/ub7c2lCI6GZ3co
 KlMSphSYJYjvpWZcfeXWn0GgJ+1a1Y3QNMTE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ncH9c7SiYmN6itdECS9f8vr7OT3dx9aRl+ruQf7+yUg=;
 b=FOQKhuKwz0oIV3FnhGvk5QltMpFsptnwTYF1cOud9SeA/q2KLwqF4UmI9Kh8e/eiOE
 IMgaojoyAlaQqdRocnfbX6fdBUmsbzjl4P3JpH82jKS1Zt4p7rbGrM77D2iOmvVfshxR
 cPqimhZW+HiF4UPscuUqPwJN5W79kGBziakHBo2oQ5THaWedoelFjp89ixo2KuS3Ymge
 p6RczsoQV8Yf77O3Y2h2bIHc1egfgOSxJGGhQRJE4TuqpbxQmluzAgIZTjtt9CljcTsD
 e30f3wnTQplpxoUeABsSj9WgZ+9jnqFRbPDzOE6ciXmZyp4rfJTGjTCccU12zROGhWa8
 bIvw==
X-Gm-Message-State: AOAM533fYdLq7yj0+d0ELgDxhIWvfyUx8pMSVpWvh+0+GzoW4xc1zn3g
 MlybNWJva0q1TI/pngU7HMX6cGZQKNYQeXgr9LY=
X-Google-Smtp-Source: ABdhPJzT86wv1mqMe58bFmF7CHXbpF7+KDWesbhP17Lgj3pojW9yiNR5Cgp8CYIpTOommrZdPIHUBg==
X-Received: by 2002:a50:cc89:0:b0:400:8f82:99e8 with SMTP id
 q9-20020a50cc89000000b004008f8299e8mr27697647edi.7.1645565121159; 
 Tue, 22 Feb 2022 13:25:21 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id e4sm6665033ejm.116.2022.02.22.13.25.19
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:25:20 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id i20so2056266wmc.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:25:19 -0800 (PST)
X-Received: by 2002:a05:600c:228e:b0:37c:2eef:7bf with SMTP id
 14-20020a05600c228e00b0037c2eef07bfmr4792688wmf.73.1645565118969; Tue, 22 Feb
 2022 13:25:18 -0800 (PST)
MIME-Version: 1.0
References: <1645449126-17718-1-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n507XcYRz4=Uw-K37kPsLRqi_gN2L9y1wcu_X-UJP+6ySg@mail.gmail.com>
In-Reply-To: <CAE-0n507XcYRz4=Uw-K37kPsLRqi_gN2L9y1wcu_X-UJP+6ySg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 13:25:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WvstZkDJcHJPAT0aez3X=uSKzDX0paQRHYD4DEktkMEQ@mail.gmail.com>
Message-ID: <CAD=FV=WvstZkDJcHJPAT0aez3X=uSKzDX0paQRHYD4DEktkMEQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v1] arm64/dts/qcom/sc7280: update mdp clk to max
 supported value to support higher refresh rates
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 22, 2022 at 12:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Vinod Polimera (2022-02-21 05:12:06)
> > Panels with higher refresh rate will need mdp clk above 300Mhz.
> > Select max frequency for mdp clock during bootup, dpu driver will
> > scale down the clock as per usecase when first update from the framework is received.
> >
> > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>
> Please add a Fixes tag.
>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index baf1653..7af96fc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -2895,7 +2895,7 @@
> >                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> >                                                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
> > -                               assigned-clock-rates = <300000000>,
> > +                               assigned-clock-rates = <506666667>,
>
> Why not simply remove the clock assignment and set the rate based on the
> OPP when the driver probes?

I was curious so I dug. It turns out that it _is_ using the OPP. It's
just that the kernel driver currently assumes that the initial rate is
the max rate. :-P You can actually see in msm_dss_parse_clock() that
it walks through each of its clocks at boot and records the boot rate
and stashes it as the "max_rate". That's not a scheme I've seen done
commonly, so if nothing else it deserves a comment in the commit
message.

One other note is that I think there are _two_ places in the dtsi that
are setting this same clock rate, right? The parent node `mdss`, which
you're not touching, and the child `mdss_mdp`, which you are touching.
Seems like you should just do it in one place. If it needs to be done
by the parent then the child could just assume that the clock has
already been set by the parent.

-Doug

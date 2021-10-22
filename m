Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AA437E9A
	for <lists+freedreno@lfdr.de>; Fri, 22 Oct 2021 21:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B9E6EDA6;
	Fri, 22 Oct 2021 19:25:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA1B6E560
 for <freedreno@lists.freedesktop.org>; Fri, 22 Oct 2021 19:25:20 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id x1so5401871ilv.4
 for <freedreno@lists.freedesktop.org>; Fri, 22 Oct 2021 12:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFA4wQlK8CaJ1hsur/1XKvwpvXwy3gkeKIlN9LvzEXo=;
 b=rLomiKzN1fvLTUesFN4FsINXNm+w/LrB2o5/eWt84mtqPWqYwdzh/K2yIhZXhq60v5
 jZq7ZhN8IHFdFn6ymywqjTysXCp6H7KF0WPorpOWZJn/A0QZ9xCJDC2etyOaV9oAomTs
 +QdYrypKZwRsuzxTyhdqlZnFNfAqZ+508z+85OkGoBFUJI4khVGEfHYIEMGDSvm6RYVT
 rY984v4bEqJsQQIvvfBkmOMva/I9A+gkPdxO4Ls/SaajWH1gOnawzN/Kr7SJpv3Ffd3U
 apdsb38aqGg6FUCQH2BondlgVJRZEe7JTJ5KU+r/b2IGuor4mCtZx5Qw35qfNgpbCn2P
 ZrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFA4wQlK8CaJ1hsur/1XKvwpvXwy3gkeKIlN9LvzEXo=;
 b=rU6Ziu3xfFQCM6rG6ql41QKtW/g9jlgV4qR5nhBflGlPa7pTzLVqxZgf5ocKZBF2d0
 /pTxA5jK3EIN+KNJohuwwh52HSkWpbbx1pKAaJAIn17KAQcIFX/9TxoDzqeDeKwdukDq
 BsjckaSiC88240nD+euMVcXl9y8mGKYg62X7orVz+s4Uo76Av8HOJ8IDejxaI76okrSB
 slSzgksVeJeIA6/uKl1ZVyuVrJqmYV5wxcroeviUx/rwd+JvYRItByTpR9tOnvzE77PW
 5u1lWN5jTirDf6Q+bjI5jOw4hUrF/v9ecCUZvH1REnfaS/X+QZiXQLJOX8qX7WwxYTl6
 8fbg==
X-Gm-Message-State: AOAM531G5Ygck00o2ECIzBI6svf2eRqvKBLdDdAa5zlnjoo0e08SKGF4
 xDZ/womW9s6PEeC/ed5HpAdkBC8TJpX9uSwwnH1IVg==
X-Google-Smtp-Source: ABdhPJwvWnJcpi9p4Iog2ilpcyx5pHCQ1DxE1z9y9o1svoDRBNloCTdriMWufTsRJesTGutghF0pvYQAlf/QVGTOqaE=
X-Received: by 2002:a05:6e02:120f:: with SMTP id
 a15mr1159054ilq.109.1634930719824; 
 Fri, 22 Oct 2021 12:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
 <3af41112-7ccd-5da8-c189-3ed8d22273c0@linaro.org>
 <CAA8EJprjoEX4BDHOHevQQ=TMwM21xZSHuqYm8yNJ=L6GiovQYA@mail.gmail.com>
In-Reply-To: <CAA8EJprjoEX4BDHOHevQQ=TMwM21xZSHuqYm8yNJ=L6GiovQYA@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Sat, 23 Oct 2021 00:54:43 +0530
Message-ID: <CAMi1Hd15Qb=xitFax-0OrL47reZnkpg-=Tvu3w=rKtwBk00JuQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>, 
 Rob Herring <robh+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] Revert "arm64: dts: qcom: sm8250: remove bus clock
 from the mdss node for sm8250 target"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 15 Oct 2021 at 02:53, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 14 Oct 2021 at 19:54, Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
> >
> > Hi Dmitry,
> >
> > On 10/14/21 4:54 PM, Dmitry Baryshkov wrote:
> > > From: Amit Pundir <amit.pundir@linaro.org>
> > >
> > > This reverts commit 001ce9785c0674d913531345e86222c965fc8bf4.
> > >
> > > This upstream commit broke AOSP (post Android 12 merge) build
> > > on RB5. The device either silently crashes into USB crash mode
> > > after android boot animation or we see a blank blue screen
> > > with following dpu errors in dmesg:
> > >
> > > [  T444] hw recovery is not complete for ctl:3
> > > [  T444] [drm:dpu_encoder_phys_vid_prepare_for_kickoff:539] [dpu error]enc31 intf1 ctl 3 reset failure: -22
> > > [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> > > [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
> > > [    C7] [drm:dpu_encoder_frame_done_timeout:2127] [dpu error]enc31 frame done timeout
> > > [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> > > [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
> > >
> > > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> >
> > your sob tag is missing.
>
> True. I hope this is fine:
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>

Hi,

Any update on this? I'd really like to see this or a relevant fix to
land in v5.15, because I can't boot AOSP on RB5 otherwise.

Regards,
Amit Pundir

> >
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > index 8c15d9fed08f..d12e4cbfc852 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > @@ -2590,9 +2590,10 @@
> > >                       power-domains = <&dispcc MDSS_GDSC>;
> > >
> > >                       clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > > +                              <&gcc GCC_DISP_HF_AXI_CLK>,
> > >                                <&gcc GCC_DISP_SF_AXI_CLK>,
> > >                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > > -                     clock-names = "iface", "nrt_bus", "core";
> > > +                     clock-names = "iface", "bus", "nrt_bus", "core";
> > >
> > >                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > >                       assigned-clock-rates = <460000000>;
> > >
> >
> > --
> > Best wishes,
> > Vladimir
>
>
>
> --
> With best wishes
> Dmitry

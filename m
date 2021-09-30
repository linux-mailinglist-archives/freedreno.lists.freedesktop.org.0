Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC3741E067
	for <lists+freedreno@lfdr.de>; Thu, 30 Sep 2021 19:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8A96EC3C;
	Thu, 30 Sep 2021 17:58:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFDC6EC3C
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 17:58:27 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s69so8311380oie.13
 for <freedreno@lists.freedesktop.org>; Thu, 30 Sep 2021 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ODaJrzhlII7IaX+qlNLhzszeBmnqReAaw8HMQDA91KQ=;
 b=bTQg8VLL960aI4MFPT4bL+ziwayamEyzDehDR1iOJFMPkxj/2Nk4rKVj9YVCEdzD6b
 UrAEhn7yK+oZWFVFV9a2Vsk+1xTPbIH4KRcCLTJq6nYecBRghntzlrD0p0OATanZSj0t
 St0+87W3xKmk6mTdbO+IC0+LpfWha2ZwUXZQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ODaJrzhlII7IaX+qlNLhzszeBmnqReAaw8HMQDA91KQ=;
 b=0VKA5Gnb5fB+N7Zxw0bmiZ2SZNO9ORTCzhf6YNXDAyqSX75JU0QwsWO6XyUrUqfT+k
 0tmyXnaC502XYSsxkZXRgekYMYbJ2SETY6I/7uj3aTmREFou8RMusEUCpaD0L+Y8l+j1
 wGOi3/CnIgJa4rXvc3AtDSda0aGpvbCzzXR0c4UWaipbWAXDAzFMymc6U2MffnyPhRDi
 tgeGkQP0fG/16jVoM4E1DBwmYeZVnSSDkl2rLwKS5b/1PjEmIIJ7hstk7b9tY45IhqiM
 dDDaXW/rBak3MUPDH0+bsyGTBJx39WQPe6hCR4Jx7tZny8B9MMASxb599yMJI9C+h65j
 1+Uw==
X-Gm-Message-State: AOAM530LBxFPRmCchovG6xyVz5/ajtPrQQtb8RMCHBS+jAzq2aabWAx1
 TVjpmkzfbFReI1D7j9tGJF9pYx+GHdn1Ua67AQiMog==
X-Google-Smtp-Source: ABdhPJx0TbzSitN4I1kanbYg8IkdrXr3mPw09WhLirZ71+GW8AkE5QIIHBvLl1NRDRFk/IIUhiDGGlyQIyMalzrBWvE=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr501591oia.32.1633024707214; 
 Thu, 30 Sep 2021 10:58:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Sep 2021 10:58:26 -0700
MIME-Version: 1.0
In-Reply-To: <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
 <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
 <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 30 Sep 2021 10:58:26 -0700
Message-ID: <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
To: mkrishn@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org, 
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com, 
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/4] arm64: dts: qcom: sc7280: add
 display dt nodes
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

Quoting mkrishn@codeaurora.org (2021-09-30 04:56:59)
> On 2021-08-19 01:27, Stephen Boyd wrote:
> > Quoting Krishna Manikandan (2021-08-18 03:27:02)
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> index 53a21d0..fd7ff1c 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +
> >> +                       status = "disabled";
> >> +
> >> +                       mdp: mdp@ae01000 {
> >
> > display-controller@ae01000
>
> Stephen,
>     In the current driver code, there is a substring comparison for "mdp"
> in device node name as part of probe sequence. If "mdp" is not present
> in the node name, it will
>     return an error resulting in probe failure. Can we continue using mdp
> as nodename instead of display controller?
>

Can we fix the driver to not look for node names and look for compatible
strings instead? It took me a minute to find compare_name_mdp() in
drivers/gpu/drm/msm/msm_drv.c to understand what you're talking about.
Perhaps looking for qcom,mdp5 in there will be sufficient instead of
looking at the node name.

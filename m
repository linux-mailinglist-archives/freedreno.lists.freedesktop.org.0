Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1AB247B75
	for <lists+freedreno@lfdr.de>; Tue, 18 Aug 2020 02:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8716E156;
	Tue, 18 Aug 2020 00:24:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F086E159
 for <freedreno@lists.freedesktop.org>; Tue, 18 Aug 2020 00:24:36 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id q19so8391512pll.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Aug 2020 17:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=fIzNe6kBLkkiD888cP6x/Hi2iQ+s1AZsPih0Qi4fjZc=;
 b=IA5/pMtMp5vroeKoC6E1UoM88UwlNdVHVR28k5xmCUvR+oKpm7Qf27cSaXhCse3vky
 Cjwd30Twk5TQNDX0tLBWQO1YIxZGch6pxTP0WGflQiEKqUk9VikrGPipVoOXhQNU9uGC
 c6f0invxLMEpoZ/uvU+OO1lVPwA5CH4mgGASA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=fIzNe6kBLkkiD888cP6x/Hi2iQ+s1AZsPih0Qi4fjZc=;
 b=CyXy/acCLeFMRC2NW/wGCeGaAEpcvhYvIhzddQxLwm+OqmBuvwoyd3T9MSgvHphrkK
 jlX4dcepzKTqSAWCfIkwsW5yZcl4sY1TeyA4x8BQXCI3d95SDb+GkoJxseNbcdFJfePj
 Zf4DCcGotBGEqlncTv7MQKdEvcVdHmd7HolQJvaU43JuhBwDE9k3yXtNQKGzUzr8RRQY
 aeI6/A37QCG/D6Tkf/hvR7i7xXYnCNduwU2O9gGk7JnAxy59En2jdsa4HITXZ1Pyk6zM
 rrGgQgiykfh7Dqw/4TywmsWY55WYrk3uznPvaTxovVakpdNvcFd9APca78BwckYrdv1V
 tW9A==
X-Gm-Message-State: AOAM533HZ1UcJudgdTrRvAWUp0XMky3cKeALFRQtktA0Wsx+KnmBqj9e
 oj7lF1BvSeNoMnBGUcvAzCk61g==
X-Google-Smtp-Source: ABdhPJySOSK83lgv0VrVvSo5NN8HgXozKW5Xwsrc4v9hYedTPLRrqRuviKh2CudX25Tf3teS8OfmDw==
X-Received: by 2002:a17:90b:150:: with SMTP id
 em16mr15073789pjb.86.1597710276290; 
 Mon, 17 Aug 2020 17:24:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id l22sm18949038pjy.31.2020.08.17.17.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 17:24:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200817225300.2209-1-tanmay@codeaurora.org>
References: <20200817225300.2209-1-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>
Date: Mon, 17 Aug 2020 17:24:34 -0700
Message-ID: <159771027430.2423498.17739000479526174339@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v6] arm64: dts: qcom: sc7180: Add Display
 Port dt node
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
Cc: devicetree@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org, robdclark@gmail.com,
 seanpaul@chromium.org, abhinavk@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-08-17 15:53:00)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 31b9217bb5bf..bf2f2bb1aa79 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2440,6 +2447,71 @@ dsi_phy: dsi-phy@ae94400 {
>  
>                                 status = "disabled";
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000 {

This should come before dsi-phy and dsi node. It should be sorted by the
address (0xae90000).

> +                               status = "disabled";
> +                               compatible = "qcom,sc7180-dp";
> +
> +                               reg = <0 0x0ae90000 0 0x1400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12>;
> +
[...]
>                 };
>  
>                 dispcc: clock-controller@af00000 {
> @@ -2449,8 +2521,8 @@ dispcc: clock-controller@af00000 {
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>                                  <&dsi_phy 0>,
>                                  <&dsi_phy 1>,
> -                                <0>,
> -                                <0>;
> +                                <&msm_dp 0>,
> +                                <&msm_dp 1>;

Don't think we should apply this still because the binding will change
when the phy is split out to qmp node. Maybe just leave this part off
for now?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

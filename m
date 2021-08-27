Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3953F9D84
	for <lists+freedreno@lfdr.de>; Fri, 27 Aug 2021 19:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A007F6E996;
	Fri, 27 Aug 2021 17:19:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F7D6E996
 for <freedreno@lists.freedesktop.org>; Fri, 27 Aug 2021 17:19:11 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso8831417otp.1
 for <freedreno@lists.freedesktop.org>; Fri, 27 Aug 2021 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LUINJeVF8Mv+Qni9gSoxQ0tMUJKZ5DY+dY1yDHy05KU=;
 b=wXzAoFu3YPB/qKtRMuy9NS/vw+iY8qqKSMhL91DwkH3fx1VFILrLHQtvDJmfVw/vWt
 u0Gmea/jMmYkBs0l2KLAt0hNR6cljTmPyyig+3a8NslpVjwrpPlq/V5HKevdiWunMVAL
 5dYm2M2SZOdSfBVuIJwiptec/K/PECRi7UdwO+40h2rvwcR4JLB8PISkchwuwfkkmICf
 LMlN97nC/yJnI43xCuUk2ZX2f3sSe5el182ghH6U7YLnuVBQgALrCZERCZN1HTeZtCLz
 gE/n61OXCM0PdihuljqD6O/yjb8PoVAPYXmmW+ePkLzJ1THBUJhVV9Td6wGBA/sa2z1B
 Wjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LUINJeVF8Mv+Qni9gSoxQ0tMUJKZ5DY+dY1yDHy05KU=;
 b=VeNyZCS1cAQcH0mANepKlPlJGhhPzxDOpFTOtFMjeSRJ60w5SjW3xWOw3YsKOVXUZb
 SDwR/Q45ZLz1E4Jn1KiuyBTh/KoXuwYsc+bgR9FMgLrEQiV7YW8UdVhPw925aaRqtOH1
 CfItsYMf2DwjdrbeV3wwJTfsU/zM4Q4M9/QAmW8fTqqnM61dBarAwJDytHPoQ+prSIFU
 9eInO2l7ShmMdu5ghwSYuDRaLr6rUkyZMBzp4HunsAlafDXKGQt6aVZk2YZxkp4m7pX0
 1dYvlV/MQc/1VaZ3Kqpjmy4AIUoUCUMbA6hNd8LdyBMF1CIGlabYfYcJ+yLdAvtS3Liy
 HJUA==
X-Gm-Message-State: AOAM533Fm27B/MffAC2vFEtEN0u+8tVOefqcAogOsPe35ZKZbfBWe7zp
 cg5Sfd81BwnSV4hl5SWGY3emwQ==
X-Google-Smtp-Source: ABdhPJzpZGHJr2Nwej0U+Rd/3Jh75eu1bT9hRrxL9fP6KKzmFMhs9Syiz/V9cJhMDnuwNkWiUOuqsQ==
X-Received: by 2002:a05:6830:314b:: with SMTP id
 c11mr9064499ots.169.1630084750178; 
 Fri, 27 Aug 2021 10:19:10 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id m20sm1461021oiw.46.2021.08.27.10.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:19:09 -0700 (PDT)
Date: Fri, 27 Aug 2021 10:20:23 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, mkrishn@codeaurora.org,
 kalyan_t@codeaurora.org, rajeevny@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <YSke10cPLS9QlKKZ@ripper>
References: <1630083316-2028-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630083316-2028-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] arm64: dts: qcom: sc7280: fix display port
 phy base address offset
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

On Fri 27 Aug 09:55 PDT 2021, Kuogee Hsieh wrote:

So the order was mixed up, 0x088eaa00 got the wrong length and you got
one hardware block too many in there?

> Fixes: 9886e8fd8438 ("arm64: dts: qcom: sc7280: Add USB related nodes")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c29226b..77b0b4e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2918,15 +2918,11 @@
>  			dp_phy: dp-phy@88ea200 {
>  				reg = <0 0x088ea200 0 0x200>,
>  				      <0 0x088ea400 0 0x200>,
> -				      <0 0x088eac00 0 0x400>,
> +				      <0 0x088eaa00 0 0x200>,
>  				      <0 0x088ea600 0 0x200>,
> -				      <0 0x088ea800 0 0x200>,
> -				      <0 0x088eaa00 0 0x100>;
> +				      <0 0x088ea800 0 0x200>;
>  				#phy-cells = <0>;
>  				#clock-cells = <1>;
> -				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -				clock-names = "pipe0";
> -				clock-output-names = "usb3_phy_pipe_clk_src";

This is not "base address offset", please fix $subject.


Looking at this makes me feel that the dp-phy node was copy-pasted from
the usb3-node and that this patch corrects a copy-paste issue. Seems
like this would be an excellent thing to write in a commit message.

Thanks,
Bjorn

>  			};
>  		};
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

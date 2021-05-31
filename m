Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784EB3962A1
	for <lists+freedreno@lfdr.de>; Mon, 31 May 2021 16:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118316E93D;
	Mon, 31 May 2021 14:58:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4D66E93D
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 14:58:11 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id j75so12513989oih.10
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SknFJ3pQdKucMRHgV1sQyN7dFPet0HuZCehCboQA0AY=;
 b=A5WFHkEP14fFB5I+cbnJMBAg50o9+oCkyD7OC+ezgsSlYqN113tjqNbWlEbw9hjYaR
 IwaMuPuoCMvGi/FdtO8CvqpMJ+yzNXY6iTXAli3unRd9J2KKsH2VWmh1qUOjez326WJg
 tmD5/GEcNvGA/PXgpUIrUaRlgz29mHXjZxbI4AYk8ZlzS2NAcqUosIhAkgptMwK8kING
 Zx4QzVllmm2lATyhR9jsBXgypP9b8pm+GKwYZs10pbzXFVAMElQuMTWHojpqpBu4VIlO
 EkXSw6+MiAiMdyATJ6FSYZAyMu15x6EFb7kL6C9nkn8dOje84NVTHeKWWOa4+/QalmGh
 tgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SknFJ3pQdKucMRHgV1sQyN7dFPet0HuZCehCboQA0AY=;
 b=g12BK1VSRIN3iRwwedt4/QBMbkhKPD24z0ETSg1kiCKRk87SRxHFRpRl7LCIdeD++5
 6CLhMsakXE9r5mRYhS0vHy8wXgiSy2I2iRCdsD/1JsVKUizvhGoq8dZ4CJ2bliICJzEE
 inBZWWY841IKDJViLwQxHgJ34+cCdwbEN0Fxfkefou3GWJjR2tE96grTd/GWC7ELwE0y
 nw8x7CwGNLJYSN7uK9tm37HTT1jS70tM4x0VtZBoqA8zLO4hpUmGm5wi0MLrOfgQM01g
 Rn+TLJgZhtU1PTGrx1MgnuVH35+hKvq+toUw1VcMvLMWKvnLvqFcZWNbqLLFpjWYj7Bx
 4p/w==
X-Gm-Message-State: AOAM53112QCzmpFeM2Uyms9wTictfOP83zijhmTEf5DCdGUdWEgngBe1
 tabfobeExEjUezl0YdCLjAzj5w==
X-Google-Smtp-Source: ABdhPJwHZUdNkJg14uls6i/Ap6IYxZyXJWwt7uA1mAadjaCVt0HA9y67LACxjJDBXdg11yuPqdXXZg==
X-Received: by 2002:aca:6501:: with SMTP id m1mr17843119oim.0.1622473090719;
 Mon, 31 May 2021 07:58:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g26sm1488378ooe.15.2021.05.31.07.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 07:58:10 -0700 (PDT)
Date: Mon, 31 May 2021 09:58:08 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YLT5gGKP3lUkpmG8@builder.lan>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
 <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407150157.801210-5-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 4/4] arm64: dts: sm8250: move bus clock
 to mdp node for sm8250 target
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed 07 Apr 10:01 CDT 2021, Dmitry Baryshkov wrote:

> Move the bus clock to mdp device node,in order to facilitate bus band
> width scaling on sm8250 target.
> 
> The parent device MDSS will not vote for bus bw, instead the vote will
> be triggered by mdp device node. Since a minimum vote is required to
> turn on bus clock, move the clock node to mdp device from where the
> votes are requested.
> 

This commit message makes sense for the other commit, where you move the
"bus" into the mdp. Do you mind me changing this to:

The bus clock is voted by the DPU, so remove it from the MDSS node.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 394973e778f7..60fe2eaf06c5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2294,10 +2294,9 @@ mdss: mdss@ae00000 {
>  			power-domains = <&dispcc MDSS_GDSC>;
>  
>  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -				 <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&gcc GCC_DISP_SF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "bus", "nrt_bus", "core";
> +			clock-names = "iface", "nrt_bus", "core";
>  
>  			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>  			assigned-clock-rates = <460000000>;
> -- 
> 2.30.2
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

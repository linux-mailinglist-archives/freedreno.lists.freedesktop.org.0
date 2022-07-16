Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2AB576F96
	for <lists+freedreno@lfdr.de>; Sat, 16 Jul 2022 17:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335298AD8B;
	Sat, 16 Jul 2022 15:01:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9855B8AB66
 for <freedreno@lists.freedesktop.org>; Sat, 16 Jul 2022 15:01:15 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10c8e8d973eso12778705fac.5
 for <freedreno@lists.freedesktop.org>; Sat, 16 Jul 2022 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f3tz7nvmrPAAR/RbLohjcCYMNjuNkgsggyYfatjl8N0=;
 b=YiWcxBuOViRE9C2TQS67I+4SQqQNXu0Du8TD/CdP5T/IkfjcgiVIzaOQk4GsRZONyB
 hBHfBwShdm2mIwahbj1sBf2itVCOk3qz4dHIuupJPaLTr4cCA9RBRsFJskIaLAMBAd8Y
 tRFi/QEnIVTLqyIQtVJw9SUcqIMnW48GEdQagNbrphc2Yp1Vfb7Rwnf1genmNH1hGZwc
 e52msSV0HOqNGDigwkJYGyuDJgZ9qQA3Nz3pdqiDs8NFYPX1+6BYTCeFIruPhjSYahkG
 7w1hwRGRtSRX4rMQ17fXM/0MAPMh4hlVvlVgtuDVnRQSCVMJKdyhpNE7Gn4JBFVFAHYS
 Zp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f3tz7nvmrPAAR/RbLohjcCYMNjuNkgsggyYfatjl8N0=;
 b=OOotmv4wyPDamJV1ik6XPvO/2Go7sdJ9Zpq8BfplWraNsTw/X9EtqWQ9X66/yCHwoW
 ueO7hog91VfSQtXS9QjIs+PGcdkxULt2dV5YgGRJbrl91OwSYIpgtmOmhQrke/upC0rO
 kIbeOUY8wQAi7jApKpiphWI72XVmFgaMez6en5yU7dt4bnrpNrY1XvOL8nqiZiR7UEM3
 muehvWz3TBwL5ETsGY0fHiEerlZfPbmUUiTlfft2eorhUm66iQf5qZ0tVrOKAOSPirY0
 XDNych9wfFQMvjn9GUpkIK+eKpxkdE1QnwW0Fzj3UI9kutvEjk+lpO/N04zTXG0BSiCQ
 nK2Q==
X-Gm-Message-State: AJIora9oAHoXaufDmCIGQtHkvg8ilmK5LY1flD5nC18vXLMy7yHTRldw
 iN2bVi0WJ7QBw3iitzDVCqBuAg==
X-Google-Smtp-Source: AGRyM1tLjSavEbjob5lq7rZJRnxO6mQsgS28vxTpRXsEGIO9iCrfC5M0YSjPOt2YndJ0FtgU1AYqhA==
X-Received: by 2002:a05:6870:14cf:b0:10b:f83f:fde with SMTP id
 l15-20020a05687014cf00b0010bf83f0fdemr13662254oab.234.1657983673883; 
 Sat, 16 Jul 2022 08:01:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 w62-20020a9d3644000000b0061c4c925c87sm3045273otb.78.2022.07.16.08.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:01:13 -0700 (PDT)
Date: Sat, 16 Jul 2022 10:01:11 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YtLSt7NH4c5itRzI@builder.lan>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/9] arm64: dts: qcom: sc7280: split
 register block for DP controller
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun 10 Jul 03:41 CDT 2022, Dmitry Baryshkov wrote:

> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a3def1022ea2..e54c2000b098 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3810,7 +3810,11 @@ mdss_edp_phy: phy@aec2a00 {
>  			mdss_dp: displayport-controller@ae90000 {
>  				compatible = "qcom,sc7280-dp";
>  
> -				reg = <0 0x0ae90000 0 0x1400>;
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0xc00>,
> +				      <0 0xae91000 0 0x400>,
> +				      <0 0xae91400 0 0x400>;
>  
>  				interrupt-parent = <&mdss>;
>  				interrupts = <12>;
> -- 
> 2.35.1
> 

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C8542DE76
	for <lists+freedreno@lfdr.de>; Thu, 14 Oct 2021 17:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35506E183;
	Thu, 14 Oct 2021 15:42:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6591B6E17D
 for <freedreno@lists.freedesktop.org>; Thu, 14 Oct 2021 15:42:22 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id z126so8964376oiz.12
 for <freedreno@lists.freedesktop.org>; Thu, 14 Oct 2021 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ibfKdmBbKs8YG5Js109buSon4Qmub7UDY394dDMAH4w=;
 b=KgheEG/UXv0HI/BNZQhaEAEJT9Z5nbSCPmo6ZGo9h0lo6G4uzkobeo3/v8zD4qCRFJ
 Bncmx5JHh/YIxusm6Qxj3lv9L85DmKu7ugYRDBh7RUHkxSjJBFGlFnEOjie6fuoKTQ0d
 WB2zu+ZkQe7/aRf6vvTdQvxSKgiYNmod4P5d4b8L4wG0b+/kfQS/jfcvRyfaXKOvH+rq
 C5BtswYfDNrJo9f3tP+2CCGM0AfTCt/ZNvhS9nnHHWfst9u5eQM7mAeCNJhyKZpTU0dE
 CgKDdEqRRbDGGRRamKiZZ6bjUDoS8TJ88LuxVlyWWvmFYGnlaKOCpxXJB3qw4OQ2PwnE
 R/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ibfKdmBbKs8YG5Js109buSon4Qmub7UDY394dDMAH4w=;
 b=KG4pY06yvhRP2X32UhkCFMctm8oqsAsdqEXfSPl8ZHg3B6/jDt0miieqqFrniyVM1m
 /TXWZvUqHH+yyVbfBEODUYEospPGzMy+k+GnZbgDTlcIDRa4xxYsDeKKLfFupH55HodT
 LonJT2vZEJs8yjeeGy+IqYxuSN4HUJoSf8uHr09cxtqZk8FoQ9Njezzeet2OVdphM3Iv
 BDYUgs5xAJLpy1CVZTRJTtkQn/47uBB5qCid0ABFGaQfAWapNFzHvKdolFntx+VgmaVW
 lEItJEqWF3TVRyiwu3i0Hx5ciED3M7ybvpU1B2n7TCJAbEGgQLvmyA9h1Glrn2eB0M6K
 Uo3w==
X-Gm-Message-State: AOAM531fSVc8pfwUnMPpwujwCgK0DKnFGU9t5kBBlaOYv9GZISZyIcqc
 8jOG+alMO5U964TuDYo1oeIa3A==
X-Google-Smtp-Source: ABdhPJxI/fQjmhOiApXHpCZCw74jpPRDxZuw3p2+huSdF08a3MhSWCMRvxGCNobnB5MlHlo8kOIukg==
X-Received: by 2002:a54:401a:: with SMTP id x26mr4514908oie.117.1634226141500; 
 Thu, 14 Oct 2021 08:42:21 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id m13sm497647oou.25.2021.10.14.08.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:42:21 -0700 (PDT)
Message-ID: <298400eb-fe8d-6a92-6ff4-6188a8f3161a@kali.org>
Date: Thu, 14 Oct 2021 10:42:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Amit Pundir <amit.pundir@linaro.org>
References: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 10/14/21 8:54 AM, Dmitry Baryshkov wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
>
> This reverts commit 001ce9785c0674d913531345e86222c965fc8bf4.
>
> This upstream commit broke AOSP (post Android 12 merge) build
> on RB5. The device either silently crashes into USB crash mode
> after android boot animation or we see a blank blue screen
> with following dpu errors in dmesg:
>
> [  T444] hw recovery is not complete for ctl:3
> [  T444] [drm:dpu_encoder_phys_vid_prepare_for_kickoff:539] [dpu error]enc31 intf1 ctl 3 reset failure: -22
> [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
> [    C7] [drm:dpu_encoder_frame_done_timeout:2127] [dpu error]enc31 frame done timeout
> [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 8c15d9fed08f..d12e4cbfc852 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2590,9 +2590,10 @@
>   			power-domains = <&dispcc MDSS_GDSC>;
>   
>   			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
>   				 <&gcc GCC_DISP_SF_AXI_CLK>,
>   				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "nrt_bus", "core";
> +			clock-names = "iface", "bus", "nrt_bus", "core";
>   
>   			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>   			assigned-clock-rates = <460000000>;


Is this the correct fix for the issue?  I see those same messages on the 
Lenovo Yoga C630 every so often as well as the blue screen, however I 
see them on both 5.14 (which does not have the related commit to this), 
and in 5.15-rcX, which does.  Or does this just revert it enough that it 
doesn't occur as often?


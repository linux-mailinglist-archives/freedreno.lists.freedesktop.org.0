Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41876EB913
	for <lists+freedreno@lfdr.de>; Sat, 22 Apr 2023 14:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6B810E179;
	Sat, 22 Apr 2023 12:11:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A613E10E036
 for <freedreno@lists.freedesktop.org>; Sat, 22 Apr 2023 12:10:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso11560273e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 22 Apr 2023 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682165457; x=1684757457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XPnDF9DYM/NKDMLhSe3+ERdFQloF9vFQjHlbD109zt0=;
 b=NC5nBS9GOvTeZcG3repZOpLz3E9YKYGLizrTJ2BDD6eW2BTL5jfSVdgabcYuNCLjOM
 WW2VZxrSQwIsAWjCKE6SO2ClAaEFixljd6fDlSz7co1Y5txHKiZQk7/OnkyRzhDsTtyd
 LNvdoleCD+nUJhT75ncZESs6aeJZFlRArFHnCIWcM/oMaGx4+Ad25QFcSXC7CLrj0kdS
 SeYw4klaP90YhSK1A3kHYr4+q9dSqZLfRDw3l+ZMHlSl+RDIAHCjFh8+9/0PtUUXviQS
 9VQPGAtrSIVBRgk/Eef6z8+zsXhlygFTpsx7eh5naCThMLNbLdZ25/wgZKzu+CW/wmzl
 rZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682165457; x=1684757457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XPnDF9DYM/NKDMLhSe3+ERdFQloF9vFQjHlbD109zt0=;
 b=lsGGBA4H+YdFBTK/9KR4Dl7VwAwwEUNmF+nb7DXwbpWdRGxvzPlofBrPtmAFDeP4+1
 4ZUCekH6KiW7WwRSkudpVyRYq1u86QrQMKgx+ZuRpb/tStYe1FbmeB9/Gu/aIyaJGdcM
 5PBB0LLGLW2Bkz5WBAaqnlIIBE+PKzZbqvhEz3y+gvQ7GrvEyEmeOQ410U/qOH2sRwQ/
 RbAsgf4TbtkTIxBkxumZ9/tdTz9xewfdatS6H+rnKGPYTvSwZdsKu+UAriqSlcmKz5Yn
 p6nt/CRkZmqG7EkQgFfd6GrhggJHHgDhtiH7WIOSVhl1IrAXMZhFpde3BtP7K8WaZb3u
 KX4A==
X-Gm-Message-State: AAQBX9cb1Sqb6FYJQPh6xEyOosbnt9eEcvHGJ9lPuT/AJgmyp6f2bA5B
 E1IpVowepMQGxJ83TjseGA4ouQ==
X-Google-Smtp-Source: AKy350b+41OQZx0jt34QgFSz8mpHAcQA7Q4IfXLOTt1Aty4YMRkKmMvzXO8PsN8Eud0T9Lm1G0kumw==
X-Received: by 2002:a05:6512:3e16:b0:4eb:41ac:e33 with SMTP id
 i22-20020a0565123e1600b004eb41ac0e33mr3783203lfv.19.1682165457203; 
 Sat, 22 Apr 2023 05:10:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056512014c00b004eed4c80b55sm866517lfo.156.2023.04.22.05.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 05:10:56 -0700 (PDT)
Message-ID: <01d06e66-9535-cb4c-6ea8-102f8b16f8b8@linaro.org>
Date: Sat, 22 Apr 2023 14:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-4-176479fb2fce@freebox.fr>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-4-176479fb2fce@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/4] arm64: dts: qcom: msm8998: add hdmi cec
 pinctrl nodes
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 18.04.2023 20:10, Arnaud Vrac wrote:
> HDMI is not enabled yet on msm8998 so the pinctrl nodes are not
> used.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
Are they supposed to be identical?

Konrad
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index b150437a83558..fb4aa376ef117 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1312,6 +1312,20 @@ blsp2_i2c6_sleep: blsp2-i2c6-sleep-state {
>  				drive-strength = <2>;
>  				bias-pull-up;
>  			};
> +
> +			hdmi_cec_default: hdmi-cec-default-state {
> +				pins = "gpio31";
> +				function = "hdmi_cec";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			hdmi_cec_sleep: hdmi-cec-sleep-state {
> +				pins = "gpio31";
> +				function = "hdmi_cec";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  		};
>  
>  		remoteproc_mss: remoteproc@4080000 {
> 

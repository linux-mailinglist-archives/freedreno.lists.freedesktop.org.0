Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A67D629AE4
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 14:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF58910E3FE;
	Tue, 15 Nov 2022 13:44:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2B010E3F6
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 13:44:24 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id r12so24485442lfp.1
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rdaHmrZopow0cZrS7QRhB/XmFkl/A5fmUKYPPGyHrPQ=;
 b=ycizX72uD0PnQmkCOgJqAakMV2BZT7P/463tJ48Di3wgsFQuRWUW5BbRx5OScawtiB
 RIqqRnnWzGAdh7G81shiXKHpxIwOspFS8e6VJSVJFu7FALGX2tT7HADcaoCwHYMa1Xt5
 a8cPAQTbMJyeKfZFl8zdn9LV+ch5IZMEBgPeiGzVceiKzscwkdDkYr9sb2pY0+W0doyB
 5X4JA2EaOjA9vhFQfUqL6UB+rKaPY+R0//XOmJjKyI8c+mYexXEcIWr6G1oA7V5ao27h
 L4W38YOvFj5a7m7/KMZl53EwN6USaEN1Lk1YNj/H7IwbzKOqi3cbXA1a5HEGFeeY+DQ9
 sKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rdaHmrZopow0cZrS7QRhB/XmFkl/A5fmUKYPPGyHrPQ=;
 b=Idbplse7g08Q9ajjQZRC36mT6RsqtiZKBfx341QcfRfSyPIE80T8WvkTzGoEy/+Tou
 6dvsSyWI1tvUZHREb/dRII0UpO6qxXvo5SoNin0f3f1cpA5Nngp2+1lshXtsVTcETavF
 x5gb1CZ4VIEeIefuhkWQtUsqCv0BY089J9VwuEYgJjeX7kpnTFz2+3oo4RvMnoWeu3iJ
 GN6K87ZFoxDBPOEjHthsmXKJBpPjYq7+2GIw/AdA32t4azG2xETwcJsPQbV9zB4xQCkY
 4WI0mTArU2hvWD36exaOZWucFfNWjRgZJwt9gseBuvhSAIY9flv/abyERaRjCfVTRrau
 5OUA==
X-Gm-Message-State: ANoB5plJex8drFFhZg2ssd7ldLwEGBJoCIF+KKXJZgiKyHlXg3/rCKye
 KjUJ+2zUZcB/OxxkM92SCnwWOQ==
X-Google-Smtp-Source: AA0mqf7gFOTN3V/Hzzq2wgjXL7xVmz53u/5hppb8CWem6NjgH646duFocYVW9tk/Vyy7OF99ZPKYjw==
X-Received: by 2002:ac2:41d4:0:b0:4a2:4d53:8294 with SMTP id
 d20-20020ac241d4000000b004a24d538294mr5110012lfi.263.1668519862567; 
 Tue, 15 Nov 2022 05:44:22 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 s13-20020ac25c4d000000b004a91d1b3070sm2207716lfp.308.2022.11.15.05.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:44:22 -0800 (PST)
Message-ID: <c4db1802-9aac-7fd6-605d-cac4b62b25d9@linaro.org>
Date: Tue, 15 Nov 2022 14:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-9-robert.foss@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115133105.980877-9-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 08/12] arm64: dts: qcom: sm8350: Remove
 mmxc power-domain-name
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



On 15/11/2022 14:31, Robert Foss wrote:
> The mmxc power-domain-name is not required, and is not
> used by either earlier or later SoC versions (sm8250 / sm8450).
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index cbd48f248df4..805d53d91952 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2558,7 +2558,6 @@ dispcc: clock-controller@af00000 {
>   			#power-domain-cells = <1>;
>   
>   			power-domains = <&rpmhpd SM8350_MMCX>;
> -			power-domain-names = "mmcx";
>   		};
>   
>   		adsp: remoteproc@17300000 {

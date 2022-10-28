Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917D611D1D
	for <lists+freedreno@lfdr.de>; Sat, 29 Oct 2022 00:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30EA10E8EB;
	Fri, 28 Oct 2022 22:03:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C99110E8EA
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 22:03:17 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id d13so4380774qko.5
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 15:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JEh1m2BZsGPhLegWl0gI6K0SksICnbu5WCO4CkZ7SZk=;
 b=iE2tyRua7hVzAgJU0AOezFIvb6TZDPJ6VKUc5wp+v6b3b6bkutzeyAx7RK+dUY20eW
 Fkhu3wmRBT3HgfhLdAj+oA/cxL602LVDLS4yf2/KX66HwRRIxCJfEczlUOmx1fZ1RN3D
 2JgCU4HW5mpEJV9D20hzgBpEBWFcJC8aRi2X7zOJRKzNfktPm8myGxKXqpvaH1b03CAf
 ROP6ZbS/Pi9LudbS/GoxMADywODGedJhyEEWR78ZcF756lb6AW6MDglWYRNg4kc3aELx
 J2dy+C+6/SfWmVTyadbHNvZYoj5O2fhHzW3fgO4a5rdmfMB0Ia74FA3o1J/r4IJVBinl
 pPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JEh1m2BZsGPhLegWl0gI6K0SksICnbu5WCO4CkZ7SZk=;
 b=7eqpDaOu1iX1GqDSkl8ZUs0eBzzHAwkL0kiN/jpBN9EUbN0jdyuRtzdYQDSNqxjgci
 2nRQo5kMOjvLCTQ/7BPTag7CldGYFko8ou4xuPETThceyeA1z+gr/6Qu4oIYZihfF7BX
 HNSTKlX9SUZduGm0YoVWpcs8ycT4hskGm0Ujj785M5atm8OvO+ryWYp1igDhoOfGobmM
 xjHE1YRgIahQuG674odf4lwJcig/N0sgD19MtF9+Z9uI6nHJm5wZ2LnSNCUv46KMrL3T
 02vErc3l8IkXz9C8q5TEiIUy+yM9h7T5gA7Df+gb6jAEUjjSTgcQavbBPeA0ZbprQ5+d
 2ScA==
X-Gm-Message-State: ACrzQf0KelUaw6ttvCalPkdqE4ps7frL4lYviyAoI8+p6RziQiEnDFzg
 QnSP/1bLvaFDwcrDu7wBD42h3g==
X-Google-Smtp-Source: AMsMyM4w5sAgV/4A4vdJFca6Nzd/ep28S3kElmPq1FpynnhrFrhjL8xYOXuVz2Rtf4HQ6enD2yiZFg==
X-Received: by 2002:a37:f50b:0:b0:6fa:12f2:974c with SMTP id
 l11-20020a37f50b000000b006fa12f2974cmr698344qkk.171.1666994596489; 
 Fri, 28 Oct 2022 15:03:16 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05620a24c800b006ce515196a7sm3787913qkn.8.2022.10.28.15.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:03:15 -0700 (PDT)
Message-ID: <eeeefa55-1782-2768-8d47-0f315ed9888b@linaro.org>
Date: Fri, 28 Oct 2022 18:03:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-9-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028120812.339100-9-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 8/9] arm64: dts: qcom: sm8350-hdk: Enable
 display & dsi nodes
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

On 28/10/2022 08:08, Robert Foss wrote:
> Enable the display subsystem and the dsi0 output for
> the sm8350-hdk board.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index e6deb08c6da0..6e07feb4b3b2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -213,10 +213,32 @@ &cdsp {
>  	firmware-name = "qcom/sm8350/cdsp.mbn";
>  };
>  
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&dsi0 {
> +	status = "okay";

Status is the last property.


Best regards,
Krzysztof


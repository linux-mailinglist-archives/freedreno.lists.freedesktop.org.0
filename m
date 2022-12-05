Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CCE642D79
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 17:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297FF10E25C;
	Mon,  5 Dec 2022 16:47:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CC610E25C
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 16:47:46 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id b9so14211372ljr.5
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yfNcDnQIXBHvzHnGf+xJsMK1hqs+Kpeg/edf77EtziQ=;
 b=UIGQUtI/FGywg/wlQU+zKDxWrRAkK023sHkOnS7/ALTtpFIWWf19eQdLPoWuPIdKyq
 8J/cW6tgPj2s0u0bwV6IGCWpvypx6U38/vETtt9Fd19GYmMBip0+n4+YePyRdPdUel1E
 e8sBp1kt6Zhsl69Mf8pPEhDj8OV4ZLS0G01O4rehEr7c+CHFoxsFObn2RBf+Rcm3HaRz
 oobM2WUo0XNw+8LmuuTAQLP4VyGULFVDvoO/dX0ZTfC54TFkYdzUdZXgWQIlVdE21jO7
 ULXoF7vi5lA3qA/nF9vbgvb7UU5cwCrlgbJzKmsvyU7GK0PXazGKQ5dETXqvgHhAawC5
 9b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfNcDnQIXBHvzHnGf+xJsMK1hqs+Kpeg/edf77EtziQ=;
 b=a84iqefrR7Y3MSLJrzQ4CzDMQGpyAfIqDqx0HgNokhyGw3J8AR2fQMNvDuS3OGxPvd
 EgPfuKcdoV7J80nMo5Omi0lNFobb3RbUeJ6D4loZBlFzMNYvnZRrqrBD/h5yjjOXdhdM
 E0qtewXH4PQgkTAvkKFbLx63Z5NveWqm4qJkUeVf9VSs8Fgrg5RkGl1xrV0GHIYU9NCy
 F9hpjdLDLcmpQkGsEDC2cHUkXxy6fzvFWaBjqOFQ+D+H2aYc4009Ha5WT/6tl9TFQ3at
 6v/8JkwG6pMhHk+1LwAHMhiASGX9VXfVGUxZsjjvEAPZ0pD6HxoLB913VBdbDAAzxz44
 ECDA==
X-Gm-Message-State: ANoB5pnYe0zgssBH9SHL6Zei3zugm1kDVrYMn9RzS9mdQgfJMkf+8G7d
 QaJRRte7eop/5OaBwKUzYiJ9sg==
X-Google-Smtp-Source: AA0mqf7iCfiosfAZqR500ANFZIqlekk62mqbnXBK8wPLMhjHsxiCQZZ6tfr5879JzOo6Wsi50/R4+Q==
X-Received: by 2002:a2e:bd81:0:b0:26f:9736:bd5f with SMTP id
 o1-20020a2ebd81000000b0026f9736bd5fmr25412078ljq.285.1670258865301; 
 Mon, 05 Dec 2022 08:47:45 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05651236c100b004b56bebdc4esm711999lfs.14.2022.12.05.08.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 08:47:44 -0800 (PST)
Message-ID: <ed8c6ca2-e4e1-52f5-0858-8c774819dd73@linaro.org>
Date: Mon, 5 Dec 2022 17:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-12-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205163754.221139-12-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 11/11] arm64: dts: qcom: sm8350-hdk:
 Enable lt9611uxc dsi-hdmi bridge
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

On 05/12/2022 17:37, Robert Foss wrote:
> The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> 
> In order to toggle the board to enable the HDMI output,
> switch #7 & #8 on the rightmost multi-switch package have
> to be toggled to On.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> +
>  &slpi {
>  	status = "okay";
>  	firmware-name = "qcom/sm8350/slpi.mbn";
> @@ -544,4 +633,20 @@ usb_hub_enabled_state: usb-hub-enabled-state {
>  		drive-strength = <2>;
>  		output-low;
>  	};
> +
> +	lt9611_state: lt9611-state {
> +		lt9611_rst_pin {

No underscores in node names.

> +			pins = "gpio48";
> +			function = "normal";
> +
> +			output-high;
> +			input-disable;
> +		};
> +
> +		lt9611_irq_pin {

Ditto

> +			pins = "gpio50";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +	};
>  };

Best regards,
Krzysztof


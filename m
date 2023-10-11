Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88857C4D4B
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 10:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A8910E23E;
	Wed, 11 Oct 2023 08:34:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A6010E23E
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 08:34:40 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-503397ee920so8299014e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697013279; x=1697618079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=FKjNKmVwLteJ2rdG4Wdm/YqXtcBPxrCX3IBRkzT5D44=;
 b=mzuKACvNorVchNG9fvJazPbhcjo1i3HtGmz4Gnu0qkY13m+yY6+mROMVGBEjX/nDrq
 z7+wW/V9Uf33Fw3TC/T4n5kar7YKdafbCkyLvPSaVUpNYF5wZrtbArvF4hY/Vdh1lziY
 XfYBBmKjdRrWdImbI4nXzZxOagUQdclzR0+YEFbAmmGb+h0xBjT5xA0pPJUQcDuqXAiq
 18zsL2jR4LIaBz24eQje89GiXHnJJw8qCDFRkIn05t3lK87kJwKZaWh+m8wtMFQHgV0e
 tcRvunXoM1a7af5qtLB8JWP/jXoPoXz+kTzMWgpUFMGlfoECAxOufswju+KtevQDkuBq
 10wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697013279; x=1697618079;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FKjNKmVwLteJ2rdG4Wdm/YqXtcBPxrCX3IBRkzT5D44=;
 b=aSM66SZzhlMn/uyRc3uVCRXivAj9mWSJ5epq6WCDo3RH1eZw2vJWDyupz9O7mFSByC
 Wx6sT8IbouHCNr1Hrg6NUWodBoCSGTFLCWJluSzChKXsD97xoVePXhNZlXbQiupkRfFo
 tfUPiw58byLd4RXC1VU9vzTgTL9+pRfeQJzU8y7O9LSNeVh3Q2+OQwsVaE9m+UlMcX+f
 w9jHEAtvDSbrzhMIc2IjJZ6QXcN9HVR7zXC6rz9g0mPSSkT4b/UJ4T7M1BTo3XeyQGK5
 zmcz1abrMLYFtIH5L5KphRVpkRQlUJS9f81Q7PFhNglJjq0JymqZdxy3nlc9c8eLRP/+
 MdNw==
X-Gm-Message-State: AOJu0YwmTlhDGDcaGujDBbCxHaoEJwJ3eOznQsLzYn50VgvcPus5LSFt
 0XOoBPKoh2NztbNTEKsaCxYRUg==
X-Google-Smtp-Source: AGHT+IEZ+xF7gk+iiMVaYujK7+HvKygwHOtNr4X6sKuh1VeAOiudExW5SBYVdPOvx4vKD+tuVThMIA==
X-Received: by 2002:a19:4f4d:0:b0:503:2683:ec7b with SMTP id
 a13-20020a194f4d000000b005032683ec7bmr15734530lfk.33.1697013278872; 
 Wed, 11 Oct 2023 01:34:38 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 v3-20020adfa1c3000000b0032d8354fb43sm1523507wrv.76.2023.10.11.01.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 01:34:38 -0700 (PDT)
Message-ID: <f7ec06f9-7c03-4614-9b3b-d09dad0c6c46@linaro.org>
Date: Wed, 11 Oct 2023 10:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] soc: qcom: pmic_glink: fix connector type
 to be DisplayPort
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/10/2023 00:52, Dmitry Baryshkov wrote:
> As it was pointed out by Simon Ser, the DRM_MODE_CONNECTOR_USB connector
> is reserved for the GUD devices. Other drivers (i915, amdgpu) use
> DRM_MODE_CONNECTOR_DisplayPort even if the DP stream is handled by the
> USB-C altmode. While we are still working on implementing the proper way
> to let userspace know that the DP is wrapped into USB-C, change
> connector type to be DRM_MODE_CONNECTOR_DisplayPort.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 9569d999391d..6f8b2f7ae3cc 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -467,7 +467,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>   		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
>   		alt_port->bridge.of_node = to_of_node(fwnode);
>   		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
> -		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
> +		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>   
>   		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
>   		if (ret) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

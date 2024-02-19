Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F72A859F0F
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 10:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5D010E15F;
	Mon, 19 Feb 2024 09:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CFelVz7Y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A313710E15F
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 09:03:40 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4125df3c40aso14245315e9.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708333419; x=1708938219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=gF7sGDk1x24G6RZbBVHNrWjV9qvXDZGdRDsrtRvQq9E=;
 b=CFelVz7YOSsfwf8OgMfc50wVHXbqqgUa4+eFSbOaO5dB3Oi43evsET1oRc7Hnhs/BF
 xbCqH3y2ENrOBs9wnz+feyQcP4GSytRlyM/pqAUJ37sq5cC6LmciGnyjoZ2xnDHW0tuv
 Lt3ZIXrOUHvQIiftBX+LSHh9+l+GCi17Djqoz7rpJ3eB84f09MudsxGVYcnKdAbbXGeg
 b69PidDE3jVZs4BtEAGGInXd3mRrA5s1hNcckK3qcjej/Ik87Sdx62SgT/yxilffu3Yw
 aw+a723zGhTImZRuwXVP4XDqs/fc5Dve5G1PgJNNfcrd/pVpRELoF8ANuJOU694HHYw7
 VnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708333419; x=1708938219;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gF7sGDk1x24G6RZbBVHNrWjV9qvXDZGdRDsrtRvQq9E=;
 b=m0KnIB3vBz126M6EX9p730yKVcoQT7bIzCX2hraqE0fgDWrG0FAMmwj+DennHChS8C
 AW8LUWWAsJOkstxBS70jhy1sHUpur7/GoBDXsMVuD0aC7fvXCiu33/fRaOAEmodGB6FZ
 YYyFaXfE3L/KVqoYHlVtW/N7Wh78nHEixc+Uwp/f1ixXBIBGV5J0ueMG/UrJqRsZ/2X9
 sN9q3hVHR49lA5W4RsnRjsD8zIAoWTYFHBJuIcGA2BZowtQAjnjZ8R6TjnCkyqz52IkM
 ckzemw0oHIqnm5SUgi+R6KQpiIsazPPs/twaFIrXmMCR5Jz/0jL8P4gO4x3WlH8PkBvi
 pRNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq8JxF7qkBvau70meNiaNAwwA3/Nk3FyzanGhg2F9lh8hid7I0OGjkhUqlQ9KDjuEDgjnQq44OjjyWkcSQ4tN/6VIvyE89CbpnWAxi03My
X-Gm-Message-State: AOJu0Yxe2NQkrHey9jdEjsRMTg6mc9HUhQg/aBta58YoP2cWxv82nMsC
 ZUayvhJdn6qcoqrz5soAK7l04jj0jt9xGVj3rMKSzxwjUh2rkHWPN8pdPtcNGqo=
X-Google-Smtp-Source: AGHT+IHeW4FAyqvBoHaZHyX8ohtq5iNNLDp8u7VcW4ZWJqvxtsgUI3BYpUKh1ifXeE1GS2yUvTjqBg==
X-Received: by 2002:a5d:588f:0:b0:33d:2b3d:b598 with SMTP id
 n15-20020a5d588f000000b0033d2b3db598mr4141771wrf.70.1708333418779; 
 Mon, 19 Feb 2024 01:03:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f?
 ([2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adff801000000b0033d01fe1f04sm9722957wrp.55.2024.02.19.01.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 01:03:38 -0800 (PST)
Message-ID: <c86594cd-f32d-4b66-8459-9045640aa928@linaro.org>
Date: Mon, 19 Feb 2024 10:03:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] phy: qcom-qmp-combo: fix drm bridge registration
Content-Language: en-US, fr
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 stable@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-6-johan+linaro@kernel.org>
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
In-Reply-To: <20240217150228.5788-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/02/2024 16:02, Johan Hovold wrote:
> Due to a long-standing issue in driver core, drivers may not probe defer
> after having registered child devices to avoid triggering a probe
> deferral loop (see fbc35b45f9f6 ("Add documentation on meaning of
> -EPROBE_DEFER")).
> 
> This could potentially also trigger a bug in the DRM bridge
> implementation which does not expect bridges to go away even if device
> links may avoid triggering this (when enabled).
> 
> Move registration of the DRM aux bridge to after looking up clocks and
> other resources.
> 
> Note that PHY creation can in theory also trigger a probe deferral when
> a 'phy' supply is used. This does not seem to affect the QMP PHY driver
> but the PHY subsystem should be reworked to address this (i.e. by
> separating initialisation and registration of the PHY).
> 
> Fixes: 35921910bbd0 ("phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE")
> Fixes: 1904c3f578dc ("phy: qcom-qmp-combo: Introduce drm_bridge")
> Cc: stable@vger.kernel.org      # 6.5
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 1ad10110dd25..e19d6a084f10 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3566,10 +3566,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	ret = drm_aux_bridge_register(dev);
> -	if (ret)
> -		return ret;
> -
>   	/* Check for legacy binding with child nodes. */
>   	usb_np = of_get_child_by_name(dev->of_node, "usb3-phy");
>   	if (usb_np) {
> @@ -3589,6 +3585,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_node_put;
>   
> +	ret = drm_aux_bridge_register(dev);
> +	if (ret)
> +		goto err_node_put;
> +
>   	pm_runtime_set_active(dev);
>   	ret = devm_pm_runtime_enable(dev);
>   	if (ret)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

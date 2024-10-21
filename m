Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34D9A5D08
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 09:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562AD10E430;
	Mon, 21 Oct 2024 07:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KQO5qKMP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A996110E425
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 07:29:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so45473765e9.3
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 00:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729495795; x=1730100595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YNOZqddaoOrk8/x4u3nq9GdRCqUuOFLmAqZeR4UqCCw=;
 b=KQO5qKMPFyfeBZZ6IJZcZ3jNwyX+BM1fJFLU2VqbDLeHT5XeRBT7FCU6LRiS4RkJmY
 nEUHsT1qKZPwnZEl54MKwEASCu/dC7RQwarvp9qRFp2H/KIIItGjGvOhB37+Tzi3PM77
 GNF85sMo+cYesMKhBM8jQ2h1g/WrclAaEUjWZQEpD6t4c8iy5+SSdw7QOxWOcqgT7QgY
 LkWX4C6syKIuxYEq7gg7amrv6HV17rxM8HZVb5Xd4InM4HaLHD9NhfopNHvz+E/ZI5Lh
 vOyIwu7Hj1MDi967P2NhVoIYlGlXA5AkBwDrAuMVgBg4+PWb+LjseThQP8we5SZuushn
 6Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729495795; x=1730100595;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YNOZqddaoOrk8/x4u3nq9GdRCqUuOFLmAqZeR4UqCCw=;
 b=o7uYkeBZq9y6KR8/vl2cnXOEuhngvWQveFdIfbfhTK4tn/N/5n0dttSPjPUfJx0/Nu
 VZudPg3Chog1uMJIVPr7LRZkuxmIh0wU+pvn9gAF5RPvW9RAdXDUICCm8zbaxw7HIVFO
 5CLbhsuv8ZqZUkbhXcYbfNBzMuRIFNjzL7SxaThJ4AitWBZ4Lu6m9UyL+W6e1rHN8xTk
 kpoXBQ2ye3BuDIvpmyqTF3c2QlI3T34xOD/Qn9MyIgLBImFdKiUVrGykzRzZL/7FKFZy
 H1uQ+g633GEmb7ZglyW3sXpb/Cr1pDoAUTfk8yKeHu19UGc7+hGS0bEjSTSQfcdiT9ip
 4lTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBstN84TjHJMIi+jOBViq0UxyP5pQOvRMpY5L6ff1kmXAzTo5iNh1d3rgdTrjiLa6fr99R0NAIVyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrB0plR9FtcNF7nYsndk2/ESsa1xmUTpo+cr0XJB+ygxqcONK2
 s/p9/b1+IjRuCU8U61M9H9bYOsA5etNCQCfH780pmYw6ak3KMVBkcf1fNcJQaMQ=
X-Google-Smtp-Source: AGHT+IFJuoUGb5krhAn5cqCgAJnC/ljP9vnIC3rDFQBRXtRPQG7LFSg4zpy9bDNhkNTbxSQjbnPvqQ==
X-Received: by 2002:a05:600c:1d04:b0:431:1a98:cb40 with SMTP id
 5b1f17b1804b1-43161667bddmr62590085e9.18.1729495794803; 
 Mon, 21 Oct 2024 00:29:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97?
 ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5709efsm47712795e9.10.2024.10.21.00.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 00:29:54 -0700 (PDT)
Message-ID: <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
Date: Mon, 21 Oct 2024 09:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
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

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
> bridges in the chain still might limit YCbCr 420 support on the
> corresponding connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/display-connector.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index ab8e00baf3f1..aab9ce7be94c 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
>   	/* All the supported connector types support interlaced modes. */
>   	conn->bridge.interlace_allowed = true;
>   
> +	if (type == DRM_MODE_CONNECTOR_HDMIA ||
> +	    type == DRM_MODE_CONNECTOR_DisplayPort)
> +		conn->bridge.ycbcr_420_allowed = true;
> +
>   	/* Get the optional connector label. */
>   	of_property_read_string(pdev->dev.of_node, "label", &label);
>   
> 

I think we should make sure all HDMI bridges can filter out 420 before
landing this, no ?

Neil

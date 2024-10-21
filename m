Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4062D9A688A
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 14:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8CD10E4C4;
	Mon, 21 Oct 2024 12:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ebpvAms2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890D410E4C9
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 12:32:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so43261565e9.0
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513963; x=1730118763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xK977l4SMZlVVZ120SxoAqshGqpipjnvBMfJGymAJIY=;
 b=ebpvAms2Mj4wO88WtSkqrGGu6zamLc4l6j2PZjUAZBGJOZvh+LZB0Syr5Hydo/El/G
 bvQ2sX+uJcntE5FAt+otLtSL2NdX5mD+LCYFCN7EuhST0w01QKPVSpJjKOpN552dgIRn
 ACJWXJpWipE/DYcjfVcX1Oym6Qc+ZpURmvBkLMLomt0HwijkKzPYdMmQHL80kJJ/HvZD
 eczx4UjnRk0GgpHFuv4+Xkgy+/q1OBHtANyxbFI8Eaq7sBxWXY+KEUPOdrTY5eCzZ87r
 u9JFR0Ywv0kghlh+XUmHZh4iBPDQD/u8S031KkZPFxzSQI8g5QXM1NHHEgr8l8KEm7FD
 lHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513963; x=1730118763;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xK977l4SMZlVVZ120SxoAqshGqpipjnvBMfJGymAJIY=;
 b=iz/tyoy0BomEU7Qm6LQt9YzbEcKQMAIMcDhqmQAHKbtgYM5esmSrpAhOni0zronKcI
 XzTXZ0zsPRCUC4/l+3bAL0LD9enIw3zXiLlJ/tnfD7WaKDbqAxUWeDOx8y8Np7eV0AAy
 QfXkH7ajIbMD1itnku8KHEtlxDkjlXph4LE9YdIzE4YXpYWu5eX+wlX/rYgaECWlbTya
 s/qRfIkpuo2Pz2EEhaMLRw8QKLZTyMf9ZhjpqMEX8nibhdBvxOogTgrq/D+fGpuv+cV5
 BpsbhVqcL+GSXe6mAwjor4r2NXzA0fMoVzRmjq4mNba/O02F8jUtK20RhwPx/rH7ny1M
 QUpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWjXrsumGxYJfBqGjdz59QiWNCuRKXbpD7poliU5SnbOUKBRbedMIkqIiVSJL0V3xPdnnQrrzvGdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5mPVFy9R4ycbJiABOyEjgr1pXfgoHWwqcjKAAxtG1CYg8c0hm
 ONBrqf53EbxozXaN5FS4i8l9xJU5hdJTVcs8a/hiwVqbvsZh5hI7/02vJA8NnZY=
X-Google-Smtp-Source: AGHT+IEF5fcgC6ODgI4jJBJx2i1qOREjjBxmOShJ8ylB9dd5vueXyrRW5QKR45FnVPpf8X+wIJuZhg==
X-Received: by 2002:adf:ec8a:0:b0:37d:4ef1:1820 with SMTP id
 ffacd0b85a97d-37eb487c281mr7320360f8f.40.1729513962869; 
 Mon, 21 Oct 2024 05:32:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97?
 ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a587f4sm4249896f8f.52.2024.10.21.05.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 05:32:42 -0700 (PDT)
Message-ID: <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
Date: Mon, 21 Oct 2024 14:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
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
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
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

Hi,

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> One of the features that drm_bridge_connector can't handle currently is
> setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> the drm_bridge struct and propagate it to the drm_connector as AND of
> all flags in the bridge chain.
> 
> As an example of the conversion, enable the flag on the DW HDMI bridge,
> MSM DP bridge, display connector drivers (for DisplayPort and HDMI
> outputs) and AUX bridges.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (6):
>        drm/display: bridge_connector: handle ycbcr_420_allowed
>        drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
>        drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
>        drm/bridge: aux: allow interlaced and YCbCr 420 output
>        drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge

How do you plan to merge this serie ?

>        drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag
> 
>   drivers/gpu/drm/bridge/aux-bridge.c            |  4 ++++
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c        |  4 ++++
>   drivers/gpu/drm/bridge/display-connector.c     |  4 ++++
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c      |  3 +++
>   drivers/gpu/drm/display/drm_bridge_connector.c |  6 ++++--
>   drivers/gpu/drm/drm_atomic.c                   |  2 ++
>   drivers/gpu/drm/msm/dp/dp_display.c            |  4 ++--
>   drivers/gpu/drm/msm/dp/dp_drm.c                | 10 ++++------
>   drivers/gpu/drm/msm/dp/dp_drm.h                |  7 ++++---
>   include/drm/drm_bridge.h                       |  5 +++++
>   10 files changed, 36 insertions(+), 13 deletions(-)
> ---
> base-commit: 7f796de9da37b78e05edde94ebc7e3f9ee53b3b4
> change-id: 20241018-bridge-yuv420-aab94d4575de
> 
> Best regards,

Neil

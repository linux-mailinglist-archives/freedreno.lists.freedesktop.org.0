Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65088D1596
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2024 09:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7AF10EA7C;
	Tue, 28 May 2024 07:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BuZ7WyKR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0B110E9F1
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2024 07:56:52 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42101a2ac2cso3752985e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2024 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716883010; x=1717487810; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KCjfHPIMT5wUou0t8i9b0QJfs+bLamMmZgWIm/rkFmM=;
 b=BuZ7WyKR9JJEud4cPx17ltRfQv6aWrGUniUu3YQv0M5jwuo9ntorj04hff9mZdnKN0
 Iq8NoPeXMlsMNgu/17tsOt4PqxwPKFM3u5tLKi2urnzGdKEo0focbnpanul1F8ucMHKg
 vRc57D5h6AHKgfMS606pF7NMHcWk3R5osp7tWlbY79DGdKuNOgMKubFAhuU+rscVFDEs
 Gh3eL4RscKFLq74k/u1iylSFVqh4ysX6gwL6KXUKtP9ufWMSLFVaCl/4NIqYR2vjiHsE
 dqRA5jszJnHZSCnXzCZqVEb1n7LcoFBJXg4lCfTa+RrJ3+FxgBMQs89cxBcxHDf/vGDh
 hTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716883010; x=1717487810;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KCjfHPIMT5wUou0t8i9b0QJfs+bLamMmZgWIm/rkFmM=;
 b=NFOvZ5MJaxdpQ3G/0Gdtfv74/12giznGnSJSbSYvSAHtSF+4t5VRGaMu7ycgM1WIkc
 kxl8uU5zJEnp8TVa8BEeL+wHgFNCmjLbbV398BtQnggY0NZmQULSpQRmn12hd2YpqO9k
 rSB6vsKBOXS27bGPRGpOYLavEb15useAE/csyIp98KOhvjb5PKUY0DDp0SOnUN4dTCQI
 eiXxStUfcNJhKsayL2k0GF1U4Xz0N2XMyNU49Jn7E6jMKphjNV43de6zg7LGvvbYG38T
 T52JfzrQ71HLUtmtVh570Poqgtb7AIyAzBI/rjZTi3qwklhWecBbn3NrcVgU7iR0U7HT
 lGFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7f7GI0z9qs/v8nhYcj+joxt6DvxhfCbcBei0vaZaPmy9mnBHESLZWu7l31nDd19tjB++/KwfYeTdNyK4U30tYDk3t/PlwqoyLEHe2o0D0
X-Gm-Message-State: AOJu0YxJUov9/YKptMANBHfth/IIpfiPLRkSIFLf2FTMNKHNTu7w5HAh
 aLleGg5UoIp5l1gmKoaKIIGFCgi0YRfmDpG3fYSDZgYDH8c5jGhEQFdNi/ogQ4M=
X-Google-Smtp-Source: AGHT+IEvsSaSRUS9z739pDAh0FjrjH3txLuBAGvYd1RJEBQ7yTIpgIeSfP/iRhvitjp+ztGPhdS87w==
X-Received: by 2002:a05:600c:5641:b0:41b:85bf:f3a8 with SMTP id
 5b1f17b1804b1-42108a0ba39mr101583065e9.35.1716883010189; 
 Tue, 28 May 2024 00:56:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f19:f965:3f93:6385?
 ([2a01:e0a:982:cbb0:8f19:f965:3f93:6385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100f163a8sm164159405e9.13.2024.05.28.00.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 00:56:49 -0700 (PDT)
Message-ID: <e8268cf2-16e1-4903-9dc5-9377a9be7d0e@linaro.org>
Date: Tue, 28 May 2024 09:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 0/6] Add DSC support to DSI video panel
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
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
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
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

On 27/05/2024 16:21, Jun Nie wrote:
> This is follow up update to Jonathan's patch set.
> 
> Changes vs V4:
> - Polish width calculation with helper function
> - Split cfg2 compression bit into another patch
> 
> Changes vs V3:
> - Rebase to latest msm-next-lumag branch.
> - Drop the slice_per_pkt change as it does impact basic DSC feature.
> - Remove change in generated dsi header
> - update DSC compressed width calculation with bpp and bpc
> - split wide bus impact on width into another patch
> - rename patch tile of VIDEO_COMPRESSION_MODE_CTRL_WC change
> - Polish warning usage
> - Add tags from reviewers
> 
> Changes vs V2:
> - Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
> latest mainline code.
> - Drop the bonded DSI patch as I do not have device to test it.
> - Address comments from version 2.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
> Changes in v5:
> - Link to v4: https://lore.kernel.org/r/20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org
> 
> ---
> Jonathan Marek (4):
>        drm/msm/dpu: fix video mode DSC for DSI
>        drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
>        drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
>        drm/msm/dsi: add a comment to explain pkt_per_line encoding
> 
> Jun Nie (2):
>        drm/msm/dpu: adjust data width for widen bus case
>        drm/msm/dpu: enable compression bit in cfg2 for DSC
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 13 +++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi_host.c                   | 10 +++++++++-
>   5 files changed, 49 insertions(+), 2 deletions(-)
> ---
> base-commit: e6428bcb611f6c164856a41fc5a1ae8471a9b5a9
> change-id: 20240524-msm-drm-dsc-dsi-video-upstream-4-22e2266fbe89
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

with https://lore.kernel.org/all/20230728012623.22991-1-quic_parellan@quicinc.com/ and enforce-video-mode in panel node.

Thanks,
Neil

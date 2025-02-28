Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93DDA493A6
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 09:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C143810EC1A;
	Fri, 28 Feb 2025 08:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fNwrJZXL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28F810EC1C
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 08:34:58 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4398e3dfc66so16461705e9.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 00:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740731697; x=1741336497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ORkzKEvck1HQHJSDGsDM0EnateW6ppAyaVvLCKXR2rQ=;
 b=fNwrJZXLFz6gsGxN3zyZhQne3w6U6oCbCL7Pkn+V7uYTDEUPylJTWQt5xd0IDGBtbL
 RBfUtUSrMinMeG8iqOfaBk3oVKa/ffMShrL+wEHgC+fTdAmpPxM/n31icMuQDd/x7ej5
 VBktD9s/qCQvAPvoZ4L+kliZ8+uOFZ1ri5yCYI1L4/qHSCAwjquvEBKbyhhj0KMGfdxp
 /9ZxwI6/B5UepX+EDqD2AMkarxeBNK6nE8uaBWI9+NlmSHLc7creD3Iyl7OG4URCRMws
 C+ZHjCSlbqhKEhKzXybj+UMu7c32Ueh2slWm8wbnHhZcfBC947/3XYptjg6gL/N2XIWm
 W13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740731697; x=1741336497;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ORkzKEvck1HQHJSDGsDM0EnateW6ppAyaVvLCKXR2rQ=;
 b=Cp+8TIz8Yst1CP6hRG049tLnm4sL4Fm+l0Pg7pwawH3WnseGeoUigmWWx9rA8Ah4R2
 DHJ8miL7c680gRO4ap7WIhlLSoQfgujjFoCFaJd8pFu52Ri+qDGqe+zz9M1OYgV1jaIY
 e7jl8vY/uANhoHqNNyTnxxqMJv4iqOoTQyz6Qq8hDspaUqYey5wfaitxgLe4vHv6MBk+
 v5EUkk9plPtwh8nskeRn6Biyz6ERQmnVyPDKn5EYDjQgUYn9v4g7447TH8xwpys5KOf0
 CJ9zek+lNPfCkyGJQJifpec5hgrK2zD2Y0XLg71XkJq0Ua5KY1z2l7hkZNBUAZ1l4OEO
 Lgmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqq4KuyDuRj2C1e7Gw8qF5G1KktEQOgcPYUdSVH2Xwvaz7Fpvu3rTgqRf3SELppj7+QuLnYkjyREo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeaCivcTuw3cVVPHMItwD7w2u3ztpfZwblOtOC8QL33d1hHLaY
 Z2afhASo7Oj0pi/r4E6v7UTvbGWsuK3Xi6tP+A13dSfX5CCkbWjjg8F1vKhtp40=
X-Gm-Gg: ASbGncsIlTqodSYj5sW+56K8dKzw8A1SzzXeqan1PQ1bZR4217RM9w6Whca2WL25DyD
 yKJIyi7OJbAfrMc38ZTynV3O9HxiDB7krZJkyzNcFBV7SXZ+zT/hc3hWqwSR0ZC1RmXHwW1iAbT
 j9IsTwjy3sXDtHA04PBnz4e7vbrGRiInqTlksY9C5xKGPktRMNlzLRIzDw9/lnb34twaC520cq8
 luYRzc2zdUsjJG/NcYQ59IRqAua5LOnn7D2tWTtPGGMd0EwLnLYPRIGxf/T+46IyDjVfWRzjVLb
 MpBuNpRYE1N8MHTSdseHjqg2reN//+PCP7i8QzdmVNXPsZl2iON1LAFsp0+rH6IBRPM/jnPmOtP
 KUag=
X-Google-Smtp-Source: AGHT+IFdmFEna3crd/T/BTFxEG6Spc/EH5R3cReUqC66z3dsLR8Peke+TaeF096gTUqsxyCShEVirg==
X-Received: by 2002:a05:600c:3590:b0:439:33dd:48ea with SMTP id
 5b1f17b1804b1-43ba66cf24emr17659275e9.2.1740731697410; 
 Fri, 28 Feb 2025 00:34:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c728:ed22:3bb8:f351?
 ([2a01:e0a:982:cbb0:c728:ed22:3bb8:f351])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b6d31sm4394392f8f.42.2025.02.28.00.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 00:34:57 -0800 (PST)
Message-ID: <15e62852-c896-4790-9de9-835136d30df0@linaro.org>
Date: Fri, 28 Feb 2025 09:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
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
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
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

On 28/02/2025 05:14, Dmitry Baryshkov wrote:
> Since version 5.0 the DPU got an improved way of handling multi-output
> configurations. It is now possible to program all pending changes
> through a single CTL and flush everything at the same time.
> 
> Implement corresponding changes in the DPU driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Made CTL_MERGE_3D_ACTIVE writes unconditional (Marijn)
> - Added CTL_INTF_MASTER clearing in dpu_hw_ctl_reset_intf_cfg_v1
>    (Marijn)
> - Added a patch to drop extra rm->has_legacy_ctls condition (and an
>    explanation why it can not be folded in an earlier patch).
> - Link to v1: https://lore.kernel.org/r/20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org
> 
> ---
> Dmitry Baryshkov (8):
>        drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
>        drm/msm/dpu: program master INTF value
>        drm/msm/dpu: pass master interface to CTL configuration
>        drm/msm/dpu: use single CTL if it is the only CTL returned by RM
>        drm/msm/dpu: don't select single flush for active CTL blocks
>        drm/msm/dpu: allocate single CTL for DPU >= 5.0
>        drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
>        drm/msm/dpu: drop now-unused condition for has_legacy_ctls
> 
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  5 ++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 +++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           | 20 +++++++++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c               | 14 +++++++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h               |  2 ++
>   18 files changed, 65 insertions(+), 39 deletions(-)
> ---
> base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> change-id: 20250209-dpu-active-ctl-08cca4d8b08a
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

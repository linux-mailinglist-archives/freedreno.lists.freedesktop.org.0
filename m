Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC94BB62CF
	for <lists+freedreno@lfdr.de>; Fri, 03 Oct 2025 09:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D150B10E8D2;
	Fri,  3 Oct 2025 07:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EIYtbZlp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E52710E8E6
 for <freedreno@lists.freedesktop.org>; Fri,  3 Oct 2025 07:33:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e52279279so12470345e9.3
 for <freedreno@lists.freedesktop.org>; Fri, 03 Oct 2025 00:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759476810; x=1760081610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5grRFMX+2MrPypsgKycA1aZd8AJQaqdGLD/iYz7bwBc=;
 b=EIYtbZlpcecgy0Cj6FgT2RyLIdR+JCiBXmZqPr+WYq+tQE92q8qSY+qO3CnrIoftV4
 l57cm2gDzejRkqb4p400lbLkji0x0uWzwdSS/VxAW4LX3yrGQe2OBkbM3JPGaup9MC6s
 J674e0In6j6DP42iO8CnU4yl/qQh3r2cJ+UAkNSTGvbDsTY6JB+XTb2n7HVo6hEXRodq
 YDmVeNU/bOj7BePpy6b68Wo/OomBcGFFAmzEUYf8to/Ud62ZUNZTyvfFwYWAVTWNbMlK
 4FuQ3kSDpGPqzJ8LR7Xp/8bBxyaoZ48BmqyQOQOAIiOoiXl5mi12XSRpc4xk6a+OstW9
 g3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759476810; x=1760081610;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5grRFMX+2MrPypsgKycA1aZd8AJQaqdGLD/iYz7bwBc=;
 b=Le6EMNnc9W3trG+OSGJUaljfO2fDXA6B5E6BIoIBGeVXmdw8JQGNrTbjVAaLzTiVK5
 ejt2nbf3PPq3AldpXQKaISqsoRPV8yUa6KLvXtl35IOl6dTP7Y1xbjXzuAaHsfRS2xyv
 /NJ+vCFwh12cDhGJ153nZ1Z5eKYDW7tQScj2Le8mS1UL4d6vRA4wBWkqdIYNLgULTW+W
 3hMu4DuwTej6maKM49g564qrK16ni3jFIqGPvjmUBM3CK5nX8beINiWB3nJqky2Dc5Dp
 sXMgnY5FEOs4sdYAQnxfFUobr5w+76DOdkS/F78REibgu/pfEhn0gaQT/rX8ESOOFVDe
 jI3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg57Tf6CeiiLFV0xERj2+IWdfTh7yfLP4D9zlXvVY6fudap/umsWdfipGKgFr7KvsCAEp6y+qQbYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywnb9manvnUP0Y+QtvdnpWwyvGq/pF3QTHCSVc49rEBXO/GiDiW
 SN1LAcImLsMrpU9L7jR2imtQLt9tCn3Eclp9lEQbXLJAA+HSDZfcC78RNqq7UEKMP8o=
X-Gm-Gg: ASbGnct2aXJOJZcxzhnhmDY8dmvVolJ4qj5isxvyQgIF9ceArPmHIoR+Dd3f1UY1lb7
 2kY7P7E8RQtmxJ9dzqiX+kMSsQwlc/WSAQRq6M4Na/RGJhiG+fIcL/2n/ZC2RV5AijT5Hd9Jaww
 SwZ8yeiZY2VRorX3DOURs67fiEcuIyFPa4uhiFjUbFT5oO6k9Batj/fogkyT1RZXd4uGffHPWbl
 mdVG/Y1rOF8y1C7Y2Iworsm3q/dpVHPdz8ULugSkTJtWkckI1V3p3eAYNYowWy5It2lxECCyAxM
 38I09u8O7y/p9GFep6vm4I4d5VABs6Vo3RCG2UDwZ0lgPrrcfBHBQK6L6H59p52WDZasp9lNlQV
 m/ks7kncxIqe5zUdJyXsqqX7SXTI3YFQ6tWWl/zzDfyDa70R9cmAdJmUZUzxCGtFh3Fju9v227a
 pu7WEVpeODa6phzSVI8NG0KIWPH+k=
X-Google-Smtp-Source: AGHT+IE3WIkcpTDGTYbL1KkTG7og5gmapvp+rB9slPdpJDq+7fpgXOqr+o6R0DGbS0j/8Ti8nPucHg==
X-Received: by 2002:a05:600c:6094:b0:46e:39e1:fc3c with SMTP id
 5b1f17b1804b1-46e710fff73mr14591685e9.5.1759476809742; 
 Fri, 03 Oct 2025 00:33:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1516:b5be:def8:9a0b?
 ([2a01:e0a:3d9:2080:1516:b5be:def8:9a0b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e675b557fsm96132185e9.0.2025.10.03.00.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 00:33:29 -0700 (PDT)
Message-ID: <3ccc3649-dbb6-406a-bec4-fb3d4068bad1@linaro.org>
Date: Fri, 3 Oct 2025 09:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
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
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/3/25 01:57, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e7515a412e9..7a712ded8f9f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robin.clark@oss.qualcomm.com>
>   M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Abhinav Kumar <abhinav.kumar@linux.dev>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> +R:	Jessica Zhang <jesszhan0024@gmail.com>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> @@ -8325,7 +8325,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
>   
>   DRM PANEL DRIVERS
>   M:	Neil Armstrong <neil.armstrong@linaro.org>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> +R:	Jessica Zhang <jesszhan0024@gmail.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251002-quit-qcom-5125b64a86aa
> 
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

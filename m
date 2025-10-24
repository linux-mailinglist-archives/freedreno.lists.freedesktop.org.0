Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB4C06E2D
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 17:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA71910EAB4;
	Fri, 24 Oct 2025 15:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cVX8Wylw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CDF10EAB0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 15:12:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso30949065e9.3
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761318722; x=1761923522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pKXKa1r9FQp0EetqAb+WbXj1OlPLTljUDebvvRCMG5U=;
 b=cVX8WylwDWHBpwipgtreAPcfb27FeNwLm4RuQ9CV+Y3y5YFkPZqjtrvwUbHxer+AOi
 +KjzOwRTHiCpTg8RpuW5ddXr6Ocx0f6loaL3yUTwAL/Rfd+jvye0ZvMuP6l0Jqd2/DhX
 Fc1bnm91U+/UsBoEJY2RZF6Pv6ta2ank+Toe3XdqT/EJ4RmXUTOikJWZmp9pcCCFGt89
 I5f7MYt70qh+bV0t1zjED7ks6N1f6eHYuJTQzM30MM99dj2vv7mrNJvJLWRY6XL8nkVs
 8VB0yCTzvt7p6szRYoQC93Bs5eYQggVUZyhquswaJlB5pTfeTOUlTBH975A+3leB92hA
 g0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761318722; x=1761923522;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pKXKa1r9FQp0EetqAb+WbXj1OlPLTljUDebvvRCMG5U=;
 b=vbjziGCueRnuV1+psb1PxgUEf4LeXathTuWydxljLlYZL08odk0aioK+/w2Tujvv/X
 ka2OyCzNG/73DeJT1Cd1SC5JMngJ7KEXcKf5n+DtOtAbFhB/mKdF3LBPuIf5qnFl99L0
 y1phJ6S3k/HV2tKp/6HZN/49zzoPPRvdtGiVcVNyqEmAv93CSXhSDDhNb8/K303Hldbt
 dQHtAkw0ouWmu4eB/SR6Kt0IS2V5gE5syn+RrJ/6CA3VvbjX4OOdHy0gdLjm/ZtQFUgC
 eYSGS/XEXzcuxu6La4R+9tJQyRwhh+uculbmdqW7lbpbfK/kT6b6bQBFH6LkEdEPvcpc
 /CwA==
X-Gm-Message-State: AOJu0YxCqulH8fGRTGlHVxRVB4mfP3EIFsSSGK1Q7Hj5hVh43N6qUSsj
 7hQOO1Xn+7gPhPRglsV+mrVzubKtp7iMKLAsazR6sgzo2XXEjcDyGt40BDv7WI9HpPE=
X-Gm-Gg: ASbGncsoJkQWf0YBp6mjdXUkv0Fiu6KRzgbuh9124kWUXOz+oLcgCBctgXpbe9lCXM7
 kgc0b5Dpo/0YNtQdsOcUslw5LjKV9RR217oIrzjCST+jXWyRBTKlnQxfj09Y+mwkO072c86jomK
 0ikwxcI7AvqHI50KbcgxKgT9I/JfhotLhOsmzBljU7FsqbXgN6KTWoTYw2YcrK+NaogJMoCnqki
 0SlcTMVZH48wTPOiGr0XZtGZptgl+28Bj6Fgq7C+4kcZjD9aJSGPRQXxjF2uVBlV0KniBc6Mm1o
 4fGmIm+ZwvvmN65i9AFn9ZR4JBJcU0Kn1E6mjKIsVwSpJg7tjx7q0FO/ln0B38ymxndOEyR3dx5
 aCvMDQL1zZd3gM0hZZe3CQSqqJX9MaeE9ssXgXzjWzeayeM5N12uTO8mbgWmnt60N+WYTBUeNoC
 Lt6MLj2+9GmKmWraWmfqqqX/V4Y0islXomdqOIjq7UFGKZjgMqGjCG
X-Google-Smtp-Source: AGHT+IEeYZZ1u4HY2vXbkSYScyAQKTH+8cdNSXByfKXc78Da0+wNoJJLRMMOc8tdqcg10A8rkudsJQ==
X-Received: by 2002:a05:600c:3e0a:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-4711791c522mr217452615e9.27.1761318721751; 
 Fri, 24 Oct 2025 08:12:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b4ee:479d:354c:6970?
 ([2a01:e0a:3d9:2080:b4ee:479d:354c:6970])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474949e0a3csm89873665e9.0.2025.10.24.08.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 08:12:00 -0700 (PDT)
Message-ID: <fe898b57-2b96-4f8a-8f27-58dca1c11ffa@linaro.org>
Date: Fri, 24 Oct 2025 17:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Jessica from drm-msm reviewers
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
References: <20251024-remove-jessica-v1-1-f1bb2dfc2e18@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251024-remove-jessica-v1-1-f1bb2dfc2e18@oss.qualcomm.com>
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

Hi,

On 10/24/25 16:56, Akhil P Oommen wrote:
> Jessica has left Qualcomm and her Qualcomm email address is bouncing.
> So remove Jessica from the reviewer list of drm-msm display driver for now.
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5889df9de210..064aecda38cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7889,7 +7889,6 @@ DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robin.clark@oss.qualcomm.com>
>   M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Abhinav Kumar <abhinav.kumar@linux.dev>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The email has already been updated in drm-misc-next, but .mailmap change
is needed now:
https://lore.kernel.org/all/20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com/

Neil

>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> 
> ---
> base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
> change-id: 20251024-remove-jessica-1abd363a4647
> 
> Best regards,


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D8BDCFD7
	for <lists+freedreno@lfdr.de>; Wed, 15 Oct 2025 09:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F9310E276;
	Wed, 15 Oct 2025 07:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C3YeCjD9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CC610E276
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 07:26:56 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso3309687f8f.0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760513215; x=1761118015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=y9LKr8c4AZy90CShrcGX7pZTKvN/kuV9gDox9nEwyjk=;
 b=C3YeCjD9ESuU24L8MRZcsT+FPhSgIw4VgCDr7SIgR2vBz6B7zRc4FYZVJY8u9Amg98
 jjKnHFf17WRjbC+FqwKjDmjW7iOp4iQDvAvmQ6+Wi7pq3DM8iWWJTJha/nvtQbP4Jd3L
 +LKl3+MPFNxgNUUZQVwqq7eV7A/iVP9ChUGsBgTT7WSblQj6WyKGEba8wWMr3H6IO4AL
 j6PZRcdY9niu9uCX+EyNYTmP4r+FJIf7y+BEV29zjVppreJ4rrAAiZTtqQvgmZKJ2gxu
 jq1/ty0S0kprAjNI7FsejCAP3sCU2KBYwPdC/x/L0qdFRXV9b85G3ETtyHYCYqrrd1WP
 bmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760513215; x=1761118015;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=y9LKr8c4AZy90CShrcGX7pZTKvN/kuV9gDox9nEwyjk=;
 b=AAMZc0hNdHTeJp+ddTbJyOcPVpoiIS4Hd4fIdTkfBvsG9yrjjg+/1Kiz9AbJcG66DC
 eBrNwi5cVKQWBE0sQIi8/2EJebecCjoXxpaSgR61FElRrYIsmytlnv1rc2wUDBX5dV3v
 K5hmkrdm16077r1czQ3439Ol2oC+Ojwk0OOJ5YZq0S4F/NMzVpyC7ii1mqsFFjNHBF+U
 RhScShUSsCeLU40EkZY1d/EG9p718f261Js6ItPmqW/7aWxbpbKbzcxPoVK4Ixi1AfDm
 oTK6xlbIPGYx+5+p+5MNsRYuL6jN55JlKoSegziH/T3DjhKyvUgYy9PrPaMJ/76oh5K/
 DlHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdn51bIc7EIoi98S+SmUSXAE5tLF3ZDjvuAjuC5rDY9mwUuHUkBWPf+kQB2cePV5Em1k4priPLN0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeh6Dx6a/uAPhtqOMPWv+fZG+dqA/HqOf5sKMzbhHQrVcg3uEA
 ArFui2zRxSW5sUmOvq3YtwJ8csacn0LEec5s/oVScpyPZ3B7NMgIdQ9vyc4vZoCkSb4=
X-Gm-Gg: ASbGncsIYAzl3H2Q6hfZAzbuBHNGnwuX+DqtD7a3q66PKTxC/xLqRwGQqpiDxnyJ7hK
 LylQk/HSJcMqGaqyNKkwgJTPoUhd3b5UNiD0zfWXBpwCEiJO7/X0wMKZlOfQeTk7JiZLDOKbenD
 Ewunkdj2Z6Vs03zAvdgKPayEwz/W/P/bGZoLqpAZD8cx7REAP2+euRRttxJGVTZwDdMlBaKmOR5
 d4+80QRojwXKQhpTBDSg9n5KM2q7IkV9fJ0I06Y6hTcokG+uvqVgyoxqXIG2Ikp4/42xxGDxmnW
 jTwZjbUyUGeZjeTv/v69kx1QWRqTJzIuSXA5ZUH62FlaNN65uadq1CwdZ1/0BjYM28SOYpGXAL6
 wYELO/McN6IKgbqXS/BMEIIm1WvWq9LExZDpnW9nQeXVZHb3Vowo8UFSBRHzCL40OG8AkB4yOaV
 W5RFsWIn3JYzadSUZ1Az4o23fWCKlVhpqFQRhwVKi7
X-Google-Smtp-Source: AGHT+IHHwcCTmm/vrgRmtvSgxozxppcZledDwbcL4KZQXqwFqDlzftxRdw5MBdI9t2oHDJ1rb68IEg==
X-Received: by 2002:a05:6000:22c5:b0:3fd:bf1d:15d1 with SMTP id
 ffacd0b85a97d-4266e8dde71mr16693928f8f.49.1760513215308; 
 Wed, 15 Oct 2025 00:26:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ef0f:4a43:2fd:39aa?
 ([2a01:e0a:3d9:2080:ef0f:4a43:2fd:39aa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e13b6sm27556373f8f.44.2025.10.15.00.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:26:54 -0700 (PDT)
Message-ID: <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Date: Wed, 15 Oct 2025 09:26:53 +0200
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

Hi,

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

Could you also update .mailmap in a follow-up patch ?

Thanks,
Neil

> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251002-quit-qcom-5125b64a86aa
> 
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A092A06F9A
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 09:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D911410E44A;
	Thu,  9 Jan 2025 08:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y856HWMJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7D310E44A
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 08:00:38 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so645003e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 00:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736409576; x=1737014376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=SDburU8EM+cyhb0IOZ8ZAadXRNXnF/xp0rz1w6CgrGM=;
 b=Y856HWMJVuS0K1SR7+QCTfEFTAfebV+y/tgd02Clljv/03ej7PkszOqFzA+hQi9of5
 gCjeJy3ioU2TFBf/qh2AT+EenKkjp57047xDTfBA8OFaXpY6bjLVft80FXGC2GkEK2fe
 KfEAOpaKhEMwmeII8+V6nEmR2aF4OUJQ0yf4AnTVOwxwTxirA6vjkJ814Icrd+PISNZt
 GkkUDnt1Y0vmi8Bs0sQNlNAXMNgMMAIMeBl8CzaWYkSi1p49cZ6//BNTaxKk0xxGUSSP
 VGcdOO0WxeloN4ECbSncHFdHKh/ZlxzfVK/eubQvAwgmhPY8Ww6jmfE8DzUK/3CG2GIR
 ANLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736409576; x=1737014376;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SDburU8EM+cyhb0IOZ8ZAadXRNXnF/xp0rz1w6CgrGM=;
 b=dgAM8luGkupCLtGb9OFQBUhqhX3qpuowCzLqfF/bqP9umAyty2HnQSm7KLa4hvvyRU
 j/1pEZnDEYWiQy0Ql6pKAC0AWq1UVBtJjs0Rc9vtoJPT8a4Mnw/QBtoIjKv+QUcHgghK
 IJ61Jk8GmhhOB3mFAC9eC75u0IOwC7WI5hr2NxB7g6tYDayB+B0Y1SMZIU7Yvc56zIgF
 zq+Y0UZ5fMGs1acm5x+2g8vG43f1JP7U+1CaxUTOlhHFg1y5oMqome8m4rzGPbOrCMyD
 yW3QdIkwu6GgAVCEUGNyhSOfkEXUT+wWGAsAOhzycHMli0tzECjxzjxgJeIp3cET7mjm
 tAyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHb7ScnPN6QIuT7lvNxQ81DuxaylW6jkNhFEG6NG6Xp09V72TTKMVm+6Xeydw6NqfS6IWlqAlMA1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0MRRrJALbItfa9MJvQsWSNCe+c9POqHZHQRaCTFscOSglkaGJ
 hOz9qclQ27t8SlKKiVsjeOkxwu5o5fOUAJwjrhNeJLi46gIoDGW98aeHeZJpV7OEv4AKuOwJD7I
 U
X-Gm-Gg: ASbGncv4viIaRuFS5mgrJbTzK8anKvWJ1DLDW4WpVNTZjlmt6mp1F7SjD0NBjJxSAyh
 UeERUhBr27UduWbscKqggPS647MJ8MbotNLaBL0DAqsVDX+8EsqUEQPRE3q82zMEBkL+wgQIo2a
 cuO6yyQsj3x8uZSlSEcKauiJeF1BJudLbvP0D7JpqtY6qpPS3xmqgxBpnhmE4NTqiaVRXSSCS1R
 q3yPlTaarov2HOG5G5dJNoGzSAjv93xc6PI/SRnYVnNCC7BQ05Wdk1QTO2x30ijnvwbVpaej4oK
 80+uBuCOoUfi/SHm+qFnh7GtlRAFGBftOw==
X-Google-Smtp-Source: AGHT+IEGs+msZPIsIgrCbfJ6qv2MxuOOnLjQWHB0A0O0rUMX53v5jVSSQQyb1v/1WHGX+P63OGrEFA==
X-Received: by 2002:a05:600c:46d5:b0:434:ffd7:6fd2 with SMTP id
 5b1f17b1804b1-436e26aeb4emr47286725e9.7.1736409263961; 
 Wed, 08 Jan 2025 23:54:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:688f:e09e:ce30:f1b2?
 ([2a01:e0a:982:cbb0:688f:e09e:ce30:f1b2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da6271sm45823095e9.9.2025.01.08.23.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 23:54:23 -0800 (PST)
Message-ID: <00a01ba3-8b03-4a41-a8a0-650aaf661f12@linaro.org>
Date: Thu, 9 Jan 2025 08:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 2/7] drm/msm/a6xx: Increase HFI response timeout
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-2-08a5efaf4a23@quicinc.com>
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
In-Reply-To: <20250109-gpu-acd-v4-2-08a5efaf4a23@quicinc.com>
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

On 08/01/2025 21:39, Akhil P Oommen wrote:
> When ACD feature is enabled, it triggers some internal calibrations
> which result in a pretty long delay during the first HFI perf vote.
> So, increase the HFI response timeout to match the downstream driver.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 3c183c1c6266..7d04b242363c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -108,7 +108,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
>   
>   	/* Wait for a response */
>   	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
> -		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
> +		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
>   
>   	if (ret) {
>   		DRM_DEV_ERROR(gmu->dev,
> @@ -725,7 +725,7 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>   	}
>   
>   	/* Send ACD table to GMU */
> -	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg), NULL, 0);
> +	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, acd_table, sizeof(*acd_table), NULL, 0);
>   	if (ret) {
>   		DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
>   		return ret;
> 

Ok it's here, this should be on previous patch!

Neil

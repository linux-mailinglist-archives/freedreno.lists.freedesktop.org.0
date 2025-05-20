Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C97ABD164
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 10:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12E910E4DF;
	Tue, 20 May 2025 08:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ifaILBas";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098E310E4D2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 08:05:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso35324555e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728320; x=1748333120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8uNWDaQGmXlN2WBOvHoF7sz3M4udRBK5xujbVMotESw=;
 b=ifaILBasQuobB5jNlMIR9XDKIF+OBb955VUHoDP3emiFpawiLRcTRcfgo9dzIVCwhk
 X/Sv+8C13Smvb5X0s2UL1e8nb1k3XUYbG+SNufv+omyLQZxQ7eoPsZVGsBXPvSd2Rt1v
 76Wxxaye5Tu9FHL9bE3J8A5hALmlHsz0If221oKWCDZKULl3qHS3NDnvj+9uKI2AEva/
 PvgwaTPcd4LwgW1hpZalUWwVK8cvJbjz/CS48HAUrU9sVmsgTPQOKjsHhHiVmZLRtNj5
 Vm4F5qw0/uYAel6B5jOTTRsL5ebR59W8FZQRvpcCfo8NZJQLkzwjlwhiQU2yU1kCbOyD
 FXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728320; x=1748333120;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8uNWDaQGmXlN2WBOvHoF7sz3M4udRBK5xujbVMotESw=;
 b=tB3RKUynQ0G6m1uEgZdiqPtyvLH9mC4HH3op8l68XGRfOsJ1iEWbmgTOS8sMyItf54
 ZUYUU3KpJnRtpEN/f8Sdtw+QArkDTOVRIJ+frQYfPkED17EmVEKUMcvlkIHfLA5xsiMJ
 9hreadOZYOx3nOekS3az8KKgbpDzmFfCGlamqEZPiMNanctwgpcjaxRSZXs/axNCPaYH
 PLbzXEpc3e20KtyNKHD6tbGStfDa5VFtNSrnCRJhezf5ucjzliKk4aWV85zp9fMgJ7jT
 yw65QoR8A+ihm85QHN6TJagS6eXGO8Q9xd9zNfxjUlQxaUhU5c8br9wmDufthVnaaL7R
 ZLkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Ijrm0ghU9uK0eMKukdqDOt4COp4Mi5kpPLoJ1jNYsBkq67GAHvxu4uIH8I7j6PrqtaKnrVF3nD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWqvi0/qpLgb8Z0tlj4Y2xGm5nMYBHBsJViVHZQYC1YsFy4Lr4
 SqXutmZI3gZpCwed9Z1lLVds+HglYZT33N7fi1Y4VBKv8wKJjMSE0qZbBfGM37W0YAs=
X-Gm-Gg: ASbGncsBJu0hi1NtFxKVvgADYC9XtlJ6/8bIZX4JzsSToHxdk1XQKcDF/YGpqVN5wQD
 2NGlQN4CGdH4LzGFDkCwhbTCdYHw+sOpHt2LRjOkVzXzhBaLMhAmJOiOhFkEdNLxOs+w0IYYbak
 pGHrtJJHfX7kuxV6PVLqc98zUASEuCU74fX853wx/cxihRg3mgwjA9SJMzkIkx3KAzcAr02BuGC
 AsfXmQ1Bq420QegXPwjMPbPFh5xHxbPJ9MiB4gyYYCpWXz8btK+4jztOufMMTu1eW5R4et9Foxx
 ZmlBxqIugE0UizAclZvhZDnnuRUEpLeXCl2Lb12wtcAs942rZkIxvIAO7ChYME/SyeeMlnYZNTs
 zEGtbnPgB/YgEWTiJE5N6Nz92NwmV
X-Google-Smtp-Source: AGHT+IEdhL7k5DzcFwB/JV4pFW3hFU/M2ztaF4G0E1I47kMXHVf4IEu46LQ3/VSTgqWHUuOLyF6tAQ==
X-Received: by 2002:a05:600c:4fc9:b0:43d:5ec:b2f4 with SMTP id
 5b1f17b1804b1-442fd6271b6mr194407665e9.10.1747728320567; 
 Tue, 20 May 2025 01:05:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f182538fsm21418725e9.7.2025.05.20.01.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:05:20 -0700 (PDT)
Message-ID: <b6a18331-2f5a-4ce6-a3a5-2a483805cc78@linaro.org>
Date: Tue, 20 May 2025 10:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 28/30] drm/msm/dpu: drop ununused PINGPONG features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
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

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All existing PINGPONG feature bits are completely unused. Drop them from
> the current codebase.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 9658561c4cb653ca86094d67f7b5dc92d36d38cd..c1488a2c160b0e2ab08243a6e2bd099329ae759b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -87,18 +87,6 @@ enum {
>   	DPU_DSPP_MAX
>   };
>   
> -/**
> - * PINGPONG sub-blocks
> - * @DPU_PINGPONG_SPLIT      PP block supports split fifo
> - * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> - * @DPU_PINGPONG_MAX
> - */
> -enum {
> -	DPU_PINGPONG_SPLIT = 0x1,
> -	DPU_PINGPONG_SLAVE,
> -	DPU_PINGPONG_MAX
> -};
> -
>   /**
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

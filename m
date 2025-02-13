Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C9FA34AEB
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 17:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D57B10EB3F;
	Thu, 13 Feb 2025 16:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="laB2IVu9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EB710EB3F
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 16:56:21 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so1168500e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 08:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739465780; x=1740070580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/envL72wMRKdikgn0jlOsIdrQo3kgOjkSiUW09bvDSc=;
 b=laB2IVu9EBWfnxDoVCWdaSEikBzUXT3sKPA9HwPPsYQ/Kg3rqQqiY7VzlOim1W2vcz
 +0qKRz+wVDsl/F7M/afhpTkSeFMSsNC+OtIejVH+Xxpk4L8fsSd/LTWkWB+1CBCuwKrf
 TOCtwUKr1//Gyj38MrEc34tYf8o+Kd4BAmlkSSlm/rTMvo3Tq+oSUBS+JM9sDfl2MLE+
 xSLcGpiOJU0kdbk4U1ExoLik3SBCHB6TdpY8PYr/N7oEwS6PzN/ZiD4GxBVJ4k0mhlgW
 vfuOwac3m5KUlir2qYw7XdY/oe0DGMT9ZxmBCBTX+iWWLU0PELfZ7Bd0Hxh0OyePuHN7
 07JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739465780; x=1740070580;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/envL72wMRKdikgn0jlOsIdrQo3kgOjkSiUW09bvDSc=;
 b=pEYEsBohn6+5DEhDg4DMpRdIzwPoxnbGxFo41DS0dZqvwgn7iaunPFKsc2mirRzeXL
 Y9cN/nIDFCA9Vd17aqktxcT0xUk+uUa/Q8JY0bR1V6x7z4ZTXnch6qq7fzfjiqfLL2ul
 HnQol2NX1gu8V3TB1DGDXxCCEOpnKJ07D3G4HUf0wNlkzxeic0T+bEGlM9WfZENBpRzN
 +rPKoNVaZlLN/h5J9T9SydBoDePQ/jf8yNJk4gGmGmCDuF2N3CuJGpRPRm0goEtLfsJ4
 NoH4Ns+WaBlDxWU0ZBLbHcn9YfKQ2aOjcRaIXHi/Vw2inaEf+CjjVsqWPRXnP2JS4sHF
 zC+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoILr6HHr+or/o2N2fECBgVd5TPQwv/BkLMphOGjaGGmhJIlvmnutrwmrDlbCAY89soF1lRzhZ0dA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+VWnBFHiYxlDj6vniHCfkG/QQ8yLtJPa+rl4R2XPKIh+Qlixz
 20T3jwio8Tsdw4TcwjSK4LIlT/BmkveLGIm08usA80Pu4eCP+tBF9p8t/cYah3c=
X-Gm-Gg: ASbGncuKxfk5VvjkUJhNLITiBsxxtvQhCgYhN0jaz3GOlXL/1vLNOzrM7HWU7fPl2jy
 gExJ5yEi4LR4nN7uf/ika0iH4xJhbfAQCgADiXmCFV+eHxKzqugxWtrUWwzxVJukD1r6awrWzYK
 gS+VcSbacwV/aHjFtZBucMr2QSviJqDYy2IaVAWBfdIPotp+mmSSTAycO54E9pOiBlh8tDxGE8S
 JiO7g+4/J6KJW1pcn54zWuMFInTAYQACRzhjmO8mkl3jt5LPHaEtiXR3qh4OP2fyrNSr439P89W
 psT1s5S68bbf3Pdi2h8TO9OiMSatnR8NgHsaHTHCHamYB+6ZjKs+V3EHL4nUtXAJExNF
X-Google-Smtp-Source: AGHT+IHnDme1A09aFbNagSefdEV+h90f4ZlM9hLHk8vhRV/RdAImC8Xub2lJ0Glyh4NPgqmQceNBkQ==
X-Received: by 2002:a05:6512:b08:b0:545:8cb:218d with SMTP id
 2adb3069b0e04-545181551b6mr2616230e87.41.1739465780168; 
 Thu, 13 Feb 2025 08:56:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b065:478c:3f8f:ac1b?
 ([2a01:e0a:982:cbb0:b065:478c:3f8f:ac1b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105f28sm219002e87.118.2025.02.13.08.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 08:56:19 -0800 (PST)
Message-ID: <489c405a-b2c1-4252-b170-ef77b5a90ca2@linaro.org>
Date: Thu, 13 Feb 2025 17:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/msm/a6xx: Only print the GMU firmware version once
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>
References: <20250213-topic-gmu_no_spam-v1-1-1e4afdd898b6@oss.qualcomm.com>
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
In-Reply-To: <20250213-topic-gmu_no_spam-v1-1-1e4afdd898b6@oss.qualcomm.com>
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

On 13/02/2025 17:44, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> We only fetch it once from userland, so let's also only notify the
> user once and not on every runtime resume.
> 
> As you can notice by the tags chain, more than one user found this
> annoying.
> 
> Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Suggested-by: Abel Vesa <abel.vesa@linaro.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 65d38b25c0707a3c7fff08d110b4ac2b9d410473..699b0dd34b18f0ec811e975779ba95991d485098 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -813,10 +813,10 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
>   	}
>   
>   	ver = gmu_read(gmu, REG_A6XX_GMU_CORE_FW_VERSION);
> -	DRM_INFO("Loaded GMU firmware v%u.%u.%u\n",
> -		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
> -		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
> -		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
> +	DRM_INFO_ONCE("Loaded GMU firmware v%u.%u.%u\n",
> +		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
> +		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
> +		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
>   
>   	return 0;
>   }
> 
> ---
> base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
> change-id: 20250213-topic-gmu_no_spam-4fc4c459755d
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

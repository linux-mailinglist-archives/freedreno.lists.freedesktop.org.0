Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D7DC64F12
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 16:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C33210E3EF;
	Mon, 17 Nov 2025 15:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aWMf+PQU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4085410E3E6
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 15:47:29 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477549b3082so36784285e9.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763394448; x=1763999248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PIgBKPIhg16h/OqUa/f0YqwJTctSG0gGZpea6OLuGEY=;
 b=aWMf+PQUCACWtXvGgIWHb19aeES7fNdgmt41gw+jW2NeaIMMkedC7805+lu0Co2+RG
 9xfUiDp6nXcmwdrmqlIXJp0293JBm7BDOC3LrzFKCYSNmS/jHlVoGlxtzyeMa43QxcQQ
 rVVRaUMeqVKVdPHU3u0Noej9hQyq6Ybt5fWD6YUWsBBv4FuHf62DkIw1GmiheFaW6mC/
 KyciV7gbFOPIFnYXbV4nSeJVzPOqb186Jl4SyTkU73Izmx8WEYJzG/Inlv/fy4M19w52
 xxSHvUcLro8fE+sQjNIIGeK1kqlXUkSQ5KpMRRDZS6wNsFT7Kt46cSd6hnL4QdMQMkqc
 D4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763394448; x=1763999248;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIgBKPIhg16h/OqUa/f0YqwJTctSG0gGZpea6OLuGEY=;
 b=rrdsu2ZN0+cmO0Bqrcn1QEzFjUSHzX/jMFotG/L/SqF422x5nUAzNyXs47+GlHzhV5
 pLPeTnxn2gnC+207g9ihKftQxF855FQck3nuZo0dkjGNDZ8SAG9C9XQq5vHD5bVPZwwQ
 86XhM2ldAyIu9/po1X0qHesUSvGaexPYestefRoiWuhaTDsVQERiaVr9tNTEUUvf2P1T
 sC8xPZwm3vDB7spQY3tWSfKclyKT6L4RBHDm4x/AJjHr/Xugj67tIUS3OWKKQsuuEfPl
 OntdGWjtejVoPTgownG5fRMQ4rxOiBMIkVZUxuetpoGSxfuiTgWdPuCAKysQO0NpnvVD
 ATWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQRcsOBNz6fBeLkF6AnGR4PvsMb5VXSqCs8/moPJeieT89orEqTmJE/aSYCYSIkU67wvHuep3Y/1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr6kpX9NFD5lAkjZZUNo02T7RuYrg0ZfKtoyJZRxTRjPVCLOMv
 oqfAz8ijfDc2vY4S8uctP3U98qjKj7F2FgSXqH/lRWj1OCJHMnhD23JD1UQhnwjQQUw=
X-Gm-Gg: ASbGncsnkD8TQcMZWqQ/ejBkN/lniG8CIQ6CSNGUfmgwH1rS/wkXWHl6/G7MarHuAZz
 iDbMwhUZw7jsynFvlSZZn8lHvpfnH2rRZen1M+/lYhRS6BrXJrjSL9aMxMDPiSh0Ibzho6WiORF
 vrdAlT6GHrjhUYJC59EveYagKZhlDQVxsmzNX7uSw7MxOLQSXqswsNXjzBhQN3wnIG6C1wmdG8V
 UxbFJTd6wPbC+YcEoNViu/WHSgcg1kmHmVEMhdxAvF+W3KuDpU3/vbtJ978DMHw/ertJXy9jJBH
 nYkYg7aym307+VyZ3b1w7PM9atjBvjUrKELteW624lKkj0IxJ2DVTU74bHK75/qvFq9i+8Fqptw
 I+mPGvSZFXUEm6TN3RKKyJP5jMpQOmLrRiSZw7kQQgyUB0y6MrqU6RTV8rWLIlYK9n16dMt/w6P
 LuHmDyQ4Kqp9AmG3gx7DvdhJVR4zgRpxuYmompnAsBI12oqJQnVsxo
X-Google-Smtp-Source: AGHT+IEBd79a6dYljA3MZX+cNglY3uITavEkQzyznMYyE7VV+eFYzQzCVuHaNRfiwfZAjPjWNzJXLQ==
X-Received: by 2002:a05:600c:45d4:b0:477:7c45:87b2 with SMTP id
 5b1f17b1804b1-4778fe5dde3mr157686805e9.16.1763394447511; 
 Mon, 17 Nov 2025 07:47:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3?
 ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779fc42f25sm96547835e9.6.2025.11.17.07.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 07:47:27 -0800 (PST)
Message-ID: <1488f09b-63b7-4412-ba56-28b1c81528ac@linaro.org>
Date: Mon, 17 Nov 2025 16:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
 <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
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
In-Reply-To: <04aec988-59ba-4c98-b922-510d86b10ea5@oss.qualcomm.com>
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

On 11/17/25 16:02, Konrad Dybcio wrote:
> On 11/17/25 3:51 PM, Neil Armstrong wrote:
>> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
>> if still deferenced in a7xx_patch_pwrup_reglist() which causes
>> a kernel crash:
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
>> ...
>> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
>> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
>> ...
>> Call trace:
>>    a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>>    msm_gpu_hw_init+0x58/0x88 [msm]
>>    adreno_load_gpu+0x94/0x1fc [msm]
>>    msm_open+0xe4/0xf4 [msm]
>>    drm_file_alloc+0x1a0/0x2e4 [drm]
>>    drm_client_init+0x7c/0x104 [drm]
>>    drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>>    drm_client_setup+0xb4/0xd8 [drm_client_lib]
>>    msm_drm_kms_post_init+0x2c/0x3c [msm]
>>    msm_drm_init+0x1a4/0x228 [msm]
>>    msm_drm_bind+0x30/0x3c [msm]
>> ...
>>
>> Check the validity of ifpc_reglist before deferencing the table
>> to setup the register values.
>>
>> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> I think it should be fine to skip calling this func altogether
> if !ifpc || !pwrup_reglist
> 
> Although ifpc && !pwrup_reglist should probably scream very loud

Sorry but why? pwrup_reglist was introduced way earlier than IFPC.

Why would we be skipping the a7xx_patch_pwrup_reglist() because ifpc_reglist is not declared ???

Neil

> 
> Konrad


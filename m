Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92117D07C37
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 09:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5998110E807;
	Fri,  9 Jan 2026 08:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DmuZ6sYR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895BA10E805
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 08:21:02 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso42684185e9.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 00:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767946861; x=1768551661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=f9uKMSt4+hDezkXTZIi9m3T1AtMKx1vNqIx/d02r4Ps=;
 b=DmuZ6sYRp+8Rw79YDyUW5174v4JaoQyOP+lgTjFJS0yUzvy0rNO6tpgemDfdWTlNoH
 Y3CqGHy+a90VES6fLbMHQBLM9dktLfZf+EuJ22nrhh4jGz2iOT5+32TqAYwy4FgfLtyi
 b8o75V+fpvUM1Rc0cAH2DGKMZ212ryZ/AF+DYto2JzSQGdDU7b3n0d310OQ+kSaSi20p
 UJCd/NtGyrRL+N5J7+EIgB751QDEV0PqgZUN9gzM5pzqKVogcIV47dzs7kBnXpK5Pdk5
 d33IAtQEywPNgz+EHEE7Ek17h1Fi5SzDI6LDXNc8M0GqWEJIXvIoeh+1dACKxUsx8axg
 ngZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767946861; x=1768551661;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9uKMSt4+hDezkXTZIi9m3T1AtMKx1vNqIx/d02r4Ps=;
 b=ZOvOooee9AO5C097ArD3PrrRBrvSaYWtVnj9Ckx/szbxjvpRAqNiAkWkLp54hPH5ii
 +ylJlLwSY8XNApboOYiWpSUichasPbOID70GBl5u9RpX24+R+rIHZ3On/j9U9ECwgexW
 BfrsLqxSFRbEf86eoLLNMzh3p7Du+/B8n5U+Vm+eARB2ZHBXvRHnLDWenFCHWwKX48ez
 ESqbWxJz3MNtdZponpmnMC9TNPwOKE/7KysKMpdd1hqAFjnxvm2K/t8iaWYi87sWHjaV
 houvE2q1j2OxursylTsnAeTbZQuwYT1+lamSy+rFXde/6SRc+/HXZS2fudpdgAe1Bvnu
 gBIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL0sXiJy3lVjNitYfjXht/K4Lnr92zEPQoE7PvGzK93uWIVWrtLsZ/sx3GvqzMyPGJzJ8T88Zm6G8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU6vWl7kQswsae8XCkNW3gpN+SUx8nTNC2wMTHJSoAor5kqUOn
 TOAf7ricLYL1sIXRR3RuLlAGdMNgTZhPPfS10EtVtRstA3aOE3P338pBi++lNc31dvHr94tLtD7
 ZoDKu
X-Gm-Gg: AY/fxX4yMdw5WRPy+sInXbG20d8VFdgT2XwA7ACgYkTmS/Y6R8/dz2Lxoe6iJgmsxs5
 i9HMS+IxhWSWbUwoKLyjEXr2vlkM0eHU2hGKKX46zO17vDCUt73NVCf4Xi3DasHUfnQYTi5SWVd
 T0TxJ7fJmtYLiS13kXeHZNdx+2twJuRR7Fhfk4N98up3NroCCX9OaCPEf2x8TDj2dJD3HDZd9vC
 76ZRuGko43g8GGU29PfSpEAg0njll1OGnQvI7gC2aEciUrCDR4Si03zoLzp4TUOPXlMTNgxj+I3
 ukxmB6wkDZgHkA/f7c8hmKJn68ZSK/PyFU7kZgd6sabNgXQd346gJKEZ0a8LmDF+hrjHb0gHToM
 hPm8VxD6wd/Rhs5Bc2e1zeiFWcWEKbicwtdCLqKRcPqxVUb3jl/pCMJyUjA7mplMN7BhjcvthVD
 XAPPzTeybWY7SAWfwjNKgt7YS9H2c6Aawf4IjQ2pa+Tu0vxxLQtt53iigMfsNGsoI=
X-Google-Smtp-Source: AGHT+IH0OJfkjAgMzQqRakprSyrN6tCPxBuCGvpfdT55BzOyLssSQCuBpAQ8A1Mu0tIEefB/dW4VNw==
X-Received: by 2002:a05:600c:8b43:b0:479:1ac2:f9b8 with SMTP id
 5b1f17b1804b1-47d84b33b7bmr99212625e9.21.1767946860895; 
 Fri, 09 Jan 2026 00:21:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d86c6ff40sm123761785e9.2.2026.01.09.00.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 00:21:00 -0800 (PST)
Message-ID: <6ef89318-5fa4-47f5-8027-04a91656d81e@linaro.org>
Date: Fri, 9 Jan 2026 09:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
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
In-Reply-To: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 1/8/26 15:21, Konrad Dybcio wrote:
> SMEM allows the OS to retrieve information about the DDR memory.
> Among that information, is a semi-magic value called 'HBB', or Highest
> Bank address Bit, which multimedia drivers (for hardware like Adreno
> and MDSS) must retrieve in order to program the IP blocks correctly.
> 
> This series introduces an API to retrieve that value, uses it in the
> aforementioned programming sequences and exposes available DDR
> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> information can be exposed in the future, as needed.
> 
> Patch 3 should really be merged after 1&2


While trying it, I got the following warning:

In function ‘smem_dram_parse_v3_data’,
     inlined from ‘smem_dram_parse’ at drivers/soc/qcom/smem_dramc.c:380:3:
drivers/soc/qcom/smem_dramc.c:216:31: warning: iteration 13 invokes undefined behavior [-Waggressive-loop-optimizations]
   216 |                 if (freq_entry->freq_khz && freq_entry->enabled)
       |                     ~~~~~~~~~~^~~~~~~~~~
drivers/soc/qcom/smem_dramc.c:213:27: note: within this loop
   213 |         for (int i = 0; i < num_freq_entries; i++) {
       |                         ~~^~~~~~~~~~~~~~~~~~

Neil

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> - Handle rare cases of DDRInfo v5 with additional trailing data
> - Rebase/adjust to SSoT UBWC
> - Expose hbb value in debugfs
> - cosmetic changes
> - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com
> 
> Changes in v2:
> - Avoid checking for < 0 on unsigned types
> - Overwrite Adreno UBWC data to keep the data shared with userspace
>    coherent with what's programmed into the hardware
> - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
>    branches separately
> - Pick up Bjorn's rb on patch 1
> - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com
> 
> ---
> Konrad Dybcio (3):
>        soc: qcom: smem: Expose DDR data from SMEM
>        soc: qcom: ubwc: Get HBB from SMEM
>        drm/msm/adreno: Trust the SSoT UBWC config
> 
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
>   drivers/soc/qcom/Makefile               |   3 +-
>   drivers/soc/qcom/smem.c                 |  14 +-
>   drivers/soc/qcom/smem.h                 |   9 +
>   drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++++++++++++
>   drivers/soc/qcom/ubwc_config.c          |  69 ++++--
>   include/linux/soc/qcom/smem.h           |   4 +
>   9 files changed, 485 insertions(+), 120 deletions(-)
> ---
> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> change-id: 20250409-topic-smem_dramc-6467187ac865
> 
> Best regards,


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D1C1F6EC
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 11:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D7E10E8C9;
	Thu, 30 Oct 2025 10:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WYPWYjAU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5A010E8C9
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 10:02:58 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so11797925e9.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761818577; x=1762423377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=7cZyc2F+uCR0RhVCjuRr38GEFiWRVmB/pYGXqMvYdqk=;
 b=WYPWYjAUiPfA9DU15326hwKPFcmk1CIIcFHB0ILDLfJLs5BlCF/o2TI6W/9YhXl3st
 Hlo/6llPV3i0hP1WQRJxtkJLUbJ0Chalig8Y6L/+q8zotH51T10GEPk8dEpP2kPdEKSW
 Jii8nRmlLhZOZIJ+F4HJAJUjYY0jowZOvj25kVmpu0nh/dxu725MEpDU0CwIxvxrNN9P
 Mi2TUFVYkk10XF+4wlqNt3jpezMyo45LD2mkcOT3DGG/ph6EWusvJZZCjXmft/pS3f1a
 VB9cHspWR9jErtJVrPadVOscVrOU7JkB3CbBQKb2bjtFFKUbEZk/FCKavcQyea4z2PRs
 hMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761818577; x=1762423377;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7cZyc2F+uCR0RhVCjuRr38GEFiWRVmB/pYGXqMvYdqk=;
 b=mbbmqpV/YY1MWvCuRGncH+84AMkEgCB3jlennx5rHmTheg+a06E/3hh4MJv6waDVpR
 /xLvMXdJx7nDVW5JyxbQC7ELeAU61Rp0IW6LiLU5zzazAhoC7uOZ1bLhH5es2LTUMnUE
 EFevqSruFJ+b1Y3a3YxwMFRIukyEVriZXbRfLFw0kGaA7oGAJzTYNcR5YnaxV9osZHJ0
 g3q5lbb0VUHisl0hZjQ8l29/zNtXlWAO5fQql1iY/hw965fAmbqMVjPdD3Z1tVTbW8S1
 iPSCsReGWv4sqrQyuQZmEz4Hhoch60VWW5TzW2lCwyH1RvyPMI8F3dSdfAz/Ac9XwxgD
 /KfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxmBTaRRT86J0BpkhkH/W4k5TV+eUUqW6puPKpDOfYlji1zH5Ck41A8XuyGLdEXkH251kenjDMDjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPlj4Of5Aq7+i4KbpRPA9AYM5scR7GKvHy6dTB1poaD1NhLvhV
 SWbhHLGuYBnwvI05Lg+ERvLq/jb9dxo2ZjeZeoPzartLwcnoWHoFIJsn3t6TuVAlRX8=
X-Gm-Gg: ASbGncsN65HOuyBoLb0efg+W7n1Xb7ItxEPGk0zc5HwrNKKFBeWbn52wC412QIrWifn
 xPWwfm8+WMKz4iE/B5zvIx363AIaFcLAezFgtft0K7Znajk2zeH13KMe6WZOporiz97AbWZrP7n
 JZKWdQ8l8QUXYXujgchQMXEfMoqXRerlKdAkJ7xrEy2lsf5KxYXO99ULVB6TJGNogRZ641uO3Ge
 BkUk2wv4DREPr4nks7Vf9VclyavUD8DPHI/WQBdgZT2S1x+OEIZrj/aXEh7a5c5+hfCohMsk0qY
 D+wUrmxQnFtWMpX6FURxB1bddOM2UEWncuMOLsoI/fRbRENKfujergGq+C5m0rfjLg9CXg2bpFq
 ghWWCIH6ho6/eAqJQVLbIndT76/CqepXF1BvplxJmdboc3XiNszIhZIaW0hA1xfisUqRMGvrO/q
 K81ozYR8Lp7epxqEBXTpQ39uUMMFUoYbhhDaL6GXzKI84UCA/0M7/C
X-Google-Smtp-Source: AGHT+IFJBoa9YdfMbxiAk1SCPTzm/0RQQYulj8uAJ0Kt0YVpcYoKE4JtI4r67rxKu51doX5nxSQpwA==
X-Received: by 2002:a7b:cc0b:0:b0:477:f2c:291c with SMTP id
 5b1f17b1804b1-477262baa1bmr18108475e9.14.1761818576676; 
 Thu, 30 Oct 2025 03:02:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477?
 ([2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728ab375asm31884385e9.17.2025.10.30.03.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 03:02:56 -0700 (PDT)
Message-ID: <36f62e69-ef7c-4f22-93ab-32bceade3fd1@linaro.org>
Date: Thu, 30 Oct 2025 11:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
 <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
 <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
 <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
 <a15e8316-96cb-452d-b2b8-731eeb6d25d3@oss.qualcomm.com>
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
In-Reply-To: <a15e8316-96cb-452d-b2b8-731eeb6d25d3@oss.qualcomm.com>
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

On 10/30/25 10:52, Konrad Dybcio wrote:
> On 10/24/25 11:11 AM, Neil Armstrong wrote:
>> On 10/24/25 10:55, Konrad Dybcio wrote:
>>> On 10/23/25 10:27 AM, Neil Armstrong wrote:
>>>> On 10/22/25 19:09, Konrad Dybcio wrote:
>>>>> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>>>>>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>>>>>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>>>>>> full performance:
>>>>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>>
>>>>> Does this *actually* cause any harm, by the way?
>>>>
>>>> ?
>>>>
>>>>>
>>>>> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
>>>>> to a pair of GCC clocks and GCC refers to VDD_CX
>>>>>
>>>>> and I see these prints, yet:
>>>>>
>>>>> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
>>>>> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
>>>>>
>>>>> /sys/kernel/debug/pm_genpd/cx/current_state:on
>>>>> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
>>>>>
>>>>> I'm not super sure where that sync_state comes from either (maybe
>>>>> dev_set_drv_sync_state in pmdomain/core?)
>>>>
>>>> The way we handle the GMU so far is wrong, it abuses the driver model.
>>>>
>>>> And this is a symptom, whatever the impact it has, it needs to be fixed
>>>> in a proper way.
>>>>
>>>> The sync_state is retained because the gmu device is never probed but
>>>> has some clocks and power domains attached to it, which is clearly wrong.
>>>
>>> Yes I agree, however I'm only debating the commit message claims of
>>> 'leaving the resources in full performance', which doesn't seem to be
>>> true
>>
>> OK so the wording may be a little bit extreme, perhaps something like:
>> the GCC and GPUCC sync_state would stay pending, leaving the unused
>> power domains enabled for the lifetime of the system.
> 
> The debugfs reads above suggest this is actually not happening

Oh yeah so let's do nothing, thanks for your very useful nitpick review.

Is there anyone going to review the actual change instead of the commit message wording ?

Neil

> 
> Konrad


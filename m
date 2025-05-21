Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F3ABF6D1
	for <lists+freedreno@lfdr.de>; Wed, 21 May 2025 15:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FED10E9BA;
	Wed, 21 May 2025 13:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r+NtCRJw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5058514A77B
 for <freedreno@lists.freedesktop.org>; Wed, 21 May 2025 12:51:25 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so55383205e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 May 2025 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747831884; x=1748436684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=e/jHmzzVj7avj1EieVfvkWdGnf23YVTEruZCNzw90qE=;
 b=r+NtCRJwTKE6nDX/Gy8wIbHNcH3ONXlVUD1a4zYd4b4lw16FkrO6w3w5NgG6HRh5Y9
 xLovgAZAE6WAIVQRM1cod4uScn5zaw+Tm7cm4zWo22X4d1fQz2tmCcKA658lzCCLqJvr
 5WIdCjV6y+1K8jAjY35TnhVH/7jwTVm5uUeaiWVpLd4Cx/tXHw3taU4a8/U5DnsA2gGo
 ac2LwqQ1+xvO6IgPrzmu1nOXlXlGL4bnqVf4BHuZsSYOqpiz1trHRQgvhAj/15nIBQUM
 ULUGBy6XB66wjkGb3AKMXpKj1jy/+uSeWkSlHk2cWmrJCqtrPhW7vBk6Rm2+W3NsP5NM
 sy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747831884; x=1748436684;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=e/jHmzzVj7avj1EieVfvkWdGnf23YVTEruZCNzw90qE=;
 b=pIh6/HwxJy4mPrm+gZx8TCQk29x42eN5U8/v4hsc1q+/Q7RNHhpwP8NrqHYHp1vfD6
 zB90pS/L6uKd7pLF+XlpdkETJQmt9O+tNoW1uYPiHOsrUZuDVUdKj4w73ZcRL3bxFj3B
 ph8jsEufoQncdmMyGJmfEF6RZG6ggwqG60vrpzzYyYE9AZ3Vpa+vV4ObFRINBv/X9Wet
 nxYfaEjRlTTugnb9/kUWTnEIgkB4MctoK0CTAexclMPSVzIW0+3a9kRtzyDcE4sFdmqo
 Vw3OrWfxnVzpsUhZ8JYvXD00gdhFM2YHQOTWV4LOoBCn/heXkebBU3vlCvKPmJM7B0iO
 2TkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDF//IL57XtP+7D7te165F+G5HhLxodRRDvKQ5uiEprFdJAzuk+ACqM/V31Qr/NYoLKLyPf2E3ll4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCg40FG6jxHpgqYZv2MNk+hiW8lPzs/ZjTu0tW1UXhL/9wPhZB
 R+IkauQJORHsy6jL05UgGayX06WShaWhV5vSpkP33Yf6d6soabCwucgdIhcqDzoE4BI=
X-Gm-Gg: ASbGncvP+nXFNxzwwftF/P6f+ulsRBZdaZwdr+XF8Y6RpSQim7I62ehba1jXqf8NZK2
 27l8WnvGvP9dVPaJcPHXAhHJYPRG6sjzNahqU6I/hPBOfZ+J7MyB+lLXBHF1klpZIe+GqplNXgQ
 Wn6vAk77NZU04JpDR13YsADuLLqzi8HsNbHkChqeTxWL6HXBtpVcM6lhSKPHV3doaf23CTINC2o
 tq5BcJHEqnC87sCPTi6+mzow2CoI3xj62Pbwzm0we3CyxBBGWHt2Rsox60n05P4Gg0vqr5fSz/I
 Pd1J2zLarTwYJ/AjR6MziOviYekSVOYG5sqZoo5oXDrhc/D7wiTOSfoXBB/8iFE6D+7Q2uQDt43
 Gv18t6vMH7LrnMixLlVPZb9iiiedd
X-Google-Smtp-Source: AGHT+IFnVyqqduGLFeoeuylj/zZQ1NZU8qcb9cwDLm6nbxo5hFKroW6gCdx5Z9rdFWlJAbhHaS7W0A==
X-Received: by 2002:a05:600c:a016:b0:441:d2d8:bd8b with SMTP id
 5b1f17b1804b1-442fd622c81mr210080505e9.8.1747831883562; 
 Wed, 21 May 2025 05:51:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:80b6:c1af:bc94:958d?
 ([2a01:e0a:3d9:2080:80b6:c1af:bc94:958d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3ce483bsm67820435e9.33.2025.05.21.05.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 05:51:23 -0700 (PDT)
Message-ID: <e2173a8f-db10-4fd3-8bdb-ea5e6664237e@linaro.org>
Date: Wed, 21 May 2025 14:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
 <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
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
In-Reply-To: <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
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

On 20/05/2025 23:29, Dmitry Baryshkov wrote:
> On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
>> On 19/05/2025 18:04, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Continue migration to the MDSS-revision based checks and replace
>>> DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
>>>    17 files changed, 6 insertions(+), 57 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>>    	/* setup which pp blk will connect to this intf */
>>> -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
>>> +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
>>
>> Why did you drop the version test here ?
> 
> bind_pingpong_blk is only available since DPU 5.x, the same set of
> hardware as the DPU having DPU_CTL_ACTIVE_CFG.
> 

I think it deserves a comment in the code or the commit msg.

Neil


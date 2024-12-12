Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15369EFE7F
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 22:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1D410E306;
	Thu, 12 Dec 2024 21:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IeNWADDt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCB810E306
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 21:39:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43628e97467so4273225e9.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 13:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734039588; x=1734644388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=I0k1fvuKT9m1wErYutTpuyN8BLsuG8GZk48OKFLo0lA=;
 b=IeNWADDtg942vi98KqGV1zkQaWSFUjTojbDeOE8Zh227Q21g0MesZPYzc5FNWDj0LA
 MNqpHQ3ij3ndQa+mmmjkqJ0L9jL7mXd7wdaGSrTBKPjL4qNOjAFtZeEGRrZaJlmS/x/b
 gOS6himSMdo4tJ0ACAgD5RMoP7WLZi2TFt7tzTypVUtC3KHjSe8TNvuashWDhHMbPBa/
 fJsn6LLQvY1EKI+VdTvItRRB9YKtKWfs/hL9Mg3o3Ah5dW2K8KkgWe5hGA/mpvZeOmK1
 m3OxoqoxkJ2FDVu0nfl9V/5DHESvy1NCKP4hX72f9b9MbVvoft3lPMlkXTgwFh1iETrR
 gGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734039588; x=1734644388;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=I0k1fvuKT9m1wErYutTpuyN8BLsuG8GZk48OKFLo0lA=;
 b=trg7qY0tWgXHNIINNlOpF3lT7CCXA6dRkTxcsndktnxhsw/0+R5EK1f+Ygxm0RXGJ1
 zpzU/GsEqWgvan3atcp1BkBlxvjiZZdp6cKvs1/AabYquSPComGoESTnybs/E4xQdD9o
 Mza8hdzZbv3rQsD3Nu7QHYclcJ5kkKWdRF3u8sfI3Mfnc2ZGXMCIES7IdbPBpoEdcKod
 4cJvptBRzEkUOLlaQX/114edtzjpXqbZfX0RXrVWTFWUMf0DSr3BGY9vj4hGgRVSt1Wd
 5iS3OO8qRDpu1UlPm+kl6hhomRGejtiJjW4CUThH7bkdBJi4Q5l/QEQtfPueEQbSB6fK
 LQNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/FSlgAAhZCgh9PDGO3BPbKMJg//lgrLz+NlwnFdlbjOHpf8MOvIsmgMaPSKoSob2hMM5eU8nW+4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyijh5vZLgyk31GstU58hgJlGFas0uOEgQxx2R7WRcc09OQmzZD
 pwbebJUaZv+A3FAtmo/aILsb0sKVeT2agoZsm4w99jNqONVs96xoHywpbux/QSg=
X-Gm-Gg: ASbGncsVnX1OU25BySIVPb/mf1ZY2UMsdB2SMfvzJWT6aWAkic0Nw/n2xiVCBCqVfAb
 lSml1ahn3IJZLLGfXzYBZKKpL4otNeYM6UHZ4acQKdIDrMKja+jEswOKXwn5rzGmUwVPip5ZAiq
 jI9qzbTew+3kea8vPaUKEc+VXzvC8etXuuqR1xsAscmtSXOYmgkOTmb9J9MhfI0DiBLRBKKCpm9
 aFQh38dRcxgm8cXPzzFqT2oiJmvo4OO3OpL6ut547Q9FaaKqIJaGrodxYVwgv7h8AUqMqM8j/W0
 ulUXnxKEqlSOK6Mol5Ayfw1rU8VCQlNIuA==
X-Google-Smtp-Source: AGHT+IFdbMU+m/VBA7CRP6F9gkZQC7hZocBSfp3JyHJOM9EcJT7Yo+BQtQGBqVzNNych5hj5m0mWmg==
X-Received: by 2002:a05:6000:98f:b0:382:47d0:64be with SMTP id
 ffacd0b85a97d-38880adab11mr126646f8f.29.1734039587874; 
 Thu, 12 Dec 2024 13:39:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a?
 ([2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514e86sm5175242f8f.72.2024.12.12.13.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 13:39:47 -0800 (PST)
Message-ID: <c0e588d9-1ba4-4486-a889-df0649c40180@linaro.org>
Date: Thu, 12 Dec 2024 22:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-3-6112f9f785ec@linaro.org>
 <8d854f93-36da-4779-9ab0-381912aef4b4@oss.qualcomm.com>
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
In-Reply-To: <8d854f93-36da-4779-9ab0-381912aef4b4@oss.qualcomm.com>
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

On 12/12/2024 21:10, Konrad Dybcio wrote:
> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale the ddr
>> bandwidth along the frequency and power domain level, but for
>> now we statically fill the bw_table with values from the
>> downstream driver.
>>
>> Only the first entry is used, which is a disable vote, so we
>> currently rely on scaling via the linux interconnect paths.
>>
>> Let's dynamically generate the bw_table with the vote values
>> previously calculated from the OPPs.
>>
>> Those entries will then be used by the GMU when passing the
>> appropriate bandwidth level while voting for a gpu frequency.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..995526620d678cd05020315f771213e4a6943bec 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/list.h>
>>   
>>   #include <soc/qcom/cmd-db.h>
>> +#include <soc/qcom/tcs.h>
>>   
>>   #include "a6xx_gmu.h"
>>   #include "a6xx_gmu.xml.h"
>> @@ -259,6 +260,48 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>>   		NULL, 0);
>>   }
>>   
>> +static void a6xx_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
>> +				   struct a6xx_hfi_msg_bw_table *msg)
>> +{
>> +	unsigned int i, j;
>> +
>> +	for (i = 0; i < GMU_MAX_BCMS; i++) {
>> +		if (!info->bcms[i].name)
>> +			break;
>> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
>> +	}
>> +	msg->ddr_cmds_num = i;
>> +
>> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
>> +		for (j = 0; j < msg->ddr_cmds_num; j++)
>> +			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
>> +	msg->bw_level_num = gmu->nr_gpu_bws;
>> +
>> +	/* Compute the wait bitmask with each BCM having the commit bit */
>> +	msg->ddr_wait_bitmask = 0;
>> +	for (j = 0; j < msg->ddr_cmds_num; j++)
>> +		if (msg->ddr_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
>> +			msg->ddr_wait_bitmask |= BIT(j);
>> +
>> +	/*
>> +	 * These are the CX (CNOC) votes - these are used by the GMU
>> +	 * The 'CN0' BCM is used on all targets, and votes are basically
>> +	 * 'off' and 'on' states with first bit to enable the path.
>> +	 */
>> +
> 
> /* The CNoC BCM only needs a simple off/on vote pair on all platforms */
> 
>> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
>> +	msg->cnoc_cmds_num = 1;
>> +
>> +	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
>> +	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
> 
> While it evaluates to the same, I think this is logically 1 (as in, one
> unit of bus rate). The question of which bit that corresponds to is
> handled by the macro.

"1" has not meaning, especially when we're supposed sending a bandwidth value, bit(0) means this bit has a special value

> 
> Also, a7xx sets values in both x and y parts here, while a6xx only does
> so in the y part.
> 
>> +
>> +	/* Compute the wait bitmask with each BCM having the commit bit */
>> +	msg->cnoc_wait_bitmask = 0;
>> +	for (j = 0; j < msg->cnoc_cmds_num; j++)
>> +		if (msg->cnoc_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
>> +			msg->cnoc_wait_bitmask |= BIT(j);
> 
> This is a very fancy way to say msg->cnoc_wait_bitmask = BIT(0)

Fancy but we know how it's calculated...

> 
> Konrad


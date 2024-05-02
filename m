Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB68B9613
	for <lists+freedreno@lfdr.de>; Thu,  2 May 2024 10:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6330A10E0FD;
	Thu,  2 May 2024 08:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UQpGeLYW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4009810E0FD
 for <freedreno@lists.freedesktop.org>; Thu,  2 May 2024 08:03:45 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2de232989aaso92045321fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 02 May 2024 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714637023; x=1715241823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0Gwh/IaVsJdTO/wtoqCQNJq6R897Bz66ybMuoZB8azo=;
 b=UQpGeLYWSWRH6DfDhnOOt+frHefdVeXE5d5PSI5x2O4iDf+3FcAv89CqdyIn2EfJqi
 sMexn01TVngOYDwzVl5k3+uJs/2NgrMkUxIC0JLZ4OzyFYds1V0UKHe8lpd0qtDgsQ2t
 MCh6q7evL67r0/QEoAYQaMd1wi0WmGcJEVhzLj66MY30u+iKccyJXSbj6eJh3zNCLMtF
 Kf/4HaTB9amI5OSlAkYANxty1gA8LN0kaX8wf3M5DYwovBKlwENrgPDlxl+6ihecqkeR
 vPSpDFWrF/1ASrXrO0vbmp6YQek4awM4gGtIfNKAoS/KJMzc8BH9jRdE4HX919/LlBXP
 hCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714637023; x=1715241823;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0Gwh/IaVsJdTO/wtoqCQNJq6R897Bz66ybMuoZB8azo=;
 b=o6nPm7bCKB4SO96WR6BV9Ty6ioTF5bZJ4lUL0Fq2sEzjGQ81C9KgrDhpTPodEjsN9V
 Ju6ky/6s3sgWQLfZ9xzjpsbG44nbhjm4XZ4aG9k645W00DJu5qDFJdT05Lju8AKEZfPw
 MKgnBTwo/u/Vzh5cBY1RQcbF6IyzK4qGBlLPCaDk3+m336GQ7WnD8GGFpjJLMyUMA+XS
 tq20OGm+CJ3vP6/5HcqTjLVwUuQkldKWRb9xNCL6y1pEoov3U8ZyeqXlGo+fs00OoUnd
 JbojbOdzIW0ChrhBAR3jRxrJv2Ffjn1ykPIEWBM2RmySq8lPMmAAlTrhdv3h29to+/Di
 geRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8xNmczznsQbRR1EnCCtsae60EvqhwUIymAqCQtvH3qAlGbMfuG9hZwmaUveMSbUHEpeTUGq5WBc5SAfTvwjxW74CscYj11pYm4P+in1/d
X-Gm-Message-State: AOJu0YwwCudnpopKeOwxTfQL8d4guPABScGJeaHSz8qxmlrkm5+WxUeT
 cZaiHGUcN8zF+cjx20nMZ9dGw5lu6uhDdRawWbAvcnX/fQHYYxlneWJIFOfVcf4=
X-Google-Smtp-Source: AGHT+IFKB2jYfl8fT7daTvXF76Voco2LUQCQynA10mjWN/2Fl/PgSJVaA7LhHuO7psiOU98YLDVNKg==
X-Received: by 2002:a2e:b0e8:0:b0:2e1:dc63:9f9 with SMTP id
 h8-20020a2eb0e8000000b002e1dc6309f9mr765564ljl.23.1714637023167; 
 Thu, 02 May 2024 01:03:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129?
 ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c4e9400b0041b5500e438sm1042055wmq.23.2024.05.02.01.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 01:03:42 -0700 (PDT)
Message-ID: <a4441fba-4a2e-4107-8fe6-c0dbb985fbc8@linaro.org>
Date: Thu, 2 May 2024 10:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jun Nie <jun.nie@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
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
In-Reply-To: <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
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

On 26/04/2024 20:33, Connor Abbott wrote:
> This is doubled compared to previous GPUs. We can't access the new
> SW_FUSE_VALUE register without this.
> 
> Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 658ad2b41c5a..78b8944eaab2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2607,7 +2607,7 @@ tcsr: clock-controller@1fc0000 {
>   		gpu: gpu@3d00000 {
>   			compatible = "qcom,adreno-43051401", "qcom,adreno";
>   			reg = <0x0 0x03d00000 0x0 0x40000>,
> -			      <0x0 0x03d9e000 0x0 0x1000>,
> +			      <0x0 0x03d9e000 0x0 0x2000>,
>   			      <0x0 0x03d61000 0x0 0x800>;
>   			reg-names = "kgsl_3d0_reg_memory",
>   				    "cx_mem",
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

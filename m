Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73239FE4FD
	for <lists+freedreno@lfdr.de>; Mon, 30 Dec 2024 10:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ABD10E366;
	Mon, 30 Dec 2024 09:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rqO3m0zP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2649410E366
 for <freedreno@lists.freedesktop.org>; Mon, 30 Dec 2024 09:43:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so5806843f8f.1
 for <freedreno@lists.freedesktop.org>; Mon, 30 Dec 2024 01:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735551767; x=1736156567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KMwQvIGyVkCUyV/IpsYbuvCQSMiHiTDiiE+Z7EPnTw0=;
 b=rqO3m0zPmXDW9tEsKn+JPl0GH+tdIii0tv6ekseYzxmedCjzJRBNNvwB7XVXf0WEJ2
 aosAyI1pO9DUfQ7Rw2wpU6qGvnDZsZnlRF5ojOQo6qhgxdcR2BwOLf19QFFh+74K7s2O
 Tg3LBu5jmBWUfAQxbBWcD/wLPonKkZ4mFDxPVPbszqBVPyh9dwvf5+xt2gvlB+ivHCn8
 nWqf1WSkrt/X5FywWj+74fW17Q5UpNhNINIFu89CMh6pnUWPhb/WW4m8vfGrofCcwAWg
 AdmhNhxcRPoKNqqlMvio5qMfz3YUIS+wXpMhlH0KMogo7xahTnzZ8koG5eizfIwWuRLM
 guCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735551767; x=1736156567;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KMwQvIGyVkCUyV/IpsYbuvCQSMiHiTDiiE+Z7EPnTw0=;
 b=RaO6lWtxJJDzl2qwmK0SlFZLpvgHUsqZYLqb9geA9Bqg3b0sLIATSfhG9tgG8HenRg
 ///xXxKwe6HGEuA/Wpr7LkoTdMCwEhJ8BWWJTXGBV6mPOMme1k34kiin5YCYA8XXznjO
 mgKxx8pCbRzn9GR85b7FYLufiR0N43jeeM4MaFd0M81ytRNtjtSidbTuu27OyGD9wnFl
 MBxp7DkdbazkK5jPJ5+iXFiwRH/4OeTXsGJBho2mkX6qH6eviSa0/Bx46l8aOcYsrJmu
 ++opye9MkTUJ6jmob10RGqfNeDHYmtEPnU5UAdIgmhw1hxByB5thEJfpqQtxsF33Givm
 gpdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLuksVvWDrN+CwPHqbOxlGElXz6LVjCQQggemlxkm/QLv0PLq5E/KxGCTUWEprOfpGzi3EyU9Dqfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxqr/CLkVi1UIF57XzRc37SApjuCFtJvScj/FQZJv242FLzOXnL
 iDKU1ZjN+QC2PQCBgsrYml2pCsJX56mqOQsHksxMLn3EBZIp5l/iuviqCFUzBhM=
X-Gm-Gg: ASbGnctQV0C1sMc/pT1D2dWpHHq6AJ1S2hQZ26yrKkgLIKVh9RxYH0v1FH1a5Mc0Jrv
 WZbiNUKaCGym6gtL9Rlb4rzWFte3M4Zv1hx/0y9jZco5vd9LSDLsE9J+BFeh5g2t9BXRjmgK++Z
 0d+7Pj6vtZDgVVWTSRRCjaQ8OZDvf0MRHIjw+fFOcTiGYoPOJKVtr+DbPJb9qgRcMGrfvL62sJb
 peZ5T/yNjICwDZ2h8tqNd+reVg0JJKcQry/Qs08Ps5enQE4wd3CWVA2y/3GadKGd5LSHgiMRuG8
 tjVmk89bnH8tBMzdWGD6Fut5fJLKK+JbxQ==
X-Google-Smtp-Source: AGHT+IGPIXYF0sevQ5D8W2iWMvwqdjetefwVRPrdv5IQdeYecck/HKi8ZIZb2Ho7ItZHOXvkJNA7aw==
X-Received: by 2002:a5d:5e09:0:b0:385:e3c1:50d5 with SMTP id
 ffacd0b85a97d-38a223fc3d0mr34907681f8f.48.1735551766740; 
 Mon, 30 Dec 2024 01:42:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:883b:3c16:2465:ad55?
 ([2a01:e0a:982:cbb0:883b:3c16:2465:ad55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b4274csm385758175e9.38.2024.12.30.01.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2024 01:42:46 -0800 (PST)
Message-ID: <77649497-8b78-48ba-9a30-64485b6ddb07@linaro.org>
Date: Mon, 30 Dec 2024 10:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: correct MDSS
 interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 stable@kernel.org
References: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
 <20241026-fix-sm8x50-mdp-icc-v2-2-fd8ddf755acc@linaro.org>
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
In-Reply-To: <20241026-fix-sm8x50-mdp-icc-v2-2-fd8ddf755acc@linaro.org>
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

On 26/10/2024 19:59, Dmitry Baryshkov wrote:
> SM8650 lists two interconnects for the display subsystem, mdp0-mem
> (between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
> The second interconnect is a misuse. mdpN-mem paths should be used for
> several outboud MDP interconnects rather than the path between LLCC and
> memory. This kind of misuse can result in bandwidth underflows, possibly
> degrading picture quality as the required memory bandwidth is divided
> between all mdpN-mem paths (and LLCC-EBI should not be a part of such
> division).
> 
> Drop the second path and use direct MDP-EBI path for mdp0-mem until we
> support separate MDP-LLCC and LLCC-EBI paths.
> 
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Cc: stable@kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 173e092b15e2..4b54063c0e0c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3455,11 +3455,8 @@ mdss: display-subsystem@ae00000 {
>   			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
>   
>   			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
> -					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
> -					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
>   					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> -			interconnect-names = "mdp0-mem",
> -					     "mdp1-mem";
> +			interconnect-names = "mdp0-mem";
>   
>   			power-domains = <&dispcc MDSS_GDSC>;
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

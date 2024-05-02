Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447408B9616
	for <lists+freedreno@lfdr.de>; Thu,  2 May 2024 10:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186EF10E0FD;
	Thu,  2 May 2024 08:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OE2RuUaF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6133C10E0FD
 for <freedreno@lists.freedesktop.org>; Thu,  2 May 2024 08:03:58 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so65257915e9.2
 for <freedreno@lists.freedesktop.org>; Thu, 02 May 2024 01:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714637036; x=1715241836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xyNbWUH2AJeq8x5xkAz8AZWn5WUNTsAjnfRWU12OotY=;
 b=OE2RuUaFZgsx4JMZBfere8Dmfif/3SxqsVIrQFQCwoL5nqPl7I+IpYbvfVOygQoM2c
 06rdNPwCiP+TFoW63wbdcKeWreMMHSATCcV0ERSmwvO4qSq5cX/hFk6nFeXQt+pnWusj
 2OpvSk6x+Sv/4NjPfpi7buQueBLavRPbIebyyk9NHYpYCSjOaj0amtnp5d0wG/+a8HLG
 +DCAP1LxKiJBj3/+keoPdP5Vnx2+KNCV78GEdQWxEqAtENt5URNGuSqVjcvZJv3mxMvm
 wUid0qAltLI6IS+vbqRexera2NCsti/2mDY/giWlykTNrbJQwVeJ7f/r4XO/PbXu5KWM
 6rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714637036; x=1715241836;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xyNbWUH2AJeq8x5xkAz8AZWn5WUNTsAjnfRWU12OotY=;
 b=tvRcX5SwoxabQrDpOWleAzUnkvHJNpaa0I6O37f3aMabGXL6GxyK1XvNogQUC8K6YO
 GH9cSqHaBJf7euBX513Hgv5hGT/2LId0JcgBEzGWlbDB5Bo77Rbmph4ojlHBvmlIEGU0
 3Pdh5kFAkYSm5FngTrdxsc/3Dv37YwgURBnm9D2ZuAYM5d+oIR2k4C34JxH+B/M9Tmn2
 ye8bRlfjKIXb++hGmDTqV5NE5c3nIeSDGxQY6foOjScRI9luu8acibGtU2fJ3r6acgkd
 ku3tnalyhb3Fvz8FU2h9IGV78GDRLisL6CM6XDk3dF3ELaLaT76z4AxJ899rpzVpqaP+
 4YDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULe1W1L7fM4S22gcB4+4hGeGQresiIiAGLoLyNdt62dD7Muhi4op7Jbk8+v+N4nD08LDJi5DS8ObOtf6jZohh0J4iUE2bNRX4uEcL6dvyF
X-Gm-Message-State: AOJu0Yx51XYYu5MQRPs93Q2YJPNQ336rjFBXt03n0O0Kjc7cA5nTci8x
 z4w08R8XWJ/b+Vd6kvo3wXLk9+5FJpI+W0O3quOv8b0a5wcQrX4piYpXl2fo860=
X-Google-Smtp-Source: AGHT+IEQcWkhWeusdWhjO9GSKwVQwq55n2Nz9CSKWdte2v9mj2LVlIVSwZk91kA0p23BmNfbY1FXow==
X-Received: by 2002:a05:600c:3b93:b0:41a:6edd:6c1d with SMTP id
 n19-20020a05600c3b9300b0041a6edd6c1dmr4235253wms.32.1714637036265; 
 Thu, 02 May 2024 01:03:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129?
 ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a05600c139500b004190d7126c0sm4791899wmf.38.2024.05.02.01.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 01:03:55 -0700 (PDT)
Message-ID: <11d004cd-2e6d-4d9e-84e2-7b2da08036fc@linaro.org>
Date: Thu, 2 May 2024 10:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
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
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-1-7f57c5ac082d@gmail.com>
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
In-Reply-To: <20240430-a750-raytracing-v3-1-7f57c5ac082d@gmail.com>
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

On 30/04/2024 12:43, Connor Abbott wrote:
> This is doubled compared to previous GPUs. We can't access the new
> SW_FUSE_VALUE register without this.
> 
> Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

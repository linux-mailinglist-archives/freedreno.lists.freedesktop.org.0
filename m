Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A877E28F3
	for <lists+freedreno@lfdr.de>; Mon,  6 Nov 2023 16:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6710E34C;
	Mon,  6 Nov 2023 15:45:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9F210E34C
 for <freedreno@lists.freedesktop.org>; Mon,  6 Nov 2023 15:45:37 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c50cf61f6dso63792831fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 06 Nov 2023 07:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699285535; x=1699890335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=j4zNa66tU9LDu4ntzAjdNZcWXIQRXUIkVKUhIyKqwfs=;
 b=fbP6EIJF2DAc/RC0YxV2ziICkIFE8Q8SYEgnv89SZ+/Ynz5zKYGRzvNfzqRIJwCKTr
 NZf/PZg00hk5nF2tC/tDpIo8BUqlocPLTHsSKxdV+VUO9bRdM9Y0Fi/yKgyAsb0EVMAX
 FWKiWvRaAeKG81dbgdKUSv274sixv1XqunatbIksySOVrMqqp6bRjiyvdaKrhCTAXN7q
 5d/4eTopVWRbB6G+Kj+buf6FEpBNVvI52fEoU0HxqcgwZuDApDWgNcoG2823PV3n3cR4
 IsPzfV3ILRJrnLHQVjk6nrdxnBGdpO1MrF7hypFpqoAJhreWMQ2Z6cR4tssM7/plHtBH
 J6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699285535; x=1699890335;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j4zNa66tU9LDu4ntzAjdNZcWXIQRXUIkVKUhIyKqwfs=;
 b=uzFxfuqIj5qUjUVUPQTzlZM7kNin5yVEaMkwkr+BLZ2H2TR4I8plcqaqcopF64WufA
 Zqhy0QAzegTtbf2xWUrgmjBEBuyOGsLKXOruYNqR3MyU2lgWe0DrTwi6tQ5zpah80Tqq
 VviYCYO59n7yu2XNsdJex7aEMSEfLQaUh5NoVYMP2vDglxzzPoCBO8CxlC/vzzPKPVMO
 6q/7gQDRXChj9bQAYUU5UXs1pkOrwdhkqPNqqIOASoNbOK7aPExon8fnT87h/wlilbUp
 mI1YaNxVi8JbWeJycY2YsNIlEoFHjFs4DQMS3gmcfD1YbolVcj6Re9ascMPRSIrKJS8G
 6Zrw==
X-Gm-Message-State: AOJu0YyeqQYxhWJFhv2uGT4IDX4mEWs4UnThxjJZVOA/EUhOjEKeTDru
 dRtfirA/u3ZNpFlL4w3Asa9KKA==
X-Google-Smtp-Source: AGHT+IEKrFLBL4eYJLlAb1eNsc/xpLwlEqxPzH/et4FbIUCOtrwSehAb36ib1E4knPd7s7Av6UgHSA==
X-Received: by 2002:a2e:8e94:0:b0:2c5:2133:a9fc with SMTP id
 z20-20020a2e8e94000000b002c52133a9fcmr22315017ljk.40.1699285535542; 
 Mon, 06 Nov 2023 07:45:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7a54:34e:8001:fb7d?
 ([2a01:e0a:982:cbb0:7a54:34e:8001:fb7d])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b00407efbc4361sm12735833wmq.9.2023.11.06.07.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 07:45:35 -0800 (PST)
Message-ID: <aaacd997-4b85-4086-982a-c992ad52831a@linaro.org>
Date: Mon, 6 Nov 2023 16:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
 <20230928113535.1217613-3-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20230928113535.1217613-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 2/6] dt-bindings: display/msm: Add reg
 bus and rotator interconnects
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On 28/09/2023 13:35, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
> other connection paths:
> - a path that connects rotator block to the DDR.
> - a path that needs to be handled to ensure MDSS register access
>    functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
>    interconnect.
> 
> Describe these paths bindings to allow using them in device trees and in
> the driver
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index f69196e4cc76..6b4ce08a60dc 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -66,12 +66,14 @@ properties:
>       items:
>         - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
>         - description: Interconnect path from mdp1 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
>   
>     interconnect-names:
>       minItems: 1
>       items:
>         - const: mdp0-mem
>         - const: mdp1-mem
> +      - const: cpu-cfg
>   
>     resets:
>       items:

This is not enough, on sm8450 this still appears with patch applied:
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: display-subsystem@ae00000: interconnects: [[182, 14, 0, 30, 3, 0], [182, 14, 0, 30, 3, 0], [53, 2, 3, 183, 14, 3]] is too long
         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#

This is also needed:
==========><================================
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 001b26e65301..e94e8630cc85 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -30,10 +30,10 @@ properties:
      maxItems: 1

    interconnects:
-    maxItems: 2
+    maxItems: 3

    interconnect-names:
-    maxItems: 2
+    maxItems: 3

  patternProperties:
    "^display-controller@[0-9a-f]+$":
==============================================

Thanks,
Neil

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41113A2C459
	for <lists+freedreno@lfdr.de>; Fri,  7 Feb 2025 15:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C0310EB09;
	Fri,  7 Feb 2025 14:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xWauh5dD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BAA10EB0D
 for <freedreno@lists.freedesktop.org>; Fri,  7 Feb 2025 13:59:31 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38dc6d55ebaso626781f8f.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738936769; x=1739541569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=hkR9wNKJuVrn2xXLtp0xWMIVzcU5W5qY2aQJeG+PYo0=;
 b=xWauh5dD+44K2rHJofM2NypMCc9CqIDEctqmt6ZgqJZ1xffISwzXTDqGRj5+i917Ey
 Gvi4CpV/EvkoJcSkVK5huyE1AdbxE/m56yUR3znUluGTYHprDrMXSddXVGnSqUR7T6GE
 eIM7/ivlw1VkmraP35tXgCHbLD2N5jvfBUUZn7D3duW6doUrQc0EbNzmRgq5kvvNtMom
 s9G+Kp+HhQyOTbQK+GJrPM3mX/1w4IpsmPMX3RolmyB8nY1+fj9+tN0YUo2MFEsrYCAK
 goWFXlg0e+pq5YOZhkZpc/d1x+MN9UA3ofsGEiZN0NZBTyeh1nXPxHKhx6U/ysiw8xdM
 CUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738936769; x=1739541569;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hkR9wNKJuVrn2xXLtp0xWMIVzcU5W5qY2aQJeG+PYo0=;
 b=ow/vZYSHZtsO1aJyQQd/ZCNf7WlxWYcrpI6n+m3V02Km1l6AZyd/4OvOziSmQjwOBi
 v4hKYS7HrNWz82x6jzTDe/zyue+wAbpVZ5xt8oeG0vRSvmyn4Kd/OmMvXGueOLd7dK1a
 LnhHpkVZPk48wZ0YNDarOLYfDpMyZBThKYClktrFHYcoqTGgXqp4gXPHF4BiPgbcomhK
 GLu1ytb9r2hq7dJ/DGStvkhvYrMrEhAcOnB6o6f5FBRdxy26C7eGmS3hHyQ7uB+0YVK9
 NcmvpN1P5s3WH2wZG2KPMT4R8NI/mf01UKqp1JjxqOanHbGde0xaX9rfQDavubdTmB+o
 jsyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJcL2w1Fjgr/Ry2j3qTgq69qFYRqfp+q4NI6wMA7TNY4FUUFI+5ygyOAGHEOuAF5ygF1qQmHG0DnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxstjcxw/m5hffNd1jg1LGOUL6+A6ABI6VIIrtcCtLT6l5ROzIY
 toVGI6bUqIBjSMBY6GK5nvl86zzLQwm1xqu5Vuf4Ipz2a+4gpFV+zPCwU+1uUmI=
X-Gm-Gg: ASbGncvw7aeF040uuqVzVKYKPUotXlFqB9TtBD5NE0HSQ89MdnrBoPR/sGqcCZ2oCFi
 mA3oKPE/pWb8DcbSX8A8IeDNiLOAt7jC16UkELRFSvlAMhyFjHnqiljTsaaCLedev2qV5SY36FX
 TI020HLNcpK+8d1a/bAR2NtEnG3wFvvQaJTZt+1eqj+ZxrbhJIU/Av5I+KxAPLC9n3aj1O/CcB8
 haxAi5XBaay+Tom+S9rtoDuMg7bh0tvyijS7VK62M83xd+9/gSxjCqiiqkWy2L1jTz0wfNLLapU
 fekyi5mBlCiuaJnaANw1ovwaVNmCwvaxXrsUJPWLVnywRCKQMa7SCDhhCQxF+3+Q7iPX
X-Google-Smtp-Source: AGHT+IFaHTGIHzKLUvnWz9+Y5u7+raJr/5Kf7pvr1qGvrp3QDa8oLg2Fjp7WNSzvc3RsTpW1NE2RGg==
X-Received: by 2002:adf:e60b:0:b0:38d:b52d:e11c with SMTP id
 ffacd0b85a97d-38dc994edbfmr1754061f8f.15.1738936769612; 
 Fri, 07 Feb 2025 05:59:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b26:96be:712e:30cd?
 ([2a01:e0a:982:cbb0:5b26:96be:712e:30cd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd1af07sm4646491f8f.15.2025.02.07.05.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 05:59:29 -0800 (PST)
Message-ID: <ec30d033-f53b-4d71-8c36-b6448879b691@linaro.org>
Date: Fri, 7 Feb 2025 14:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: qcom, sm8550-mdss: only document
 the mdp0-mem interconnect path
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org>
 <173893208278.4072473.6097194764742914829.robh@kernel.org>
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
In-Reply-To: <173893208278.4072473.6097194764742914829.robh@kernel.org>
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

On 07/02/2025 13:41, Rob Herring (Arm) wrote:
> 
> On Fri, 07 Feb 2025 11:50:37 +0100, Neil Armstrong wrote:
>> The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
>> mdp0-mem interconnect entry.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb: display-subsystem@ae00000: interconnects: [[4294967295, 3, 0, 4294967295, 13, 0], [4294967295, 0, 0, 4294967295, 1, 0]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Damn example, went too fast...

Thanks,
Neil

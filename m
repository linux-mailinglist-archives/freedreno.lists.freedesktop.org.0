Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F919E3A00
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 13:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F363410E49E;
	Wed,  4 Dec 2024 12:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sLOZmmHw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BD710E49E
 for <freedreno@lists.freedesktop.org>; Wed,  4 Dec 2024 12:31:21 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso5368761f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Dec 2024 04:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733315480; x=1733920280; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cbWwdT7tE9INHbs3KzJyjOSIJ8TmE2VppwJHxa8fgK0=;
 b=sLOZmmHwITBAmrjv25SNq4Tr344IYn294JvXYX6SYBSfEO0PoBVzPEwXcHOFL/hBCA
 MLfUAa6sSztdSaXy2U70MfP27mD59mgawAImf+TeFW5GPD/Q8mRKQu8BJirEots+esIl
 HnspLWzid0mkMt9oL6wclsB5nGoA7ng5saiWQT15t6iycZIHJt+vfZy0sYxuzCmXRiH0
 KRqyKaamIJ8u6oXlk3iLdgbJPdGyIpdGVK9El0n9I3ZnPsGRaboMteeIlUYvp99h7TBT
 aQtmWdCg/4t1Tzqwm6Ggm+QjKVWiFw0rUQXhebP9FVqqy7HVcMNIkMh+aOVQtcmIT9iO
 4MQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733315480; x=1733920280;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cbWwdT7tE9INHbs3KzJyjOSIJ8TmE2VppwJHxa8fgK0=;
 b=EZ/ZKkxOI/2U96QkmlP6QxHDMN49A8KQhV9qrmkAi8GoaGjTEnOgrZWdiIyue0VPR4
 ab4Ly+jQGw1odKjVa4qJeIj7F5nUAI/oM+kTz/LXg0s2v5cbGRN2BIPDDz04BPL1TznW
 sM4jBhDzo63ABR8QZXCquawwqyZB/oKGKQl3COew4c3wlDyNS6QVoKlE8/03IrBf/oJv
 QbvwpCkEE9bxH5pfaA0CHWkUONnyUyk2wO8diKYesHAMqvYSwSVIkNhOvInL0gDM5+u/
 ykUVlSQBtReGzzl8Qar3iVW4rtkb7KhrEP1P7ThoOhK6ZuOvwWPLgcT7EWbkgSZTzvHz
 VT+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9ER+QrFGwTtlvZmEAA1plaTXSVtJ/Jt8zg74UBbe3RIB8BupLokOREYLzJ1ZsfjMyvfVSQHXrL/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTU26pgE8t8JqlmCZpWHSLtxU5f5xQRpo+dFpqgwfH6Y2ZIT9j
 N1NL18TZCHDwvdbxtZkE9EIH7z5BN7pU3tZSf12CqbuVvK+habB4m8m9Fhwxe1U=
X-Gm-Gg: ASbGnctb7DBaHdAC4UrNYl26MqybSj3PpirCZ1BQrEiKBs7W4ATB1Eu6RxEks9MLj7D
 NxP1IJddNhOPIhZ5ymSDRiUHA9de05o2ujz84+/WJ69KCRdsNjz0EDsZ1res4bl8TyHytKQIV3V
 wnCSzrF8YV2vPp+SWG5KXte1xdW2/SVrx3afdciNuqMXawOrOIujDl4Wf4/nHmpblgParVl47ue
 stuRibr6yvOmq+eP62XND37XoPJ/s63jcfXXjvCUEHpB2LyhLKFBRoCVPVJk5t7VL9HEu82oYP1
 qm+Uu6/OPC3XsgL+Pkw33QKa
X-Google-Smtp-Source: AGHT+IHlnaIAnJCdDW1tnpOh5zG5O4kkYOWjTdY1ooDYR2tXwky8ii+ehLuUnq0yb/fUFPuqeP2PTQ==
X-Received: by 2002:a5d:47cb:0:b0:385:eb7c:5d0f with SMTP id
 ffacd0b85a97d-385fd3f29dfmr7132352f8f.26.1733315479660; 
 Wed, 04 Dec 2024 04:31:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:740:b323:3531:5c75?
 ([2a01:e0a:982:cbb0:740:b323:3531:5c75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e5e3629fsm12188615f8f.93.2024.12.04.04.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 04:31:19 -0800 (PST)
Message-ID: <6e4f39c4-fe74-4b17-b333-47ce64d458fb@linaro.org>
Date: Wed, 4 Dec 2024 13:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: msm: sm8350-mdss: document the
 third interconnect path
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
 <173331176548.4095099.9767845657326548018.robh@kernel.org>
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
In-Reply-To: <173331176548.4095099.9767845657326548018.robh@kernel.org>
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

On 04/12/2024 12:29, Rob Herring (Arm) wrote:
> 
> On Wed, 04 Dec 2024 11:36:37 +0100, Neil Armstrong wrote:
>> Document the missing third "cpu-cfg" interconnect path for the MDSS hardware
>> found on the Qualcomm SM8350 platform.
>>
>> This fixes:
>> display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
>> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
>> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>>
>> Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb: display-subsystem@ae00000: interconnects: [[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295, 1, 0]] is too short
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem'] is too short
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

Oh, indeed, will fix in v2

Thanks,
Neil

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org
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


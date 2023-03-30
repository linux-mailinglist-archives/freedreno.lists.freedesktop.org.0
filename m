Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0182B6CFC48
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 09:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B6210ECEF;
	Thu, 30 Mar 2023 07:10:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EB110ECF1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 07:10:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m2so17990858wrh.6
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680160225;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=A9g40+pYko1oQ0+izLCIUGQJsSJvSt/dnzj5Sjs9caU=;
 b=NjKNBdMCQzrdk/xTjAjZU9GPJg4DJiKkX1+5pFtBH3PKdMcP8fPGH/ozfuheRs6rIn
 uJh5+X0wh+SvoSk41CF65WuN+k/yQTcsTUbTAxgwFfykK3daI2F20+wLcZBiIjJ6w+Sv
 8fyNnCYfC7ag8UMhd5VWZLeFA1eqNJe20Vsps46/lStdI8uX3XTEI6jzQ0G/o009Yk8W
 a2kPMt6lsrmf5w+cH4Ci7qWs8IkJYRs9qSPpThiXkOBgXR129dWiYv/BK/5ExP5Q38mC
 n28qaFtjReqnOiS9QIPGj7lpExEA7+mLlR6EE/q1z9WIly8cNiJfjq2kbCyc/fk9iD+6
 qnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680160225;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A9g40+pYko1oQ0+izLCIUGQJsSJvSt/dnzj5Sjs9caU=;
 b=hNvZpda1sYjX4Ilo7gUzyOTEAU9B55N1zr1EkJWoEpoDwo5LptMBXkzvrd+CJyOfw4
 Aj2Ky4C6wvlur9J/2lSINaK9yaqLEGf98JNo5HDeHOQwsN0srmz6gBEUW8p0mi9Eto7o
 gJGEZG2EPKfByzA3FpzW6hJkKboTIVAC0KI+RrDtVKm14y42Td9b3Ybt8D65zDUEFi94
 4zzGjqtDrAUxaw1TQ7wQTXsrC6ybCS/Glcl3pqXgv/Nb2WMfEutkhcF5BSYk5xPBz0dr
 pdjUWoqZmOicM0y4OYJwzTOIIUe5agyYxyoKkwCZssrMKXRc3F+5GrjxoE54wK5wgh0f
 xarw==
X-Gm-Message-State: AAQBX9emgkgwtWrhvf2mqChtwqwS2O/BHtLu00psRB1bWgRsllrsQHVU
 ikuKMerJeWUCK+XaXThy1r4L+w==
X-Google-Smtp-Source: AKy350Z2+SKpQJsn3un+Yupn3W4e1PSsxpmxTXJvC9uXmIaar1BNFnuKt0o5hcdn4tqg8pKQO5lI6g==
X-Received: by 2002:adf:e68d:0:b0:2c7:d575:e8a4 with SMTP id
 r13-20020adfe68d000000b002c7d575e8a4mr17065061wrm.65.1680160225095; 
 Thu, 30 Mar 2023 00:10:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f?
 ([2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f])
 by smtp.gmail.com with ESMTPSA id
 r10-20020adfce8a000000b002cefcac0c62sm32330053wrn.9.2023.03.30.00.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 00:10:24 -0700 (PDT)
Message-ID: <8489ff19-047c-c68c-05a9-1cc01ea772dd@linaro.org>
Date: Thu, 30 Mar 2023 09:10:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <168004255469.1060915.1800625604847213121.b4-ty@linaro.org>
 <CAL_Jsq+VoBkpCT_iUD1Nq_SazCVDa49rn0qtX3Qnm1KBB3gkcg@mail.gmail.com>
 <420b5400-844f-4ca9-a4e3-1f5f6536f7a2@linaro.org>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <420b5400-844f-4ca9-a4e3-1f5f6536f7a2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 0/7] drm/msm: add support for SM8550
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/03/2023 22:13, Dmitry Baryshkov wrote:
> On 29/03/2023 22:52, Rob Herring wrote:
>> On Tue, Mar 28, 2023 at 5:38 PM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>>
>>> On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
>>>> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
>>>>
>>>> This patchset is based on the SM8450 display support serie at [1].
>>>>
>>>> In order to work, the following patchsets are required:
>>>> - PM8550 LDO fix at [2]
>>>> - DISPCC driver at [3]
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [2/7] dt-bindings: display/msm: document DPU on SM8550
>>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4557e40338d2
>>> [3/7] dt-bindings: display/msm: document MDSS on SM8550
>>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/0e4205eb8663
>>
>> And now failing on linux-next just as my bot reported:
>>
>> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dts:24:18:
>> fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
>> directory
>>     24 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
>>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[1]: *** [scripts/Makefile.lib:419:
>> Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dtb]
>> Error 1
>> Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dts:25:18:
>> fatal error: dt-bindings/interconnect/qcom,sm8550.h: No such file or
>> directory
>>     25 |         #include <dt-bindings/interconnect/qcom,sm8550.h>
>>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>>
>> Please fix. And quickly please. Fixes in the DRM tree seem to take
>> forever to get in...
> 
> I pushed the fix, so it will arrive in linux-next tomorrow or the day after tomorrow. Please excuse me for breaking it again. I checked that the patches were merged, but didn't notice that the header name was changed in the process. Mea culpa.

My bad I should have rebased and sent a v4 with the bindings only,

Neil

> 


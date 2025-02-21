Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CFDA3F581
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 14:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154B910E822;
	Fri, 21 Feb 2025 13:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cy4Q9rme";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3079010E822
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 13:16:29 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5dc191ca8baso412914a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 05:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740143788; x=1740748588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HuLqhu3JmGBzjCZvULGc+vY++b5XygaCEKMmQr8WksA=;
 b=cy4Q9rmeD536M4qhNnQnnQtBL6iVThWt0cD15fiIgetIDEoohlridUYhjOIqvPYoqb
 BHiOnKMbutUZKrhzUDlLFW3NlByDGyJo0/woiEAaUnOcplhXRYfDnhcx45BVbTReQIdT
 6Ax8EeXQbmSIdtA9hzRxUFfaIbBp/BU07cBBWx+mzLNv/aMO4FYbdvRo1JckA0EhlzO3
 IVFD5AEgE6JBHEKSDwhg20TfMYKnL02nvW4mJPtKMUkpnPREsXu3/bGu5JfRcbb0YUeB
 jfpGO3nXrTHXRmJFxFIOYfZvIm1/bIfDpwKesmNwTCcqgnBq9Vjj+rSBf3mBP9qY1Kso
 TH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740143788; x=1740748588;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HuLqhu3JmGBzjCZvULGc+vY++b5XygaCEKMmQr8WksA=;
 b=ZEnEZQrF4vus+0YEh3aYOZ28v0zcWTsFIcAVZaztTX6Ue3M3dhxvYVKUusPGRiiWeM
 g4BEv5gMhA8G83DJVj9l2Od6H2VOYzg1/5qYwIhJuLYlnFP++eopUboYNTBtOqIfyQ0A
 QtWyNJT339GO1PksrRC5wyyzpSLvY5w00EuyrM3eg8irPLiFeHk4fvgLIgf44+vVpn7f
 k/9js2AP8mc6lMdssEHmuToQ2y5sPYCFuqAX0mqUQVSLEb1msdzYgdmAAF7qPYSi2Asg
 4x2fdlZ+dkbBQxMy2AL9fl1BscSV8yzYp6jXk1+6znXcU4Gayw9Qd1Ziz0pQK+Y9jHuB
 gxag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF14bFhhtnHM4/Bfbo49M1J7WpOMuxiE1FvEm5XB6kYAGWetzbylj34I1/51wR1PWV5VSQOf1RpOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2eVHWnLdypuGyYBd6nf00xSX9k+ALXNDNE+ODu8OTIobzFpHQ
 9d3+5zy9ponlo3+s/o6mYjp0v/dn+H1UuWp7xlDhE09dK62SbXtb3ACWtyay82A=
X-Gm-Gg: ASbGncsUzkiNmqOhGLSZreDXi3o7r+8ZevPqIx6NWI2StQOqjyh3BK4lEFNUSoXXX5S
 8g3yBFd1HT5TD5wGtlM5yaw15Hh21xoSDK9MvzvEvEjzo6Io9dmOriaO8QrFJofOnqYEZ7euSgQ
 Ma2aQqiN+C98a6hN4LXFVrkOmVmaie0J/shnSEj7+zXsO5lQyGPIJDDRKj1Id6LKLYSp8B74LdN
 5R80QHP8jxqehrF2YHqx1w6ONWo9yWazP0WzJFvKiN1Wve4JtnoyxKxNvm3jAmuODKpkbnPcu0Z
 KRozKyIRteUhxYjhUhw3JWObHBo8dNUkQbniMlF8m3eCoNHffunw8DQCCb3pt+L+bgufbKSpuEb
 xxmtr
X-Google-Smtp-Source: AGHT+IHyaoSfFlo9oiTbzWYLyufNzsCGgbvwOOWfLPnqyUL86Ms80Ejowilrbj3d5d81IAwIA2+XSA==
X-Received: by 2002:a05:6402:2108:b0:5de:3b3c:d02d with SMTP id
 4fb4d7f45d1cf-5e0b724a9ccmr1004101a12.9.1740143787453; 
 Fri, 21 Feb 2025 05:16:27 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5decdfe758asm13670691a12.0.2025.02.21.05.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 05:16:25 -0800 (PST)
Message-ID: <ebf41227-a0c5-44eb-b6a7-53e30b24e298@linaro.org>
Date: Fri, 21 Feb 2025 14:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm: qcom, sa8775p-mdss: Add missing
 eDP phy
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mahadevan <quic_mahap@quicinc.com>
References: <20250221121703.72230-1-krzysztof.kozlowski@linaro.org>
 <174014368122.2668239.11304901481263017777.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <174014368122.2668239.11304901481263017777.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/02/2025 14:14, Rob Herring (Arm) wrote:
> 
> On Fri, 21 Feb 2025 13:17:03 +0100, Krzysztof Kozlowski wrote:
>> The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
>> in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
>> missing device node in the binding and extend example to silence
>> dtbs_check warnings like:
>>
>>   sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../display/msm/qcom,sa8775p-mdss.yaml        | 32 +++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: phy@aec2a00: reg: [[0, 183249408], [0, 512], [0, 183247360], [0, 208], [0, 183248384], [0, 208], [0, 183246848], [0, 456]] is too long
> 	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
> 
Insufficient testing. I'll send v2.

Best regards,
Krzysztof

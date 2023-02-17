Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F04069B473
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1603310E191;
	Fri, 17 Feb 2023 21:14:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AE310E191
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:14:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l15-20020a05600c1d0f00b003e22107b7ccso1555893wms.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EW4MkRsSt97nP2OjfvV/HrGYB4OX6Pt48nDkauxGyVI=;
 b=wRikKBLe7U1qL1RunGMOmQJZb52SbsdTuBi/QKYTXpD0L7ZK1id5boXGjsYdHFf8vf
 LJIvZGWBbdvPssG79W2NBPBD75X7A6RH3cNtPCVKPvFqCP9aLLd/PFXKwRykabDpdeon
 pe3DsWjPFB+lDLA6LFksZBcxs6+Swd+CyVvO0XFJuKhvATe5hgC9jVAQm3gntTZ+ORAD
 SdDTQC8/KwWbbb/fr8ZnSKCffiPh1iLNrmCxO054pkTVH1udo2qXQjw/PEEiPXm15HNI
 HHDrLgIPXsXTUxzCcODGO1YDtlYrmsI2h3zYCsjB9yOc0J5SPItWlTZKDK8ZERv1rHiA
 F/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EW4MkRsSt97nP2OjfvV/HrGYB4OX6Pt48nDkauxGyVI=;
 b=eVZ9poX06K4Qsl7+G3MHHBXIVyOtSxidd55gpWP+KrXEZd4LoCO5r1f1muB2JWYYNw
 /WHrpSMUVzJ2YYRee/jWwW6Yul/k8idvqdgjaUgr61wHjH3vaURnI2AFMhT6QwH5WaWZ
 9RmvJH/Bc9KNJUXDXcLpPMnB6Z0qUxCS1lgcUSvuMEPp+14jBHzeVNqIJ44+qkts7qge
 FY8YjPcbKxXEebLgupLzDzuSO8Laha7VayVFsCTskQKllw5cYasMRz4JUJzvLgbpl7DC
 Rmjc55f4IFKNDvUg+iVNW4LA0GVxrIkWPzzIy1NYHlCyk8uw17oWjO8Va40kA+2yC5S9
 RTcA==
X-Gm-Message-State: AO0yUKUzZ6SPzZBMhz2zvj5iVatAQqRbh9PtZsC3PIErlPLgf1K0MjdT
 J8L+p1lXx7UkpptM98UF9i09ow==
X-Google-Smtp-Source: AK7set9bJWwf6VPImlBjocxK7OpKYe1M5pUpgHsEVTe3rlCdpxBRrmj8mEol2u8NhQQD66+cxhN0VA==
X-Received: by 2002:a05:600c:1895:b0:3e2:589:2512 with SMTP id
 x21-20020a05600c189500b003e205892512mr1723935wmp.21.1676668441188; 
 Fri, 17 Feb 2023 13:14:01 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 ip24-20020a05600ca69800b003e223fe0a3asm2771609wmb.27.2023.02.17.13.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:14:00 -0800 (PST)
Message-ID: <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
Date: Fri, 17 Feb 2023 21:13:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
> First, it would be nice to know what was the intention of Bryan's commit?

Sorry I've been grazing this thread but, not responding.

- qcom,dsi-ctrl-6g-qcm2290

is non-compliant with qcom,socid-dsi-ctrl which is our desired naming 
convention, so that's what the deprecation is about i.e. moving this 
compat to "qcom,qcm2290-dsi-ctrl"

Actually I have the question why we are deciding to go with "sm6115" 
instead of "qcm2290" ?

The stamp on the package you receive from Thundercomm says "qcm2290" not 
"sm6115"

?

---
bod



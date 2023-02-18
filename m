Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188869B9B9
	for <lists+freedreno@lfdr.de>; Sat, 18 Feb 2023 12:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A0410E4A4;
	Sat, 18 Feb 2023 11:23:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ACC10E4AB
 for <freedreno@lists.freedesktop.org>; Sat, 18 Feb 2023 11:23:19 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d11so683023lfg.6
 for <freedreno@lists.freedesktop.org>; Sat, 18 Feb 2023 03:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zXrmfYPtbD+a4mYWOw7gzX5blmN63cfug46pUteyx84=;
 b=kzgT7ub+8SeOW/sL4cVFBuzPnNqoM6WqL8uiNYdBNlvtGlgd5lAOwrqaThKyUtzI6q
 hZPQ++Wa9Bdv294jRq4J9JThEpkCGjTVN/gjjmPdJBTIlwxde9hPV4HU3+iL4zJCiRh7
 s2aJ0gekWlA7msRBLxF/MznErWfBfNzq/Mz3p8dssISUc70jYCJU1FcC0v5ctD+0KdUX
 ++eferbxRB4BEpZRn/gvHYPjkeUD88GbtQW7C8PS2zo8EOMuAgDxFCi4rluIgPqPVepn
 V7+Vrj2qW7APxl6KjZnwP03e9dmotmyN2gGqQn1nuUphnePzLuUcY9T2RSG8YvhrdKSj
 hEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zXrmfYPtbD+a4mYWOw7gzX5blmN63cfug46pUteyx84=;
 b=DbcCyx0w9xsPZ04En5eTQtjruzOEtOIA8u9wVej2HhsugZbeX45a6QvlR4YS02Fptp
 noT/JbZ1zdb96zRREObku2YwmWzvW3mquLQbmostO93g0fseUKxcIktoKBkAwES2PxFz
 shwBF9048q+ZQOEypnzCoIsSgUYxM6t8fd1Nu+gLaM04jDhCkdQUzZFpUef23oq4UgoT
 U4FsdFVqN9pJPJvt1PxCavkgNnr2QTO80AGEcSW2Kze46TkFW7R2pgWGTmyEGHvcugIl
 ssczd/x0LWoZcnVI+0S7IzHus54dg6kTRykiHHk9oA1/Az6maALhkMoOpCslEaUXqJSv
 JzPA==
X-Gm-Message-State: AO0yUKWBeAOMgjoXegtSLh2dYYOTjhgHgDNNjDB2egB4tRSdDAX5RUH+
 YpS/ph1dB8UsD82FqM1cIrgFKw==
X-Google-Smtp-Source: AK7set/2Ym3B0dnJtwcPI9O9DneEz9RDbQ+ZtBmCZopQM4AHFgi7uc2wVb/PGBW+WJcbmcklTCJHtA==
X-Received: by 2002:a19:a40e:0:b0:4d1:7923:3b92 with SMTP id
 q14-20020a19a40e000000b004d179233b92mr781116lfc.50.1676719397408; 
 Sat, 18 Feb 2023 03:23:17 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 m17-20020ac24ad1000000b004cb1e2f8f4dsm950902lfp.152.2023.02.18.03.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 03:23:17 -0800 (PST)
Message-ID: <fbece9d6-2204-2534-e44f-29c29cc56413@linaro.org>
Date: Sat, 18 Feb 2023 12:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
 <e6d397bb-dd5d-8308-eb07-3aeb2589115c@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e6d397bb-dd5d-8308-eb07-3aeb2589115c@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 18.02.2023 11:14, Krzysztof Kozlowski wrote:
> On 17/02/2023 22:13, Bryan O'Donoghue wrote:
>> On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
>>> First, it would be nice to know what was the intention of Bryan's commit?
>>
>> Sorry I've been grazing this thread but, not responding.
>>
>> - qcom,dsi-ctrl-6g-qcm2290
>>
>> is non-compliant with qcom,socid-dsi-ctrl which is our desired naming 
>> convention, so that's what the deprecation is about i.e. moving this 
>> compat to "qcom,qcm2290-dsi-ctrl"
> 
> OK, then there was no intention to deprecate qcom,mdss-dsi-ctrl and it
> should be left as allowed compatible.
Not sure if we're on the same page.

It wasn't intended to deprecate [1] "qcom,qcm2290-dsi-ctrl", "qcom-mdss-dsi-ctrl";
(newly-introduced in Bryan's cleanup patchset) but it was intended to deprecate
[2] "qcom,dsi-ctrl-6g-qcm2290"; which was introduced long before that *and* used in
the 6115 dt (and it still is in linux-next today, as my cleanup hasn't landed yet).

[3] "qcom,dsi-ctrl-6g-qcm2290", "qcom,mdss-dsi-ctrl" was never used (and should never
be, considering there's a proper compatible [1] now) so adding it to bindings
didn't solve the undocumented-ness issue. Plus the fallback would have never
worked back then, as the DSI hw revision check would spit out 2.4.1 or 2.4.
which is SC7180 or SDM845 and then it would never match the base register, as
they're waay different.

Konrad
> 
> Best regards,
> Krzysztof
> 

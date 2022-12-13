Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171664B5CF
	for <lists+freedreno@lfdr.de>; Tue, 13 Dec 2022 14:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD5810E0F0;
	Tue, 13 Dec 2022 13:13:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74C910E0F0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 13:13:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b13so4837502lfo.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 05:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vd3T8ah0dWWDH2U5v0IMPHsJRf7PThuVXGlxa+Fk7UM=;
 b=V1fR4x97oaWfy1VMojxg6M8O2dPqeQVawUxtzpzfwbxeCJOzWCJmgQcNe8l22OI1k9
 UaJ06VWqGFv8hCDEuZth1+8OH+LI5MeQ1oK+ZdqHZ2dDwj3DZoumzNSLSu/m/7O6u5Z0
 tRDwRsta6XHOMSBHDue+xmitUdWdjlUYvLKE3aBX+gFymGdKjiJ+5xLke/pqW0Ayn/Lo
 SZ6vDRn4XE5bL1WcmnFRlMyuiAIIv2UHBig4XRzBv4vdDd2JGwA2cZik9/iHF91X/XWy
 q2OepdSYTD629UA1O7uWAQ0KOa+xHKscbiiTm6fegvMtXfJm/yn06Qs6oFQZ/oPMIWNq
 6yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vd3T8ah0dWWDH2U5v0IMPHsJRf7PThuVXGlxa+Fk7UM=;
 b=qnoPoCoLLBYWchLYfUzkV5onxRFMgyL5Z1e45MSZSWAe4HW3YsRfHCsoAUgBT0CoEG
 6pikzXZqkf53mXoeNqg76cSlrOIL1II5xZY02g2RE9dK0PlKB4432La2595w1aKHUb9C
 mA1/55Y3uZ5MkWANFV+IMLLAvSxbbwbHrggBO/Ob3xS/K2f8YswNwZ+8qZ6/1ptDrVZj
 BAIke6HEwZt6Q49fNwgnaJxoL/ajQZgyqlP8TwiUH8Ei5brgueLMbrsEU0Q7etrJWjBC
 NtaC/D56qC7jJnIZZHizXD3AVqcD0kKdrufDQ50OPv9i/5uMQutOypzUdE3A2ETQW5+z
 lMIQ==
X-Gm-Message-State: ANoB5pmrhpIDS03o1eUpUAjrt7yUkX+69xHZ9JOQTnK07uKjEmsJ2AsW
 P5nlNS5CLUylR69Aut/am4j9KQ==
X-Google-Smtp-Source: AA0mqf5wXBdUAnvmZIvysTHRCIWUkZNsPqVOmaLbYbtInVwUKBFj2syz/R6zVfkeLETTtp1+isewQQ==
X-Received: by 2002:a05:6512:6d1:b0:4b4:91e2:7864 with SMTP id
 u17-20020a05651206d100b004b491e27864mr6016763lff.26.1670937219058; 
 Tue, 13 Dec 2022 05:13:39 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 25-20020ac24839000000b004b5979f9ba8sm360705lft.210.2022.12.13.05.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 05:13:38 -0800 (PST)
Message-ID: <bca77270-f3ac-f23f-ef96-43f9f7d574c4@linaro.org>
Date: Tue, 13 Dec 2022 14:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
 <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
 <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
 <CAA8EJpr5RYyQa7xu1_xJ0F-dn-H9aOf0KE-CDgDCwnZu3HPgXg@mail.gmail.com>
 <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes
 and link-frequencies property
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@gmail.com, andersson@kernel.org, konrad.dybcio@somainline.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 robh+dt@kernel.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/12/2022 00:41, Abhinav Kumar wrote:
>>>
>>> besides, i think i have to sent the whole series patches include this
>>> one to address your new comments on other patch.
>>>
>>> is this correct?
>>
>> No. Please fix your system first, validate your patches and send them
>> afterwards. You can not expect others to do your job.
>>
> 
> Just finished working with kuogee on this. This issue had been reported 
> by few others earlier (example 
> https://lore.kernel.org/lkml/bc9be279-a130-d5e7-4397-bbb389d14403@intel.com/T/).

This report says:
"Sorry for the inconvenience, please ignore this false positive."

Best regards,
Krzysztof


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A002F5E83C4
	for <lists+freedreno@lfdr.de>; Fri, 23 Sep 2022 22:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D698210E987;
	Fri, 23 Sep 2022 20:32:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A1710E987
 for <freedreno@lists.freedesktop.org>; Fri, 23 Sep 2022 20:32:53 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i26so1961771lfp.11
 for <freedreno@lists.freedesktop.org>; Fri, 23 Sep 2022 13:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=nBM+qi7ZEJ79MaRiQNuFb4KCQxuABqaRCCx+mb2oxBg=;
 b=o3OHHM/T+yReW4NfXa27nKO8K+4nryGOnb1wE+L9S/UfvloEESITwMAB1wcImMrHR2
 I7UswL4qx/NwsvUNcVKNFu8Gjv9iLlBMjlyahuHAty143DTuh2GHlMR7LYWusM4zZDeX
 gf8oqH68bp/44bZhX5aBiMU78uyltyU0U49t8zj7sbidsN5COcIdH0+NJfFH/nffMsmd
 kJFc1FapVDm5MIh5e9j1ebQblIXWvxSranbYEp6z9ES/TJR8IeHTtU1QBlsTvsSKyfgw
 d+FiHLZEFI59C+9cXso+ojwzhoV8Wti0G1bbjGJPkkL20w/N70pQsVp1SkkxoMc8nChO
 PKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=nBM+qi7ZEJ79MaRiQNuFb4KCQxuABqaRCCx+mb2oxBg=;
 b=4OoI6lRWSSVLYBaFkYXoZdqgPa9KX8oPfPpu71JIi7ASM+l3CV/1Rb6MIsLgauxKFi
 P7GMLzjW5k1Kt6TB0Z6eikmPpaBxIYga4DcVq9DcliDdlCFHvxV2jJb8ecfhv3iB26wR
 aAQZOc0+XNcDWjrlR5ClDs/hGO0pQ57mGZSdApL0cdAbKaIl1doN5AFilK6l+1oTHJ50
 5HsZ4YnPobor/zLtxTGg55fHsHMA9kSQ5zBMryRvxSyQL7AV2V6KlHB5MZQO5Ly70quY
 ZoxFZsxzX3RQVv6P6SXNKsWVr2gSxE+XXLwxEMVKFINgy77kJTz9uMh6VE15A+MWUKe4
 meEg==
X-Gm-Message-State: ACrzQf1tmqoRBSknuV6Ntn6L3meGJVB1dQhaNF4xxZ6gkrVYsi7rK1xW
 39ziTQ5COhTBqGCOsJCnOoGoYg==
X-Google-Smtp-Source: AMsMyM7YTtVO77quMiW6KFmjaY2ziWHoZFQBBzaOp2QWJF5Pd4KQtydKOHQr1S++G+N5wTYhKpJHig==
X-Received: by 2002:ac2:5623:0:b0:49a:d7b9:c06d with SMTP id
 b3-20020ac25623000000b0049ad7b9c06dmr4251708lff.511.1663965172046; 
 Fri, 23 Sep 2022 13:32:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a2e5c02000000b0025e4c49969fsm1520756ljb.98.2022.09.23.13.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 13:32:51 -0700 (PDT)
Message-ID: <aeae567c-ccf7-de73-61eb-1f04772d3bba@linaro.org>
Date: Fri, 23 Sep 2022 23:32:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
 <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
 <d2af0a8e-63fe-221f-1c53-9fe1c43fa04d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d2af0a8e-63fe-221f-1c53-9fe1c43fa04d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 05/12] dt-bindings: display/msm: move
 common MDSS properties to mdss-common.yaml
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/09/2022 15:28, Krzysztof Kozlowski wrote:
> On 22/09/2022 13:46, Dmitry Baryshkov wrote:
>>>> -  ranges: true
>>>> +    maxItems: 2
>>>>    
>>>>      interconnects:
>>>> -    items:
>>>> -      - description: Interconnect path from mdp0 port to the data bus
>>>> -      - description: Interconnect path from mdp1 port to the data bus
>>>> +    maxItems: 2
>>>
>>> I think this is not equivalent now, because you have in total minItems:1
>>> and maxItems:2, while in past minItems was 2.
>>
>> This means that I should have minItems:2, maxItems:2, which, if I got it
>> right, is frowned upon. Let me doublecheck though if it works as expected.
> 
> It is frowned upon only if it is alone, because for missing minItems,
> maxItems implies minItems. Here you have minItems in other schema, so
> there is no such case

Well, I just checked, the schema will throw an error if I put a single 
interconnects or iommus entry. If I understand correctly these two 
clauses are evaluated separately. So, the dpu-common's clause tells 
minItems:1, maxItems:2. The platform schema file contains just 
maxItems:2, which implicitly adds minItems:2 to _this_ clause.

Thus I think I'll leave this part as is.

For the reference (with single-entry iommus and interconnects properties):

/home/lumag/Projects/Qcomm/build-64/Documentation/devicetree/bindings/display/msm/dpu-sdm845.example.dtb: 
display-subsystem@ae00000: iommus: [[4294967295, 2176, 8]] is too short
	From schema: 
/home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
/home/lumag/Projects/Qcomm/build-64/Documentation/devicetree/bindings/display/msm/dpu-sdm845.example.dtb: 
display-subsystem@ae00000: interconnects: [[4294967295, 1, 0, 
4294967295, 1, 0]] is too short
	From schema: 
/home/lumag/Projects/Qcomm/kernel/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml


-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB269B4A1
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B878710E494;
	Fri, 17 Feb 2023 21:23:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD86C10E4A1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:23:30 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id p19so3129036lfr.9
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=giMyztqRFKja8+Zwf+y6h9FIEuqpthPiWJnY4CCgAMk=;
 b=UnlSVCeMmWi4Fe0tQX0SeGUAzOM4BfaNyF7VyR3lU2KBasoP+uqiVB8V0h+eBASK6D
 BhRiwsAxhW+SjjuighcXsDpNB1WWZnV/G+ew0LEiqaDKbYid4yOUXvvpnDVFsQMFYjOG
 7zhh+xijUUr+Na0yRcijoA9gl8VWvc96lOYWLNoLuBdQQOnuUI37oaFM1OBS1UUdg+GJ
 2AbVHFZRjxiGdfQ4O9qSbFmAfHsmLpj+sY2RP5SLULo3aZ17Ng4sTO599ecSFmlhsWoM
 EnntPjIqC7MoPIxVyMJH22Ax7+7W2HBjUr4u/hn3nYfvxrQySenJb90dGUoqfwOh0YCb
 WToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=giMyztqRFKja8+Zwf+y6h9FIEuqpthPiWJnY4CCgAMk=;
 b=R4GNo2qBj2XWHwHpC+LOuI3n6Jggi5+3jo1aD7gsR/KaZya9HIrnu99Tex+rWXYAsK
 xCP3KGnJe/tmNl22NJWO1bYafbYxTRhube6cWQRLrU/XlV7HRNQZ+q2m4oUws2VdH4pj
 FzcOmzJNz4aIA4rqv8saa6/VmBgoDTzg8jHFzqPMR/FF97blUt4FW7I9vkaASy/98TDF
 bbihO6WXSWwG6OPcPRqoUJvRpb5QVl6JFI3ckXjwtpoxy6VUvjb/4unhbA2kcgOCyIUF
 1pw7Glx9RcuLETd8Cd+qsJf78urqPkJFT/ypMDPuAO08Todp07G6xsgKnz1KMG9YHlTN
 rrXA==
X-Gm-Message-State: AO0yUKWY91p5QrjbYSm/4d5jBkPfyI83hI+14sUalGM4ScCtQKzYe0X+
 QAvr/Yuv3QTLQqTPpsxKsatXmA==
X-Google-Smtp-Source: AK7set+qbs0k8IvIUWwm+GXxnhNiNcoHfnb8Iihm8m3SF+0EJQzyZBvPz1ay8Bd4yoV+kZqL0VCW6A==
X-Received: by 2002:ac2:598e:0:b0:4dc:823c:8127 with SMTP id
 w14-20020ac2598e000000b004dc823c8127mr1048307lfn.57.1676669008996; 
 Fri, 17 Feb 2023 13:23:28 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac25626000000b004db25f2c103sm783789lff.86.2023.02.17.13.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:23:28 -0800 (PST)
Message-ID: <0989eef7-cd0e-324c-eef9-aa8500197b91@linaro.org>
Date: Fri, 17 Feb 2023 22:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
 <76de00dc-f128-e609-7f0c-b53161036b97@linaro.org>
 <0b3e8c81-b0fb-651b-8688-872f03c68d8f@nexus-software.ie>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <0b3e8c81-b0fb-651b-8688-872f03c68d8f@nexus-software.ie>
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



On 17.02.2023 22:20, Bryan O'Donoghue wrote:
> On 17/02/2023 21:16, Konrad Dybcio wrote:
>> Correct, but QCM2290 is not supported upstream yet.
>>
>> SM6115 (a different SoC) however is, but it used the qcm2290 compatible
>> as it was a convenient hack to get the DSI host ID recognized based on
>> the (identical-to-qcm2290) base register without additional driver changes.
>> We're now trying to untangle that mess..
> 
> Gand so what we want documented is:
> 
> compatible = "qcom,qcs2290-dsi-ctrl", qcom,mdss-dsi-ctrl";
qcm* yes, this became documented with your original cleanup

> compatible = "qcom,sm6115-dsi-ctrl", qcom,mdss-dsi-ctrl";
and yes this became documented (well, in the DSI binding) in
my other patch series and is finished being documented in this one

> 
> with the old compatible = "qcom,dsi-ctrl-6g-qcm2290"; clanger continuing to be deprecated.
correct, we still have to note it but keep it deprecated

Konrad
> 
> ---
> bod

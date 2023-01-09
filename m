Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDB7662F04
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 19:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C6010E4E8;
	Mon,  9 Jan 2023 18:27:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A8F10E4E7
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 18:27:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bu8so14347184lfb.4
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 10:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kxYPnnoghobJBBaTSe4UpQEXrK0A3XTblMlNo+lNKnw=;
 b=N5iszDV3mgeHPrAvF/9tRC+vKFBKYrz7Apqh06BeapGPdvoJYONuE/tfsSTiwDbIOc
 SISlclRbKC8zbmblfRkNPFVO7mQbTZJxv4iYHdxM9cS720U3Os1Kfp6UFvvwdjNFRLaN
 +rhe1D3q6p03AqvPSK0Oh1k6SaN+VL+BI9BpHsSDAPv4lnmbRce4kWhDuwIrV+I3RxkM
 YS6RTxU8phGc3GJ8uqKRMcslmstBDpPK5zI0d+CLOHi7cCD/Az9LL5zrLxV7v7+IAWJ9
 oTYo5Af2TyqnUJEbUFrc6yTkMLyCEEryiBPcMNNH3Ii+KF3ACyPsGzsM8wYzUe/EVTLM
 Ooeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kxYPnnoghobJBBaTSe4UpQEXrK0A3XTblMlNo+lNKnw=;
 b=1BOT6yIvHMSgCtIcgv2x6gvC/pCzR1hUCKEvhUhGSd2V7+TuXWxigPeRn7Fkb/IhDk
 bvnrT05ynVBN77AM7ujZ4BxWPMNF6KhpzhHH6v8h0aj1ZeOLZJkHXOWru5GQB4jV0PM2
 oEHyT7hTbgRrq6KSvae3Pr7osYxabke/gwKxItAkj7QcP9hIa4mrbCII076GjFWg0xKY
 UjYHswF2CElIXTNdnutAdUybrBrmEkQ1/VXIdBzNsYksgu+qhSpTrJGnh29swpmOGEvG
 ruDAcF52Er5uFIoLeNOYlFs5cV220nS+0M+5LKp+q+2DeO8rz3Day12GnBbmiI05+gxE
 K1aA==
X-Gm-Message-State: AFqh2kr2g6QK4XVtWS7e6gYugHgAQ3nxyDnQ4V2zfzG05YvGmgiy9plO
 MMEwdrXySAyNzh+pzaJtu/V1Ig==
X-Google-Smtp-Source: AMrXdXsvQo0NvFzBEknwIyyBRBQGy1hIEDfz6ILvqd2xvN8nHcpkCUkW5+saH9fDGyxWFbjIzrkLqw==
X-Received: by 2002:a05:6512:1281:b0:4cc:8682:ec65 with SMTP id
 u1-20020a056512128100b004cc8682ec65mr749371lfs.39.1673288874809; 
 Mon, 09 Jan 2023 10:27:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 br11-20020a056512400b00b0048a934168c0sm1732866lfb.35.2023.01.09.10.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 10:27:54 -0800 (PST)
Message-ID: <a2f427f2-ee79-600a-ce01-088f786f5a35@linaro.org>
Date: Mon, 9 Jan 2023 20:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
 <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
 <20230109160005.GA721066-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109160005.GA721066-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/6] dt-bindings: display/msm: rename mdss
 nodes to display-sybsystem
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/01/2023 18:00, Rob Herring wrote:
> On Mon, Jan 09, 2023 at 07:13:57AM +0200, Dmitry Baryshkov wrote:
>> Follow the 'generic names' rule and rename mdss nodes to
>> display-subsystem.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>>   .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> index 59f17ac898aa..ccd7d6417523 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> @@ -15,7 +15,15 @@ description:
>>     Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>>     sub-blocks like DPU display controller, DSI and DP interfaces etc.
>>   
>> +# Do not select this by default, otherwise it is also selected for qcom,mdss
>> +# devices.
> 
> for NON qcom,mdss devices?

Actually no. This schema is used by qcom,SoC-mdss devices and it should 
not be selected for legacy qcom,mdss devices.

> 
>> +select:
>> +  false
> 
> select: false
> 
>> +
>>   properties:
>> +  $nodename:
>> +    pattern: "^display-subsystem@[0-9a-f]+$"
>> +
>>     reg:
>>       maxItems: 1
>>   
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> index c218c9172608..47fde9b6779f 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> @@ -15,6 +15,9 @@ description:
>>     encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
>>   
>>   properties:
>> +  $nodename:
>> +    pattern: "^display-subsystem@[0-9a-f]+$"
>> +
>>     compatible:
>>       enum:
>>         - qcom,mdss
>> @@ -153,7 +156,7 @@ examples:
>>     - |
>>       #include <dt-bindings/clock/qcom,gcc-msm8916.h>
>>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>> -    mdss@1a00000 {
>> +    display-subsystem@1a00000 {
>>           compatible = "qcom,mdss";
>>           reg = <0x1a00000 0x1000>,
>>                 <0x1ac8000 0x3000>;
>> -- 
>> 2.39.0
>>
>>

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4709659C9C1
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 22:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553C5A18D7;
	Mon, 22 Aug 2022 20:14:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E052014A3FF
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 20:13:56 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id m3so11152147lfg.10
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 13:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=qmsBVTW2Kw9QZYgrXYBiKM0jZ5EnPYQhFnDoUmOu0Ig=;
 b=DkzfPlJdDdx4ac46MRcI/qfxIkxok4t/OX75S93HBbWMx6fZ/Q+gcbumkkeGB6vszz
 g6+0SM4lrNE8d/n7we7v1KTEwdAIL+Bu7YkE8T3Tbnoyxs6LY8rVXJiy/q0N48dabztH
 N4w//H6Pdo6pvzbG7UvaIMp8u8ken0ANXR9hg6ADaMG2SFzmQrW0q/lESkt6vZcPs95m
 jpko3rGdTGYQstzRsHXFWv8cc/WFXBvdAZIZYDzGrFQmnL65nxyTfO0NFfMPdwgZ+ayD
 Q4G7oLAes3tIJs6yUsCmAnV/Q+6j1HZhMt7HQ/ymeerrC43pyXJm/ToOnNbGa79+OncH
 cAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=qmsBVTW2Kw9QZYgrXYBiKM0jZ5EnPYQhFnDoUmOu0Ig=;
 b=3gt+HtayZHwRgp20NjJSsfZucZn43pOIPd/JQhBcokLZ5nIwpJlI4Sgf2fyCN1crgo
 9j0RfWsEFS8ngA489E4AHx2KJkQAlZLN9BxjDWFMUaE1kRasw6PzpReYSckfTC++u5ql
 l6wOpCWSwyYk3nt+mm7Eru+QUTxyGS8BVy4n384DfLXiP3Sker7WFYxZ84HD2DR+b1D8
 N39YtDM2ds/lyMLOBOX+XXO9OYtZ38isHdHDlCZHebCVG55yaVaoQPEgR7SH38jFC1E8
 FOE0xyNWVONwTsjAX1YD3gEPwUq39tc5PDCyevvlljaWInV4hi08XEUQOQdsAsyb8yqH
 UQPg==
X-Gm-Message-State: ACgBeo2i9N58IBaCUbLuXG3Q6KLl6jQxrOXjMwmt9F+7hp8GXJ7QV1q4
 qFRRnbjKgr99KhSye4s0h6U2QA==
X-Google-Smtp-Source: AA6agR4ekRr/V9fIIooxy6Y1A5rvJcIlIHh/P71WptjlJlepsZ8D51GfdYfCYh+ME1fAAF46eS3LMA==
X-Received: by 2002:a19:6755:0:b0:492:e5e9:4cdd with SMTP id
 e21-20020a196755000000b00492e5e94cddmr1785962lfj.361.1661199234949; 
 Mon, 22 Aug 2022 13:13:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a056512210900b0048b1d92991asm2003483lfr.303.2022.08.22.13.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:13:54 -0700 (PDT)
Message-ID: <421e45e1-5f70-b92b-ac41-3cfdd2e61904@linaro.org>
Date: Mon, 22 Aug 2022 23:13:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-12-dmitry.baryshkov@linaro.org>
 <20220718175023.GA3216365-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220718175023.GA3216365-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 11/11] dt-bindings: display/msm: move
 common DPU properties to dpu-common.yaml
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/07/2022 20:50, Rob Herring wrote:
> On Sun, Jul 10, 2022 at 12:00:40PM +0300, Dmitry Baryshkov wrote:
>> Move properties common to all DPU DT nodes to the dpu-common.yaml.
>>
>> Note, this removes description of individual DPU port@ nodes. However
>> such definitions add no additional value. The reg values do not
>> correspond to hardware INTF indices. The driver discovers and binds
>> these ports not paying any care for the order of these items. Thus just
>> leave the reference to graph.yaml#/properties/ports and the description.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/dpu-common.yaml      | 42 ++++++++++++++++++
>>   .../bindings/display/msm/dpu-msm8998.yaml     | 43 ++-----------------
>>   .../bindings/display/msm/dpu-qcm2290.yaml     | 39 ++---------------
>>   .../bindings/display/msm/dpu-sc7180.yaml      | 43 ++-----------------
>>   .../bindings/display/msm/dpu-sc7280.yaml      | 43 ++-----------------
>>   .../bindings/display/msm/dpu-sdm845.yaml      | 43 ++-----------------
>>   6 files changed, 62 insertions(+), 191 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> new file mode 100644
>> index 000000000000..14eda883e149
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> @@ -0,0 +1,42 @@
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DPU dt properties (common properties)
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
>> +  - Rob Clark <robdclark@gmail.com>
>> +
>> +description: |
>> +  Common properties for QCom DPU display controller.
>> +
>> +properties:
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: |
>> +      Contains the list of output ports from DPU device. These ports
>> +      connect to interfaces that are external to the DPU hardware,
>> +      such as DSI, DP etc.
> 
>  From the last version:
> 
>> In case of MDSS all ports are output, they are connected to the external
>> interfaces (DSI, DP, HDMI, etc). The driver uses them to bind available
>> interfaces (using components framework). The reg property of the port is
>> completely ignored.
> 
> It doesn't matter what the driver does or doesn't do. Without
> describing port nodes at all, you are not validating what port nodes
> can contain. Just try adding any property under a port node. You need at
> least:
> 
> '^port@[0-N]$':
>    $ref: graph.yaml#/properties/port


Hmm, the graph.yaml already restricts the ports node to the 
ports@[0-9a-f]+$ + #address-cells/#size-cells. I don't think we have to 
add any additional restrictions/entries here. Do we?

> 
> where N is the max number of ports.
> 
> Rob

-- 
With best wishes
Dmitry


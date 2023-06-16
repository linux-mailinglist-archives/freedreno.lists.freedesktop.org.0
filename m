Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F25732C73
	for <lists+freedreno@lfdr.de>; Fri, 16 Jun 2023 11:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E131210E151;
	Fri, 16 Jun 2023 09:49:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A1910E151
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 09:49:34 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so585877e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 02:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686908972; x=1689500972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UZF9KFxIZfNMlNnN4a5urW2y13NYb+j9w9JbZAccnI0=;
 b=LfWXM+bRQRhDl55+u4QJwEWR5CJEukjUvCsWZAZFzHhp2yFtZl9WGm4OubFYJkZiXv
 3lhGyX2bLcQIZny1ciEPpo4t9xxxrI6LbCIGfruPUopKQQyrJv+BLTQgJiTyLdIIXzLj
 O0MZMtgBCvxbtU9Es+1ratCjaXLYRHzEzrunfJ+g3UoA1qhsWVPcO5GoxsVASmv9XwHb
 4tBbcihqgNfxTVE9N4YxRZeQ+8403ctzR6BB+ukLpkJk/27tXH2x0f4rWgs8kPQ0J6hC
 MXEu+XCEMuBM6czE1eGSW0gjMku5s/Jge2AmRAjHEQk236E8SOlwRWLOC0bL8Dv//K9s
 zcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686908972; x=1689500972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UZF9KFxIZfNMlNnN4a5urW2y13NYb+j9w9JbZAccnI0=;
 b=DhiACxLl8lzZmQ1ibAp4rLuXelzJqXxgKOwftEj+quLEFGO32sd5Ehbk0Rh6DKN/lg
 C42I/5dw9aM+hbFogc4juas0+HRGx1I2CXwq4ZgNavsnja6XEN/MOJDJBlhfjipQ6L4I
 mOv9pUEUTHE1FNbybhRquSPF5IWbmX8RaV3qB3FYB1ZtqjoQv8OS0qmDJhu5SVeiXN92
 iuqb59N14AJGrrDCDDQRPc2VKh3gZVs9BWGQwspq/y7x2O7Qq/fD83jt+ImCNUTsRVJR
 YS1YLXFoHBRYKvuTd7bNwAUXKjbOCoW0/6/0rE66vq+jG206dXwZgeJ1q+09d8NKaaSm
 cw5g==
X-Gm-Message-State: AC+VfDxgnct4t7TzQCLRq8M84JS/iRCjTDH2Vvnb5rdtVzsVlq17CYMx
 mjDXi9mOeyeVKauE8F0U5AiwVw==
X-Google-Smtp-Source: ACHHUZ6vKJ7mGdwajEVNIi/+OLER02kz5AF6qKLt13kQX+hdase2WXOCzr1xf/RqVopNxr3rMVXTKw==
X-Received: by 2002:a05:6512:54a:b0:4f4:cacb:4b4b with SMTP id
 h10-20020a056512054a00b004f4cacb4b4bmr940977lfl.18.1686908971946; 
 Fri, 16 Jun 2023 02:49:31 -0700 (PDT)
Received: from [192.168.1.151] (85-76-68-127-nat.elisa-mobile.fi.
 [85.76.68.127]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac2544f000000b004f858848fefsm65878lfn.177.2023.06.16.02.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 02:49:31 -0700 (PDT)
Message-ID: <f954a89f-a0f9-c30d-385d-6149dc360c1f@linaro.org>
Date: Fri, 16 Jun 2023 12:49:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-4-dmitry.baryshkov@linaro.org>
 <6akejrsahbmrueanyhx5hdt5kipkm2fb4dylh4jzprfgzdbczk@x75wfsoza5ah>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6akejrsahbmrueanyhx5hdt5kipkm2fb4dylh4jzprfgzdbczk@x75wfsoza5ah>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 03/22] drm/msm/dpu: remove unused
 INTF_NONE interfaces
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/06/2023 01:26, Marijn Suijten wrote:
> On 2023-06-13 03:09:42, Dmitry Baryshkov wrote:
>> sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
>> definitions.
> 
> As Abhinav said, add sm6375.
> 
> If it wasn't for sc8280xp using INTF_NONE for fake MST, we could have
> dropped INTF_NONE and the special-cases in dpu_hw_interrupts.c and
> dpu_hw_intf.c entirely!  Is that your plan?

I have not thought about it yet. Generally I think INTF_NONE might still 
be useful to document interfaces that we do not want to support for some 
reason (e.g. MST or 8974/8084 eDP interfaces).

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 

-- 
With best wishes
Dmitry


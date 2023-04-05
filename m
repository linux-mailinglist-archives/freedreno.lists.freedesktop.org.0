Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7E6D7159
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 02:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2078910E7FE;
	Wed,  5 Apr 2023 00:35:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC1410E7FE
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 00:35:38 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id x20so35684218ljq.9
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680654936;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+FyiraeumRvn9lWhsqVqlc5idZJ3mN1HddRn347ZxeU=;
 b=tDcur6hQq8gbQ2tTKuacPs8wWNMtuXhdNZjaQTX1lVlbhqvqOz1O0YmX5CSm12D5J2
 uGNcLX6WiO7HphJ2GeytYeGNQsiuYN38F/TgprkDBrBFO0nJDwyOnLo4Ow6l959Cgxuc
 w/Ds8DXxnPVkSzXyZGkgFX0rjRcE85hUbp5rI95CS7/59BqIS+3dhH67slzWVHW3QInh
 mNUwfcMXEl6uPBXQaZ+qtYoT3ZJgMKcmjfEti/32xOTes9U1fyVnAHm8qvT6seUset9n
 CnfTv9rGwJZCe11wgro+QQIPNRLEhHDoWGLytN+1bK6P6s7jNwx5ybxrVtte6V+FpEox
 +2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680654936;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+FyiraeumRvn9lWhsqVqlc5idZJ3mN1HddRn347ZxeU=;
 b=gtSMHrsuTrVSFZw91qKePRStgay2vo0O5DFeiCywjdPukZI8NcjQOQ8KftL0GKRjkv
 dxKCKAplFpBSThWzD1ablJQ/YoyPKp1s1GIwEF6MuB2fTNzmWdvZ7oJMgPlP+6N1TdyR
 lKzgBEHb9vFesVIw6I0W7tKAZt5JJCVy9Sdsqg0c+W+ri4PDqPe9vSqk8M236KrpMcrH
 DQ0hVIlVCrsHWu5w0JKYZBC13nxkT3zqWt0WA4IrzK4H7RnP1FeumuMHqCFaWvx7Jdcl
 ypvlGAuOUq2ODHbbO/B/NNrrDxQKX+ns4k4KyInn+Cg6JPQc6cH15UV+jTgyoCHq6Jqf
 oneg==
X-Gm-Message-State: AAQBX9e/0SSd6P3Jxpa9xNB6NHgfevV9//mQ/m/jbix6pKBOV6JlhYmG
 mbMchUe40lu2KWQ96TCPCESNjA==
X-Google-Smtp-Source: AKy350YLeRc6KY2le+IjjR/XGprQsv1A2gpFyYvLi1D+1ckPJ2xme/FjlbB7ZbchrqG8F5b2V8vJOQ==
X-Received: by 2002:a2e:8ec2:0:b0:2a4:4ce4:1f52 with SMTP id
 e2-20020a2e8ec2000000b002a44ce41f52mr1405441ljl.34.1680654936570; 
 Tue, 04 Apr 2023 17:35:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a2e86d4000000b00295a8c68585sm2608774ljj.56.2023.04.04.17.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 17:35:36 -0700 (PDT)
Message-ID: <4fa6cbad-4daa-e030-9d41-4f9caa2d8a28@linaro.org>
Date: Wed, 5 Apr 2023 03:35:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-3-dmitry.baryshkov@linaro.org>
 <72915d9e-dbba-7391-28d8-cbbca479da76@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <72915d9e-dbba-7391-28d8-cbbca479da76@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 02/42] drm/msm/dpu: Allow variable
 SSPP_BLK size
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/04/2023 01:19, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x1c8) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: fixed some of lengths, split the INTF changes away]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Everything is fine except sm8450. As I already wrote in the previous 
> version's review, it should be 0x32c for sm8450.
> 

Ack, please excuse me for missing you comment. I'll fix this in v5.

-- 
With best wishes
Dmitry


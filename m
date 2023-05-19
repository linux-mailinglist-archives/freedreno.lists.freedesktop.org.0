Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3F70A312
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 01:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084A110E08E;
	Fri, 19 May 2023 23:02:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E1510E08E
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 23:02:17 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2af15b5f726so33089711fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684537333; x=1687129333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ICfQVhv0p58QRGm6Ofs09fgKjfcNCD6otbrYwwYRjw=;
 b=k9H9/XI3c4gYLXp82YhPCxKp/bDxz6SLs54kVqVsH58rAVBFtDinul2AXJ4edC47fj
 nKbery7wfrU4P9uk2IJgPBl3Fjdr7phb96CXmFwjNSPMLGxh1IVMXyRmqV31yuFyfZoM
 7jc+hyKKcb3efWrPCnY+pwHfbjLrL8lYZAha27UWnTXjswT7u3SXRwa+yDiwxCJyXG5y
 FsnGNwxdnMS6EH1orrvTh6JDIUfouHrBU0mUd54t4lZcvgGwCcyNJ2VFo4E+SpxkHuSv
 KLF+Lp2TPkzxtmpmWsLk8N3ZCmFsRVTr3CJUN17MXA07WLu1RKvXM/Tol4dUd9C6ntbh
 A4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684537333; x=1687129333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ICfQVhv0p58QRGm6Ofs09fgKjfcNCD6otbrYwwYRjw=;
 b=O+8rc+dI2kJwpHm2lNatXqt9ak6nx5m1EZjaFP3+d7ikLgOiBO4dcR0N8GxjCgzkEn
 chj9us3bMTbdDZMzuDn1Mr3R630BrtllSaOPl6qOJ/ZfLx/CZGia/08mCa3L9FsxBtxC
 Z+PabUXFzwMSZteChiAWFKforE3J0/9l9odpMKixg5jZXRQUzwvKRVi9OUs82Z9eA/io
 GdCaiBFOhdftI1TacwP93qCZlb5Ip8FgHni6zVdz02d3XcsbP7wuZ1ktWjnQA7mUX9/K
 xhiORMOzsEht9xCuuQgkAAH+JJZk5Cy4tG0P49pEScr/uXAIq3Wsf6IM6t5ZXcINnR4M
 k+Uw==
X-Gm-Message-State: AC+VfDxGW8QcjZmuyXTRJpXD+Gw8YY7vs8yeeCyx+6v24XH/DHC7SiDl
 yVqxFWyxePMohB1aBhFhHLeXkA==
X-Google-Smtp-Source: ACHHUZ7UMqHk5rENqq9JMQbX9ZqRDgPSQuGZy96/uT1vIZP+8fQjGpkcjjF1D/yArdvq6XYMW8UwDw==
X-Received: by 2002:a2e:9117:0:b0:2ad:af50:6ecb with SMTP id
 m23-20020a2e9117000000b002adaf506ecbmr1397207ljg.14.1684537333678; 
 Fri, 19 May 2023 16:02:13 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a2e2401000000b002a8c2a4fe99sm34178ljk.28.2023.05.19.16.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 16:02:00 -0700 (PDT)
Message-ID: <d97a5b51-f71e-28d6-47ee-a49d11a6aa2d@linaro.org>
Date: Sat, 20 May 2023 01:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230508-topic-hctl_en-v2-1-e7bea9f1f5dd@linaro.org>
 <56ac76e8-e5ac-3712-1e07-ad6c5b96c77c@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <56ac76e8-e5ac-3712-1e07-ad6c5b96c77c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Set DPU_DATA_HCTL_EN for in
 INTF_SC7180_MASK
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 20.05.2023 00:00, Abhinav Kumar wrote:
> 
> 
> On 5/19/2023 11:49 AM, Konrad Dybcio wrote:
>> DPU5 and newer targets enable this unconditionally. Move it from the
>> SC7280 mask to the SC7180 one.
>>
> 
> You mean DPU 5.0.0 right?
Yep!

> 
>> Fixes: 7e6ee55320f0 ("drm/msm/disp/dpu1: enable DATA_HCTL_EN for sc7280 target")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
> 
> I have cross-checked all the chipsets affected by this and confirmed DATA_HCTL is present and those 3 registers programmed with that feature bit are valid, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Thanks!

Konrad
> 

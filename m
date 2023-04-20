Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD856E9EAC
	for <lists+freedreno@lfdr.de>; Fri, 21 Apr 2023 00:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114EC10ED05;
	Thu, 20 Apr 2023 22:20:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3F910ECFA
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 22:20:27 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8ad872ea5so9385121fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 15:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029225; x=1684621225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0QW2zFEjgoUsaSsxeB6v7NVOeo+doEcmv6Xwkw75TFw=;
 b=qX9nkfpbyJjng6ZSha7rHGcg4LudKd3zSrQNn0RR5uF1qMb/HDTzv5Ygyp7yz5JUby
 x+O1vf9GjBtAXRMaFcMQJsseHfBHftKtS2GGSlKHy6bJ+s58OX012Te2Hj3Ie0m+VjI3
 TjrB7NMPSfeFaDXX1tzrCf/EDlBBycUodM8JCXTkDRvL2kzdvZz+83MKUXhIgwHnHURB
 FXHSEHoku5wDTH4+Ij2eO44jPWiA6hQpXJHCdbgp+gJ+crH+oZJQKm6s5DvSstYRE/cC
 RVSv1Ga5xyYN0ZIror7eizBU1aaHZbRhjipk/BAOsRSFaW2x00OrZo5jEGbDL4z2tqMK
 gMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029225; x=1684621225;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0QW2zFEjgoUsaSsxeB6v7NVOeo+doEcmv6Xwkw75TFw=;
 b=itbBM5vAAM7QKOsnp5mdowmZBd6Qql1nv/s4+YlZLXz3l7onDbnQmjEEIWmp64C1lT
 SXTZRdNUq0Zu2T5vFTxiPnUPvvAMqezGsvibz9kpUOKgcjZbBdVDDb0t7ab1eguakOth
 MhTdt/JzN72QKPHDaqNzSDnStLXsy2EKthnwAbf76foyNDa+BE5dspvuaRl1QZPYMDej
 Za87yGQD97zF3N/xD5WAmOAzPfkplMw8ECnCOGWVGWmen5v+h2whZBmcXh3WelKywzZH
 +X5jrEqs0GkcJRpRp6eNZ3HuwR6ZV5wLzg+9odzbMflHdMUgvgoQ97HQAJ2dhh+Z7iDK
 N3cQ==
X-Gm-Message-State: AAQBX9eXn370m+QPQ0gFm3UGyci2ad0d5WPyud1ww61vNaSUNsvbTJxy
 Q+JaQRsK4dl6E9nmk+grv6VHvQ==
X-Google-Smtp-Source: AKy350bMn6KVhj21+we3mlghC+POksK+s8xQxvWGGN3UFAziRJEF3Lev22U9KKRMAJ1zT38co8wU8Q==
X-Received: by 2002:ac2:4891:0:b0:4ec:8d97:9479 with SMTP id
 x17-20020ac24891000000b004ec8d979479mr777600lfc.20.1682029225592; 
 Thu, 20 Apr 2023 15:20:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n5-20020ac242c5000000b004ec88753502sm347146lfl.111.2023.04.20.15.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:20:25 -0700 (PDT)
Message-ID: <61bdd089-89b7-749b-95bd-c7e61c396e29@linaro.org>
Date: Fri, 21 Apr 2023 01:20:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v1-1-b9897ceb6f3e@somainline.org>
 <7ad86cd9-4b30-e7f1-780f-2c1c7093087e@linaro.org>
 <cd308be9-5420-6d75-da23-e844107ec275@quicinc.com>
 <2ujeakobg7oulzarvzjktx5elo4ckpjq5pbknr3jx3h43snmry@yd4j64s7tqy5>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2ujeakobg7oulzarvzjktx5elo4ckpjq5pbknr3jx3h43snmry@yd4j64s7tqy5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Drop unused members from
 HW structs
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
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/04/2023 00:39, Marijn Suijten wrote:
> On 2023-04-20 08:46:46, Abhinav Kumar wrote:
>>
>>
>> On 4/20/2023 7:33 AM, Dmitry Baryshkov wrote:
>>> On 18/04/2023 02:14, Marijn Suijten wrote:
>>>> Some of these members were initialized while never read, while others
>>>> were not even assigned any value at all.  Drop them to save some space,
>>>> and above all confusion when looking at these members.
>>>>
>>>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>>>> Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for
>>>> writeback blocks")
>>>
>>> The fixes headers are slightly questionable, as unused fields are not a
>>> bug. Nevertheless:
>>>
>>
>> Yes, I would also not treat this as a "fix" but just cleanup.
> 
> Ack to both.  This seems like a fine line to me as the fields are not
> contributing to anything except confusion.  Specifically hw_mdp which is
> never initialized and may accidentally be used without realizing that
> it'll stay NULL, but that is again up to the developer using the field
> at that point.
> 
> Feel free to drop them while applying, or should I reword the message to
> at least still link these commits to mention the origin of the unused
> fields?

I'm fine with having the Fixes removed. If you can send the v2 reordered 
& with tags removed, that would be the best.

> 
> - Marijn

-- 
With best wishes
Dmitry


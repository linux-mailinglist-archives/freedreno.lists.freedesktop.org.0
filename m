Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C890A6D2F98
	for <lists+freedreno@lfdr.de>; Sat,  1 Apr 2023 12:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFC810E09A;
	Sat,  1 Apr 2023 10:01:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA9F10E09A
 for <freedreno@lists.freedesktop.org>; Sat,  1 Apr 2023 10:01:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id br6so31991953lfb.11
 for <freedreno@lists.freedesktop.org>; Sat, 01 Apr 2023 03:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680343289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2ashd2jmNGSIbGJQnNJYWhd+xpZtd9xxM/hYfr9rYcA=;
 b=cvMa0BOgOKuLHFcuTuUangjhtuU9ZabVvI0Y+v8IFlvPGejj0sSIewvL7PGEV7j7x/
 m7keJzkIcw0KW873qypmVzRl4n3BKSuEZCrnIueU1O1MCZ8MQ4007y7RtoKD1QcIwuQF
 NwAISXX+HjvmxoT2DE/UeDk1YxQue+jP35L/fr4iuNePtiFdXtGCKwqpzCBwQBeX5j8E
 h6iQOrydTiQ3WV/4DZWmW0a+T9eUFZyBkYya7PmAra+focN70gHeyDvFH+Gk0rZs1he+
 TcGEtE2k2tmRLbLm1w3sKDg+oeTuZAS8yKlMxHwR7gzK5MS9FVtqaJpsevHksBp7P8FL
 dy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680343289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ashd2jmNGSIbGJQnNJYWhd+xpZtd9xxM/hYfr9rYcA=;
 b=UdDJCNzYbl3tKmHgbHVExIioO9qu5Kvp4ZznuTCOOTQSZZ/95TITjUtKCspm62Iq3B
 gjLsHHCylLEBSZFX4Wc9mmBVlbIoH7ovnxRm3Qyn7brEqrtXcRbf+wsZ7wSd8GEL8t8i
 ePMykvX3z2eoiabI0sqlmuwwTn6A8ZpH67u3LyyCN8dZLxi6Cj5MBnKFyYrN50Gdl2Oi
 +Z5fMIpYyJpCyezHCs9Qjsikpl/ZEeQBU+NzD/s4GXT2eLBuie9r5OFQpihNnDp2/+8d
 3VwajnFi3HqCrQaoe7CLNX5irw7SQCRzvnn408Hd1EFiMS0pXQP4ejKOzBxJfgziq2sg
 dJcA==
X-Gm-Message-State: AAQBX9dLsRwIF2L/wBLlsaZINBc19ed9w9vIAON25rzHjmLdlp6xaD1K
 ITM9mQjwa1CJ6uMcZvw2vkCymQ==
X-Google-Smtp-Source: AKy350Y0rU9C+2qKJhXR3P4UDAi3oG2kpaWzmNmI8qMFgCf0V70lDWcGZrau2okmTZjXeM+5aRXtrA==
X-Received: by 2002:ac2:428c:0:b0:4e9:9c76:1b85 with SMTP id
 m12-20020ac2428c000000b004e99c761b85mr7761595lfh.3.1680343289432; 
 Sat, 01 Apr 2023 03:01:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d7-20020ac25447000000b004d57fc74f2csm752344lfn.266.2023.04.01.03.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 03:01:29 -0700 (PDT)
Message-ID: <e538dfcf-e317-e975-0442-8ab5cdca6c8e@linaro.org>
Date: Sat, 1 Apr 2023 13:01:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-1-3c13ced536b2@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-1-3c13ced536b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC v2 1/6] drm/display/dsc: Add flatness
 and initial scale value calculations
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/03/2023 21:49, Jessica Zhang wrote:
> Add helpers to calculate det_thresh_flatness and initial_scale_value as
> these calculations are defined within the DSC spec.
> 
> Changes in v2:
> - Renamed det_thresh_flatness to flatness_det_thresh
> - Set initial_scale_value directly in helper
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


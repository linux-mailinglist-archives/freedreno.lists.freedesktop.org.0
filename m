Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B469FE65
	for <lists+freedreno@lfdr.de>; Wed, 22 Feb 2023 23:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3091810E455;
	Wed, 22 Feb 2023 22:22:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF18410E456
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 22:22:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f18so11992880lfa.3
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 14:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=atzpGGm4vagUHizle3JgA9VVbXqT62LG4zh3TeyuV3k=;
 b=z3HAXW0r+lBjP33n3TNvCI7k44IekUH5PFat+cB07EL6dqRd2YdAOFE6sHRm06PTCx
 5ZRmH6n7pROQPFle8JBqNEs/lyQY1sZPmKdPB13sKN5sjz4TKeIMgF0F1jVPR/4mW8+7
 IJjxEJwCzXjmQVjqK3k3+erufB2HHOSUwxpp0HZQvBuB/3mUGt4GssoSkle12dUBv/b5
 32HVgPy9GJlDkp3JxNO0tgIE3UAe7HpN2aoTbDnE5q8RiU8hMpAH72pxsJ3l62kt7+ZE
 bwSqs+AK+lrxCwPCvBpOCHlqPZjOmJ+k6JYkoBtpZArbD9pQOCUMd12Wv4PU8p4pITvT
 WJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atzpGGm4vagUHizle3JgA9VVbXqT62LG4zh3TeyuV3k=;
 b=yQR1FZVv/OEDSdMs7AMyUJDdOPFTC+vmMN9YJdCiyplSpD4oV1ny8u5gVjAWXhKD8c
 syXvS1WlQaCqQJxcQlpzZL1y/a7rNqWkhFpYSRMHo3r9QpxYPyk/jY8B0RrWjWDgwCiw
 4/1UxXzsLDHoXTRg2YCW/Ae4pz57uc5ryq2/EOPrXHdMUpG8whOAZJDa1hY1zVFjTDnU
 wMYytjJI0WrVIqRKKpcywG6jdInNw6dWkGrUzakT7ezItuDE7GOAlFx9N8wU0xF0rCls
 TnOt2SWPu8/E18JJ8XaTKQGJeWjVa9IWLaG+zYpGR5L45cilr05MCYbQcqhY44SGQ/r5
 QoQw==
X-Gm-Message-State: AO0yUKVStsUz/XXhSqBVqnHWWo6PUGID/ZoClUm+cRpExhhmyzVAEUFu
 NuzPQpxf8h6+5GAvZyH19twOb8U39TMRIufJ
X-Google-Smtp-Source: AK7set9n3cIGAeZEY7Yp6SQEIqmsXNCVJMpeL/gyWazXzSu4mnct6+IYJTjeiy23AJy9CGnSUq/4DQ==
X-Received: by 2002:ac2:46d9:0:b0:4dc:807a:d134 with SMTP id
 p25-20020ac246d9000000b004dc807ad134mr2911452lfo.65.1677104562994; 
 Wed, 22 Feb 2023 14:22:42 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac25a41000000b004d85a7e8b17sm398111lfn.269.2023.02.22.14.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:22:42 -0800 (PST)
Message-ID: <414f038f-7196-e3ca-5854-222c7c42348d@linaro.org>
Date: Thu, 23 Feb 2023 00:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-4-01021425781b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-4-01021425781b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/5] drm/msm/a4xx: Implement .gpu_busy
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Add support for gpu_busy on a4xx, which is required for devfreq
> support.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


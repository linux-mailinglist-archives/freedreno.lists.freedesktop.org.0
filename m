Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9886B1EFE
	for <lists+freedreno@lfdr.de>; Thu,  9 Mar 2023 09:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B8F10E7B3;
	Thu,  9 Mar 2023 08:55:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC5510E7B5
 for <freedreno@lists.freedesktop.org>; Thu,  9 Mar 2023 08:55:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id b10so1113385ljr.0
 for <freedreno@lists.freedesktop.org>; Thu, 09 Mar 2023 00:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678352126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vLBDAeGfi6fykGB3Tt3PujkB5zxsvtk+q1HFLQn1pv8=;
 b=n5CjXjQJy3XvX4EqSVAUkwBkvfzUBq2gpFIvFTzHRbutv6cJtuXaZz89UJkZT6aObo
 TTdfX4Rf5ZE6x+PVWd5I07yA1EecUY6nAAz5jotfS3pVWapndAaD9Ms1hMshctES6r5s
 5BQOQHTl8fc3w7M8EjC5a+wBzY9R/X5hjoISI7NXqCgwAVnJgBtVINw3XH4Ccn2dacF0
 MvgvYCRVxF0mWIvQ2smci6DVslCDY1LboH7y4KUTk8zTq4/aov3bFQDgMdFp7tBQxFHp
 FXeLwqwfI1tLxLEEeaACJ6GnKuvGv1qirtdWnBN+SvpcSNjqTeuK4lATr1SE25QILzfv
 7Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678352126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vLBDAeGfi6fykGB3Tt3PujkB5zxsvtk+q1HFLQn1pv8=;
 b=c3W/G4tYVXkBlT7hm4ktCMZaBfdsoST9ggsqf2pZCRjXV8WQput1U8n3DpQeWs9UGi
 U00HiWaimtnPVxHwRUPUStbOR7189vm6FCg3y3AZq3qFVCkbJH6cxDkVo+05ojoRQs4B
 zodO6nyrpBr4XOYBJxGStJvHOh/XJyFp0g5eIat+vF3j7yIzWx0maj3bs5taOcwhotlI
 FkM0fgMyNIyqltBDqor05OplyxpZw5oRt1bX0O50pu6Of1jCjtuyJyMq7V4x2Xl1yOpb
 UVMCy+qcq10fevVnTRhfXwv/tWCK/TM1qDPJ8wf3hqPJEhTXpLW+uH941IolAEuPAjue
 Eggw==
X-Gm-Message-State: AO0yUKX7zxtFdeG2C05QEMJPFhVT8gPlJjPwq9mrgeh3K6YcoBCsXb3u
 yraZP3upxN+KzmcjpfQa6OxzEg==
X-Google-Smtp-Source: AK7set+5eGFPe5LwpRknNFPmVr5Zn+raNlFoV5fuEy8mgKlZr5bnCH0CJVo+9hOvmznMcjmlEXH91w==
X-Received: by 2002:a2e:9ccc:0:b0:295:b29f:5b15 with SMTP id
 g12-20020a2e9ccc000000b00295b29f5b15mr5880143ljj.24.1678352126304; 
 Thu, 09 Mar 2023 00:55:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a2e9acb000000b0029347612e94sm2887280ljj.123.2023.03.09.00.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 00:55:25 -0800 (PST)
Message-ID: <9a9a8279-c634-b595-7a19-fe95540a3540@linaro.org>
Date: Thu, 9 Mar 2023 10:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC] drm: property: use vzalloc() instead of
 kvzalloc() for large blobs
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
Cc: freedreno@lists.freedesktop.org, robdclark@gmail.com,
 laurent.pinchart@ideasonboard.com, daniel@ffwll.ch, airlied@gmail.com,
 ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/03/2023 22:02, Abhinav Kumar wrote:
> For DRM property blobs created by user mode using
> drm_property_create_blob(), if the blob value needs to be updated the
> only way is to destroy the previous blob and create a new one instead.
> 
> For some of the property blobs, if the size of the blob is more
> than one page size, kvzalloc() can slow down system as it will first
> try to allocate physically contiguous memory but upon failure will
> fall back to non-contiguous (vmalloc) allocation.
> 
> If the blob property being used is bigger than one page size, in a
> heavily loaded system, this causes performance issues because
> some of the blobs are updated on a per-frame basis.
> 
> To mitigate the performance impact of kvzalloc(), use it only when
> the size of allocation is less than a page size when creating property
> blobs
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/drm_property.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index dfec479830e4..40c2a3142038 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -561,7 +561,11 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
>   	if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
>   		return ERR_PTR(-EINVAL);
>   
> -	blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
> +	if (sizeof(struct drm_property_blob) + length > PAGE_SIZE)
> +		blob = vzalloc(sizeof(struct drm_property_blob)+length);
> +	else
> +		blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
> +

Seeing the same expression repeated three times in a row is a bad sign.
Also, I think in the else branch you can use kzalloc directly, kvzalloc 
will end up there anyway.

>   	if (!blob)
>   		return ERR_PTR(-ENOMEM);
>   

-- 
With best wishes
Dmitry


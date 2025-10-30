Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13368C1E9C1
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 07:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EAC10E895;
	Thu, 30 Oct 2025 06:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NlxZgT9v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB4B10E88C
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 06:42:15 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-782e93932ffso706334b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761806535; x=1762411335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XRjmjhwgFo6DAjuANvJLlsLw1oA4anFVQb7lf99MW8g=;
 b=NlxZgT9vErArTnzYZcWQ79vYcwltgJFY69SdLX5+4k7dfpg96aIICnTIETydp6g4rQ
 nBMbQDJAHYaAnu4eMNC4jiglBmSeMbkKqxin+vL5OuW5CpEsDqdPglRyyrlciag9uCro
 qWAsXspjdR+5Ul/BZzq01SbTfVA31bTCSlSLHrkh37RTOIzQmGAst9iYgNriP4u7q8d+
 KGH49XBkW4jbFXpLUNriBpXrPWWA8go6shyqn/ddx+gVZ709OwM7OA46xZZfmT7Obhrp
 VAglSl+9TtEGS4hq97c+e4l6zAH/t5yjdxcL8riXhAs702y3BcrDkuTZ67BM8YIVjco+
 pdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761806535; x=1762411335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XRjmjhwgFo6DAjuANvJLlsLw1oA4anFVQb7lf99MW8g=;
 b=l/S0/L7PCtMfK/kGIiIcgMvlv4GylyN6YuBNgv6n3Lbn+2U6s9sVXw0SWcnIH2TsnW
 93o6v6ceSa4fkcf6WyjFp6agcmUvlWdc6cNpE6KKMUG+Yj8RLkMYyCjL2xc+5L8ObXVs
 eU/uKfG5WZL93OKpa+jbpkpTwtFkEPQSyyRn0NZa4fGd9x1LYGjZiPFLW+B5m46srJAE
 1ETgJzRxwxKe/SrKJXsJDvCf7zlF6TPO5vIAaqHMlzc9RqGzougbDDc9bzmJzWCKDx8J
 Qw2oRC1qE4WeHN/kG6RDk/k7gZjRqiW6oa/cxckfmIO6QCIKojdrwK6adwcPf2bPwsMP
 fJUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGSf5mhb4OTOgCO89/cGawGSz5ZI00BBRpqy+qVIccDG8TriMfMk6/TA6QpTIQ3lJL+5GYxbZi+ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTn6AtPMFF7PTYEduU3HEadz0TXISAzwn0DsnVmc4HRDfKfl4o
 KHDk5WvHnPjMH9QBPjoz+8OupDvF/lgrhN92VxHLUxJGNMjWaAKTcDVa
X-Gm-Gg: ASbGncvTpbh20kS0wmVA0Q7H+XOP07d46AYaLaQu22Kly9mDwny5cC0bWZMA2KEiSwr
 zAB6uiK2LHTAWZoC5sIfb1M8MywuXkB93ZIvQAelwI9LgRdjhrynHaT4SkjsX7H1AwJflhUFvqS
 lZW95Ho9wTYkkQLVW9CgooSXb8JaHQhC9bWihvdWq6Kgv3iSv5yhLjDOGF7ccQ+O2eBikpFhZc8
 JCQBN5p3N3BG4rMff7ixKjdwmUHDkO0M2R2fco6+vNQEH/APmrrKkgAHQbLdIxgpylOQ03dH7o4
 YZsP/ySQ3RpnmuXYGWBr/ThgR8JQ8ZG7/0qlM9xRqqgATTGOV3hXWnXgkEGqOZLxu0cVQt2CVqv
 2R1CgdJBhSltBAAEGjb6OOnBp97uMf0nZSCEzqDaeBVS2+cNMKUqSRKK4y9xIz82HHuPNfTLYLI
 sCGxIjT3yD6sxW+6361s2KDGz5PJJrCPxZ81pQJTFWGDNjWVOT6JNtmg==
X-Google-Smtp-Source: AGHT+IHhNxsrwPO8GFNjwbeDLO66xSVyMs6+J042HgogOYR3N9tX6avqO0/30+zi499pUFsIKhHa2g==
X-Received: by 2002:a05:6a21:3287:b0:334:9649:4754 with SMTP id
 adf61e73a8af0-3465293bf63mr7104225637.13.1761806534844; 
 Wed, 29 Oct 2025 23:42:14 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:90ae:1623:a8e:9839?
 ([2600:8802:702:7400:90ae:1623:a8e:9839])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a4140168f7sm17329517b3a.11.2025.10.29.23.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 23:42:14 -0700 (PDT)
Message-ID: <89dbc85f-631e-4402-aca6-128e2cce399b@gmail.com>
Date: Wed, 29 Oct 2025 23:42:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/15/2025 12:26 AM, Neil Armstrong wrote:
> Hi,
> 
> On 10/3/25 01:57, Jessica Zhang wrote:
>> My current email will stop working soon. Update my email address to
>> jesszhan0024@gmail.com
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7e7515a412e9..7a712ded8f9f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
>>   M:    Rob Clark <robin.clark@oss.qualcomm.com>
>>   M:    Dmitry Baryshkov <lumag@kernel.org>
>>   R:    Abhinav Kumar <abhinav.kumar@linux.dev>
>> -R:    Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> +R:    Jessica Zhang <jesszhan0024@gmail.com>
>>   R:    Sean Paul <sean@poorly.run>
>>   R:    Marijn Suijten <marijn.suijten@somainline.org>
>>   L:    linux-arm-msm@vger.kernel.org
>> @@ -8325,7 +8325,7 @@ F:    drivers/gpu/drm/clients/drm_log.c
>>   DRM PANEL DRIVERS
>>   M:    Neil Armstrong <neil.armstrong@linaro.org>
>> -R:    Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> +R:    Jessica Zhang <jesszhan0024@gmail.com>
>>   L:    dri-devel@lists.freedesktop.org
>>   S:    Maintained
>>   T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> Could you also update .mailmap in a follow-up patch ?

Hey Neil,

Sorry for missing this earlier -- I've posted the follow-up here [1].

Thanks,

Jessica Zhang

[1] 
https://lists.freedesktop.org/archives/freedreno/2025-October/041998.html

> 
> Thanks,
> Neil
> 
>>
>> ---
>> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
>> change-id: 20251002-quit-qcom-5125b64a86aa
>>
>> Best regards,
>> -- 
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064EAAAEEDA
	for <lists+freedreno@lfdr.de>; Thu,  8 May 2025 00:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6C510E202;
	Wed,  7 May 2025 22:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i5othX7L";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9909210E202
 for <freedreno@lists.freedesktop.org>; Wed,  7 May 2025 22:53:25 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54fbe1f679cso54457e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 15:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746658404; x=1747263204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TlVficwMHW5bnQrJgqz9lUT+ZGh6/8t1mCdFoRRa5Eo=;
 b=i5othX7L/ZypLjAfMAEjAPTJzIcqPsJYK7cPExk4q2MwsCsWT7blajEkCoTfwbzJ88
 v9791/xFp3m7lTzmSeCtR6BnKom1PNO2uTHqGOEskDKsp/J6nK0YUBF0qnFgOpGDxhju
 +IYwMyeBk9pTK7G1qNwmLHyQp9esoupuMfL4307bVm2yqc/UcWglSgaa5FBeMqz8AxDL
 +WkHGEjBz+w+4pm2rZUh8e7IEeaCDYuNW0PqopoilCsYy2LCQ7gDbpUX3Cl/S61HSjOg
 ysplyF6MTknjevju+6lEsNsBf7Fw+dw4fP8gLJC8eeDpldKsCIBsYe47szHRFot6cWNU
 wJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746658404; x=1747263204;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TlVficwMHW5bnQrJgqz9lUT+ZGh6/8t1mCdFoRRa5Eo=;
 b=jyK7iHTiETaFQkrmfqx8mRrvdxd61JeTNVCXM/uiwXfFsFJUG/G6jf9LIE8g9D6szH
 aA+4jNpdAtaF+UWJKB457R/COh/YWee0LBj2OXDr4LyHB+ivTX21PbcuV7RU4V5HJAsf
 ArYV+PQFx22EfWWUMHRMxW8A8zqlJbbLuLc/rw79WQ32gxsovs5ZdrX58Q6KH5AOL1EX
 q0ZrXoiUBRHadFzmZRLe0fk7Z0Nh3jrFdgwCr3G12iUhTUR3p1KY7Gay7ZI+n6FYw8Ql
 v4tYwzKAXiEBAeO8+cuCcEQi/y9R+mfb5+mGiAxd7+vWSd+G5yYfqYsGGwvgP5Blw7SZ
 FOqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI9XvJi7TAa3xnlw3h3pKnhqfXZ+PYsdsJR0zpihssD4PL6dFgHUxZ9eKS1rsNCZhfzXxnRREP/X8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdLFvbQVdGmuejN0Fy8C7I9Hwc9l9CQeEs+wjRz7MDrS4Zue4z
 yYkTtGSXjlfqkbYmljOqHLrWeTrbH0MRqJVeYjXf5NX4WC1sMEnZW3sDDFmC2XE=
X-Gm-Gg: ASbGncupDKAo6Dc9RqMdKfd69jvJT44JzLQiCuhc0fWOs0CgUbrIs1242TBxbsjm7dn
 bNw2/7I5hUqaXGHg7z20M12NCDGN+MoiC7POocwwccmUAF8c1wsa5ONzzyo5s9f5+cmnxsWZ/f9
 g6ePTcLllPN8fnkiiH+A0kPUto65uZ5pE9Xzr9o5L5XEMzoqEac3inKtlppZvnxe6wXFUfV0JDy
 GZ8ML8Tt3Lj9Q2IvVPQcuXU1v5b+D2tnSalyogNPRUNTvxx07y0Ch7DHeNR8pMB8yP5jrkgUSgQ
 qTDfz9HPLiJJCw74Kl71kh3ZF2L3B11iT7CqHGMn0fn+kISZEPB9emCl9sh4RT7ZPmZcbhHjzvm
 zaVH9h+9Kz6tTjRPtNco=
X-Google-Smtp-Source: AGHT+IGSPC0AEPj05+D6d3Mzs6vri+sTBq2zyky+s0YWr7AbwJ8/5Bp1988wfG7UTipNEAgT6KZp8Q==
X-Received: by 2002:a05:6512:ea6:b0:549:8faf:e21b with SMTP id
 2adb3069b0e04-54fb95fff5bmr638518e87.5.1746658403798; 
 Wed, 07 May 2025 15:53:23 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi.
 [88.112.131.206]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94b1914sm2470283e87.38.2025.05.07.15.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 15:53:23 -0700 (PDT)
Message-ID: <765b0d28-7295-42ae-9ecc-58899dc2ea53@linaro.org>
Date: Thu, 8 May 2025 01:53:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: mdss: use devres version of interface to
 populate children devices
Content-Language: ru-RU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
 <xmpb6zrbnx2jcfjthkafj6viptkugowo7qdfxlg7vdfh3mqlua@2tcbsd4f3dtv>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <xmpb6zrbnx2jcfjthkafj6viptkugowo7qdfxlg7vdfh3mqlua@2tcbsd4f3dtv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/8/25 00:24, Dmitry Baryshkov wrote:
> On Wed, May 07, 2025 at 10:35:38PM +0300, Vladimir Zapolskiy wrote:
>> Trivial change, there is a managed device resource version of
>> of_platform_populate(), and its usage simplifies the code a bit.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index dcb49fd30402..116e8f93f8c8 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -550,7 +550,7 @@ static int mdss_probe(struct platform_device *pdev)
>>   	 * Populate the children devices, find the MDP5/DPU node, and then add
>>   	 * the interfaces to our components list.
>>   	 */
>> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>> +	ret = devm_of_platform_populate(dev);
>>   	if (ret) {
>>   		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
>>   		msm_mdss_destroy(mdss);
>> @@ -564,8 +564,6 @@ static void mdss_remove(struct platform_device *pdev)
>>   {
>>   	struct msm_mdss *mdss = platform_get_drvdata(pdev);
>>   
>> -	of_platform_depopulate(&pdev->dev);
>> -
>>   	msm_mdss_destroy(mdss);
> 
> Unfortunately this means that the child devices will still exist after
> destroying the MDSS (IRQ domain, etc). So, it seems it can not land as
> is.

Due to the essense of the change this sounds odd, anyway thanks for review.
I'll perform a test, if it's a regression or not.

>>   }
>>

--
Best wishes,
Vladimir

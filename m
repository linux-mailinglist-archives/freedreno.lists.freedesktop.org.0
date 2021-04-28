Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0236D871
	for <lists+freedreno@lfdr.de>; Wed, 28 Apr 2021 15:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999236EB44;
	Wed, 28 Apr 2021 13:41:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF0E6EB45
 for <freedreno@lists.freedesktop.org>; Wed, 28 Apr 2021 13:41:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 2so6581879lft.4
 for <freedreno@lists.freedesktop.org>; Wed, 28 Apr 2021 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UdaUkpA5N5nHKWHA6Y11Sw4irRFTX3g8KA8orjrfBsU=;
 b=mKD+BwdqpP+b4KJs/cYSekD0cEqSNkwjJ5DGcCum6eqpKHUSCvM/ojFkhfTdJaCf1L
 YkU6lF8VpmpvOtIXQ2+DTfQWGSMHqtHXDQkAHtME33M58Q9cIbnGCoVoODFMT0OOeHIu
 xS4OTqDnhP/SMWzJRCmsMsV484MSsmaAGILVqfzwTQxc/3UKq4lDk6kouQpxk+XBc52J
 byNA8QeOoiyx52h0rJeCEb2uvsCMONG/z9C0ykmUagZKP3ZClBUXuwTxB8Mt9TEJGj5l
 MWabM6x7lSjmFYFlbpPGRYQWF9U6McKdiO3iwkZcRQP7HZWyQ+8lGMdXxAf2Osa9F7I8
 dpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UdaUkpA5N5nHKWHA6Y11Sw4irRFTX3g8KA8orjrfBsU=;
 b=CUNgByvr6k2z3bV+eu5fIMjJn6Hd/6yEcx70UybbE4MdLOVzZ+FWBeFuMEP9VRGqmd
 SqeOpv6WCwkb8+gbbAzBVEjL+mPcn2X6akOVciZL2nxsSA/B7dXtn8hCjT7sGPGRbvLG
 F2Tk3+iKvUOsaCDEaJPW2R/3K4X/OkkzRJF8B8ldlW4Prwgsjm2WvsOOOFhZ4cpjdBmI
 PfeDP3sjWedTdfUyzkgmJOdbC9t42IY05GX2MSIdBKoop/5a6DLrROPBa2h+JyZM19mc
 I0vV5vIDviAGsHhpBln+K0zw1A+qGOVZcs0Cogr9D/1Tt9boQLLRwDMW/mNqY+XtrhBl
 SV7w==
X-Gm-Message-State: AOAM533AESvkNSmdIy67N51OhMqN6pbKuLV20vm2nDgH3D5eFhhkv3Gl
 dZ4XfGNRQp8PacwYr6iZ+HpLxuL5KDHssg==
X-Google-Smtp-Source: ABdhPJwZ8hSuuPlle9JJpl95OeROAwnXVDtwnjuR43flrbjDNYUGcXMjeq6y8jBeVkreKP1v4+xBtA==
X-Received: by 2002:ac2:5f92:: with SMTP id r18mr7033680lfe.253.1619617285747; 
 Wed, 28 Apr 2021 06:41:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f20sm1181344ljn.123.2021.04.28.06.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 06:41:25 -0700 (PDT)
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <20210428024755.GJ1908499@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
Date: Wed, 28 Apr 2021 16:41:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210428024755.GJ1908499@yoga>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/04/2021 05:47, Bjorn Andersson wrote:
> On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
> [..]
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 92fe844b517b..be578fc4e54f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>>   }
>>   
>>   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
>> -				  const char *dbgname, bool quiet)
>> +				  const char *dbgname, bool quiet, phys_addr_t *psize)
> 
> size_t sounds like a better fit for psize...

I was trying to select between size_t and phys_addr_t, settling on the 
latter one because it is used for resource size.


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

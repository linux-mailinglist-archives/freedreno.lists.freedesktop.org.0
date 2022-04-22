Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE350C248
	for <lists+freedreno@lfdr.de>; Sat, 23 Apr 2022 00:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237C410E350;
	Fri, 22 Apr 2022 22:41:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5705A10E300
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 22:41:02 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id h27so16387072lfj.13
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=9OGcVwu87n3nund5h+/ahM8cEAIF7XFZ15UqXk1Yef4=;
 b=CAbZr1b6SoLRrn/4p8RcK6MLkzVkZgvKehcD3ykk64L1/GQ5UmB431dmyJGGomJr5t
 dRPHBDtHDtmmCotIXNa3FMpfZrYi+pzKGLfCTdphzfy5ur+Hj4gdLnD9XHOrU2Ql1nPp
 JeLDHlxeu2zfMIxQj6Ir6A6i003s57R/ADVSBgIne7y4GpHjpuvtOzWcUUiOg2qIgrWK
 TZedyUdVBjOeQW9AspdDmo51QngzQnuez6hlfVK0RFZHmoeA5cuKYT57ag9lMEoDGKbW
 PYn1Psu3wJkuFyzBpeYMhGYKOUograhAi5d1twBLHe6Iv6Vvr3S1H9fK5uf5aXRdESbk
 DmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=9OGcVwu87n3nund5h+/ahM8cEAIF7XFZ15UqXk1Yef4=;
 b=ugPrbuPZ2BoXmV9pehITyYuXoAU5OOq65CEqpEQFifMpOk7uX2JApLIEUqSsJ03fV2
 wqU5vxZETrJjuyft9WsRYjjzr3eWnYstjE25G1LNQYqcSo1tkx26xDl7R2KSgtgUM/aw
 ym55oOhOJe1CnrXATJ++ic+10zxJSOPTOktyXrKkqyDHXf+VDMUXyYWGljAl0PhUDmBI
 F4ta2zahkOJkEWyVnUzJomkNaUrk2JNBz07wMavk0NjF40t65Lo00An51Ki3m7aINPFN
 ukpKKD93HEDUBa+dADQdu/XtrEQsSkD0/n+MRlXuJvBfJz6nrJQoHRbwShA6WQYUB3OM
 TGlw==
X-Gm-Message-State: AOAM5339T7cfcgMbMFRJIem8+kEizH9Ya7ZwO2745KyMValbyMo5sweJ
 5zx85u4DhXpfn9pfx4RDkZeArw==
X-Google-Smtp-Source: ABdhPJzys8moEhv4YW8LsUgDZNfCdy9bUPFmjV3EvTn8K635yo6mVPcZHalEKkB0DlcYfz1pZkkM7g==
X-Received: by 2002:a05:6512:1193:b0:471:af88:2d74 with SMTP id
 g19-20020a056512119300b00471af882d74mr4515551lfr.531.1650667260391; 
 Fri, 22 Apr 2022 15:41:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a196741000000b0046bc4be1d60sm376636lfj.123.2022.04.22.15.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 15:41:00 -0700 (PDT)
Message-ID: <39b3828e-064c-6aa4-de77-35b201b1b40f@linaro.org>
Date: Sat, 23 Apr 2022 01:40:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: cgel.zte@gmail.com
References: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
 <CAA8EJpoAeCp-=k2o+C4E4jHBAv7f3eKrV5FZiYjVZ8hcRGYLVA@mail.gmail.com>
In-Reply-To: <CAA8EJpoAeCp-=k2o+C4E4jHBAv7f3eKrV5FZiYjVZ8hcRGYLVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm: msm: fix error check return value of
 irq_of_parse_and_map()
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, quic_mkrishn@quicinc.com,
 vulab@iscas.ac.cn, daniel@ffwll.ch, sean@poorly.run,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 angelogioacchino.delregno@collabora.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/04/2022 13:42, Dmitry Baryshkov wrote:
> On Fri, 22 Apr 2022 at 11:52, <cgel.zte@gmail.com> wrote:
>>
>> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>>
>> The irq_of_parse_and_map() function returns 0 on failure, and does not
>> return an negative value.
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> index 3b92372e7bdf..1fb1ed9e95d9 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> @@ -570,7 +570,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>>          }
>>
>>          irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
>> -       if (irq < 0) {
>> +       if (!irq) {
>>                  ret = irq;

As noted by Stephen, this will cause the function to prematurely return 
0 (success).

>>                  DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
>>                  goto fail;
>> --
>> 2.25.1
>>
> 
> 


-- 
With best wishes
Dmitry

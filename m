Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8756A5A2403
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF3710E7B3;
	Fri, 26 Aug 2022 09:18:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047010E7B3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:18:09 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id x10so1004932ljq.4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=4tus8epaMHUbmcArRBTPpFlbWX4EVf9W5eBIrU+kqkY=;
 b=qVu8Xb5EIg2/CvU9f9gAfM8LglPh5MxjjdfkYzxqCxO+1yUyAxXS+TqhDivybxTyDk
 RH5EkqCw/3NpMfD+MynhyVqcIoNZ8N4UWQyB6+8BKIft6xChpFmMFJx/5Mx/AeQfCOuK
 taxIcgTW7O96R3cGw/pJFpd5LG8KrsLD7ccspqCCYb3C+yqOiu60J5JFhqr14+HARQKN
 lOXdlO0xPhw+Bib17QapPeYTXIiIrAu9sVAhOFDIpbJslb0J26Hg5Cwya8wehHPQWRp4
 5C1bUMdEwBz16gAAvxF8cUKMbHaoNaNczvdCt+HkUduY8wmCk40rDEsbOtSK2oEwDVds
 eQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4tus8epaMHUbmcArRBTPpFlbWX4EVf9W5eBIrU+kqkY=;
 b=loAbeEdXSc91jLDbEtZUNoubg3ZX3oygryqt32JH1QIcKml2tOV8qPAGS1X/Go+8CY
 JGqYlbAbsLPnTbE51KPVJOqcYX39mz+KZVdbUPE0rA2qIHmbYg0TItbEfZlRTHStvngp
 LSH028TqGbcrahClCH4REAFNg0mn3GOX4nBxYGEIbxeFvJoQOG14/QMIfKToeUUKoFB9
 NnXtaMUrqUVtIoCXqaE5T84iXxP9J6OKG9emlphC5L1pirjzlvXAyTTCnxWKQSYnUaXG
 zQC68LiaepKiA6Car12baQJHzXPb+B4pYqOTBl23NYapvWKFqAy0rHhBAetXFPcrSVlb
 ZIhQ==
X-Gm-Message-State: ACgBeo1jGUDWWPlGP6gcma08PPM3GjUavhuGgJ4fdCkDJEe42ZnaZP+o
 k/Z5WqR0XswIZGhrPQ+UooiR5w==
X-Google-Smtp-Source: AA6agR6P92JvdVZk+ayg/PXxM10IDYQD7T2TrNgNAYeJOPy+CUj9fLqkhSoLoba1Lj8tOJ3oQJ9TfQ==
X-Received: by 2002:a05:651c:17a0:b0:261:ac0d:6c45 with SMTP id
 bn32-20020a05651c17a000b00261ac0d6c45mr2042434ljb.225.1661505487989; 
 Fri, 26 Aug 2022 02:18:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05651203e800b0048b3a92a2dbsm309954lfq.215.2022.08.26.02.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:18:07 -0700 (PDT)
Message-ID: <1a415bc7-d521-3c13-e61d-26211c00a165@linaro.org>
Date: Fri, 26 Aug 2022 12:18:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
 <CAE-0n51XQEoi-+6njQaz3oR=wMwe+WVnqA1PApmZDuQ3-gjMqg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51XQEoi-+6njQaz3oR=wMwe+WVnqA1PApmZDuQ3-gjMqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH] drm/msm: lookup the ICC paths in both
 mdp5/dpu and mdss devices
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
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/08/2022 00:31, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-08-05 04:56:30)
>> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
>> index 7b504617833a..d02cd29ce829 100644
>> --- a/drivers/gpu/drm/msm/msm_io_utils.c
>> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
>> @@ -124,3 +126,23 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
>>          work->worker = worker;
>>          kthread_init_work(&work->work, fn);
>>   }
>> +
>> +struct icc_path *msm_icc_get(struct device *dev, const char *name)
>> +{
>> +       struct device *mdss_dev = dev->parent;
>> +       struct icc_path *path;
>> +
>> +       path = of_icc_get(dev, name);
>> +       if (path)
>> +               return path;
>> +
>> +       /*
>> +        * If there are no interconnects attached to the corresponding device
>> +        * node, of_icc_get() will return NULL.
>> +        *
>> +        * If the MDP5/DPU device node doesn't have interconnects, lookup the
>> +        * path in the parent (MDSS) device.
>> +        */
>> +       return of_icc_get(mdss_dev, name);
> 
> Perhaps this would be better served by having another icc_get() API that
> looks in the device and also the parent? Or maybe there should be
> interconnect-ranges (similar to clock-ranges) so that interconnects can
> be mapped to child nodes in DT.

I was not sure how common this situation is, so I did not add the 
helper/API. Typically the driver knows exactly, which node has the 
interconnects. In our case this is complicated because we are 
effectively merging two different driver generations and two different 
bindings. Thus I suppose this situation is quite unique.


-- 
With best wishes
Dmitry


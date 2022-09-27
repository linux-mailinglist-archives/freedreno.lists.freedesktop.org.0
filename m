Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9FD5EBDF7
	for <lists+freedreno@lfdr.de>; Tue, 27 Sep 2022 11:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E7710E1B8;
	Tue, 27 Sep 2022 09:03:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F9A10E1B4
 for <freedreno@lists.freedesktop.org>; Tue, 27 Sep 2022 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664269373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xy/vZrVEyKAC936wld9SdePzf0CNuc4X8kChnAdBCQk=;
 b=byO95JaO0ItwGw3P2tPcAvNam3Qe9/Xl7H2P9TK1BG/DGdlHezoIgWZ/hh7hHdg/2XKz81
 3MZg3EO8hsCshJRGMHzbd+wmxhim2KvK1dW3D6aTGVPQsbXvBsPHlkxsaypo1441LOG8Ds
 Th9OuF6h9wnOZN7EZ9TdAXguj3lUsJ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-8CSJmnc9N6SU3101KZ_b8A-1; Tue, 27 Sep 2022 05:02:52 -0400
X-MC-Unique: 8CSJmnc9N6SU3101KZ_b8A-1
Received: by mail-wr1-f71.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso1937310wra.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Sep 2022 02:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xy/vZrVEyKAC936wld9SdePzf0CNuc4X8kChnAdBCQk=;
 b=eyEuSscsiGpGR5QUiK+/wLxfKPM+4zxJZkR2Tn/LOcY+dwwppEqQORK3+0BQEV6VRN
 rnp9XZ00YdVNu2Mc1egJB1aqBm7ckjQ7jl3E0yUAFcrc6Z6NNbIlm0aZQQDAtmLaoDng
 Ba0sjIU3Ptz0jozNk7a8aE1NA5Yhc3jAKj79zNBeRlwwO+Z3Yj5s2i3rX7moAufSvKH/
 yWxLxzfd+zO4BOiWXGIRuWC+lrZIlXneDxxQjnWF6PcfCusAQxHLT9b4Ia4YoNuNDK6t
 0UguILKThpupvccdZMM+VkDgHJEprMOQ01pUWkOfay3S3jGZv1apdbCup4eoxbCkpyDJ
 F2Ag==
X-Gm-Message-State: ACrzQf3JiIp8rsMQzz7aVLnlnZFaCuT3BuRML0apBNSJnMiVI8i4DYX7
 1Oc8dOwsSbgti0c6Dn2MZzyXbVGOujeIEF4JmydWQTcKKMkKMobNtKPwnW8BzMM9BFKg5joLBJ8
 uu6MPLtZP7He4HfC+sCiMoZkyEKvP
X-Received: by 2002:adf:dd8f:0:b0:22a:84ab:4be3 with SMTP id
 x15-20020adfdd8f000000b0022a84ab4be3mr15951098wrl.40.1664269371780; 
 Tue, 27 Sep 2022 02:02:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6QQ+AHuQOmKI/6F1QjWVeqDfj9EhoRpgYUwRQU9fWumUC0o5Tf3aS3su5R3i29q/HGgpvQ8w==
X-Received: by 2002:adf:dd8f:0:b0:22a:84ab:4be3 with SMTP id
 x15-20020adfdd8f000000b0022a84ab4be3mr15951066wrl.40.1664269371478; 
 Tue, 27 Sep 2022 02:02:51 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c284200b003b2878b9e0dsm1116996wmb.20.2022.09.27.02.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 02:02:50 -0700 (PDT)
Message-ID: <2a3b6824-7a76-308c-c7a7-cc7c6001dfcb@redhat.com>
Date: Tue, 27 Sep 2022 11:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Vinod Polimera <vpolimer@qti.qualcomm.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
 <29ae886c-b2b2-2387-87cb-e4a885080418@linaro.org>
 <f70f9f1b-c835-7baf-974d-87f2bf6e4e53@linaro.org>
 <BN0PR02MB8173E3E88164E52AEF5AB1A1E4559@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <BN0PR02MB8173E3E88164E52AEF5AB1A1E4559@BN0PR02MB8173.namprd02.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v2] drm/msm: add null checks for drm device to
 avoid crash during probe defer
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
Cc: "vpolimer@quicinc.com" <vpolimer@quicinc.com>,
 Abhinav Kumar <abhinavk@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "kalyant@quicinc.com" <kalyant@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello Vinod and Dmitry,

On 9/27/22 09:31, Vinod Polimera wrote:
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Friday, August 26, 2022 2:11 PM
>> To: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
>> dianders@chromium.org; vpolimer@quicinc.com; swboyd@chromium.org;
>> kalyant@quicinc.com
>> Subject: Re: [v2] drm/msm: add null checks for drm device to avoid crash
>> during probe defer
>>

[...]

>> Vinod, do we still want to pursue this fix? If so, could you please
>> update it according to the comment.
>>

I don't think this patch is needed anymore, since AFAICT the issue has
been fixed by commit 0a58d2ae572a ("drm/msm: Make .remove and .shutdown
HW shutdown consistent") which is already in the drm/drm-next branch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39C645D581
	for <lists+freedreno@lfdr.de>; Thu, 25 Nov 2021 08:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5214B6E5C0;
	Thu, 25 Nov 2021 07:32:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5186E5C0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 07:32:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b1so13898744lfs.13
 for <freedreno@lists.freedesktop.org>; Wed, 24 Nov 2021 23:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tY0dI4JKSMqLqN8bCT5xhyliQM9cl3Za+ENI5kRKGSo=;
 b=MStlbuYF8XwOtaZm2IZDizPpaqNzw/O0bk5WXfDpOkji9Fo+7tKIwAdHX1Q1q2Ddn6
 4wKOsAgl/kwiIf6TDdRbFcKFBoIko4gHB3sEpXZ2h92dsV+AehEE78QfLPfoS6325J4K
 4jEuVVTdsl0tZBaPYqCYSH+/mBWzSLxkhq+23G/7my8i6fiU6Bd7jvvkVtjIewIznFz0
 mluf8oJk+qvs0tnccQ15XopVMiFaCIaD5sqpwAHFci8jxVfmJXboeQKJzKYUZ9mjiS4s
 CyKtnFdE784toKoJ2yas/U8sqRsgQdvq8uc6YlKb5oST5hgnqwSUPiw7BuP4UUogoFNU
 lSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tY0dI4JKSMqLqN8bCT5xhyliQM9cl3Za+ENI5kRKGSo=;
 b=rAht3sYWk9S9gygZ73xRCgWMccYxweL2C9T+WN/20bXfz/DelMjWftIqNnSlFqCDDx
 0JCkF58aOh0pa0cTJkJMOYcqHTa38bggigoZet8hkdpmWcKUL/aFPQ4SbP3n6S6iMu/c
 Sa105E1NCSlukxbRiDu3Zy53m31RBJ8cg0s+X/55Dp7othezWF01rUC3THXfo9Xnup+4
 fj8Co7gV/TkAtrLJABLewdPuQajmMii+NMqukPppFh/kycPcF5EqqHguakPkeSw+yW1j
 digZPjZ1K3pEVOOWYu1qlVFp39Um5lATwEUmzhFEJ/oNteO+3zs+j7Ql3ehF+G9XvTEk
 sEcA==
X-Gm-Message-State: AOAM533btdJPetgFiAV4ZsXbkXJFKPV9P7IuWl4vrUkyoYFPwiWxiBWn
 9voOa7CRO3LhaUHh0I8fWeShHw==
X-Google-Smtp-Source: ABdhPJwXQ9uRH7aqsvlifGN5TFtW5mUpNOGPU6NkYy5ht0oPrCfiw1c4pfU6DkFusieGl3fIGNkrHw==
X-Received: by 2002:a05:6512:1316:: with SMTP id
 x22mr1314120lfu.639.1637825541825; 
 Wed, 24 Nov 2021 23:32:21 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m14sm179162ljg.2.2021.11.24.23.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 23:32:21 -0800 (PST)
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 robdclark@gmail.com, sean@poorly.run
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
 <1619048258-8717-5-git-send-email-khsieh@codeaurora.org>
 <CAE-0n519sFBeLsNF8=Ci1y_xfY4dRuPRNHnJ++ZXHgj6Z6LhQA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ff384e41-cc86-8028-fc81-b0b41140dcd2@linaro.org>
Date: Thu, 25 Nov 2021 10:32:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n519sFBeLsNF8=Ci1y_xfY4dRuPRNHnJ++ZXHgj6Z6LhQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 4/4] drm/msm/dp:
 dp_link_parse_sink_count() return immediately if aux read failed
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/05/2021 07:35, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-04-21 16:37:38)
>> Add checking aux read/write status at both dp_link_parse_sink_count()
>> and dp_link_parse_sink_status_filed() to avoid long timeout delay if
> 
> s/filed/field/
> 
>> dp aux read/write failed at timeout due to cable unplugged.
>>
>> Changes in V4:
>> -- split this patch as stand alone patch
>>
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Can this patch come before the one previously? And then some fixes tag
> be added? Otherwise looks good to me.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>

Is this something that we still need to pursue/merge?

There were changes requested for this and for the previous patch, but no 
new versions were posted.


-- 
With best wishes
Dmitry

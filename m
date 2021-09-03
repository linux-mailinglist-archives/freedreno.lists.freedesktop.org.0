Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABEC4004E0
	for <lists+freedreno@lfdr.de>; Fri,  3 Sep 2021 20:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A016E8C1;
	Fri,  3 Sep 2021 18:31:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F716E8C2
 for <freedreno@lists.freedesktop.org>; Fri,  3 Sep 2021 18:31:14 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q21so217158ljj.6
 for <freedreno@lists.freedesktop.org>; Fri, 03 Sep 2021 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kUpYrB6LA+X1EG7mZxbWQs5iImpyPUWVUxzm2ewn4VY=;
 b=z4ccfB5hb3hkvqLtFWhuflOfpiz8mo7jpdJ2jFD2SuzoME2QUD1YOlmAIMeZweGFnc
 GmqGEsWb4I06ZwK3Ecmc/L3QI3kD8jpbkXl/P+E/eDtu/fqcHSKnNd0KtIsiJyGLtkfu
 qzD9re9bSd2DVPTLnNxILBYeRMZ1wLTQFFJOzM3QED5PQCwhg9ua4MU397g/N70Dc+rZ
 RuusNtBT79ZAj8T09p1lGHunudIt+2pz9qY+W38ERNLWL7N59esF4sFq1dKpzZS8OuFg
 fnQh9VOzd5Ngodp36ogRU7wCMqjS5Q4T+snPD8MQK7YudtiXf0Cy7m5muLG5l9gojPEA
 YxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kUpYrB6LA+X1EG7mZxbWQs5iImpyPUWVUxzm2ewn4VY=;
 b=pwGr/lCYH/GW+zsk10Z3GGv9uAKiWPXd+75HpeDUFoy9l0MMzjnYhsKVKbcZCOyF3y
 eeKgwuH1mLIqlEV+zR2JyYV8QO4YwR6yIV8Pf7h5fvdxfTasySXts8VKpqorwOt+LjxP
 HEzO3gc7agzhmtHutvv5bu5iJiTUwAI59zXdBJeHlOYfN38Ow9iI2J8B3TglbiR0Z/02
 qzE7bWv2+6dllibCi57gyBJCfMGhEyZXb1PncON/bZnemF0qe6WDfBCqhxjEqR+TifWM
 TrmDdhPr7Y6nm3rPOgfJr5OPYEuLqP41DVPZ6y8GrceUKkaASSzp9MeletF91QkPn0i9
 llYw==
X-Gm-Message-State: AOAM530R8wTM1DL1LnZx399dJiq+qXzB9rb+iueAAPpq2/79mG7YQJmA
 ZTL46JIt7nrMk2XK5g0BvnyfyQ==
X-Google-Smtp-Source: ABdhPJzKLREu9lV2YGYPyO/peIQHRIZ9atO6bBDf5sKEpxHDJlUgqDVXsncsW/ACQqpKoCT/1TE8gg==
X-Received: by 2002:a2e:a903:: with SMTP id j3mr256630ljq.347.1630693872515;
 Fri, 03 Sep 2021 11:31:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h13sm18825lfv.62.2021.09.03.11.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:31:12 -0700 (PDT)
To: Lyude Paul <lyude@redhat.com>, cgel.zte@gmail.com, robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com,
 laurent.pinchart@ideasonboard.com, chi.minghao@zte.com.cn,
 treding@nvidia.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
 <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <52a6c92d-fe59-cdb8-23de-6fcda6ca2c68@linaro.org>
Date: Fri, 3 Sep 2021 21:31:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm: remove unneeded variable
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

On 02/09/2021 21:40, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Do you need me to push this?

We'd pick this up through the msm tree.

> 
> On Tue, 2021-08-31 at 04:51 -0700, cgel.zte@gmail.com wrote:
>> From: Chi Minghao <chi.minghao@zte.com.cn>
>>
>> Fix the following coccicheck REVIEW:
>> ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
>> ---
>>   drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c
>> b/drivers/gpu/drm/msm/edp/edp_ctrl.c
>> index 4fb397ee7c84..3610e26e62fa 100644
>> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
>> @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl
>> *ctrl)
>>   int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>>                  struct drm_connector *connector, struct edid **edid)
>>   {
>> -       int ret = 0;
>> -
>>          mutex_lock(&ctrl->dev_mutex);
>>   
>>          if (ctrl->edid) {
>> @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>>          }
>>   unlock_ret:
>>          mutex_unlock(&ctrl->dev_mutex);
>> -       return ret;
>> +       return 0;
>>   }
>>   
>>   int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,
> 


-- 
With best wishes
Dmitry

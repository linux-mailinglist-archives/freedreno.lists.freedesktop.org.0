Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52364966B4
	for <lists+freedreno@lfdr.de>; Fri, 21 Jan 2022 22:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4DE10E612;
	Fri, 21 Jan 2022 21:01:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFE410E4D5
 for <freedreno@lists.freedesktop.org>; Fri, 21 Jan 2022 21:01:05 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id n23so1913321ljg.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Jan 2022 13:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/cvB4LBHX1iUJJ6pMjFmq8Rc+tQVwfrFHdlbMQKEsso=;
 b=BWC2Q+BfElXXHALjANaUBA//Ajbzl30dpQ/P9nJzurdRxwYJDtnXUcy/4Zqt0JKpZB
 LSKZQxlHftfN3y5zO5ybxEocTATbsQIcvzfAppBkDv/6nawtw+ekNLST++AX8f5ZxeN8
 lao9IqEHcGcDGVFNWaVB9pnSyBOgKgu2ed0zggce8tWwy7xEROaNjH01CcP7b9ZSybZT
 UkYHp9llW0in9CziOj8jEOXl4cgTxRADvGEAQ+8eFAXed9iSZn2EC1UYO/T1OtZDqNV9
 dKPMXZjcmUupPAp2igICm3uOEMSaazB38nhU6o6k/Z3Jrqfm+oNCo9f673TpO850J+gY
 NXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/cvB4LBHX1iUJJ6pMjFmq8Rc+tQVwfrFHdlbMQKEsso=;
 b=BiwqgLhGVE7FHmUsAqkTKRFJBcAd3T6ltHPYZ2lygEbC3kf+MUj+Ls7Su8sZGSVbDy
 UP2gwEPBIU+qL4Y5Uk7D84NJUTa+ki6aMItoji03k0wmYNEVdTX06QRFpBVCTtXTFCFX
 PUnZ2VEI6gAgl1lssegwzXlmexRwRyDudS8/+HulE7wPftrP1D9zgX2AVK6umPA0qt2A
 ATzl1EjqJTe1kcUXeRcKWahiEyzZuYSb0kLJO9hCVXknQZIbdQoQ4Yp2LuIykWjT1t9q
 c4G6VT8YfSVc71FID1oedEuanE/Bm4VXBBUcIFfsgeB0TXWUzSDC0WAI7qoF+h9wg2+H
 4Puw==
X-Gm-Message-State: AOAM532ldb1bgyPXXExyFPk4RVEECwSrL7PEVN6b7J2oTOpyosd7RjJo
 NlgzDhJcvorN11zpVJuIQ7Cr2A==
X-Google-Smtp-Source: ABdhPJzefh4KvJdPjvl6eIx/C+c9ZTyTfgIk/ah3mCBoW0ccOQof0uRnH+MWsi0s4hff7v8bVPiz2A==
X-Received: by 2002:a2e:95cf:: with SMTP id y15mr4365824ljh.132.1642798863862; 
 Fri, 21 Jan 2022 13:01:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m17sm364405lfc.130.2022.01.21.13.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 13:01:03 -0800 (PST)
Message-ID: <a6e5fb27-8a0f-44bf-c4d3-0619d8fc834f@linaro.org>
Date: Sat, 22 Jan 2022 00:01:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
 <CAE-0n505KAiLvza2WTRfk8w9qcAH-Z2W6kLMtrOxTNRbUnSJig@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n505KAiLvza2WTRfk8w9qcAH-Z2W6kLMtrOxTNRbUnSJig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 5/5] drm/msm/dpu: move VBIF blocks
 handling to dpu_rm
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/01/2022 04:27, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-05 15:10:31)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index bf4d72356a12..2301ac114920 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -78,6 +78,10 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>                  if (rm->hw_intf[i])
>>                          dpu_hw_intf_destroy(rm->hw_intf[i]);
>>          }
>> +       for (i = 0; i < ARRAY_SIZE(rm->hw_vbif); i++) {
>> +               if (rm->hw_vbif[i])
>> +                       dpu_hw_vbif_destroy(rm->hw_vbif[i]);
> 
> Maybe drop this check and pass NULL to dpu_hw_vbif_destroy() sometimes?
> Then the check can be omitted and the braces dropped

Nice idea. This also applies to dpu_hw_intf_destroy, so I'm going to 
apply it to the previous patch.

> 
>> +       }
>>
>>          return 0;
>>   }
>> @@ -212,6 +216,23 @@ int dpu_rm_init(struct dpu_rm *rm,
>>                  rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>>          }
>>
>> +       for (i = 0; i < cat->vbif_count; i++) {
>> +               struct dpu_hw_vbif *hw;
>> +               const struct dpu_vbif_cfg *vbif = &cat->vbif[i];
>> +
>> +               if (vbif->id < VBIF_0 || vbif->id >= VBIF_MAX) {
>> +                       DPU_ERROR("skip vbif %d with invalid id\n", vbif->id);
>> +                       continue;
>> +               }
>> +               hw = dpu_hw_vbif_init(vbif->id, mmio, cat);
>> +               if (IS_ERR_OR_NULL(hw)) {
>> +                       rc = PTR_ERR(hw);
>> +                       DPU_ERROR("failed vbif object creation: err %d\n", rc);
>> +                       goto fail;
> 
> If it's NULL then rc will be 0 and fail will return 0. Is that
> intentional?

Actually no. And init functions can not return NULL. So let's fix it too.

> 
>> +               }
>> +               rm->hw_vbif[vbif->id - VBIF_0] = hw;
>> +       }
>> +
>>          return 0;
>>
>>   fail:


-- 
With best wishes
Dmitry

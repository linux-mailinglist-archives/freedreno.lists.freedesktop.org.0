Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173115690D4
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 19:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B7D113D78;
	Wed,  6 Jul 2022 17:41:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAF1113D00
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 17:41:07 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id bx13so19363633ljb.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6KthULA5VbxGyqiiOjKStZJbvnL5Ouw6A4+pSTV6Kj8=;
 b=JXpykR9CyoD738BQHWkUG0ypVyu3dd6Wuio2ZR72pj4RAsz4ciU/RABGkmzmDgdlB4
 Y4+EthXDwKUEbv4/QS/by9K1yMizKbQaKZWLKlNrCZ0XZqehFGmqZhJ0ffUsy6ThGHpn
 dXa+hET8TxYmeswjFN+YyEi8iR6gOyvuXVTdt11Ke5epMBmqV9ZJTxSam3rRl7wzqvB1
 4DBrBRbZYxaZNMRpansfPh8og2KF27ng1wSdCxYgWx+/fTVd/j0s6BsFHpwmCd5k9Jma
 gTMqqVsdt/l5PxWeMy/mu8EufPYofY9tudEvR7b7nJaQqU7s3VJPSj6uufQ7XE7qU7X2
 AtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6KthULA5VbxGyqiiOjKStZJbvnL5Ouw6A4+pSTV6Kj8=;
 b=i35l1Ml7tvEJZg1KwO3MjZ3VPwRWJ4GA+J9BPlxkCKG5v2K6+9dRQ/MFKVazQnUP9a
 STnBLhg2MEcClYqObNsn1QKG0SoKwkTSae8oLyuAYUKLcLaevnpnpNjVZmR+brR7MFSW
 Q0AqlTUH+dGMiQH0k7A19FM3KOxYRB6OGqoZqwKcOZMZoRBhLNSR9YCXwrMeXyT9ymtX
 HZx7IcNHABjIQ6e1HUlLf9pxZc+g77HzWJ1YR51EUa6q/SEu/1mUyK/3O4LZiHxcKwzg
 B/AYaQE9V8Kk6o3WEU5oszWLIeMsh1a29DO5qVzE+AGd6sEu3PdWEDieBmc1EfAjng4E
 e8pQ==
X-Gm-Message-State: AJIora+H8S5HJC7lq29ekzbQN/XYR/SI8z5e5Ud5h6z5XEJfGRBNpsqv
 Vad49c9uD6QVOne3iaNADSpZ5A==
X-Google-Smtp-Source: AGRyM1tQBRHMvjV5LEJGwXYsY62d5osg8L+wM4g39+h6nowDWQdwsVn7zlcHYU8r78KNNQmktRwT3w==
X-Received: by 2002:a2e:b88f:0:b0:25d:4cc0:f03c with SMTP id
 r15-20020a2eb88f000000b0025d4cc0f03cmr50610ljp.173.1657129265687; 
 Wed, 06 Jul 2022 10:41:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 o13-20020ac25e2d000000b0047f660822e0sm6363586lfg.289.2022.07.06.10.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 10:41:05 -0700 (PDT)
Message-ID: <b85a7423-44ec-1f58-7465-e5322bc32cd3@linaro.org>
Date: Wed, 6 Jul 2022 20:41:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1657128246-15929-1-git-send-email-quic_khsieh@quicinc.com>
 <86ee9636-8827-7bad-6bd9-22191b2d293c@linaro.org>
 <949ae061-8191-2497-af56-1df74432272d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <949ae061-8191-2497-af56-1df74432272d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: make eDP panel as the first
 connected connector
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/07/2022 20:38, Kuogee Hsieh wrote:
> 
> On 7/6/2022 10:25 AM, Dmitry Baryshkov wrote:
>> On 06/07/2022 20:24, Kuogee Hsieh wrote:
>>> Some userspace presumes that the first connected connector is the main
>>> display, where it's supposed to display e.g. the login screen. For
>>> laptops, this should be the main panel.
>>>
>>> This patch call drm_helper_move_panel_connectors_to_head() after
>>> drm_bridge_connector_init() to make sure eDP stay at head of
>>> connected connector list. This fixes unexpected corruption happen
>>> at eDP panel if eDP is not placed at head of connected connector
>>> list.
>>>
>>> Changes in v2:
>>> -- move drm_helper_move_panel_connectors_to_head() to
>>>         dpu_kms_drm_obj_init()
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 2b9d931..50ff666 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -763,6 +763,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms 
>>> *dpu_kms)
>>>       if (ret)
>>>           return ret;
>>>   +    drm_helper_move_panel_connectors_to_head(dev);
>>
>> This should be in msm_drv.c unless you have a strong reason to have it 
>> here.
> Can you please  provide more info why should be in msm_drv.c?

Let me quote my message from v1 review:

Please move this call to the msm_drm_init(). Calling this function 
somewhere after the ->kms_init() would make sure that all panel 
connectors are close to the top of the list, whichever MDP/DPU driver is 
used and whichever actual interface is bound to this panel.

>> _dpu_kms_drm_obj_init() create and initialize drm obj one by one and 
>> _dpu_kms_setup_displays() had created system wide connectors/interfaces .
> 
> After that should be fine to move edp to head of connector list.
> 
>>> +
>>>       num_encoders = 0;
>>>       drm_for_each_encoder(encoder, dev)
>>>           num_encoders++;
>>
>>


-- 
With best wishes
Dmitry

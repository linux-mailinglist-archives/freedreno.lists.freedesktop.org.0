Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAB4F5A89
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 12:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FC010E3B3;
	Wed,  6 Apr 2022 10:21:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51D610E484
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 10:21:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id g24so2542457lja.7
 for <freedreno@lists.freedesktop.org>; Wed, 06 Apr 2022 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B/LFUaH37fez2xnO8shaeHlHGb1eBKrePW5AMB1fuBU=;
 b=HZRmg+oFaKzh13ePiVJ2jL+VhhSCQeJquk6GeA45/fiBXAObbaNX2KS1j531FkqX5e
 mO9KUS8+lE/Sou4qxv4+PGxsYJA/+eXn3pU82N1b2s0HYhsBKIInsjbzvS4kNmTRHVP/
 8MXOmxghfiQJs0W2lZSEzOmPt03CEB8JhvB/7s8OHZT0VMqQIPCZv2iSMHyC4fz0ibnp
 fDPD1ia2uKc8a/5GrKMNtANsFcVmSoy/FTR2zCvZXr+lYfUBIo2Nw2i9gItxSjHNsEzG
 NoHx7/RYrJu1Cx7GqBVrIS2kK+JOzxSFseDsFJH23E2bnz4XpX6hx55lNVMnx9ZvcpQ2
 X3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B/LFUaH37fez2xnO8shaeHlHGb1eBKrePW5AMB1fuBU=;
 b=aHqdVjUDu6bWAU8fuX+nm135TRlPWU6Ut1QkxtRcUAqr25Zj1XGUeQy1DAb51Y6Nq9
 pKvGgcuGZno2nSLLUH50Hs70MGv91rX/2AZ0ghKDm14wWuGwpQd6XtD7Agi72vIQVH4J
 L0vcixMlfWfGBz5u+XqgD5JIJHNhxSMuQzsb0ApcUR45HVzFKxVo/5d2ppoAJtldajN4
 d6sL+E9o3jpk3oKosciLQYHpgEDjwh/CXPr77j/KsAucd8D6bwwAVhiF0+eokIr+ej9R
 wp+JJYS2Qoy7PnjtcnJ2wqOxnCTsrqOWVU9jONeBAaMYwg6E81WWpfoftulU+6sR3JQk
 11/A==
X-Gm-Message-State: AOAM530qgUQK6mxhiTTXPmzUwjBsjUim3A+ZHIdpk1WF8o1iCp/F1jPj
 6kW7AcqJI3Q9wxzkt4SU5eB4IA==
X-Google-Smtp-Source: ABdhPJxEcPqbRlLXG9Emf75XhqIrgC6H9t5gxSc1IyyZ+fpn0J1JnqTm0S5jbkIsSecuFNgF63V9fQ==
X-Received: by 2002:a05:651c:b13:b0:24a:ce13:ce60 with SMTP id
 b19-20020a05651c0b1300b0024ace13ce60mr4781798ljr.439.1649240487134; 
 Wed, 06 Apr 2022 03:21:27 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bq5-20020a056512150500b004433c791651sm1785368lfb.69.2022.04.06.03.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 03:21:26 -0700 (PDT)
Message-ID: <9868aa33-c423-5338-6205-ec61c18c67c1@linaro.org>
Date: Wed, 6 Apr 2022 13:21:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
 <20220405234551.359453-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53p7MsvwzqzzyHdRzX2XV9_Lv7poTuZMQowha0=f=QZSA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53p7MsvwzqzzyHdRzX2XV9_Lv7poTuZMQowha0=f=QZSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm/hdmi: properly add and remove
 created bridges
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

On 06/04/2022 05:51, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-04-05 16:45:48)
>> Add calls to drm_bridge_add()/drm_bridge_remove() for the internal HDMI
>> bridges. This fixes the following warning.
>>
>> [    2.195003] ------------[ cut here ]------------
> 
> Usually this line is left out
> 
>> [    2.195044] WARNING: CPU: 0 PID: 1 at kernel/locking/mutex.c:579 __mutex_lock+0x840/0x9f4
> 
> And the timestamp is removed

Ack for both notes, will fix in v2

> 
>> [    2.198774] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>> [    2.198786] Modules linked in:
>> [    2.211868] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-00002-g3054695a0d27-dirty #55
>> [    2.214671] Hardware name: Generic DT based system
>> [    2.223265]  unwind_backtrace from show_stack+0x10/0x14
>> [    2.228036]  show_stack from dump_stack_lvl+0x58/0x70
>> [    2.233159]  dump_stack_lvl from __warn+0xc8/0x1e8
>> [    2.238367]  __warn from warn_slowpath_fmt+0x78/0xa8
>> [    2.243054]  warn_slowpath_fmt from __mutex_lock+0x840/0x9f4
>> [    2.248174]  __mutex_lock from mutex_lock_nested+0x1c/0x24
>> [    2.253818]  mutex_lock_nested from drm_bridge_hpd_enable+0x2c/0x84
>> [    2.259116]  drm_bridge_hpd_enable from msm_hdmi_modeset_init+0xc0/0x21c
>> [    2.265279]  msm_hdmi_modeset_init from mdp4_kms_init+0x53c/0x90c
>> [    2.272223]  mdp4_kms_init from msm_drm_bind+0x514/0x698
>> [    2.278212]  msm_drm_bind from try_to_bring_up_aggregate_device+0x160/0x1bc
> 
> I'd probably cut it off here.

ack

> 
> Is there any Fixes tag for this? Still seems worthwhile to have one even
> if this is a lockdep warning.
I thought about this before sending v1, but ended up not doing so. Each 
of these changes is not atomic. A call to drm_bridge_add() without final 
drm_bridge_remove() in the core msm code would leave dangling pointers 
in the drm core. A drm_bridge_remove() is not sensible without 
converting _all_ users.

So there are two alternatives:
- leave this patch series as is w/o a Fixes tag
- squash four patches into a single patch and add 'Fixes: a3376e3ec81c 
("drm/msm: convert to drm_bridge")' tag

What would you prefer?

-- 
With best wishes
Dmitry

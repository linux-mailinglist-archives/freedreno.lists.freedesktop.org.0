Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF2524212
	for <lists+freedreno@lfdr.de>; Thu, 12 May 2022 03:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F98710EC64;
	Thu, 12 May 2022 01:30:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8048E10EC64
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 01:30:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bq30so6506939lfb.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 18:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZpnNREMqXrGizQWJD1QlgIKnhRMzjLbf/0mlxcPUNoY=;
 b=ubJMdDXJ5EZ1iKA+Zi4FaQCbOMhqLtGXLqQNQDYlQykXje9JVXVG1TBe8VOiIz+9UG
 ZLl0/Tg9qZmpr2wfWAXllTDJSX/IrR9tmSkA50GJyI1USWumZWgE9Ysu53HFKZZgeOk4
 NFOjCTmF1wFU+/A0IhLZ+ghRW406T7EoHfETAHMV7PZCZIUUwMyCo/TzAha44ot+FFgZ
 ZM1ZJKUE+AROwB5f2vOoscHXLR/B9SvSqOaa9g8RivX2NlZci7fWo+xWn/5UBHhY0yUo
 S5TvpnkJPNQmQenT96T0EJz4M18jwjsTHgtyfaC+F3al7hmyjNMOrgzxf54Wo5RKMdlr
 zUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZpnNREMqXrGizQWJD1QlgIKnhRMzjLbf/0mlxcPUNoY=;
 b=MYcOmYRljeO7QjQSfLTNVSbjjqhmgFhBtc876mW7h0trkowq/3J6yQx5QgzGskwExG
 FNjxFGHj81xg6VhRSmrp+bKHhkKgiMu2mGc7KmhLXUzKDOCY9/RhlLKcchmRWv76OmP9
 +oFikDo//iCJ3t7xNvdpML3Qsi7DlEm4ifIlPiXiJI4qYiUvE1kP/HaCf8PFe7BJ0dft
 ZATHU2oKuZV8vzWjvsemcYg/NzM++RrhnXztBbHZL6xEBgmy/vDBXhwH96sEOIq/IAju
 6elssXQz4McIyVuiiCHMR+A03Dz0B82fvj0l3kA+Hp3WhbQjF4DsjJPmzv578CqjijyR
 mcWQ==
X-Gm-Message-State: AOAM533RhXwNyHAXCZsC2ww3zPwe0aMk2qfS239oKcWeNnE0fCSGQJKx
 x2LZ0EO5Jy0dk1D5roC9r3j1dw==
X-Google-Smtp-Source: ABdhPJxz17HVXDGHrRDxjhowtM7J2TMXaJUPSrh389/cSdrGgYk75oaZeDPixbSwCmszFF1acZCX+w==
X-Received: by 2002:a05:6512:3f8c:b0:45d:cb2a:8779 with SMTP id
 x12-20020a0565123f8c00b0045dcb2a8779mr23112877lfa.499.1652319056668; 
 Wed, 11 May 2022 18:30:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 1-20020ac25681000000b0047255d2110asm535897lfr.57.2022.05.11.18.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 18:30:56 -0700 (PDT)
Message-ID: <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
Date: Thu, 12 May 2022 04:30:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
 <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
 <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: don't free the IRQ if it was
 not requested
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/05/2022 04:29, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
>> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
>>>
>>> Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
>>>
>>> Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
>>> clearing hw interrupts if hw_intr is null during drm uninit")? I mean
>>> that with this patch applied kms->irq_requested makes the check in
>>> dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
>>
>> Yes.
>>
> 
> I didn't see it deleted in the second patch so is a revert going to be
> sent?

No need to. They are separate checks. The older one is superseded (as it 
will be never hit),  but it is still valid and useful (to protect from 
the crash if this code changes again).


-- 
With best wishes
Dmitry

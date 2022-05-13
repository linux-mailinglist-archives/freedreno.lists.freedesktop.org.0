Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E3526170
	for <lists+freedreno@lfdr.de>; Fri, 13 May 2022 13:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35E810EDA6;
	Fri, 13 May 2022 11:55:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB0710EDC1
 for <freedreno@lists.freedesktop.org>; Fri, 13 May 2022 11:55:36 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b32so10017567ljf.1
 for <freedreno@lists.freedesktop.org>; Fri, 13 May 2022 04:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BWXjdtjDXNb6ni/GTLm4b+m6ctcJfNLEzZiRu6oBfwM=;
 b=aqKuiX154is7FJUpi1R8IdvDaiFB++QSQOS2uocvXsO4hWXuYurrmUCNjxy9IJ5gt2
 VUWWj78Czlnfq9WVsGIm2gMu0s5vTzLeGHyssh/j3aWt/puHX5rCaU2dNyhQa6PfeULI
 2MKJ2o/vCtem0eyof+MXzrdDHk5Uj+HASc7geNabhwZIF9JxXsL/rderzp4Zhq8H3/90
 28Oo+VNrFEJcgrPF74O3UdXSewE5M0juY7xYf9DHO4yOftNzl0VyWDFE7fKw1GrVEPbO
 7SsmaoWZZAQkdXPaxVzvqaQYd1OZRPgfLUZW1foLe2pvAPCkoqRDMjf77OHGRpzKOZiP
 DivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BWXjdtjDXNb6ni/GTLm4b+m6ctcJfNLEzZiRu6oBfwM=;
 b=Cw96eokfvW/R3me8ZZBZ+U9hBs/1VOwOAJvVE99N5fLQRj+Ao74DOrBlDMQQWs2/n3
 RV65YGJLaULmFAsKBPTSJE+K/McZmUT1IxjnkQkOiy5xOVbEsHwkfUAcPdus1UKvrGsE
 QaiWXJYFLOU7713IAhhQUUozgwOQvAKaA6xdq4/n69z6WM2I6/qtfQIN6xfauwHJ/QwI
 yuTz5AAutMs9+ED2kZHAQiFFdLsGxWRzyaG0pdnytlW3mDgkRYCnvNIbTgQ+Yh6b9EcO
 5qKrzbtDkJqztsyMJOBfs9KdBPbiyML3PAw6xjkj77eAdhoB86MpEvkPWYmg3aU8Adrf
 S35w==
X-Gm-Message-State: AOAM532F4y34x5lBlneFlTXxI9Pm7rCjly2xm3zPG/uJb246617Zfpxs
 uSaNyC3eVvIkIRP2NQU5yEV7djHYzK1cTw==
X-Google-Smtp-Source: ABdhPJyihsUNwQrrmSPPzo9FASu6qH3wwhsjygHdujD9u/4JkFplSQLT/gDF0qzTtCSPKA2xHJoeew==
X-Received: by 2002:a2e:91c7:0:b0:24f:1114:86fd with SMTP id
 u7-20020a2e91c7000000b0024f111486fdmr2873427ljg.147.1652442935109; 
 Fri, 13 May 2022 04:55:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d15-20020ac25ecf000000b0047255d210f7sm356326lfq.38.2022.05.13.04.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 04:55:34 -0700 (PDT)
Message-ID: <5c659924-0272-d262-86f1-543a0d01127f@linaro.org>
Date: Fri, 13 May 2022 14:55:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
 <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
 <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
 <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
 <CAE-0n51Bt6VKJb4RjFfNUJVpWu=3jZs7Ym++7oa+-uvMf=hfWA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51Bt6VKJb4RjFfNUJVpWu=3jZs7Ym++7oa+-uvMf=hfWA@mail.gmail.com>
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

On 12/05/2022 04:41, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-11 18:30:55)
>> On 12/05/2022 04:29, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
>>>> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
>>>>>
>>>>> Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
>>>>>
>>>>> Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
>>>>> clearing hw interrupts if hw_intr is null during drm uninit")? I mean
>>>>> that with this patch applied kms->irq_requested makes the check in
>>>>> dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
>>>>
>>>> Yes.
>>>>
>>>
>>> I didn't see it deleted in the second patch so is a revert going to be
>>> sent?
>>
>> No need to. They are separate checks. The older one is superseded (as it
>> will be never hit),  but it is still valid and useful (to protect from
>> the crash if this code changes again).
>>
> 
> Ew, gross. The extra conditionals everywhere really makes it hard to
> follow along.

With the second patch being dropped I'd prefer to leave both conditions 
in place.

-- 
With best wishes
Dmitry

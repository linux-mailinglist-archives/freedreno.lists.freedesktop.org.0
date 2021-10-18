Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B814443251E
	for <lists+freedreno@lfdr.de>; Mon, 18 Oct 2021 19:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572796EA22;
	Mon, 18 Oct 2021 17:33:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627626EA22
 for <freedreno@lists.freedesktop.org>; Mon, 18 Oct 2021 17:33:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r18so42794877wrg.6
 for <freedreno@lists.freedesktop.org>; Mon, 18 Oct 2021 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rC/hLNrxKboWrLVaDMklS7HEEU6bUXhMqtNh39WY+UE=;
 b=ah07nRlqopbTXRyZyr14fX2esaI6ry80CfTbZPLGsNidfYq3PUrTRosgXKm/11VEqL
 Sd2wYy+zZpVerDvvz3ns2S7Y318B/E2p5paJ8rKguqMMq4ABPimTJs50hePALFHQ/zDH
 kuGsxV2aX2ayWX1J3mz1XYsEWLOIakXk0j69IsfhV9PDLr9JNFM3Kcbt7qHJBHOhCMCg
 rgH5A8hBqi0Tzz41jxRjIYc+CcEdnG9DQHFgwQDY6n12Bk7mJSLZoJV/TzEifl/nnc+w
 wqyfLz93DBjiq/88MkRYrsISeFQEWh7t1ZLu6KuuU0tQDXERBeBKuEeROeDvuCb3ZTGu
 Eo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rC/hLNrxKboWrLVaDMklS7HEEU6bUXhMqtNh39WY+UE=;
 b=54xz+Nm2t+AOxDulQEtEB/X7h3JRcLvmmZN1NaF4j7pNYkTemHHUNdNwv5mN+1xqAB
 M/ytFQOsL+tyhOsgRt5HknTaFFWcPh27Zb7to7TqZVral+md+8jHCv0EnAREgU1bNQGe
 X3LSv4AZ8QGxH1yHh1ue2c46TFfExiwMS9wnL2GtNL+7Qib+1WWioQEwM+Z4k8EfgLWO
 NaI2BrfGbqCARkx758JdeAifYoQ273mSMaNxsi2YFLIAg/9ycOEBfLqLG6QDgBRCiP/q
 miXU8gOv88I+vEu44Dv/YiHD9PiuZIXgqOYF6X9hil5O2UyyHdo21tEbVBI+JLsSvXYD
 Ur6Q==
X-Gm-Message-State: AOAM533zZlotRTZ8DnhNMEZdketMbYc14+XhdEc2N0J0T5DQ9sMAMtJm
 vzytwcoNK6HqF1jyNQKVBez7HA==
X-Google-Smtp-Source: ABdhPJzTofO8JworMFPCFBKd0dnbRO1NBjt4FTsjxc0YxtMZ2929zmD3/Ot6adQDm2boDaCVAp/n8g==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr144182wrp.420.1634578419759;
 Mon, 18 Oct 2021 10:33:39 -0700 (PDT)
Received: from [192.168.0.30]
 (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
 by smtp.gmail.com with ESMTPSA id g25sm12989366wrc.88.2021.10.18.10.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 10:33:39 -0700 (PDT)
Message-ID: <5c460ee3-9079-02a7-e674-a4dde5815f0d@linaro.org>
Date: Mon, 18 Oct 2021 18:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: John Stultz <john.stultz@linaro.org>, Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Amit Pundir <amit.pundir@linaro.org>
References: <20211018153627.2787882-1-robdclark@gmail.com>
 <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/devfreq: Restrict idle clamping to
 a618 for now
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

Hi all,

On 18/10/2021 17:42, John Stultz wrote:
> On Mon, Oct 18, 2021 at 8:31 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Until we better understand the stability issues caused by frequent
>> frequency changes, lets limit them to a618.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>> Caleb/John, I think this should help as a workaround for the power
>> instability issues on a630.. could you give it a try?
> 
> While I hit it fairly often, I can't reliably reproduce the crash, but
> in limited testing this seems ok to me.
> I've not hit the crash so far, nor seen any other negative side
> effects over 5.14.
> 
> So for what that's worth:
> Tested-by: John Stultz <john.stultz@linaro.org>
> 
> Caleb has better luck tripping this issue right away, so they can
> hopefully provide a more assured response.
This prevents the crash on the OnePlus 6 as the frequency can no longer go to zero.

I would like to find a better solution that still allows proper idling on a630, but that can wait for 5.16.

Tested-by: Caleb Connolly <caleb.connolly@linaro.org>
> 
> thanks
> -john
> 

-- 
Kind Regards,
Caleb (they/them)

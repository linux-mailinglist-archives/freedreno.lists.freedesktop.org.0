Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB641F8FD
	for <lists+freedreno@lfdr.de>; Sat,  2 Oct 2021 03:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250976E817;
	Sat,  2 Oct 2021 01:10:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6796E804
 for <freedreno@lists.freedesktop.org>; Sat,  2 Oct 2021 01:10:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m3so44632360lfu.2
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 18:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gj65OPljQ6fFwZYl3s1r1tkDWhvg9hqbVVSglBp2uf4=;
 b=l+7gO+1GerK0JZX79Cxq/VqYck6HkfGZQN0rcwnH5uQ61efgpgG2uiYOzUOT5nDQmr
 kCQ6ObJuBRrcmQtxiKnNcCfgbmyK6d+Pq9DioTzR7O8YTIEWGRkxhNnYf4WpeFD/ygAl
 8ui+ZyO9NBw4PeB5U4M3z/iwX5fX8a3Eeqoa4Erdol5z/EP3nC35/KMnG66DW/lmiYyh
 qtxWrpPDeXFYHNxRM/uVQ8GtvEceqyAT8ulDjeq3HKN9a8us6W7B4dU1Z6RvgCAGCN7o
 WMHVxahb8n8xag58XztByAGpEw7q7UMxumFBvo6NLQXA986TgsIrgePWAXp4iOxPzTdn
 b1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gj65OPljQ6fFwZYl3s1r1tkDWhvg9hqbVVSglBp2uf4=;
 b=6gmCisVBcy3QfsMpDHggJU2VRDpp232nQFgI0FcZ0cRRcdM3d+hNFmtMkWqMzbDb0C
 5QBNOrT1BYuHHSLuHl+stSuMHEL10MiwsaCossQVMTxJLsQC6Lcu7G6aWUm6a4f+1HIP
 Tt0IpCIazc04h362yb9+IGVj6Y1v5QuaARiblXnVGwzU6i2npGG5+mhuCP+S4UvhAoCx
 SZCvlrbobkmkDmBQ3e+pSJ26yG0oSuyceqemCdxHq58pHPLFjlDnldAYBhibFPm/YJeo
 XFu2/XZIk5M/vc3N6qqx88cueIx+MnCT6DLpulk8ewz8NmKsEcHHp+ExmvgsyLu5bB7L
 c31Q==
X-Gm-Message-State: AOAM530/P3xSRYowgYGB3Stu1S6r7K1FlMFiCps2kD7qZWx1THlHJXeT
 IajChCW0iKx6iO5nV/uA5szp7Q==
X-Google-Smtp-Source: ABdhPJxkjTxATgYXwS6wSKUOe5zwT3bUYJkSuTjXbkiQI3kYjQ09MJ0sefoHy6efKYO6xEVwUg6uJQ==
X-Received: by 2002:a2e:8782:: with SMTP id n2mr1097803lji.177.1633137025114; 
 Fri, 01 Oct 2021 18:10:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u25sm893532lfr.279.2021.10.01.18.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 18:10:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: abhinavk@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Heidelberg <david@ixit.cz>
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
 <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
 <8c1e44cf44f917d38fa7133b869047b0@codeaurora.org>
 <7512b299-106f-2ffa-6d4f-46dc195abb84@linaro.org>
 <8060e6fd83d521ed14785ea66386337b@codeaurora.org>
 <CAA8EJpqvNJudg8-PActLEYf-BgmnJD3N7a4pMqb8VNf4hFiHdw@mail.gmail.com>
 <1ebb9efd461e9a84027ea63f7141a208@codeaurora.org>
 <45473d71-5986-7299-336a-ed498160fce4@linaro.org>
 <2a64ac4f1ef77d2e525486d411c9142b@codeaurora.org>
 <97b8dcb9-5828-ea55-139e-6d655834b3a8@linaro.org>
Message-ID: <8e9923c1-05b3-5a85-a91e-d9ebf194475a@linaro.org>
Date: Sat, 2 Oct 2021 04:10:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <97b8dcb9-5828-ea55-139e-6d655834b3a8@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: do not install irq handler
 before power up the host
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

On 28/09/2021 04:40, Dmitry Baryshkov wrote:
> On 28/09/2021 04:33, abhinavk@codeaurora.org wrote:
>> On 2021-09-27 18:29, Dmitry Baryshkov wrote:
>>> On 28/09/2021 04:19, abhinavk@codeaurora.org wrote:
>>>> On 2021-09-27 18:06, Dmitry Baryshkov wrote:
>>>>> On Tue, 28 Sept 2021 at 03:22, <abhinavk@codeaurora.org> wrote:
>>>>>>
>>>>>> On 2021-09-25 12:43, Dmitry Baryshkov wrote:
>>>>>> > On 21/09/2021 23:52, abhinavk@codeaurora.org wrote:
>>>>>> >> On 2021-09-21 10:47, Dmitry Baryshkov wrote:
>>>>>> >>> Hi,
>>>>>> >>>
>>>>>> >>> On Tue, 21 Sept 2021 at 20:01, <abhinavk@codeaurora.org> wrote:
>>>>>> >>>>
>>>>>> >>>> On 2021-09-21 09:22, Dmitry Baryshkov wrote:
>>>>>> >>>> > The DSI host might be left in some state by the bootloader. 
>>>>>> If this
>>>>>> >>>> > state generates an IRQ, it might hang the system by holding 
>>>>>> the
>>>>>> >>>> > interrupt line before the driver sets up the DSI host to 
>>>>>> the known
>>>>>> >>>> > state.
>>>>>> >>>> >
>>>>>> >>>> > Move the request/free_irq calls into 
>>>>>> msm_dsi_host_power_on/_off calls,
>>>>>> >>>> > so that we can be sure that the interrupt is delivered when 
>>>>>> the host is
>>>>>> >>>> > in the known state.
>>>>>> >>>> >
>>>>>> >>>> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector 
>>>>>> support")
>>>>>> >>>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> >>>>
>>>>>> >>>> This is a valid change and we have seen interrupt storms in
>>>>>> >>>> downstream
>>>>>> >>>> happening
>>>>>> >>>> when like you said the bootloader leaves the DSI host in unknown
>>>>>> >>>> state.
>>>>>> >>>> Just one question below.
>>>>>> >>>>
>>>>>> >>>> > ---
>>>>>> >>>> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>>>>>> >>>> >  1 file changed, 12 insertions(+), 9 deletions(-)
>>>>>> >>>> >
>>>>>> >>>> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> >>>> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> >>>> > index e269df285136..cd842347a6b1 100644
>>>>>> >>>> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> >>>> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>> >>>> > @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct
>>>>>> >>>> > mipi_dsi_host *host,
>>>>>> >>>> >               return ret;
>>>>>> >>>> >       }
>>>>>> >>>> >
>>>>>> >>>> > -     ret = devm_request_irq(&pdev->dev, msm_host->irq,
>>>>>> >>>> > -                     dsi_host_irq, IRQF_TRIGGER_HIGH | 
>>>>>> IRQF_ONESHOT,
>>>>>> >>>> > -                     "dsi_isr", msm_host);
>>>>>> >>>> > -     if (ret < 0) {
>>>>>> >>>> > -             DRM_DEV_ERROR(&pdev->dev, "failed to request 
>>>>>> IRQ%u: %d\n",
>>>>>> >>>> > -                             msm_host->irq, ret);
>>>>>> >>>> > -             return ret;
>>>>>> >>>> > -     }
>>>>>> >>>> > -
>>>>>> >>>> >       msm_host->dev = dev;
>>>>>> >>>> >       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>>>>> >>>> >       if (ret) {
>>>>>> >>>> > @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct 
>>>>>> mipi_dsi_host
>>>>>> >>>> > *host,
>>>>>> >>>> >       if (msm_host->disp_en_gpio)
>>>>>> >>>> >               gpiod_set_value(msm_host->disp_en_gpio, 1);
>>>>>> >>>> >
>>>>>> >>>> > +     ret = devm_request_irq(&msm_host->pdev->dev, 
>>>>>> msm_host->irq,
>>>>>> >>>> > +                     dsi_host_irq, IRQF_TRIGGER_HIGH | 
>>>>>> IRQF_ONESHOT,
>>>>>> >>>> > +                     "dsi_isr", msm_host);
>>>>>> >>>> > +     if (ret < 0) {
>>>>>> >>>> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "failed 
>>>>>> to request IRQ%u: %d\n",
>>>>>> >>>> > +                             msm_host->irq, ret);
>>>>>> >>>> > +             return ret;
>>>>>> >>>> > +     }
>>>>>> >>>> > +
>>>>>> >>>> > +
>>>>>> >>>>
>>>>>> >>>> Do you want to move this to msm_dsi_host_enable()?
>>>>>> >>>> So without the controller being enabled it is still in unknown
>>>>>> >>>> state?
>>>>>> >>>
>>>>>> >>> msm_dsi_host_power_on() reconfigures the host registers, so 
>>>>>> the state
>>>>>> >>> is known at the end of the power_on().
>>>>>> >>>
>>>>>> >>>> Also do you want to do this after dsi0 and dsi1 are 
>>>>>> initialized to
>>>>>> >>>> account for
>>>>>> >>>> dual dsi cases?
>>>>>> >>>
>>>>>> >>> I don't think this should matter. The host won't generate 'extra'
>>>>>> >>> interrupts in such case, will it?
>>>>>> >>>
>>>>>> >> We have seen cases where misconfiguration has caused interrupts to
>>>>>> >> storm only
>>>>>> >> on one DSI in some cases. So yes, I would prefer this is done 
>>>>>> after
>>>>>> >> both are
>>>>>> >> configured.
>>>>>> >
>>>>>> > I've checked. The power_on is called from 
>>>>>> dsi_mgr_bridge_pre_enable()
>>>>>> > when both DSI hosts should be bound.
>>>>>>
>>>>>> DSI being bound is enough? I thought the issue we are trying to 
>>>>>> address
>>>>>> is that
>>>>>> we need to have called msm_dsi_host_power_on() for both the hosts so
>>>>>> that both are
>>>>>> put in the known state before requesting the irq.
>>>>>>
>>>>>> OR in other words move the irq_enable() to below location.
>>>>>>
>>>>>> 341 static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>>>> 342 {
>>>>>> ********************************
>>>>>> 364     ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
>>>>>> is_bonded_dsi, msm_dsi->phy);
>>>>>> 365     if (ret) {
>>>>>> 366             pr_err("%s: power on host %d failed, %d\n", 
>>>>>> __func__, id, ret);
>>>>>> 367             goto host_on_fail;
>>>>>> 368     }
>>>>>> 369
>>>>>> 370     if (is_bonded_dsi && msm_dsi1) {
>>>>>> 371             ret = msm_dsi_host_power_on(msm_dsi1->host,
>>>>>> 372                             &phy_shared_timings[DSI_1], 
>>>>>> is_bonded_dsi, msm_dsi1->phy);
>>>>>> 373             if (ret) {
>>>>>> 374                     pr_err("%s: power on host1 failed, %d\n",
>>>>>> 375                                                     __func__, 
>>>>>> ret);
>>>>>> 376                     goto host1_on_fail;
>>>>>> 377             }
>>>>>> 378     }
>>>>>>
>>>>>> < move the irq enable here >
>>>>>> **********************************
>>>>>
>>>>> Ah, I see your point. What about moving to msm_dsi_host_enable() then?
>>>>
>>>> Yes, I had suggested this a few replies ago. But only at the 
>>>> dsi_msgr we know if DSI1 is also done.
>>>> So you can do it right after it in below location?
>>>>
>>>> 427     if (is_dual_dsi && msm_dsi1) {
>>>> 428         ret = msm_dsi_host_enable(msm_dsi1->host);
>>>> 429         if (ret) {
>>>> 430             pr_err("%s: enable host1 failed, %d\n", __func__, ret);
>>>> 431             goto host1_en_fail;
>>>> 432         }
>>>> 433     }
>>>>
>>>> <enable_irq here? >
>>>
>>> If there is DSI1, it was also powered on/programmed at the time of
>>> msm_dsi_host_enable, so enabling IRQs from it should be safe. Do you
>>> see any pitfalls from enabling the irq from that function?
>>
>> Just about symmetry. We will enable_irq() for DSI0 when DSI0 and DSI1 
>> are powered on
>> But for DSI1, we will enable it when its powered ON but not enabled.
>> Hence i thought its better this way.
> 
> Ah. Then it would be better to call it between power_on() and enable(). 
> I'll send v3.

V3 sent, moving the enable_irq() out of msm_dsi_host_power_on.

> 
>>
>>>
>>>>
>>>>>
>>>>>> >>>> >       msm_host->power_on = true;
>>>>>> >>>> >       mutex_unlock(&msm_host->dev_mutex);
>>>>>> >>>> >
>>>>>> >>>> > @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct 
>>>>>> mipi_dsi_host
>>>>>> >>>> > *host)
>>>>>> >>>> >               goto unlock_ret;
>>>>>> >>>> >       }
>>>>>> >>>> >
>>>>>> >>>> > +     devm_free_irq(&msm_host->pdev->dev, msm_host->irq, 
>>>>>> msm_host);
>>>>>> >>>> > +
>>>>>> >>>> >       dsi_ctrl_config(msm_host, false, NULL, NULL);
>>>>>> >>>> >
>>>>>> >>>> >       if (msm_host->disp_en_gpio)
> 
> 


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90764C9C97
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 05:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6979910EA80;
	Wed,  2 Mar 2022 04:42:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3032110EA7C
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 04:42:12 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u11so626339lju.4
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 20:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ARb9aZbZYQidMZDix9fUW3Av4Mah2x7ZZrBUNsk6at4=;
 b=Ui0F+FwAxNQGCcr+MK8Tnq1KQ0qaMmHuzF6LZXTr3eztgnjoUXPYcMGt+AqlOmZTsD
 1ISV7oisWR8C2GeMPmPqXCuUj660uH5dlRCxpcz1Wa70xPdFO25i07S14grHOUO/jg/y
 J+rigqiZwwhTGOpv0VG03paDhLmFpnTKBDE7/G4rcsQEWDD7rq3/OyCYm9dOnkQsA+t1
 9Oo0JK6/cOq183AjJxL+GAXbGDvCh63EibNA+5XE/a9clc7vt+YRzBexNKS98Dobncwv
 qrK5dZkbB78Hs9sRyzugSLmBq5nGNvkE8p9IwtlWQ9IEPPwPsjD7XCvkpifm1B8Thp1W
 m4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ARb9aZbZYQidMZDix9fUW3Av4Mah2x7ZZrBUNsk6at4=;
 b=5Zx6nonWS0/kSlaEhUWBx2vQVrMFeWiIApmR+D/ZJ4AFbYi0JDQ9FDWBWz68FVqiH1
 yvrsRyunX4FTetrjnxpJIh+UpxERQdK5sBiu0+SftPYu1a6ZPwKIyT9ILQuo+hAL55O8
 sHZPvD27X84sgv81T8gMkY1mrXy51XMYw14uDQl3GEYYXX3YOns4QeDBpgCh4KKZgJwk
 HoC/gQOUhcijfqtzVIOPuDsf6z1Rfkave4sU16+0JEzswqtH9W+DRQSKqxB0dpv1ynzw
 b+DRoQ23F7U0Pt9N6kRiKTh0u889/faF4Ne36ko34bRdLTX8vro7oaLScJQlscITbBXO
 EdwQ==
X-Gm-Message-State: AOAM532THEMwDbSR+tf9++X811rQiCO7Ygnwa7x6qy9E8XmAEWYW37l8
 diF7NfyhlrzJMBmyoH6tNSX3tg==
X-Google-Smtp-Source: ABdhPJzGqSVw9ionhPrDsFLgT7RWE3koUXv8w8EmA7YxIS9JBdPF35KMr2+UEyOsDQ5faKxMYNI/yg==
X-Received: by 2002:a2e:b52f:0:b0:23e:2fe6:af10 with SMTP id
 z15-20020a2eb52f000000b0023e2fe6af10mr18517670ljm.46.1646196130359; 
 Tue, 01 Mar 2022 20:42:10 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0:5258:5528:7624:3edd?
 ([2001:470:dd84:abc0:5258:5528:7624:3edd])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a0565123d8700b00443cec880e5sm1838432lfv.4.2022.03.01.20.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 20:42:09 -0800 (PST)
Message-ID: <ea6d7b5b-04e5-9333-cb9e-34c230bf1cbc@linaro.org>
Date: Wed, 2 Mar 2022 07:42:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
 <20220302012931.4107196-2-bjorn.andersson@linaro.org>
 <CAA8EJppiNbJhrdFgJ0sESBM5m3oyazS-8dG8919xdZu50fZ8aQ@mail.gmail.com>
 <Yh7aAMZWJPjAeC1V@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Yh7aAMZWJPjAeC1V@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: Issue MDSS reset during
 initialization
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/03/2022 05:44, Bjorn Andersson wrote:
> On Tue 01 Mar 17:47 PST 2022, Dmitry Baryshkov wrote:
> 
>> On Wed, 2 Mar 2022 at 04:27, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>>>
>>> It's typical for the bootloader to bring up the display for showing a
>>> boot splash or efi framebuffer. But in some cases the kernel driver ends
>>> up only partially configuring (in particular) the DPU, which might
>>> result in e.g. that two different data paths attempts to push data to
>>> the interface - with resulting graphical artifacts.
>>>
>>> Naturally the end goal would be to inherit the bootloader's
>>> configuration and provide the user with a glitch free handover from the
>>> boot configuration to a running DPU.
>>>
>>> But as implementing seamless transition from the bootloader
>>> configuration to the running OS will be a considerable effort, start by
>>> simply resetting the entire MDSS to its power-on state, to avoid the
>>> partial configuration.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>
>>> Changes since v1:
>>> - Rather than trying to deconfigure individual pieces of the DPU, reset the
>>>    entire block.
>>>
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 18 ++++++++++++++++++
>>>   drivers/gpu/drm/msm/msm_drv.c            |  4 ++++
>>>   drivers/gpu/drm/msm/msm_kms.h            |  1 +
>>>   3 files changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>> index b10ca505f9ac..419eaaefe606 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>> @@ -7,6 +7,7 @@
>>>   #include <linux/irqchip.h>
>>>   #include <linux/irqdesc.h>
>>>   #include <linux/irqchip/chained_irq.h>
>>> +#include <linux/reset.h>
>>>   #include "dpu_kms.h"
>>>
>>>   #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
>>> @@ -31,6 +32,7 @@ struct dpu_mdss {
>>>          void __iomem *mmio;
>>>          struct clk_bulk_data *clocks;
>>>          size_t num_clocks;
>>> +       struct reset_control *reset;
>>>          struct dpu_irq_controller irq_controller;
>>>   };
>>>
>>> @@ -197,10 +199,18 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
>>>          dpu_mdss->mmio = NULL;
>>>   }
>>>
>>> +static int dpu_mdss_reset(struct msm_mdss *mdss)
>>> +{
>>> +       struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
>>> +
>>> +       return reset_control_reset(dpu_mdss->reset);
>>> +}
>>> +
>>>   static const struct msm_mdss_funcs mdss_funcs = {
>>>          .enable = dpu_mdss_enable,
>>>          .disable = dpu_mdss_disable,
>>>          .destroy = dpu_mdss_destroy,
>>> +       .reset = dpu_mdss_reset,
>>>   };
>>>
>>>   int dpu_mdss_init(struct platform_device *pdev)
>>> @@ -227,6 +237,13 @@ int dpu_mdss_init(struct platform_device *pdev)
>>>          }
>>>          dpu_mdss->num_clocks = ret;
>>>
>>> +       dpu_mdss->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
>>> +       if (IS_ERR(dpu_mdss->reset)) {
>>> +               ret = PTR_ERR(dpu_mdss->reset);
>>> +               DPU_ERROR("failed to acquire mdss reset, ret=%d", ret);
>>> +               goto reset_parse_err;
>>> +       }
>>> +
>>>          dpu_mdss->base.dev = &pdev->dev;
>>>          dpu_mdss->base.funcs = &mdss_funcs;
>>>
>>> @@ -252,6 +269,7 @@ int dpu_mdss_init(struct platform_device *pdev)
>>>   irq_error:
>>>          _dpu_mdss_irq_domain_fini(dpu_mdss);
>>>   irq_domain_error:
>>> +reset_parse_err:
>>>   clk_parse_err:
>>>          if (dpu_mdss->mmio)
>>>                  devm_iounmap(&pdev->dev, dpu_mdss->mmio);
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>> index 129fa841ac22..7595f83da3f1 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -388,6 +388,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>>          if (ret)
>>>                  return ret;
>>>
>>> +       /* Issue a reset of the entire MDSS */
>>> +       if (priv->mdss && priv->mdss->funcs->reset)
>>> +               priv->mdss->funcs->reset(priv->mdss);
>>> +
>>
>> I think this is incorrect. In this way reset happens after all
>> subdevice are probed. They might have programmed some state of the
>> corresponding block. The clocks are already registered, so the clock
>> framework will be out of sync.
> 
> I went back and forth through the drivers and I believe at least the
> idea is that we probe all the drivers, which will acquire some
> resources.
> 
> Then in bind() we actually start to access the hardware (and acquire
> more resources, for some reason).

DSI clock init happens in the dsi_clk_init(), called from 
msm_dsi_host_inti(), dsi_init(), dsi_dev_probe(). But it's not the major 
problem.

All the PHYs do not use component framework, be it the DSI PHY or HDMI 
PHY. So at the time you call MDSS reset, the PHYs are already 
initialized, the clocks are registered in the clock subsystem, etc.
Performing a reset will put the hardware out of sync with the Linux kernel.

So, if you'd like to perform a reset in the msm_drm_init(), we'd have to 
modify DSI to perform some parts of init later. And to move PHYs to also 
use the component framework. And I'm not sure if that won't break the 
dispcc, the way it gets the DSI clocks.

> 
>> I think the reset should happen before calling of_platform_populate(),
>> so the device state is consistent with the driver.
>>
> 
> Perhaps I'm misunderstanding the component framework, but I was under
> the impression that if any of the subcomponents fails to probe because
> of lacking resources, this could be printed on the efifb before we reset
> the hardware. Making errors slightly more user friendly.

Yes, I understand why did you place the call in msm_drm_init().

> 
> I.e. in the timeframe between of_platform_populate() and
> component_bind_all() below...
> 
> 
> But if you believe I'm incorrect on the assumptions about the hardware
> not being accessed before this point, I can move the reset before
> of_platform_populate() - this is the last piece needed to have
> functional eDP on sc8180x.
> 
>> Also see the https://git.linaro.org/people/dmitry.baryshkov/kernel.git/log/?h=dpu-mdss-rework,
>> which reworks the mdss driver and mdss probing.
>>
> 
> There seems to be some room for reducing duplication between the two
> drivers, so this seems reasonable.
> 
> Regards,
> Bjorn
> 
>>>          /* Bind all our sub-components: */
>>>          ret = component_bind_all(dev, ddev);
>>>          if (ret)
>>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
>>> index 2a4f0526cb98..716a34fca1cd 100644
>>> --- a/drivers/gpu/drm/msm/msm_kms.h
>>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>>> @@ -205,6 +205,7 @@ struct msm_mdss_funcs {
>>>          int (*enable)(struct msm_mdss *mdss);
>>>          int (*disable)(struct msm_mdss *mdss);
>>>          void (*destroy)(struct msm_mdss *mdss);
>>> +       int (*reset)(struct msm_mdss *mdss);
>>>   };
>>>
>>>   struct msm_mdss {
>>> --
>>> 2.33.1
>>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry

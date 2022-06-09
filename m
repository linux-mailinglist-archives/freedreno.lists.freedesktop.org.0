Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7233B5443C5
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 08:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A152311376A;
	Thu,  9 Jun 2022 06:27:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6AA11376A
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 06:27:05 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y29so25037857ljd.7
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 23:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cycGJJ91H4YHdjGIAutpI1GaX9p7h4brlXbJX4MVN/Q=;
 b=Mpa9s8ZMhN2wGYXSvQKctpW3XIJWSKFkN2WMMwjNevVr4R381DlULaGujGUPT96e+q
 PxBqdKrEmav5wKR4JLDwgQTChoaxM/pbFLs6hfpje0G3cBfmyEyXNR3cxJzc02ougGp6
 deQUeFXF5HkLZrqF7q+HnV+SQXBah/jMfVPuFcGZbmvg6puK7keBrGeVpsdPuP9pV3Dy
 a4E1igC8EOMKif/t8j9j8LX973xuDLKgrBiJ36j+uBJs3JeIs6Rv2ywYgIFmoQ0ahx1r
 rGJYIvAdX4nR4nncPacsckqfBuOtYQnaWzumcK0pPE1e9ZfiEiiC0aNj1o3vJvZVm3LL
 LwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cycGJJ91H4YHdjGIAutpI1GaX9p7h4brlXbJX4MVN/Q=;
 b=PB+rDuN4GCem2g9Novr56ymCBDDC2tz0IKztudgrphBIVdd4gOSy3ewki4B64ndC70
 005a5vEuIm9O+AI3hxvKD93IFFOcHKwrUEwu12/fb643UPEEqNMQaSBvou7shIl9/M/1
 1eTsYG1ICxm47voAOlNKyPkEEdbEpSs4Um+BuDPGwT+dJ+1YEu9zMf4G1MDmZIYjUodu
 SMCeSqdlkvZu6AihktbjMYFwbic+6bixkDPZNiAz/QgM+Ivm5kNPoly8kwJGLAnhydZ7
 yA0WdAXru4AWxcy0Bq0/BP2rpfSZUCUdKigna4QAS9i7cXKlOLp0kMW+//MY6hHEY+/1
 TyWQ==
X-Gm-Message-State: AOAM533jklde0pkreTwWFkwIknT2+w5rT0ZmEFeZHeglYx45rzRvpZWA
 ueNzLZM8OVfUzdLFdBKVHeFekw==
X-Google-Smtp-Source: ABdhPJwH50v0hPsS84CEB+KQLzlSSoTIQA5T8P964OIyZkPVqZ+avwaWZ78IjDxe1VKTt2yylpUxSA==
X-Received: by 2002:a2e:8e38:0:b0:255:59c2:7192 with SMTP id
 r24-20020a2e8e38000000b0025559c27192mr25338422ljk.156.1654756023379; 
 Wed, 08 Jun 2022 23:27:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bf43-20020a05651225ab00b004790823d354sm3861368lfb.26.2022.06.08.23.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 23:27:02 -0700 (PDT)
Message-ID: <89941420-717a-c311-54fe-cd8fcd0b0a06@linaro.org>
Date: Thu, 9 Jun 2022 09:27:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
 <CAE-0n53z_nWsgVVn-4LbsP1GuzTgCa+DDDDE0y8k3+s-t=eSBA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53z_nWsgVVn-4LbsP1GuzTgCa+DDDDE0y8k3+s-t=eSBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 06/12] drm/msm/hdmi: drop unused GPIO
 support
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/06/2022 23:59, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-06-08 05:07:17)
>> @@ -543,41 +529,16 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
>>          hdmi_cfg->mmio_name     = "core_physical";
>>          hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
>>
>> -       for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
> [...]
>> -               if (gpiod)
>> -                       gpiod_set_consumer_name(gpiod, msm_hdmi_gpio_pdata[i].label);
>> -               hdmi_cfg->gpios[i].output = msm_hdmi_gpio_pdata[i].output;
>> -               hdmi_cfg->gpios[i].value = msm_hdmi_gpio_pdata[i].value;
>> -       }
>> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
>> +       /* This will catch e.g. -PROBE_DEFER */
> 
> EPROBE_DEFER?

Ack.

> 
>> +       if (IS_ERR(hdmi->hpd_gpiod))
>> +               return PTR_ERR(hdmi->hpd_gpiod);
>> +
>> +       if (!hdmi->hpd_gpiod)
>> +               DBG("failed to get HPD gpio");
> 
> Does DBG() add newlines?

Yes, it does.

> 
>> +
>> +       if (hdmi->hpd_gpiod)
>> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>>
>>          dev->platform_data = hdmi_cfg;
>>


-- 
With best wishes
Dmitry

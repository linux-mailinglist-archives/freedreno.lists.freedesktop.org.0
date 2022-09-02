Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1A75AA78F
	for <lists+freedreno@lfdr.de>; Fri,  2 Sep 2022 08:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E387B10E746;
	Fri,  2 Sep 2022 06:03:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB48910E746
 for <freedreno@lists.freedesktop.org>; Fri,  2 Sep 2022 06:03:05 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m7so1802105lfq.8
 for <freedreno@lists.freedesktop.org>; Thu, 01 Sep 2022 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date; bh=ffvbLl1jFsmA7m/s4nl7FyHc0hFH1L5jLxXME/aPLu4=;
 b=ZJoMUA0CzdUCYA4eJRyo7DLyyhB/Fsx8fQ/GFLCh3ehKhSFwb/l1+9+I/EHCI+Cvld
 MJC6IuSNfQDxJ99OsIpA30LS8c+Lcxw8jSJCfrt9ptEKsRMfUZK5U1lv+Tjz7vG6b5WE
 QwqDKqiWwAF+SY64GT9dbsqM3favzq0dY/2r/OfYAE7MNQ+jiOS/+rL3xTTiG04xjAQQ
 LzjVd26yukIxs6G/z6BHddJkQ2KTB2G/17iWSxrRYUV/7f1v50FKCeIv1pBzgN88lTaC
 ytZ+0ViLmyLQ8kM2bg6lSHa+IzL4+KIBVZls/jEX6WZMY2zstIbGAtnmFUDFoNkGLoHu
 3TdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=ffvbLl1jFsmA7m/s4nl7FyHc0hFH1L5jLxXME/aPLu4=;
 b=wu3ohF+jknNMv0Zu9Bpyv6xBYDIyD1l5JwQ+QEc391zYqBQcUTjuWOGYoeIjKNuXe8
 GXTY8nHLtUfmlIJALKZtLI9phVKh2kXtbpUEh0Ye01Q98CFvVOhAWJyQZq/W6GjHFMug
 /qtvBu8gvtXEf3mFYaKBBIgcfCOwOOpB0/0vJ7NhYWvilJ8xL77A90MOsfQkdYhrriAN
 Dz/12wUQXC2uqDacyf/Jn+yglv5WUuT91DTURsVSbsboHjMJBlwCTpX3geZHdpvlnc/a
 bCKFhUhH1hgPoDarpSpycQhYRAiUurOC79CDBCAEkPct9lT1JPE/KPOPm2pHLTPawjVV
 ZdyQ==
X-Gm-Message-State: ACgBeo2u2ZCXYvgsLHH+H81jiin3WIa3Yk30kJysFKNKUikG+hjTwF/8
 K97+Xy0NpFbAh9b8rRLfP0iDKA==
X-Google-Smtp-Source: AA6agR6NPHOKfoGhpIWRmH8tuIUycivkQLTgGb6ER/1vjV/cqczRuQqHyi2K0W/l4IGo+q5iOOo0HA==
X-Received: by 2002:a05:6512:2248:b0:48a:f8f9:3745 with SMTP id
 i8-20020a056512224800b0048af8f93745mr10821431lfu.256.1662098584229; 
 Thu, 01 Sep 2022 23:03:04 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.228.19]) by smtp.gmail.com with ESMTPSA id
 g9-20020a19ac09000000b004949761d330sm135634lfc.128.2022.09.01.23.03.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Sep 2022 23:03:03 -0700 (PDT)
Date: Fri, 02 Sep 2022 09:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
User-Agent: K-9 Mail for Android
In-Reply-To: <9627ff41-6bd8-e380-0e8e-438aecdb824f@quicinc.com>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-3-dmitry.baryshkov@linaro.org>
 <9627ff41-6bd8-e380-0e8e-438aecdb824f@quicinc.com>
Message-ID: <24DFFDD8-955B-459B-B9C7-06BFAB32F817@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v1 2/4] drm/msm/dpu: move resource
 allocation to the _probe function
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 2 September 2022 00:37:30 GMT+03:00, Abhinav Kumar <quic_abhinavk@quici=
nc=2Ecom> wrote:
>
>
>On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
>> To let the probe function bail early if any of the resources is
>> unavailable, move resource allocattion from kms_init directly to the
> allocation

Ack

>> probe callback=2E While we are at it, replace irq_of_parse_and_map() wi=
th
>> platform_get_irq()=2E
>Any specific reason to replace this?

Yes=2E To use generic API rather than the OF-specific unusual function=2E

>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>With those two addressed,
>
>Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec | 62 +++++++++++++---------=
---
>>   1 file changed, 32 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_kms=2Ec
>> index ae13a3a5d8a5=2E=2E756be04d804b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec
>> @@ -1206,31 +1206,13 @@ static int dpu_kms_init(struct drm_device *ddev=
)
>>   	struct device *dev =3D ddev->dev;
>>   	struct platform_device *pdev =3D to_platform_device(dev);
>>   	struct dpu_kms *dpu_kms;
>> -	int irq;
>>   	struct dev_pm_opp *opp;
>>   	int ret =3D 0;
>>   	unsigned long max_freq =3D ULONG_MAX;
>>   -	dpu_kms =3D devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>> +	dpu_kms =3D to_dpu_kms(priv->kms);
>>   	if (!dpu_kms)
>> -		return -ENOMEM;
>> -
>> -	ret =3D devm_pm_opp_set_clkname(dev, "core");
>> -	if (ret)
>> -		return ret;
>> -	/* OPP table is optional */
>> -	ret =3D devm_pm_opp_of_add_table(dev);
>> -	if (ret && ret !=3D -ENODEV) {
>> -		dev_err(dev, "invalid OPP table in device tree\n");
>> -		return ret;
>> -	}
>> -
>> -	ret =3D devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
>> -	if (ret < 0) {
>> -		DPU_ERROR("failed to parse clocks, ret=3D%d\n", ret);
>> -		return ret;
>> -	}
>> -	dpu_kms->num_clocks =3D ret;
>> +		return -EINVAL;
>>     	opp =3D dev_pm_opp_find_freq_floor(dev, &max_freq);
>>   	if (!IS_ERR(opp))
>> @@ -1249,21 +1231,41 @@ static int dpu_kms_init(struct drm_device *ddev=
)
>>   	pm_runtime_enable(&pdev->dev);
>>   	dpu_kms->rpm_enabled =3D true;
>>   -	priv->kms =3D &dpu_kms->base;
>> -
>> -	irq =3D irq_of_parse_and_map(dpu_kms->pdev->dev=2Eof_node, 0);
>> -	if (!irq) {
>> -		DPU_ERROR("failed to get irq\n");
>> -		return -EINVAL;
>> -	}
>> -	dpu_kms->base=2Eirq =3D irq;
>> -
>>   	return 0;
>>   }
>>     static int dpu_dev_probe(struct platform_device *pdev)
>>   {
>> -	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
>> +	struct device *dev =3D &pdev->dev;
>> +	struct dpu_kms *dpu_kms;
>> +	int irq;
>> +	int ret =3D 0;
>> +
>> +	dpu_kms =3D devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
>> +	if (!dpu_kms)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_pm_opp_set_clkname(dev, "core");
>> +	if (ret)
>> +		return ret;
>> +	/* OPP table is optional */
>> +	ret =3D devm_pm_opp_of_add_table(dev);
>> +	if (ret && ret !=3D -ENODEV)
>> +		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n")=
;
>> +
>> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to parse clocks\n");
>> +
>> +	dpu_kms->num_clocks =3D ret;
>> +
>> +	irq =3D platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return dev_err_probe(dev, irq, "failed to get irq\n");
>> +
>> +	dpu_kms->base=2Eirq =3D irq;
>> +
>> +	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
>>   }
>>     static int dpu_dev_remove(struct platform_device *pdev)

--=20
With best wishes
Dmitry
